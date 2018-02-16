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
<link href="<%=path %>/css/stylesheet.css" rel="stylesheet" type="text/css" />
<link href="<%=path %>/css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=path %>/js/jquery-1.3.2.min.js"></script>
<script type="text/javascript" src="<%=path %>/js/simpla.jquery.configuration.js"></script>
<script type="text/javascript" src="<%=path %>/js/javascript.js"></script>
<script type="text/javascript" src="<%=path %>/datepicker/WdatePicker.js"> </script>

</head>

<body>
<div style="padding:5px;">
  <div class="txt" style="padding-top:3px;" >当前位置：客户开发计划&nbsp;&gt;&nbsp;客户信息管理&nbsp;&gt;&nbsp;历史订单
    <hr class="hr1" />
  </div>
  <div class="operation_button">
    <a href="#" title="返回" onclick="back()">返回</a>
  </div>
  <table border="0" cellpadding="0" cellspacing="0" class="table_show txt">
        <tr>
          <td width="100" align="center">客户编号：</td>
          <td width="200">KH${oppid }</td>
          <td width="100" align="center">客户名称：</td>
          <td width="200">${customer }</td>
        </tr>
  </table>
  <div>
    <table width="100%" border="0" cellpadding="0" cellspacing="0" class="table_list" >
      <thead>
        <tr>
          <th width="15%">订单编号</th>
          <th width="15%">日期</th>
          <th width="30%">送货地址</th>
          <th width="10%">状态</th>
          <th width="20%">操作</th>
        </tr>
      </thead>
      <tbody>
       <c:forEach items="${bean.pageInfo }" var="p">
        <tr>
          <td>${p.id }</td>
          <td><fmt:formatDate value="${p.orderdate }" type="both" pattern="yyyy-MM-dd" /> </td>
          <td>${customer }公司前台</td>
          <td>完成</td>
          <td><img title="查看明细" src="<%=path %>/images/document.ico" class="op_button" onclick="toorderdetail(${p.id})" /></td>
        </tr>
        </c:forEach>
      </tbody>
    </table>
  </div>
  <div class="position"> 
  	共${bean.totalCount }条记录&nbsp;每页${bean.numOfPage }条&nbsp;第${bean.currentPage }页/共${bean.totalPage }页 
		    <a href="<%=path %>/toorderpage?id=${oppid}&customer=${customer}&pagenum=1" title="首页">&laquo;首页</a>
		    <a href="<%=path %>/toorderpage?id=${oppid}&customer=${customer}&pagenum=<c:if test="${bean.currentPage == 1 }">1</c:if><c:if test="${bean.currentPage != 1 }">${bean.currentPage - 1 }</c:if>" title="上一页">&laquo; 上一页</a>
		    <a href="<%=path %>/toorderpage?id=${oppid}&customer=${customer}&pagenum=${bean.currentPage }" class="number current" title="${bean.currentPage }">${bean.currentPage }</a> 
		    <c:if test="${bean.currentPage + 1 <= bean.totalPage}"><a href="<%=path %>/toorderpage?id=${oppid}&customer=${customer}&pagenum=${bean.currentPage + 1 }" class="number" title="${bean.currentPage + 1 }">${bean.currentPage + 1 }</a></c:if>
		    <c:if test="${bean.currentPage + 2 <= bean.totalPage}"><a href="<%=path %>/toorderpage?id=${oppid}&customer=${customer}&pagenum=${bean.currentPage + 2 }" class="number" title="${bean.currentPage + 2 }">${bean.currentPage + 2 }</a></c:if>
		    <c:if test="${bean.currentPage + 3 <= bean.totalPage}"><a href="<%=path %>/toorderpage?id=${oppid}&customer=${customer}&pagenum=${bean.currentPage + 3 }" class="number" title="${bean.currentPage + 3 }">${bean.currentPage + 3 }</a></c:if>
		    <c:if test="${bean.currentPage < bean.totalPage}"><a href="<%=path %>/toorderpage?id=${oppid}&customer=${customer}&pagenum=${bean.currentPage + 1 }" title="下一页">下一页&raquo;</a></c:if><c:if test="${bean.currentPage >= bean.totalPage}"><a href="<%=path %>/toorderpage?id=${oppid}&customer=${customer}&pagenum=${bean.totalPage }" title="下一页">下一页&raquo;</a></c:if>
		    <a href="<%=path %>/toorderpage?id=${oppid}&customer=${customer}&pagenum=${bean.totalPage}" title="末页">末页&raquo;</a> 
		   	 转到&nbsp;<input  size="2"  id="pagenum"/>
		    &nbsp;页<a href="#" id="go">GO</a>
  </div>
</div>
<script type="text/javascript">
	$("#go").click(function(){
		var pagenum = $("#pagenum").val();
		window.location.href="<%=path %>/toorderpage?id=${oppid}&customer=${customer}&pagenum="+pagenum;
	})
	
	function toorderdetail(pid){
		window.location.href="<%=path %>/toorderdetailpage?id=${oppid}&customer=${customer}&planid="+pid;
	}
</script>
</body>
</html>
