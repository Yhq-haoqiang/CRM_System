<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>客户开发计划列表</title>
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
  <div class="txt" style="padding-top:3px;" >当前位置：营销管理&nbsp;&gt;&nbsp;客户开发计划&nbsp;&gt;&nbsp;开发计划
    <hr class="hr1" />
  </div>
  <div class="operation_button">
    <a href="#" title="查询">查询</a>
  </div>
  <div class="search_input">
    <ul class="txt">
      <li>客户名称：
        <input type="text" size="30" />
      </li>
      <li>联系人：
        <input type="text" size="30" />
      </li>
      <li>创建时间：
        <input type="text" size="30" onfocus="WdatePicker({lang:'zh-cn',dateFmt:'yyyy-MM-dd'})" />
      </li>
    </ul>
  </div>
  <div>
    <table width="100%" border="0" cellpadding="0" cellspacing="0" class="table_list" >
      <thead>
        <tr>
          <th width="5%">编号</th>
          <th width="15%">客户名称</th>
          <th width="15%">概要</th>
          <th width="10%">联系人</th>
          <th width="15%">联系电话</th>
          <th width="15%">创建时间</th>
          <th width="10%">状态</th>
          <th width="15%">操作</th>
        </tr>
      </thead>
      <tbody>
      <c:forEach items="${bean.pageInfo }" var="opp">
        <tr>
          <td>${opp.id }</td>
          <td><a href="#">${opp.customer }</a></td>
          <td>${opp.outline }</td>
          <td>${opp.contacts.name }</td>
          <td>${opp.contacts.phone }</td>
          <td><fmt:formatDate value="${opp.cre_date }" type="both" pattern="yyyy-MM-dd" /> </td>
          <td><c:if test="${opp.status == 0}">未开发</c:if><c:if test="${opp.status == 1}">开发中</c:if><c:if test="${opp.status == 2}">已归档</c:if><c:if test="${opp.status == 3}">暂缓流失</c:if><c:if test="${opp.status == 4}">流失</c:if></td>
          <td><c:if test="${opp.status == 0}"><img title="制定计划" src="<%=path %>/images/pencil.ico" class="op_button" onclick="toplanpage(${opp.id});" /></c:if>
           <c:if test="${opp.status == 1}"><img title="制定计划" src="<%=path %>/images/pencil.ico" class="op_button" onclick="toplanpage(${opp.id})" /> <%-- <img title="执行计划" src="<%=path %>/images/right.ico" class="op_button" onclick="to('opp_edit.html')" /> --%><img title="开发成功" src="<%=path %>/images/tick.ico" class="op_button" onclick="changeStatus(${opp.id });" /></c:if>
           <c:if test="${opp.status == 2}"><img title="已归档" src="<%=path %>/images/briefcase.ico" class="op_button" /></c:if>
           </td>
        </tr>
        </c:forEach>
      </tbody>
    </table>
  </div>
  <div class="position"> 
  	共${bean.totalCount }条记录&nbsp;每页${bean.numOfPage }条&nbsp;第${bean.currentPage }页/共${bean.totalPage }页 
		    <a href="<%=path %>/todevlist/1" title="首页">&laquo;首页</a>
		    <a href="<%=path %>/todevlist/<c:if test="${bean.currentPage == 1 }">1</c:if><c:if test="${bean.currentPage != 1 }">${bean.currentPage - 1 }</c:if>" title="上一页">&laquo; 上一页</a>
		    <a href="<%=path %>/todevlist/${bean.currentPage }" class="number current" title="${bean.currentPage }">${bean.currentPage }</a> 
		    <c:if test="${bean.currentPage + 1 <= bean.totalPage}"><a href="<%=path %>/todevlist/${bean.currentPage + 1 }" class="number" title="${bean.currentPage + 1 }">${bean.currentPage + 1 }</a></c:if>
		    <c:if test="${bean.currentPage + 2 <= bean.totalPage}"><a href="<%=path %>/todevlist/${bean.currentPage + 2 }" class="number" title="${bean.currentPage + 2 }">${bean.currentPage + 2 }</a></c:if>
		    <c:if test="${bean.currentPage + 3 <= bean.totalPage}"><a href="<%=path %>/todevlist/${bean.currentPage + 3 }" class="number" title="${bean.currentPage + 3 }">${bean.currentPage + 3 }</a></c:if>
		    <c:if test="${bean.currentPage < bean.totalPage}"><a href="<%=path %>/todevlist/${bean.currentPage + 1 }" title="下一页">下一页&raquo;</a></c:if><c:if test="${bean.currentPage >= bean.totalPage}"><a href="<%=path %>/todevlist/${bean.totalPage }" title="下一页">下一页&raquo;</a></c:if>
		    <a href="<%=path %>/todevlist/${bean.totalPage}" title="末页">末页&raquo;</a> 
		   	 转到&nbsp;<input  size="2"  id="pagenum"/>
		    &nbsp;页<a href="#" id="go">GO</a>
  </div>
</div>
<script type="text/javascript">
	$("#go").click(function(){
		var pagenum = $("#pagenum").val();
		window.location.href="<%=path %>/todevlist/" + pagenum;
	})
</script>
<script type="text/javascript">
	function toplanpage(id){
		window.location.href="<%=path %>/toplanpage/" + id;
	}
</script>
<script type="text/javascript">
	function changeStatus(id){
		window.location.href="<%=path %>/dofile/" + id;
	}
</script>
</body>
</html>
