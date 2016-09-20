<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>管理员登录</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" type="text/css"
	href="<%=path%>/bootstrap/css/bootstrap.min.css">
	<script src="http://cdn.bootcss.com/jquery/1.11.1/jquery.min.js"></script>
	<script src="<%=path%>/bootstrap/js/bootstrap.min.js"></script>
  </head>
  
  <body>
   <div class="container">
		<form class="form-signin" role="form" method="post">
        <h2 class="form-signin-heading">登录</h2>
        <input id="username" type="input" class="form-control" placeholder="用户名">
        <input id="password" type="password" class="form-control" placeholder="密码">
        <button class="btn btn-lg btn-primary btn-block" type="button" onclick="check();">提交</button>
      </form>
	</div>
  </body>
  <script type="text/javascript">
  function check(){
	 	var password = $("#password").val();
		var username = $("#username").val();
		if(username==""){
			alert("用户名不能为空");
		}else if(password==""){
			alert("密码不能为空");
		}else{
			$.post("user/user_check",{username:username,password:password},function(text){
				if(text!="1"){
					alert("用户名或密码不正确");
				}else{
					window.location.href="user/admin_index";
				}
			}); 
		}
  }
  </script>
</html>
