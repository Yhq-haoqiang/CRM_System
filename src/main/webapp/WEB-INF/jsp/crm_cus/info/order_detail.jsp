<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
  <div class="txt" style="padding-top:3px;" >当前位置：客户开发计划&nbsp;&gt;&nbsp;客户信息管理&nbsp;&gt;&nbsp;<a href="order.html">历史订单</a>&nbsp;&gt;&nbsp;订单明细
    <hr class="hr1" />
  </div>
  <div class="operation_button">
    <a href="#" title="返回" onclick="back()">返回</a>
  </div>
  <table border="0" cellpadding="0" cellspacing="0" class="table_show txt">
        <tr>
          <td width="100" align="center">订单编号：</td>
          <td width="200">${plan.number }</td>
          <td width="100" align="center">日期：</td>
          <td width="200"><fmt:formatDate value="${plan.orderdate }" type="both" pattern="yyyy-MM-dd"/></td>
        </tr>
        <tr>
          <td width="100" align="center">送货地址：</td>
          <td width="200">${customer }公司前台</td>
          <td width="100" align="center">总金额（元）：</td>
          <td width="200">${sum }</td>
        </tr>
        <tr>
          <td width="100" align="center">状态：</td>
          <td width="200">完成</td>
          <td width="100" align="center"></td>
          <td width="200"></td>
        </tr>
  </table>
  <div>
    <table width="100%" border="0" cellpadding="0" cellspacing="0" class="table_list" >
      <thead>
        <tr>
          <th width="30%">商品</th>
          <th width="10%">数量</th>
          <th width="20%">单位</th>
          <th width="20%">单价（元）</th>
          <th width="20%">金额（元）</th>
        </tr>
      </thead>
      <tbody>
      	<c:forEach items="${plan.planDetails }" var="pd">
        <tr>
          <td>${pd.product.name }</td>
          <td>${pd.counts }</td>
          <td>${pd.product.unit }</td>
          <td>${pd.product.price }</td>
          <td>${pd.counts * pd.product.price }</td>
        </tr>
        </c:forEach>
      </tbody>
    </table>
  </div>
</div>
</body>
</html>
