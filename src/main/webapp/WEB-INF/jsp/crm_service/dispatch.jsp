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
<script type="text/javascript" src="<%=path %>/js/jquery-1.3.2.min.js"></script>
<script type="text/javascript" src="<%=path %>/js/simpla.jquery.configuration.js"></script>
<script type="text/javascript" src="<%=path %>/js/javascript.js"></script>
<script type="text/javascript" src="<%=path %>/datepicker/WdatePicker.js"> </script>
</head>

<body>
<div style="padding:5px;">
  <div class="txt" style="padding-top:3px;" >当前位置：客户服务管理&nbsp;&gt;&nbsp;服务分配
    <hr class="hr1" />
  </div>
  <div class="operation_button"> <a href="#" title="查询">查询</a> </div>
  <div class="search_input">
    <ul class="txt">
      <li>客户名称：
        <input type="text" size="30" />
      </li>
      <li> 服务类型：
        <select>
          <option>全部...</option>
          <option>咨询</option>
          <option>投诉</option>
          <option>建议</option>
        </select>
      </li>
      <li> 创建日期：
        <input type="text" size="30" onfocus="WdatePicker({lang:'zh-cn',dateFmt:'yyyy-MM-dd'})" />
      </li>
    </ul>
  </div>
  <div>
    <table width="100%" border="0" cellpadding="0" cellspacing="0" class="table_list" >
      <thead>
        <tr>
          <th width="5%"> <input type="checkbox" class="check-all"/>
          </th>
          <th width="5%"> 编号 </th>
          <th width="15%"> 客户名称 </th>
          <th width="20%"> 概要 </th>
          <th width="10%"> 服务类型 </th>
          <th width="10%"> 创建人 </th>
          <th width="10%"> 创建日期 </th>
          <th width="15%"> 分配给 </th>
          <th width="10%"> 操作 </th>
        </tr>
      </thead>
      <tbody>
      	<c:forEach items="${bean.pageInfo }" var="ser"  varStatus="vs">
        <tr>
          <td><input type="checkbox" /></td>
          <td>${vs.count }</td>
          <td><a href="<%=path %>/todetail/${ser.id}">${ser.customer }</a></td>
          <td> ${ser.outline } </td>
          <td> ${ser.types } </td>
          <td> ${ser.cre_name } </td>
          <td> <fmt:formatDate value="${ser.cre_date }" type="both" pattern="yyyy-MM-dd"/></td>
          <td class="operation_button">
         	 <select  id="s${ser.id}">
              <option>请选择...</option>
              <c:forEach  items="${list }" var="name">
              <option value="${name }">${name }</option>
              <</c:forEach>
            </select>
            <a href="#" title="分配" id="fp" onclick="update(${ser.id})">分配</a></td>
          <td><img title="删除" src="<%=path %>/images/cross.png" onclick="deletebyid(${ser.id})" /></td>
        </tr>
        </c:forEach>
        </tbody>
    </table>
  </div>
  <div class="position"> 共${bean.totalCount }条记录&nbsp;每页${bean.numOfPage }条&nbsp;第${bean.currentPage }页/共${bean.totalPage }页 
    <a href="<%=path %>/todispatch/1" title="首页">&laquo;首页</a>
    <a href="<%=path %>/todispatch/<c:if test="${bean.currentPage == 1 }">1</c:if><c:if test="${bean.currentPage != 1 }">${bean.currentPage - 1 }</c:if>" title="上一页">&laquo; 上一页</a>
    <a href="<%=path %>/todispatch/${bean.currentPage }" class="number current" title="${bean.currentPage }">${bean.currentPage }</a> 
    <c:if test="${bean.currentPage + 1 <= bean.totalPage}"><a href="<%=path %>/todispatch/${bean.currentPage + 1 }" class="number" title="${bean.currentPage + 1 }">${bean.currentPage + 1 }</a></c:if>
    <c:if test="${bean.currentPage + 2 <= bean.totalPage}"><a href="<%=path %>/todispatch/${bean.currentPage + 2 }" class="number" title="${bean.currentPage + 2 }">${bean.currentPage + 2 }</a></c:if>
    <c:if test="${bean.currentPage + 3 <= bean.totalPage}"><a href="<%=path %>/todispatch/${bean.currentPage + 3 }" class="number" title="${bean.currentPage + 3 }">${bean.currentPage + 3 }</a></c:if>
    <c:if test="${bean.currentPage < bean.totalPage}"><a href="<%=path %>/todispatch/${bean.currentPage + 1 }" title="下一页">下一页&raquo;</a></c:if><c:if test="${bean.currentPage >= bean.totalPage}"><a href="<%=path %>/getAllDict/${bean.totalPage }" title="下一页">下一页&raquo;</a></c:if>
    <a href="<%=path %>/todispatch/${bean.totalPage}" title="末页">末页&raquo;</a> 
   	 转到&nbsp;<input  size="2"  id="pagenum"/>
    &nbsp;页<a href="#" id="go">GO</a>
  </div>
</div>
<form action="<%=path %>/dispatchser" method="post" id="form1">
	<input type="hidden" value="" name="dis_name" id="disname">
	<input type="hidden" value="" name="id" id="id">
	<!-- <input type="hidden" value="" name="status" id="status"> -->
  </form>
<script type="text/javascript">
	$("#go").click(function(){
		var pagenum = $("#pagenum").val();
		if(pagenum == null || pagenum == ""){
			alert("不能为空");
			return;
		}
		window.location.href="<%=path %>/todispatch/" + pagenum;
	})
</script>
<script type="text/javascript">
	function update(id){
		var s = $("#s"+id).val();
		if(s == null || s == ""){
			alert("分配人不能为空");
			return;
		}
		$("#disname").val(s);
		$("#id").val(id);
		$("#form1").submit();
	}
</script>
<script type="text/javascript">
	function deletebyid(id){
		window.location.href="<%=path %>/deleteByid/" + id;
	}
</script>
<script type="text/javascript">
	$("#go").click(function(){
		var pagenum = $("#pagenum").val();
		window.location.href="<%=path %>/todispatch/" + pagenum;
	})
</script>
</body>
</html>
