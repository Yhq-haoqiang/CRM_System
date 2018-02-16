<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>统计报表</title>
<% String path = request.getContextPath(); %>
<link href="<%=path%>/css/stylesheet.css" rel="stylesheet" type="text/css" />
<link href="<%=path%>/css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=path%>/js/jquery-1.3.2.min.js"></script>
<script type="text/javascript" src="<%=path%>/js/simpla.jquery.configuration.js"></script>
<script type="text/javascript" src="<%=path%>/js/javascript.js"></script>
<script type="text/javascript" src="<%=path%>/datepicker/WdatePicker.js"> </script>
<script type="text/javascript" src="<%=path%>/js/jquery.jqprint-0.3.js"></script>
</head>

<body>
<div style="padding:5px;">
  <div class="txt" style="padding-top:3px;" >当前位置：统计报表&nbsp;&gt;&nbsp;客户贡献分析
    <hr class="hr1" />
  </div>
  <div class="operation_button"> <a href="#" title="查询">查询</a> </div>
  <div class="search_input">
    <ul class="txt">
      <li>客户名称：
        <input type="text" size="30" />
      </li>
      <li>年份：
        <select>
          <option>全部</option>
        </select>
      </li>
      <li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" id="b1" value="打印"/></li>
    </ul>
  </div>
  <div id="d1">
  	<h2> 客户贡献分析报表</h2>
    <table width="100%" border="0" cellpadding="0" cellspacing="0" class="table_list" >
      <thead>
        <tr>
          <th width="15%">编号</th>
          <th width="65%">客户名称</th>
          <th width="20%">订单金额(元)</th>
        </tr>
      </thead>
      <tbody>
      	<c:forEach items="${list }" var="arr" varStatus="vs">
        <tr>
          <td>${vs.count }</td>
          <td><a href="#">${arr[0] }</a></td>
          <td>${arr[1] }</td>
        </tr>
        </c:forEach>
      </tbody>
    </table>
  </div>
</div>
<script type="text/javascript">  
		$("#b1").click(
			function(){
	            $('#d1').jqprint({  
	                debug: false,            
	                importCSS: true,         
	                printContainer: true, 
	                operaSupport: false      
	            })  
	        }
		)
        </script>  
</body>
</html>
