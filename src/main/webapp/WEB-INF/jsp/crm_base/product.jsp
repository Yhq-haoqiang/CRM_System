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
<script type="text/javascript" src="<%=path %>/js/jquery-1.3.2.min.js"></script>
<script type="text/javascript" src="<%=path %>/js/simpla.jquery.configuration.js"></script>
<script type="text/javascript" src="<%=path %>/js/javascript.js"></script>
<script type="text/javascript" src="<%=path %>/datepicker/WdatePicker.js"> </script>

</head>

<body>
<div style="padding:5px;">
  <div class="txt" style="padding-top:3px;" >当前位置：基础数据&nbsp;&gt;&nbsp;查询产品信息
    <hr class="hr1" />
  </div>
  <div class="operation_button">
    <a href="#" title="查询">查询</a>
  </div>
  <div class="search_input">
    <ul class="txt">
      <li>名称：
        <input type="text" size="30" />
      </li>
      <li>型号：
        <input type="text" size="30" />
      </li>
      <li>批次：
        <input type="text" size="30" />
      </li>
    </ul>
  </div>
  <div>
    <table width="100%" border="0" cellpadding="0" cellspacing="0" class="table_list" >
      <thead>
        <tr>
          <th width="5%"><input type="checkbox" class="check-all"/></th>
          <th width="5%">编号</th>
          <th width="20%">名称</th>
          <th width="15%">型号</th>
          <th width="15%">等级/批次</th>
          <th width="5%">单位</th>
          <th width="10%">单价(元)</th>
          <th width="25%">备注</th>
        </tr>
      </thead>
      <tbody>
      <c:forEach items="${bean.pageInfo }" var="pro">
        <tr>
          <td><input type="checkbox" /></td>
          <td>${pro.id }</td>
          <td>${pro.name }</td>
          <td>${pro.model }</td>
          <td>${pro.batch }</td>
          <td>${pro.unit }</td>
          <td>${pro.price }</td>
          <td><c:choose><c:when test="${pro.remarks == 1 }">已生产</c:when><c:when test="${pro.remarks == 0 }">未生产</c:when></c:choose> </td>
        </tr>
        </c:forEach>
      </tbody>
    </table>
  </div>
  <div class="position"> 
  	共${bean.totalCount }条记录&nbsp;每页${bean.numOfPage }条&nbsp;第${bean.currentPage }页/共${bean.totalPage }页 
    <a href="<%=path %>/getpage/1" title="首页">&laquo;首页</a>
    <a href="<%=path %>/getpage/<c:if test="${bean.currentPage == 1 }">1</c:if><c:if test="${bean.currentPage != 1 }">${bean.currentPage - 1 }</c:if>" title="上一页">&laquo; 上一页</a>
    <a href="<%=path %>/getpage/${bean.currentPage }" class="number current" title="${bean.currentPage }">${bean.currentPage }</a> 
    <c:if test="${bean.currentPage + 1 <= bean.totalPage}"><a href="<%=path %>/getpage/${bean.currentPage + 1 }" class="number" title="${bean.currentPage + 1 }">${bean.currentPage + 1 }</a></c:if>
    <c:if test="${bean.currentPage + 2 <= bean.totalPage}"><a href="<%=path %>/getpage/${bean.currentPage + 2 }" class="number" title="${bean.currentPage + 2 }">${bean.currentPage + 2 }</a></c:if>
    <c:if test="${bean.currentPage + 3 <= bean.totalPage}"><a href="<%=path %>/getpage/${bean.currentPage + 3 }" class="number" title="${bean.currentPage + 3 }">${bean.currentPage + 3 }</a></c:if>
    <c:if test="${bean.currentPage < bean.totalPage}"><a href="<%=path %>/getpage/${bean.currentPage + 1 }" title="下一页">下一页&raquo;</a></c:if><c:if test="${bean.currentPage >= bean.totalPage}"><a href="<%=path %>/getpage/${bean.totalPage }" title="下一页">下一页&raquo;</a></c:if>
    <a href="<%=path %>/getpage/${bean.totalPage}" title="末页">末页&raquo;</a> 
   	 转到&nbsp;<input  size="2"  id="pagenum"/>
    &nbsp;页<a href="#" id="go">GO</a>
  </div>
</div>
<script type="text/javascript">
	$("#go").click(function(){
		var pagenum = $("#pagenum").val();
		window.location.href="<%=path %>/getpage/" + pagenum;
	})
</script>
</body>
</html>
