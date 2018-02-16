<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
  <div class="txt" style="padding-top:3px;" >当前位置：客户开发计划&nbsp;&gt;&nbsp;客户信息管理&nbsp;&gt;&nbsp;<a href="list.html">客户信息</a>&nbsp;&gt;&nbsp;交往记录
    <hr class="hr1" />
  </div>
  <div class="operation_button">
    <a href="#" title="返回" onclick="back()">返回</a>
    <a href="#" title="新建" onclick="toaddrec();">新建</a>
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
          <th width="5%"><input type="checkbox" class="check-all"/></th>
          <th width="10%">时间</th>
          <th width="15%">地点</th>
          <th width="20%">概要</th>
          <th width="15%">详细信息</th>
          <th width="20%">备注</th>
          <th width="15%">操作</th>
        </tr>
      </thead>
      <tbody>
      	<c:forEach items="${bean.pageInfo }" var="rec">
        <tr>
          <td><input type="checkbox" /></td>
          <td><fmt:formatDate value="${rec.rdate }" type="both" pattern="yyyy-MM-dd"/></td>
          <td>${rec.address }</td>
          <td>${rec.outline }</td>
          <td>${rec.descr }</td>
          <td>${rec.remarks }</td>
          <td><img title="编辑" src="<%=path%>/images/hammer_screwdriver.png" class="op_button" onclick="toupdate(${rec.id});" /><img title="删除" src="<%=path%>/images/cross.png" class="op_button close" onclick="del(${rec.id});" /></td>
        </tr>
        </c:forEach>
      </tbody>
    </table>
  </div>
  <div class="position"> 
  	共${bean.totalCount }条记录&nbsp;每页${bean.numOfPage }条&nbsp;第${bean.currentPage }页/共${bean.totalPage }页 
		    <a href="<%=path %>/tocontact?id=${oppid}&customer=${customer }&pagenum=1" title="首页">&laquo;首页</a>
		    <a href="<%=path %>/tocontact?id=${oppid}&customer=${customer }&pagenum=<c:if test="${bean.currentPage == 1 }">1</c:if><c:if test="${bean.currentPage != 1 }">${bean.currentPage - 1 }</c:if>" title="上一页">&laquo; 上一页</a>
		    <a href="<%=path %>/tocontact?id=${oppid}&customer=${customer }&pagenum=${bean.currentPage }" class="number current" title="${bean.currentPage }">${bean.currentPage }</a> 
		    <c:if test="${bean.currentPage + 1 <= bean.totalPage}"><a href="<%=path %>/tocontact?id=${oppid}&customer=${customer }&pagenum=${bean.currentPage + 1 }" class="number" title="${bean.currentPage + 1 }">${bean.currentPage + 1 }</a></c:if>
		    <c:if test="${bean.currentPage + 2 <= bean.totalPage}"><a href="<%=path %>/tocontact?id=${oppid}&customer=${customer }&pagenum=${bean.currentPage + 2 }" class="number" title="${bean.currentPage + 2 }">${bean.currentPage + 2 }</a></c:if>
		    <c:if test="${bean.currentPage + 3 <= bean.totalPage}"><a href="<%=path %>/tocontact?id=${oppid}&customer=${customer }&pagenum=${bean.currentPage + 3 }" class="number" title="${bean.currentPage + 3 }">${bean.currentPage + 3 }</a></c:if>
		    <c:if test="${bean.currentPage < bean.totalPage}"><a href="<%=path %>/tocontact?id=${oppid}&customer=${customer }&pagenum=${bean.currentPage + 1 }" title="下一页">下一页&raquo;</a></c:if><c:if test="${bean.currentPage >= bean.totalPage}"><a href="<%=path %>/tocontact?id=${oppid}&customer=${customer }&pagenum=${bean.totalPage }" title="下一页">下一页&raquo;</a></c:if>
		    <a href="<%=path %>/tocontact?id=${oppid}&customer=${customer }&pagenum=${bean.totalPage}" title="末页">末页&raquo;</a> 
		   	 转到&nbsp;<input  size="2"  id="pagenum"/>
		    &nbsp;页<a href="#" id="go">GO</a>
  </div>
</div>
<script type="text/javascript">
	$("#go").click(function(){
		var pagenum = $("#pagenum").val();
		window.location.href="<%=path %>/tocontact?id=${oppid}&customer=${customer }&pagenum=" + pagenum;
	})
	
	function toaddrec(){
		window.location.href="<%=path %>/toaddrec?id=${oppid}&customer=${customer }";
	}
	
	function toupdate(id){
		window.location.href="<%=path %>/findonerec/"+id;
	}
	function del(id){
		if(confirm("是否确定删除？")){
			window.location.href="<%=path %>/delrec/"+id;
		}
	}
</script>
</body>
</html>