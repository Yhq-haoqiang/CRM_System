<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
  <div class="txt" style="padding-top:3px;" >当前位置：客户开发计划&nbsp;&gt;&nbsp;客户信息管理&nbsp;&gt;&nbsp;客户信息
    <hr class="hr1" />
  </div>
  <div class="operation_button"> <a href="#" title="查询">查询</a> </div>
  <div class="search_input">
    <ul class="txt">
      <li>客户名称：
        <input type="text" size="30" />
      </li>
      <li>客户经理：
        <select>
          <option>全部</option>
          <option>小明</option>
          <option>小红</option>
          <option>小李</option>
        </select>
      </li>
    </ul>
  </div>
  <div>
    <table width="100%" border="0" cellpadding="0" cellspacing="0" class="table_list" >
      <thead>
        <tr>
          <th width="5%">序号</th>
          <th width="15%">客户编号</th>
          <th width="20%">客户名称</th>
          <th width="10%">概要</th>
          <th width="15%">客户经理</th>
          <th width="15%">电话</th>
          <th width="15%">操作</th>
        </tr>
      </thead>
      <tbody>
      <c:forEach items="${bean.pageInfo }" var="opp" varStatus="vs">
        <tr>
          <td>${vs.count }</td>
          <td>KH${opp.id }</td>
          <td><a href="#">${opp.customer }</a></td>
          <td>${opp.outline }</td>
          <td>${opp.contacts.name}</td>
          <td>${opp.contacts.phone }</td>
          <td><img title="联系人" src="<%=path %>/images/user.ico" class="op_button" onclick="tolinkman(${opp.id })" /><img title="交往记录" src="<%=path %>/images/bubble.ico" class="op_button" onclick="tocontactpage(${opp.id },'${opp.customer }');" /><img title="历史订单" src="<%=path %>/images/document.ico" class="op_button" onclick="toorderpage(${opp.id },'${opp.customer }');" /></td>
        </tr>
        </c:forEach>
      </tbody>
    </table>
  </div>
  <div class="position"> 
  	共${bean.totalCount }条记录&nbsp;每页${bean.numOfPage }条&nbsp;第${bean.currentPage }页/共${bean.totalPage }页 
		    <a href="<%=path %>/getOppInfoPage/1" title="首页">&laquo;首页</a>
		    <a href="<%=path %>/getOppInfoPage/<c:if test="${bean.currentPage == 1 }">1</c:if><c:if test="${bean.currentPage != 1 }">${bean.currentPage - 1 }</c:if>" title="上一页">&laquo; 上一页</a>
		    <a href="<%=path %>/getOppInfoPage/${bean.currentPage }" class="number current" title="${bean.currentPage }">${bean.currentPage }</a> 
		    <c:if test="${bean.currentPage + 1 <= bean.totalPage}"><a href="<%=path %>/getOppInfoPage/${bean.currentPage + 1 }" class="number" title="${bean.currentPage + 1 }">${bean.currentPage + 1 }</a></c:if>
		    <c:if test="${bean.currentPage + 2 <= bean.totalPage}"><a href="<%=path %>/getOppInfoPage/${bean.currentPage + 2 }" class="number" title="${bean.currentPage + 2 }">${bean.currentPage + 2 }</a></c:if>
		    <c:if test="${bean.currentPage + 3 <= bean.totalPage}"><a href="<%=path %>/getOppInfoPage/${bean.currentPage + 3 }" class="number" title="${bean.currentPage + 3 }">${bean.currentPage + 3 }</a></c:if>
		    <c:if test="${bean.currentPage < bean.totalPage}"><a href="<%=path %>/getOppInfoPage/${bean.currentPage + 1 }" title="下一页">下一页&raquo;</a></c:if><c:if test="${bean.currentPage >= bean.totalPage}"><a href="<%=path %>/getOppInfoPage/${bean.totalPage }" title="下一页">下一页&raquo;</a></c:if>
		    <a href="<%=path %>/getOppInfoPage/${bean.totalPage}" title="末页">末页&raquo;</a> 
		   	 转到&nbsp;<input  size="2"  id="pagenum"/>
		    &nbsp;页<a href="#" id="go">GO</a>
  </div>
</div>
<script type="text/javascript">
	function tocontactpage(id,customer){
		window.location.href="<%=path %>/tocontact?id=" + id + "&customer=" + customer + "&pagenum=1";
	}
	function toorderpage(id,customer){
		window.location.href="<%=path %>/toorderpage?id=" + id + "&customer=" + customer + "&pagenum=1";
	}
	function tolinkman(id){
		window.location.href="<%=path %>/tolinkman/" + id;
	}
</script>
<script type="text/javascript">
	$("#go").click(function(){
		var pagenum = $("#pagenum").val();
		window.location.href="<%=path %>/getOppInfoPage/" + pagenum;
	})
</script>
</body>
</html>