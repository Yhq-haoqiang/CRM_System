<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>客户开发计划</title>
<% String path = request.getContextPath(); %>
<link href="<%=path%>/css/stylesheet.css" rel="stylesheet" type="text/css" />
<link href="<%=path%>/css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=path%>/js/jquery-1.3.2.min.js"></script>
<script type="text/javascript" src="<%=path%>/js/simpla.jquery.configuration.js"></script>
<script type="text/javascript" src="<%=path%>/js/javascript.js"></script>
<script type="text/javascript" src="<%=path%>/datepicker/WdatePicker.js"> </script>

</head>

<body>
<div style="padding:5px;">
  <div class="txt" style="padding-top:3px;" >当前位置：客户开发计划&nbsp;&gt;&nbsp;客户信息管理&nbsp;&gt;&nbsp;客户信息&nbsp;&gt;&nbsp;联系人
    <hr class="hr1" />
  </div>
  <div class="operation_button">
    <a href="#" title="返回" onclick="back()">返回</a>
    <a href="#" title="新建" onclick="tolinkmanadd(${opp.id },'${opp.customer }');">附加联系人</a>
  </div>
  <table border="0" cellpadding="0" cellspacing="0" class="table_show txt">
        <tr>
          <td width="100" align="center">客户编号：</td>
          <td width="200">KH${opp.id }</td>
          <td width="100" align="center">客户名称：</td>
          <td width="200">${opp.customer }</td>
        </tr>
  </table>
  <div>
    <table width="100%" border="0" cellpadding="0" cellspacing="0" class="table_list" >
      <thead>
        <tr>
          <th width="10%"><input type="checkbox" class="check-all"/></th>
          <th width="10%">姓名</th>
          <th width="5%">性别</th>
          <th width="15%">职位</th>
          <th width="15%">办公电话</th>
          <th width="15%">手机</th>
          <th width="15%">备注</th>
          <th width="15%">操作</th>
        </tr>
      </thead>
      <tbody>
      <tr>
          <td><font color="red" >主要联系人 *</font> </td>
          <td>${opp.contacts.name }</td>
          <td><c:if test="${opp.contacts.sex == 0 }">男</c:if><c:if test="${opp.contacts.sex == 1 }">女</c:if> </td>
          <td>${opp.contacts.position }</td>
          <td>${opp.contacts.tell }</td>
          <td>${opp.contacts.phone }</td>
          <td>${opp.contacts.remarks }</td>
          <td><%-- <img title="编辑" src="<%=path%>/images/hammer_screwdriver.png" class="op_button" onclick="tolinkmanedit(${opp.id },'${opp.customer }',${opp.contacts.id});" /> --%></td>
        </tr>
        <c:if test="${list != null }">
	      <c:forEach items="${list }" var="con">
	        <tr>
	          <td><input type="checkbox" /></td>
	          <td>${con.name }</td>
	          <td><c:if test="${con.sex == 0 }">男</c:if><c:if test="${con.sex == 1 }">女</c:if></td>
	          <td>${con.position }</td>
	          <td>${con.tell }</td>
	          <td>${con.phone }</td>
	          <td>${con.remarks }</td>
	          <td><img title="编辑" src="<%=path%>/images/hammer_screwdriver.png" class="op_button" onclick="tolinkmanedit(${opp.id },'${opp.customer }',${con.id})" /><img title="删除" src="<%=path%>/images/cross.png" class="op_button close" /></td>
	        </tr>
	      </c:forEach>
        </c:if>
      </tbody>
    </table>
  </div>
</div>

<script type="text/javascript">
	function tolinkmanadd(oppid,customer){
		window.location.href="<%=path %>/tolinkmanadd?oppid=" + oppid + "&customer=" + customer;
	}
	
	function tolinkmanedit(oppid,customer,id){
		window.location.href="<%=path %>/tolinkmanedit?oppid=" + oppid + "&customer=" + customer + "&id=" + id;
	}
</script>
</body>
</html>
