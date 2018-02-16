<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>基础数据</title>
<% String path = request.getContextPath(); %>
<link href="<%=path %>/css/stylesheet.css" rel="stylesheet" type="text/css" />
<link href="<%=path %>/css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=path %>/js/javascript.js"></script>
<script type="text/javascript" src="<%=path %>/js/jquery-1.3.2.min.js"></script>
</head>

<body>
<div style="padding:5px;">
  <div class="txt" style="padding-top:3px;" >当前位置：基础数据&nbsp;&gt;&nbsp;数据字典管理&nbsp;&gt;&nbsp;<a href="dict.html">数据字典列表</a>&nbsp;&gt;&nbsp;编辑数据字典
    <hr class="hr1" />
  </div>
  <div class="operation_button">
  	<a href="#" title="返回" onclick="back()">返回</a>
    <a href="#" title="保存" id="update">保存</a>
  </div>
  <div class="out_bg">
    <div class="in_bg">
    <form action="<%=path %>/updateDict" method="post" id="form1">
      <table border="0" cellpadding="0" cellspacing="0" class="table_input txt">
        <tr>
          <td width="126">编号</td>
          <td width="411">${d.id }<input type="hidden" value="${d.id }" name="id"></td>
          <td width="126">类别</td>
          <td width="442"><input type="text" value="${d.category }"  name="category" id="category" /></td>
        </tr>
        <tr>
          <td>条目</td>
          <td><input type="text" value="${d.entry }" name="entry" id="entry" /></td>
          <td>值</td>
          <td><input type="text" value="${d.values }" name="values" id="valu" /></td>
        </tr>
        <tr>
          <td>是否可编辑</td>
          <td><input type="checkbox" id="checkbox" <c:if test="${d.status == 0 }">checked="checked"</c:if> value="${d.status }" name="status"/></td>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
        </tr>
      </table>
      </form>
    </div>
  </div>
</div>
<script type="text/javascript">
	$("#update").click(function(){
		if($("#category").val() == null || $("#category").val() == ""){
			alert("类型不能为空！");
			return;
		}else if($("#entry").val() == null || $("#entry").val() == ""){
			alert("条目不能为空！");
			return;
		}else if($("#valu").val() == null || $("#valu").val() == ""){
			alert("值不能为空！");
			return;
		}else if($("input[type='checkbox']").is(':checked')){
			$("#form1").submit();
		}else{
			$("#checkbox").val(0);
			$("#form1").submit();
		}
	})
</script>
</body>
</html>
