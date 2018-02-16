<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>客户开发计划</title>
<% String path = request.getContextPath(); %>
<link href="<%=path%>/css/stylesheet.css" rel="stylesheet" type="text/css" />
<link href="<%=path%>/css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=path %>/js/jquery-1.3.2.min.js"></script>
<script type="text/javascript" src="<%=path%>/js/javascript.js"></script>
</head>

<body>
<div style="padding:5px;">
  <div class="txt" style="padding-top:3px;" >当前位置：客户开发计划&nbsp;&gt;&nbsp;客户流失管理&nbsp;&gt;&nbsp;<a href="list.html">流失信息</a>&nbsp;&gt;&nbsp;暂缓流失
    <hr class="hr1" />
  </div>
  <div class="operation_button">
  	<a href="#" title="返回" onclick="back()">返回</a>
    <a href="#" title="保存" onclick="save();">保存</a>
  </div>
  <div class="out_bg">
    <div class="in_bg">
    <form action="<%=path %>/addreprieve" method="post" id="fm">
      <table border="0" cellpadding="0" cellspacing="0" class="table_input txt">
        <tr>
          <td width="126">编号</td>
          <td width="411">${opp.id } <input type="hidden" value="${opp.id }" name="id" > </td>
          <td width="126">客户</td>
          <td width="442">${opp.customer }</td>
        </tr>
        <tr>
          <td>客户经理</td>
          <td>${opp.contacts.name }</td>
          <td>上次下单时间</td>
          <td><fmt:formatDate value="${opp.cre_date }" type="both"  pattern="yyyy-MM-dd"/></td>
        </tr>
        <tr>
          <td valign="top">暂缓措施</td>
          <td><textarea rows="6" cols="36" name="reprieve" id="reprieve" />${opp.reprieve }</textarea></td>
          <td></td>
          <td></td>
        </tr>
      </table>
      </form>
    </div>
  </div>
</div>
<script type="text/javascript">
	function save(){
		var reprieve = $("#reprieve").val().trim();
		if(reprieve == null || reprieve == ""){
			alert("措施不能为空！");
			return;
		}
		$("#fm").submit();
	}
</script>
</body>
</html>
