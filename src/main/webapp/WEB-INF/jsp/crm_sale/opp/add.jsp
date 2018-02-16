<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>营销管理</title>
<% String path = request.getContextPath(); %>
<link href="<%=path %>/css/stylesheet.css" rel="stylesheet" type="text/css" />
<link href="<%=path %>/css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=path %>/js/jquery-1.3.2.min.js"></script>
<script type="text/javascript" src="<%=path %>/js/javascript.js"></script>
</head>

<body>
<div style="padding:5px;">
  <div class="txt" style="padding-top:3px;" >当前位置：营销管理&nbsp;&gt;&nbsp;销售机会管理&nbsp;&gt;&nbsp;销售机会&nbsp;&gt;&nbsp;新建销售机会
    <hr class="hr1" />
  </div>
  <div class="operation_button">
  	<a href="#" title="返回" onclick="back()">返回</a>
    <a href="#" title="保存" onclick="save();">保存</a>
  </div>
  <div class="out_bg">
    <div class="in_bg">
    <form action="addopp" id="form1" method="post">
      <table border="0" cellpadding="0" cellspacing="0" class="table_input txt">
        <tr>
          <td width="126">编号</td>
          <td width="411"><input type="text" disabled="disabled" /></td>
          <td width="126">机会来源</td>
          <td width="442"><input type="text" name="oppcome" id="oppcome"/></td>
        </tr>
        <tr>
          <td>客户名称</td>
          <td><input type="text" name="customer" id="customer"/></td>
          <td>成功几率</td>
          <td><input type="text" name="odds" id="odds"/></td>
        </tr>
        <tr>
          <td>概要</td>
          <td><input type="text" name="outline"/></td>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
        </tr>
        <tr>
          <td>联系人</td>
          <td><input type="text" name="name" id="cname"/></td>
          <td>联系人电话</td>
          <td><input type="text" name="phone"/></td>
        </tr>
        <tr style="padding:0px;">
          <td valign="top">机会描述</td>
          <td><textarea rows="6" cols="36" name="descr" /></textarea></td>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
        </tr>
        <tr>
          <td>创建人</td>
          <td><input type="text" name="cre_name" value="<%=session.getAttribute("name")%>" readonly="readonly"/></td>
          <td>创建时间</td>
          <jsp:useBean id="time" class="java.util.Date" />
          <td><input type="text" value="<fmt:formatDate value="<%=time %>" type="both" pattern="yyyy-MM-dd"/>" readonly="readonly" name="cre_date" /></td>
        </tr>
        <tr>
          <td>指派给</td>
          <td>
          	<select style="width:311px;height:30px;" name="assignor" id="ss1">
				<option>请选择...</option>
				<c:forEach items="${list }" var="name">
				<option value="${name }">${name }</option>
				</c:forEach>
			</select>
           </td>
          <td>指派时间</td>
          <td><input type="text" id="dd1" readonly="readonly" name="assdate" value="<fmt:formatDate value="<%=time %>" type="both" pattern="yyyy-MM-dd"/>"/></td>
        </tr>
      </table>
      <input type="hidden" value="0" id="ss2" name="status" >
      </form>
    </div>
  </div>
</div>
<script type="text/javascript">
	function save(){
		var s = $("#ss1").val();
		if(s == null || s == "" || s == "请选择..."){
			alert("指派人不能为空,请选择指派人");
			return;
		}
		var oppcome =  $("#oppcome").val();
		if(oppcome == null || oppcome == ""){
			alert("客户来源不能为空。");
			return;
		}
		var customer =  $("#customer").val();
		if(customer == null || customer == ""){
			alert("客户名称不能为空。");
			return;
		}
		var odds =  $("#odds").val();
		if(odds == null || odds == ""){
			alert("成功几率不能为空。");
			return;
		}
		var cname =  $("#cname").val();
		if(cname == null || cname == ""){
			alert("联系人不能为空。");
			return;
		}
		$("#form1").submit();
	}
</script>
</body>
</html>
