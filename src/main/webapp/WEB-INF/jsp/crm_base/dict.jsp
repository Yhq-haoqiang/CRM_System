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
  <div class="txt" style="padding-top:3px;" >当前位置：基础数据&nbsp;&gt;&nbsp;数据字典管理&nbsp;&gt;&nbsp;数据字典列表
    <hr class="hr1" />
  </div>
  <div class="operation_button">
  	<a href="<%=path %>/todict_add" title="新建">新建</a>
    <a href="#" title="查询" id="query">查询</a>
  </div>
  <div class="search_input">
  <form action="<%=path %>/query" id="form1" method="post">
    <ul class="txt">
      <li>类别：
        <input type="text" size="30" name="category" id="category"/>
      </li>
      <li>条目：
        <input type="text" size="30" name="entry" id="entry"/>
      </li>
      <li>值：
        <input type="text" size="30" name="values" id="valu"/>
      </li>
    </ul>
   </form>
  </div>
  <div>
    <table width="100%" border="0" cellpadding="0" cellspacing="0" class="table_list" >
      <thead>
        <tr>
          <th width="5%">编号</th>
          <th width="20%">类别</th>
          <th width="30%">条目</th>
          <th width="10%">值</th>
          <th width="15%">是否可编辑</th>
          <th width="15%">操作</th>
        </tr>
      </thead>
      <tbody>
	      <c:if test="${bean != null}">
		      <c:forEach items="${bean.pageInfo }" var="d">
		        <tr>
		          <td>${d.id }</td>
		          <td>${d.category }</td>
		          <td>${d.entry }</td>
		          <td>${d.values }</td>
		          <td><c:choose><c:when test="${d.status == 0 }">是</c:when><c:when test="${d.status == 1 }">否</c:when></c:choose></td>
		          <td><c:if test="${d.status == 0 }"><a href="<%=path %>/todict_edit/${d.id }"><img title="编辑" src="<%=path %>/images/hammer_screwdriver.png" class="op_button"/></a> <a href="<%=path %>/deletedict/${d.id }"><img title="删除" src="<%=path %>/images/cross.png" /></a></c:if></td>
		        </tr>
		       </c:forEach>
	       </c:if>
      </tbody>
    </table>
  </div>
  <div class="position"> 
  	共${bean.totalCount }条记录&nbsp;每页${bean.numOfPage }条&nbsp;第${bean.currentPage }页/共${bean.totalPage }页 
    <a href="<%=path %>/getAllDict/1" title="首页">&laquo;首页</a>
    <a href="<%=path %>/getAllDict/<c:if test="${bean.currentPage == 1 }">1</c:if><c:if test="${bean.currentPage != 1 }">${bean.currentPage - 1 }</c:if>" title="上一页">&laquo; 上一页</a>
    <a href="<%=path %>/getAllDict/${bean.currentPage }" class="number current" title="${bean.currentPage }">${bean.currentPage }</a> 
    <c:if test="${bean.currentPage + 1 <= bean.totalPage}"><a href="<%=path %>/getAllDict/${bean.currentPage + 1 }" class="number" title="${bean.currentPage + 1 }">${bean.currentPage + 1 }</a></c:if>
    <c:if test="${bean.currentPage + 2 <= bean.totalPage}"><a href="<%=path %>/getAllDict/${bean.currentPage + 2 }" class="number" title="${bean.currentPage + 2 }">${bean.currentPage + 2 }</a></c:if>
    <c:if test="${bean.currentPage + 3 <= bean.totalPage}"><a href="<%=path %>/getAllDict/${bean.currentPage + 3 }" class="number" title="${bean.currentPage + 3 }">${bean.currentPage + 3 }</a></c:if>
    <c:if test="${bean.currentPage < bean.totalPage}"><a href="<%=path %>/getAllDict/${bean.currentPage + 1 }" title="下一页">下一页&raquo;</a></c:if><c:if test="${bean.currentPage >= bean.totalPage}"><a href="<%=path %>/getAllDict/${bean.totalPage }" title="下一页">下一页&raquo;</a></c:if>
    <a href="<%=path %>/getAllDict/${bean.totalPage}" title="末页">末页&raquo;</a> 
   	 转到&nbsp;<input  size="2"  id="pagenum"/>
    &nbsp;页<a href="#" id="go">GO</a>
  </div>
</div>
<script type="text/javascript">
	$("#go").click(function(){
		var pagenum = $("#pagenum").val();
		window.location.href="<%=path %>/getAllDict/" + pagenum;
	})
</script>
<script type="text/javascript">
	$("#query").click(function(){
		if($("#category").val() == null || $("#category").val() == ""){
			if($("#entry").val() == null || $("#entry").val() == ""){
				if($("#valu").val() == null || $("#valu").val() == ""){
					alert("内容不能为空！");
					return;
				}
			}
		}
		$("#form1").submit();
	})
</script>
</body>
</html>
