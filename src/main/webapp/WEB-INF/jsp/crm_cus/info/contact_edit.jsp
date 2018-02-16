<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>客户开发计划</title>
<% String path = request.getContextPath(); %>
<link href="<%=path %>/css/stylesheet.css" rel="stylesheet" type="text/css" />
<link href="<%=path %>/css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=path%>/js/jquery-1.3.2.min.js"></script>
<script type="text/javascript" src="<%=path %>/js/javascript.js"></script>
</head>

<body>
<div style="padding:5px;">
  <div class="txt" style="padding-top:3px;" >当前位置：客户开发计划&nbsp;&gt;&nbsp;客户信息管理&nbsp;&gt;&nbsp;<a href="list.html">客户信息</a>&nbsp;&gt;&nbsp;交往记录&nbsp;&gt;&nbsp;编辑交往记录
    <hr class="hr1" />
  </div>
  <div class="operation_button">
  	<a href="#" title="返回" onclick="back()">返回</a>
    <a href="#" title="保存" onclick="updaterec();">保存</a>
  </div>
  <form action="<%=path %>/updaterec" method="post" id="fm">
  <table border="0" cellpadding="0" cellspacing="0" class="table_show txt">
        <tr>
          <td width="100" align="center">客户编号：</td>
          <td width="200">KH${opp.id }<input type="hidden" value="${opp.id }" name="oppid" ></td>
          <td width="100" align="center">客户名称：</td>
          <td width="200">${opp.customer }<input type="hidden" value="${opp.customer }" name="customer"></td>
        </tr>
  </table>
  <div class="out_bg">
    <div class="in_bg">
      <table border="0" cellpadding="0" cellspacing="0" class="table_input txt">
        <tr>
          <td width="126">时间</td>
          <td width="411"><input type="datetime" value="${rec.rdate }" name="rdate" id="rdate"/></td>
          <td width="126">地点</td>
          <td width="442"><input type="text" value="${rec.address }" name="address" id="address"/></td>
        </tr>
        <tr>
          <td>概要</td>
          <td><input type="text" value="${rec.outline }" name="outline" id="outline"/></td>
          <td>备注</td>
          <td><input type="text" value="${rec.remarks }" name="remarks" /></td>
        </tr>
        <tr>
          <td valign="top">详细信息</td>
          <td><textarea rows="6" cols="36" name="descr">${rec.descr }</textarea></td>
          <td></td>
          <td></td>
        </tr>
      </table>
      <input type="hidden" value="${rec.id }" name="id">
    </div>
  </div>
  </form>
</div>
<script type="text/javascript">
	function updaterec(){
		var rdate = $("#rdate").val();
		if(rdate == null || rdate == ""){
			alert("时间不能为空");
			return;
		}
		var address = $("#address").val();
		if(address == null || address == ""){
			alert("地点不能为空");
			return;
		}
		var outline = $("#outline").val();
		if(outline == null || outline == ""){
			alert("概要不能为空");
			return;
		}
		$("#fm").submit();
	}
</script>
</body>
</html>
