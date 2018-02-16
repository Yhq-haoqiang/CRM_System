<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>服务管理</title>
<link href="css/stylesheet.css" rel="stylesheet" type="text/css" />
<link href="css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/javascript.js"></script>
<script type="text/javascript" src="js/jquery-1.3.2.min.js"></script>
</head>

<body>
<div style="padding:5px;">
  <div class="txt" style="padding-top:3px;" >当前位置：客户服务管理&nbsp;&gt;&nbsp;服务创建
    <hr class="hr1" />
  </div>
  <div class="operation_button">
    <a href="#" title="保存" id="save">保存</a>
  </div>
  <div class="out_bg">
    <div class="in_bg">
    <form action="saveser" method="post" id="form1">
      <table border="0" cellpadding="0" cellspacing="0" class="table_input txt">
        <tr>
          <td width="126">编号</td>
          <td width="411"><input type="text" disabled="disabled" /></td>
          <td width="126">创建人</td>
          <td width="442"><input type="text" value="<%=session.getAttribute("name") %>" readonly="readonly" name="cre_name" /></td>
        </tr>
        <tr>
          <td>创建时间</td>
          <jsp:useBean id="time" class="java.util.Date" />
          <td><input type="datetime" value="<fmt:formatDate value="<%=time %>" type="both" pattern="yyyy-MM-dd"/>" readonly="readonly" name="cre_date"/></td>
          <td>状态</td>
          <td>新创建</td>
        </tr>
        <tr>
          <td>客户</td>
          <td><input type="text" name="customer" id="customer"/></td>
          <td>服务类型</td>
          <td><select name="types" id="types">
				<option>请选择...</option>
				<c:forEach items="${list }" var="d">
					<option value="${d.values }">${d.values }</option>
				</c:forEach>
			</select></td>
        </tr>
        <tr>
          <td valign="top">服务请求</td>
          <td><textarea rows="6" cols="36" name="request" id="request"/></textarea></td>
          <td></td>
          <td></td>
        </tr>
      </table>
      </form>
    </div>
  </div>
</div>

<script type="text/javascript">
	$("#save").click(function(){
		var c = $("#customer").val();
		if( c == null || c == ""){
			alert("客户名称不能为空");
			return;
		}
		var t = $("#types").val();
		if(t == null || t == ""){
			alert("请选择类型");
			return;
		}
		
		var r = $("#request").val();
		if(r == null || r == ""){
			alert("服务请求不能为空");
			return;
		}
		alert("保存成功");
		$("#form1").submit();
	})
</script>
</body>
</html>
