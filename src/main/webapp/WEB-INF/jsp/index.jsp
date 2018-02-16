<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>客户关系管理系统</title>
</head>
<frameset rows="110,*" frameborder="0" border="0" framespacing="0">
  <frame src="top.html" scrolling="no" noresize="noresize" marginheight="0" marginwidth="0" />
  <frameset id="myFrame" cols="240,7,*" frameborder="0" border="0" framespacing="0" name="myFrame" >
    <!--<div id="loader"><img src="images/loader.gif"/></div>-->
    <frame src="left.jsp" scrolling="no" noresize="noresize" marginheight="0" marginwidth="0" />
    <frame src="switch.html" scrolling="no" noresize="noresize" marginheight="0" marginwidth="0" />
    <frame src="right.html" noresize="noresize" marginheight="0" marginwidth="0" name="rightFrame" target="_self" />
  </frameset>
  <!-- 暂时注释 -->
 <!-- <frame src="UntitledFrame-3">-->
</frameset>
<noframes>
<body>
</body>
</noframes>
</html>
