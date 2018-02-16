<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>营销管理</title>
<% String path = request.getContextPath(); %>
<link href="<%=path %>/css/stylesheet.css" rel="stylesheet" type="text/css" />
<link href="<%=path %>/css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=path %>/js/jquery-1.3.2.min.js"></script>
<script type="text/javascript" src="<%=path %>/js/javascript.js"></script>
</head>

<body>
<div style="padding:5px;">
  <div class="txt" style="padding-top:3px;" >当前位置：营销管理&nbsp;&gt;&nbsp;销售机会管理&nbsp;&gt;&nbsp;销售机会&nbsp;&gt;&nbsp;指派销售机会
    <hr class="hr1" />
  </div>
  <div class="operation_button">
  	<a href="#" title="返回" onclick="back()">返回</a>
    <a href="#" title="保存" onclick="save();">保存</a>
  </div>
  <div class="out_bg">
    <div class="in_bg">
    <form action="<%=path %>/updateopp" method="post" id="form1">
      <table border="0" cellpadding="0" cellspacing="0" class="table_input txt">
        <tr>
          <td width="126" height="50">编号</td>
          <td width="411">${opp.id }<input type="hidden" value="${opp.id }" name="id"></td>
          <td width="126">机会来源</td>
          <td width="442"><input type="text" value="${opp.oppcome }" name="oppcome"></td>
        </tr>
        <tr>
          <td height="50">客户名称</td>
          <td><input type="text" value="${opp.customer }" name="customer"></td>
          <td>成功几率</td>
          <td><input type="text" value="${opp.odds }" name="odds"></td>
        </tr>
        <tr>
          <td height="50">概要</td>
          <td><input type="text" value="${opp.outline }" name="outline"></td>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
        </tr>
        <tr>
          <td height="50">联系人</td>
          <td><input type="text" value="${opp.contacts.name }" name="name"><input type="hidden" value="${opp.contacts.id }" name="cid" ></td>
          <td>联系人电话</td>
          <td><input type="text" value="${opp.contacts.phone }" name="phone"></td>
        </tr>
        <tr style="padding:0px;">
          <td valign="top">机会描述</td>
          <td><input type="text" value="${opp.descr }" name="descr"></td>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
        </tr>
        <tr>
          <td height="50">创建人</td>
          <td>${opp.cre_name }<input type="hidden" value="${opp.cre_name }" name="cre_name"></td>
          <td>创建时间</td>
          <td><input type="datetime" value="<fmt:formatDate value="${opp.cre_date }" type="both"  pattern="yyyy-MM-dd"/>" name="cre_date" readonly="readonly"></td>
        </tr>
        <tr>
          <td height="50">指派给</td>
          <td>
          	<select style="width:311px;height:30px;" name="assignor">
				<c:forEach items="${list }" var="name">
				<option value="${name }"<c:if test="${name ==opp.assignor }">selected="selected"</c:if>>${name }</option>
				</c:forEach>
			</select>
           </td>
          <td>指派时间</td>
          <td><input type="datetime" value="<fmt:formatDate value="${opp.assdate }" type="both"  pattern="yyyy-MM-dd"/> " name="assdate" readonly="readonly"></td>
        </tr>
      </table>
      </form>
    </div>
  </div>
</div>
<script type="text/javascript">
	function save(){
		$("#form1").submit();
	}

</script>
</body>
</html>
