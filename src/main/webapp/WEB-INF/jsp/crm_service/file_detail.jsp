<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
</head>

<body>
<div style="padding:5px;">
  <div class="txt" style="padding-top:3px;" >当前位置：客户服务管理&nbsp;&gt;&nbsp;服务归档列表&nbsp;&gt;&nbsp;归档明细
    <hr class="hr1" />
  </div>
  <div class="operation_button">
  	<a href="#" title="返回" onclick="back()">返回</a>
  </div>
  <div class="out_bg">
    <div class="in_bg">
      <table border="0" cellpadding="0" cellspacing="0" class="table_input txt">
        <tr>
          <td width="126">编号</td>
          <td width="411">${ser.id }</td>
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
          <td><c:choose> <c:when test="${ser.status == 0 }">未分配</c:when><c:when test="${ser.status == 1 }">已分配</c:when><c:when test="${ser.status == 2 }">已处理</c:when><c:when test="${ser.status == 3 }">已归档</c:when></c:choose></td>
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
          <td>服务处理</td>
          <td colspan="3">${ser.handle }</td>
        </tr>
        <tr>
          <td>处理人</td>
          <td>${ser.handle_name }</td>
          <td>处理时间</td>
          <td><fmt:formatDate value="${ser.handle_date }" type="both" pattern="yyyy-MM-dd"/></td>
        </tr>
        <tr>
          <td>处理结果</td>
          <td>${ser.handle_result }</td>
          <td>满意度</td>
          <td>${ser.satisfaction }</td>
        </tr>
      </table>
    </div>
  </div>
</div>
</body>
</html>
