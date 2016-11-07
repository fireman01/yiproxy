<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
%>

<html>
  <head>
    
    <title>管理员主页</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta name="viewport" content="width=device-width, initial-scale=1"> 
	<link rel="stylesheet" type="text/css"
	href="<%=path%>/bootstrap/css/bootstrap.min.css" media="screen">
	<link rel="stylesheet" type="text/css"
	href="<%=path%>/css/fileinput.min.css" media="screen">
  </head>
  
  <body>
    <nav class="navbar navbar-default" role="navigation">
  <div class="container-fluid">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <a class="navbar-brand">yiproxy</a>
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">
        <li><a href="javascript:void(0);" onclick="toCatalog();">目录管理</a></li>
        <li><a href="javascript:void(0);" onclick="toProduct();">产品管理</a></li>
        <li><a href="#">用户管理</a></li>
      </ul>
      <ul class="nav navbar-nav navbar-right">
        <li><a href="">管理员，您好！</a></li>
      </ul>
      
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>
<div class="container" id="content">
<div style="padding: 40px 15px;text-align: center;">
        <h1>易代理</h1>
        <p class="lead">便捷检索，提高效率</p>
      </div>
</div>
  </body>
  <script src="http://cdn.bootcss.com/jquery/1.11.1/jquery.min.js"></script>
	<script src="<%=path%>/bootstrap/js/bootstrap.min.js"></script>
	<script src="<%=path%>/js/jtemplates.js"></script>
	<script src="<%=path%>/js/fileinput.js"></script>
	<script src="<%=path%>/js/common.js"></script>
	<script src="<%=path%>/js/zh.js"></script>
	<script>
	var path = "<%=path%>";
	function editProduct(id){
		window.location.href= path+"/product/product_edit?id="+id;
	}
	function toCatalog(){
		renderTpl($("#content"),path+"/catalog/catalog_list",null);
	}
	function typeChange(){
		var type = parseInt($('#catalogtype').val())-1;
		if(type>0){
			$.get("../catalog/getCatalogByType",{type:type},function(text){
				if(text!=null){
					var json =$.parseJSON(text);
					if(json.length==0){
						alert("请先建立上级目录！");
					}
					var option = "";
					for(var i=0; i<json.length; i++){
						option+="<option value='"+json[i].id+"'>"+json[i].name+"</option>";
					}
					$("#precatalog").html(option);
				}else{
					alert("请求失败！");
				}
			}); 
		}else{
			$("#precatalog").html("<option value='0' >无</option>");
		}
	}
	function addCatalog(){
		var name = $('#name').val();
		var type = $('#catalogtype').val();
		var precatalog = $('#precatalog').val();
		$.post("../catalog/saveCatalog",{type:type,name:name,precatalog:precatalog},function(text){
			if(text!="1"){
				alert("保存失败！");
			}else{
				$('#addCatalog').modal('hide');
				renderTpl($("#content"),path+"/catalog/catalog_list",null);
			}
		}); 
	}
	
	function saveCatalog(){
		var name = $('#catalogName').val();
		var type = $('#catalogType').val();
		var precatalog = $('#Precatalog').val();
		var id = $('#catalogId').val();
		$.post("../catalog/saveCatalog",{type:type,name:name,precatalog:precatalog,id:id},function(text){
			if(text!="1"){
				alert("保存失败！");
			}else{
				alert("保存成功！");
				renderTpl($("#content"),path+"/catalog/catalog_list",null);
			}
		}); 
	}
	function pageChange(curPage){
		renderTpl($("#content"),path+"/catalog/catalog_list?curPage="+curPage,null);
	}
	function deleteCatalog(id){
		var r=confirm("确认删除？");
		if(r==true){
			$.get(path+"/catalog/deleteCatalog",{id:id},function(text){
				if(text!="1"){
					alert("删除失败！");
				}else{
					alert("删除成功！");
					renderTpl($("#content"),path+"/catalog/catalog_list",null);
				}
			}); 
		}
	}

	function deleteProduct(id){
		var r=confirm("确认删除？");
		if(r==true){
			$.get(path+"/product/deleteProduct",{id:id},function(text){
				if(text!="1"){
					alert("删除失败！");
				}else{
					alert("删除成功！");
					renderTpl($("#content"),path+"/product/product_list",null);
				}
			}); 
		}
	}
	function editCatalog(id){
		renderTpl($("#content"),path+"/catalog/catalog_edit?id="+id,null);
	}
	function toCatalogList(){
		renderTpl($("#content"),path+"/catalog/catalog_list",null);
	}
	
	function toProduct(){
		renderTpl($("#content"),path+"/product/product_list",null);
	}
	function toIndex(){
		window.location.href= path+"/user/admin_index";
	}
	function addProduct(){
		window.location.href= path+"/product/product_add";
	}
	function brandChange(){
		var shoesBrand = $('#shoesBrand').val();
			$.get("../catalog/getCatalogListByPreCatalog",{id:shoesBrand},function(text){
				if(text!=null){
					var json =$.parseJSON(text);
					var option = "<option value='0'>请选择</option>";
					for(var i=0; i<json.length; i++){
						option+="<option value='"+json[i].id+"'>"+json[i].name+"</option>";
					}
					$("#shoesName").html(option);
				}else{
					alert("请求失败！");
				}
			}); 
	}
	
	function nameChange(){
		var shoesName = $('#shoesName').val();
			$.get("../catalog/getCatalogListByPreCatalog",{id:shoesName},function(text){
				if(text!=null){
					var json =$.parseJSON(text);
					var option = "<option value='0'>请选择</option>";
					for(var i=0; i<json.length; i++){
						option+="<option value='"+json[i].id+"'>"+json[i].name+"</option>";
					}
					$("#shoesColor").html(option);
				}else{
					alert("请求失败！");
				}
			}); 
	}
	function productPageChange(curPage){
		renderTpl($("#content"),path+"/product/product_list?curPage="+curPage,null);
	}
	</script>
</html>
