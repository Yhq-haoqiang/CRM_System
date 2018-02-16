<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>新建销售机会</title>
<% String path = request.getContextPath(); %>
<link href="<%=path %>/css/stylesheet.css" rel="stylesheet" type="text/css" />
<link href="<%=path %>/css/style.css" rel="stylesheet" type="text/css" />
<link href="<%=path %>/css/bootstrap.min.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="<%=path %>/js/javascript.js"></script>
<script type="text/javascript" src="<%=path %>/js/jquery-1.3.2.min.js"></script>
</head>

<body>
<div style="padding:5px;">
  <div class="txt" style="padding-top:3px;" >当前位置：<a href="#">客户开发计划</a>&nbsp;&gt;&nbsp;制定计划
    <hr class="hr1" />
  </div>
  <form action="<%=path %>/saveplananddetail" id="fm" method="post">
  <div class="operation_button">
  	<h4 align="center">制定订单计划</h4>
 	客户编号:${opp.id }<input type="hidden" name="opp_id" value="${opp.id }">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
 	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
 	客户名称:${opp.customer }&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
 	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
 	订单编号：<input id="number" type="text" name="number" style="width: 200px">*&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
 	<jsp:useBean id="time" class="java.util.Date" />
 	<input type="datetime"  style="display: none;" name="orderdate" value='<fmt:formatDate value="<%=time %>" pattern="yyyy-MM-dd" type="both" />' /> 
  	<a href="#" title="返回" onclick="back()">返回</a>
    <a href="#" title="执行计划" onclick="saveplan();">执行计划</a>
  </div>
  <div class="out_bg">
    <div class="in_bg">
      <table border="0" cellpadding="0" cellspacing="0" class="table_input txt" id="mytable">
        <tr>
       	  <th width="126" height="50">编号</th>
          <th width="411">商品名称</th>
          <th width="126">商品单价</th>
          <th width="200">数量</th>
          <th width="242">操作</th>
        </tr>
        <tr id="option1">
       	 <td>1</td>
          <td>
			<select name="product_ids" id="se1" style="width:200px" onchange="changev(1)">
				<c:forEach items="${list }" var="pro">
				<option value="${pro.id },${pro.price }">${pro.name }</option>
				</c:forEach>
			</select>
          </td>
          <td><input type="text" readonly="readonly" id="price1" style="width:100px" /></td>
          <td><input type="text" style="width:100px" name="counts"> </td>
          <td></td>
        </tr>
      </table>
    </div>
  </div>
  </form>
</div>
<input type="button" value="添加商品" id="add1">
<script type="text/javascript">
	//默认有一条。
	var count = 1;
	//触发一次就添加一行列表
	$("#add1").click(function(){
		count++;
		//拼接的行数 并且给行数加编号id=option1    id=option2  进行管理
		$("#mytable").append("<tr id='option"+ count +"'><td>"+ count +"</td><td><select name='product_ids' id='se"+count+"' style='width:200px' onchange='changev("+count+")' ><c:forEach items='${list }' var='pro'><option value='${pro.id },${pro.price }'>${pro.name }</option></c:forEach></select></td><td><input type='text' readonly='readonly' id='price"+count+"' style='width:100px'/></td><td><input type='text' style='width:100px' name='counts'></td><td><a href='#' onclick=delRow("+count+")>删除</a></td></tr>");
	})
	//删除行，通过传来的行id 拼接该行的id 进行删除
	function delRow(rowIndex){
		$("#option"+rowIndex).remove();
	}
	//通过选择产品，获得产品的单价并显示到对应行的单价位置上
	function changev(num){
		//获得该产品的val  根据 规则进行切割。
		var price = $("#se"+num).val();
		//切割后获得数组
		var arr = price.split(",");
		//alert(arr[0].trim());
		//后面的值为该商品的单价
		price = arr[1].trim();
		//显示到对应的单价位置
		$("#price"+num).val(price);
	}
	
	function saveplan(){
		var number = $("#number").val();
		if(number == null || number == ""){
			alert("编号不能为空");
			return;
		}
		//var counts = $("input[name='counts']").val();
		//获取所有name为 counts的控件并获得该控件的值，并进行用，组合 转换为字符串格式 返回
		var counts = $("*[name='counts']").map(function(){return $(this).val()}).get().join(",")
		//然后进行切割 获得 商品数量数组。
		counts = counts.split(",");
		//遍历数组，并进行合法判断
		var patrn = /^[0-9]*$/;
		for (var int = 0; int < counts.length; int++) {
			var c = counts[int];
			if(c == null || c == "" || !patrn.test(c)){
				alert("数量不能为空，或有非法字符！");
				return;
			}
		}
		//获得所有商品id
		var product_ids = hpro();
		//return;
		$("#fm").submit();
	}
</script>
<script type="text/javascript">
	function hpro(){
		var product_ids = $("*[name='product_ids']").map(function(){return $(this).val()}).get().join("-");
		product_ids = product_ids.split("-");
		//alert(product_ids);
		return product_ids;
	}
	
</script>
</body>
</html>
