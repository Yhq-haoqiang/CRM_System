<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>机会管理</title>
<% String path = request.getContextPath(); %>
<link href="<%=path %>/css/stylesheet.css" rel="stylesheet" type="text/css" />
<link href="<%=path %>/css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=path %>/js/jquery-1.3.2.min.js"></script>
<script type="text/javascript" src="<%=path %>/js/simpla.jquery.configuration.js"></script>
<script type="text/javascript" src="<%=path %>/js/javascript.js"></script>
<script type="text/javascript" src="<%=path %>/datepicker/WdatePicker.js">
	
</script>

</head>

<body>
	<!--<div class="notification attention" style="margin-bottom:5px;">
				<a href="#" class="close"><img src="../resources/images/icons/cross_grey_small.png" title="Close this notification" alt="close" /></a>
				<div>
					What's the FUCK!?
				</div>
			</div>-->
	<div style="padding: 5px;">

		<div class="txt" style="padding-top: 3px;">
			当前位置：营销管理&nbsp;&gt;&nbsp;营销机会管理&nbsp;&gt;&nbsp;营销机会
			<hr class="hr1" />
		</div>
		<div class="operation_button">
			<a href="<%=path%>/toaddopppage" title="新建">新建</a> <a title="查询">查询</a>
		</div>
		<div class="search_input">
			<ul class="txt">
				<li>客户名称 <input type="text" name="custname" size="30" />
				</li>
				<li>联系人 <input type="text" name="contacts" size="30" />
				</li>
				<li>创建时间 <input type="text" name="createtime" size="30" />
				</li>
			</ul>
		</div>
		<div>
			<table width="100%" border="0" cellpadding="0" cellspacing="0"
				class="table_list">
				<thead>
                  <tr>
					<th><input type="checkbox" width="5%"></th>
					<th width="15%">编号</th>
					<th width="10%">客户名称</th>
					<th width="20%">摘要</th>
					<th width="10%">联系人</th>
					<th width="15%">联系电话</th>
					<th width="10%">创建时间</th>
					<th width="15%">操作</th>
				  </tr>
				</thead>
				<tbody>
                  <c:forEach items="${bean.pageInfo }" var="opp">
                  	<tr>
						<th><input type="checkbox" width="5%"></th>
						<th width="15%">${opp.id}</th>
						<th width="10%">${opp.customer}</th>
						<th width="20%">${opp.outline}</th>
						<th width="10%">${opp.contacts.name}</th>
						<th width="15%">${opp.contacts.phone}</th>
						<th width="10%"><fmt:formatDate value="${opp.cre_date}" type="both" pattern="yyyy-MM-dd"/> </th>
						<th width="15%"><a href="<%=path %>/findone/${opp.id}"><img title="修改" src="<%=path %>/images/gear.ico" class="op_button"/></a>&nbsp;&nbsp;<a href="<%=path %>/delopp/${opp.id}"><img title="删除" src="<%=path %>/images/cross.png"/></a></th>
					</tr>
                  </c:forEach>
				</tbody>
			</table>
		</div>
		<div class="position">
			共${bean.totalCount }条记录&nbsp;每页${bean.numOfPage }条&nbsp;第${bean.currentPage }页/共${bean.totalPage }页 
		    <a href="<%=path %>/getallopppage/1" title="首页">&laquo;首页</a>
		    <a href="<%=path %>/getallopppage/<c:if test="${bean.currentPage == 1 }">1</c:if><c:if test="${bean.currentPage != 1 }">${bean.currentPage - 1 }</c:if>" title="上一页">&laquo; 上一页</a>
		    <a href="<%=path %>/getallopppage/${bean.currentPage }" class="number current" title="${bean.currentPage }">${bean.currentPage }</a> 
		    <c:if test="${bean.currentPage + 1 <= bean.totalPage}"><a href="<%=path %>/getallopppage/${bean.currentPage + 1 }" class="number" title="${bean.currentPage + 1 }">${bean.currentPage + 1 }</a></c:if>
		    <c:if test="${bean.currentPage + 2 <= bean.totalPage}"><a href="<%=path %>/getallopppage/${bean.currentPage + 2 }" class="number" title="${bean.currentPage + 2 }">${bean.currentPage + 2 }</a></c:if>
		    <c:if test="${bean.currentPage + 3 <= bean.totalPage}"><a href="<%=path %>/getallopppage/${bean.currentPage + 3 }" class="number" title="${bean.currentPage + 3 }">${bean.currentPage + 3 }</a></c:if>
		    <c:if test="${bean.currentPage < bean.totalPage}"><a href="<%=path %>/getallopppage/${bean.currentPage + 1 }" title="下一页">下一页&raquo;</a></c:if><c:if test="${bean.currentPage >= bean.totalPage}"><a href="<%=path %>/getallopppage/${bean.totalPage }" title="下一页">下一页&raquo;</a></c:if>
		    <a href="<%=path %>/getallopppage/${bean.totalPage}" title="末页">末页&raquo;</a> 
		   	 转到&nbsp;<input  size="2"  id="pagenum"/>
		    &nbsp;页<a href="#" id="go">GO</a>
		</div>
		<%-- 	<th><a href="AllUser2?currentPage=1">首页</a></th>
		<th><a href="AllUser2?currentPage=${currentPage-1}">上一页</a></th> --%>
	</div>
	<script type="text/javascript">
	$("#go").click(function(){
		var pagenum = $("#pagenum").val();
		window.location.href="<%=path %>/getallopppage/" + pagenum;
	})
</script>
</body>
</html>
