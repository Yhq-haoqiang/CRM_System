<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>服务管理</title>
<% String path = request.getContextPath(); %>
<link href="<%=path %>/css/stylesheet.css" rel="stylesheet" type="text/css" />
<link href="<%=path %>/css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=path %>/js/javascript.js"></script>
<script type="text/javascript" src="<%=path %>/js/jquery-1.3.2.min.js"></script>
</head>
<body>
<div style="padding:5px;">
  <div class="txt" style="padding-top:3px;" >当前位置：客户服务管理&nbsp;&gt;&nbsp;服务处理列表&nbsp;&gt;&nbsp;服务处理
    <hr class="hr1" />
  </div>
  <div class="operation_button">
  	<a href="#" title="返回" onclick="back()">返回</a>
    <a href="#" title="保存" onclick="save();">保存</a>
  </div>
  <div class="out_bg">
    <div class="in_bg">
    <form action="<%=path %>/handle" method="post" id="form1">
      <table border="0" cellpadding="0" cellspacing="0" class="table_input txt">
        <tr>
          <td width="126">编号</td>
          <td width="411">${ser.id }<input type="hidden" name="id" value="${ser.id }"></td>
          <td width="126">服务类型</td>
          <td width="442">${ser.types }</td>
        </tr>
        <tr>
          <td>概要</td>
          <td colspan="3">${ser.outline }</td>
        </tr>
        <tr>
          <td>客户</td>
          <td>${ser.customer }</td>
          <td>状态</td>
          <td>已分配</td>
        </tr>
        <tr>
          <td>服务请求</td>
          <td colspan="3">${ser.request }</td>
        </tr>
        <tr>
          <td>创建人</td>
          <td>${ser.cre_name }</td>
          <td>创建时间</td>
          <td><fmt:formatDate value="${ser.cre_date }" type="both" pattern="yyyy-MM-dd"/></td>
        </tr>
        <tr>
          <td>分配给</td>
          <td>${ser.dis_name }</td>
          <td>分配时间</td>
          <td><fmt:formatDate value="${ser.dis_date }" type="both" pattern="yyyy-MM-dd"/></td>
        </tr>
        <tr>
          <td valign="top">服务处理</td>
          <td><textarea rows="6" cols="36" name="handle" id="hh1" /></textarea></td>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
        </tr>
        <tr>
          <td>处理人</td>
          <td><input type="text" value="<%=session.getAttribute("name") %>" readonly="readonly" name="handle_name"/></td>
          <td>处理时间</td>
          <jsp:useBean id="time" class="java.util.Date" />
          <!-- 类型未datetime -->
          <td><input type="text" value="<fmt:formatDate value="<%=time %>" type="both" pattern="yyyy-MM-dd"/>" readonly="readonly" name="handle_date"/></td>
        </tr>
      </table>
      </form>
    </div>
  </div>
</div>
<script type="text/javascript">
	function save(){
		var h = $("#hh1").val();
		if(h == null || h == ""){
			alert("处理内容不能为空！");
			return;
		}
		alert("处理成功！");
		$("#form1").submit();
	}
</script>
</body>
</html>
