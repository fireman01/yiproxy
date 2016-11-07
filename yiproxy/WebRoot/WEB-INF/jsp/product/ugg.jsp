<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
%>
<html>
  <head>
    
    <title>UGG</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="Content-Type" content="text/html; charset=utf8" />
	<meta name="viewport" content="width=device-width, initial-scale=1"> 
	<link rel="stylesheet" type="text/css"
	href="<%=path%>/bootstrap/css/bootstrap.min.css" media="screen">

  </head>
  
 <body>
 <nav class="navbar navbar-default" role="navigation">
  <div class="container-fluid">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="#">yiproxy</a>
    </div>

    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
    <ul class="nav navbar-nav navbar-right">
        <li><a href="#">注册</a></li>
         <li><a href="#">登录</a></li>
      </ul>
      <form class="navbar-form navbar-right" role="search">
        <div class="form-group">
          <input type="text" class="form-control"  id="search" placeholder="Search">
        </div>
        <buttontype="submit" class="btn btn-default" onclick="search('ugg');">搜索</button>
      </form>
      
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>
  <div class="row"> 
 	<div class="col-md-3">
 <!--   <nav class="navbar navbar-default" role="navigation"> -->
    <ul class="nav nav-pills nav-stacked" role="tablist">
    <c:forEach var="catalog" items="${catalogList}" varStatus="s">
    <li><div class="btn-group">
	    <button type="button" class="btn btn-default" style="width:150px;">${catalog.name }</button>
	    <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
	    &nbsp;&nbsp;<span class="caret">&nbsp;</span>
	    <span class="sr-only">&nbsp;</span>
	    </button>
	    <ul class="dropdown-menu" role="menu">
	    <c:forEach var="shoes" items="${catalog.nameList}" varStatus="s">
	    <li><a href="javascript:void(0);" onclick="chooseName('${shoes.id }');">${shoes.name }</a></li>
	    </c:forEach>
	  </ul>
	  </div>
    </li>
    
    </c:forEach>
</ul>
<!-- </nav>-->
 </div>
 
 <div class="col-md-9">
  <div class="container" id="content">
 </div> 
</div>
 </div> 

  </body>
  <script src="http://cdn.bootcss.com/jquery/1.12.2/jquery.min.js"></script>
	<script src="<%=path%>/bootstrap/js/bootstrap.min.js"></script>
	<script src="<%=path%>/js/jtemplates.js"></script>
	<script src="<%=path%>/js/common.js"></script>
	<script>
	$.ajaxSetup({
		 contentType: "application/x-www-form-urlencoded; charset=utf-8"
		});
	var path = "<%=path%>";
	function chooseName(id){
		renderTpl($("#content"),path+"/product/shoes_list?id="+id,null);
	}
	function chooseColor(id){ 
		renderTpl($("#content"),path+"/product/detail_list?id="+id,null);
	}
	function search(brand){
		var text =  $('#search').val();
		if(text==""){
			alert("请输入检索条件！");
		}else{
			$.post(path+"/product/search_result",{brand:brand,text:text},function(d){
				 $('#content').setTemplate(d, null, {filter_data : false}).processTemplate(null);
			}); 
		}
		
	}
	</script>
</html>
