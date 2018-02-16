<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://shiro.apache.org/tags" prefix="shiro" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>CRM_Left</title>
<link rel="stylesheet" href="css/stylesheet.css" type="text/css"  />
<link rel="stylesheet" href="css/sidebar.css" type="text/css"  />
<script type="text/javascript" src="js/javascript.js"></script>
<script type="text/javascript" src="js/jquery-1.3.2.min.js"></script>
<script type="text/javascript" src="js/simpla.jquery.configuration.js"></script>
</head>
<shiro:authenticated>
<body>
<div>
  <div id="loader"><img src="images/1d_2.gif"/></div>
  <div class="current_user attention">
    <div> 欢迎您，<strong><%=session.getAttribute("name") %></strong><br />
      [系统管理员，<a href="logout" target="_top">退出</a>] </div>
  </div>
  <div id="sidebar">
    <div id="sidebar-wrapper">
      <ul id="main-nav">
        <li> <a href="#" class="nav-top-item current" id="man_nav_1" onclick="list_sub_nav(id)"> 营销管理 </a>
          <ul>
            <li><a href="getallopppage/1" target="rightFrame" id="a_nav_1" onclick="a_sub_nav(id)">销售机会管理</a></li>
            <li><a href="todevlist/1" target="rightFrame" id="a_nav_2" onclick="a_sub_nav(id)">客户开发计划</a></li>
          </ul>
        </li>
        <li> <a href="#" class="nav-top-item" id="man_nav_2" onclick="list_sub_nav(id)"> 客户管理</a>
          <ul>
            <li><a href="getOppInfoPage/1" target="rightFrame" id="a_nav_3" onclick="a_sub_nav(id)">客户信息管理</a></li>
            <li><a href="getOppPage/1" target="rightFrame" id="a_nav_4" onclick="a_sub_nav(id)">客户流失管理</a></li>
          </ul>
        </li>
        <li> <a href="#" class="nav-top-item" id="man_nav_3" onclick="list_sub_nav(id)"> 服务管理 </a>
          <ul>
            <li><a href="toaddserpage" target="rightFrame" id="a_nav_5" onclick="a_sub_nav(id)">服务创建</a></li>
            <li><a href="todispatch/1" target="rightFrame" id="a_nav_6" onclick="a_sub_nav(id)">服务分配</a></li>
           	<!-- shiro 判断 当拥有 添加 权限是 可以访问 -->
            <shiro:hasPermission name="添加">
	            <li><a href="todeal_list/1" target="rightFrame" id="a_nav_7" onclick="a_sub_nav(id)">服务处理</a></li>
	            <li><a href="tofeedback_list/1" target="rightFrame" id="a_nav_8" onclick="a_sub_nav(id)">服务反馈</a></li>
	            <li><a href="tofile_list/1" target="rightFrame" id="a_nav_9" onclick="a_sub_nav(id)">服务归档</a></li>
         	</shiro:hasPermission>
          </ul>
        </li>
         <!-- 当用户，角色为 系统管理员时可以访问 -->
        <%-- <shiro:hasRole name="系统管理员"> --%>
        <li> <a href="#" class="nav-top-item" id="man_nav_4" onclick="list_sub_nav(id)"> 统计报表 </a>
          <ul>
            <li><a href="selectsummoney" target="rightFrame" id="a_nav_10" onclick="a_sub_nav(id)">客户贡献分析</a></li>
            <li><a href="#" target="rightFrame" id="a_nav_11" onclick="a_sub_nav(id)">客户构成分析</a></li>
            <li><a href="#" target="rightFrame" id="a_nav_12" onclick="a_sub_nav(id)">客户服务分析</a></li>
            <li><a href="#" target="rightFrame" id="a_nav_13" onclick="a_sub_nav(id)">客户流失分析</a></li>
          </ul>
        </li>
        <li> <a href="#" class="nav-top-item" id="man_nav_5" onclick="list_sub_nav(id)"> 基础数据 </a>
          <ul>
            <li><a href="getAllDict/1" target="rightFrame" id="a_nav_14" onclick="a_sub_nav(id)">数据字典管理</a></li>
            <li><a href="getpage/1" target="rightFrame" id="a_nav_15" >查询产品信息</a></li>
            <li><a href="getstockpage/1" target="rightFrame" id="a_nav_16" onclick="a_sub_nav(id)">查询库存</a></li>
          </ul>
        </li>
      <%--   </shiro:hasRole> --%>
      </ul>
    </div>
  </div>
</div>
</body>
</shiro:authenticated>
</html>
