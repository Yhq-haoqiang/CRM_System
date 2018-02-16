<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>客户开发计划</title>
<% String path = request.getContextPath(); %>
<link href="<%=path%>/css/stylesheet.css" rel="stylesheet" type="text/css" />
<link href="<%=path%>/css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=path%>/js/jquery-1.3.2.min.js"></script>
<script type="text/javascript" src="<%=path%>/js/javascript.js"></script>
</head>

<body>
<div style="padding:5px;">
  <div class="txt" style="padding-top:3px;" >当前位置：客户开发计划&nbsp;&gt;&nbsp;客户信息管理&nbsp;&gt;&nbsp;<a href="list.html">客户信息</a>&nbsp;&gt;&nbsp;联系人&nbsp;&gt;&nbsp;新建联系人
    <hr class="hr1" />
  </div>
  <div class="operation_button">
  	<a href="#" title="返回" onclick="back()">返回</a>
    <a href="#" title="保存" onclick="save();">保存</a>
  </div>
  <form action="<%=path %>/addorupdatecon" method="post" id="fm">
  <table border="0" cellpadding="0" cellspacing="0" class="table_show txt">
        <tr>
          <td width="100" align="center">客户编号：</td>
          <td width="200">KH${oppid } <input type="hidden" value="${oppid }" name="oppid" > </td>
          <td width="100" align="center">客户名称：</td>
          <td width="200">${customer }</td>
        </tr>
  </table>
  <div class="out_bg">
    <div class="in_bg">
      <table border="0" cellpadding="0" cellspacing="0" class="table_input txt">
        <tr>
          <td width="126">姓名</td>
          <td width="411"><input type="text" name="name" id="name"/></td>
          <td width="126">性别</td>
          <td width="442"><input type="radio" name="sex" checked="checked" id="radio"  value="0"/>男<input type="radio" name="sex" id="radio" value="1" />女</td>
        </tr>
        <tr>
          <td>职位</td>
          <td><input type="text" value="" name="position" id="position"/></td>
          <td>办公电话</td>
          <td><input type="text" value="" name="tell" id="tell"/></td>
        </tr>
        <tr>
          <td>手机</td>
          <td><input type="text" value="" name="phone" id="phone"/></td>
          <td>备注</td>
          <td><input type="text" value="" name="remarks"/></td>
        </tr>
      </table>
    </div>
  </div>
  </form>
</div>
<script type="text/javascript">
	function save(){
		var name = $("#name").val().trim();
		if(name == null || name == ""){
			alert("联系人名称不能为空！");
			return;
		}
		var position = $("#position").val().trim();
		if(position == null || position == ""){
			alert("联系人职位不能为空！");
			return;
		}
		var reg = /^[0-9]*/;
		var tell = $("#tell").val().trim();
		if(tell == null || tell == ""){
			alert("办公电话不能为空！");
			return;
		}
		if(!reg.test(tell)){
			alert("请输入正确的办公电话！")
			return;
		}
		var phone = $("#phone").val().trim();
		if(phone == null || phone == ""){
			alert("手机号不能为空！");
			return;
		}
		if(!reg.test(phone)){
			alert("请输入正确的手机号！")
			return;
		}
		$("#fm").submit();
	}
</script>
</body>
</html>
