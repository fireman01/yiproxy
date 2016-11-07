<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
%>

<html>
  <head>
    
    <title>修改产品</title>
    
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
      <a class="navbar-brand" href="javascript:void(0);" onclick="toIndex();">yiproxy</a>
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
<form role="form">
	<div class="form-group">
	<input type="hidden" id="productId" value="${product.id }">
		<label for="brand">产品品牌</label> 
		<select class="form-control" id="shoesBrand" onchange="brandChange();">
		<c:forEach var="brand" items="${brandList}" varStatus="s">
		<option value="${brand.id }" <c:if test="${product.brand==brand.id}">selected</c:if>>${brand.name }</option>
		</c:forEach>
		</select>
	</div>
	
	<div class="form-group">
		<label for="type">产品系列</label> 
		<select class="form-control" id="shoesRange" onchange="rangeChange();">
		<option value="0">请选择</option>
		<c:forEach var="range" items="${rangeList}" varStatus="s">
			<option value="${range.id }" <c:if test="${product.shoesRange==range.id}">selected</c:if>>${range.name }</option>
		</c:forEach>
		</select>
	</div>
	<div class="form-group">
		<label for="type">产品名称</label> 
		<select class="form-control" id="shoesName" onchange="nameChange();">
		<option value="0">请选择</option>
		<c:forEach var="name" items="${nameList}" varStatus="s">
			<option value="${name.id }" <c:if test="${product.name==name.id}">selected</c:if>>${name.name }</option>
		</c:forEach>
		</select>
	</div>
	<div class="form-group">
		<label for="precatalog">产品颜色</label> 
		<select class="form-control" id="shoesColor">
		<option value="0">请选择</option>
		<c:forEach var="color" items="${colorList}" varStatus="s">
			<option value="${color.id }" <c:if test="${product.color==color.id}">selected</c:if>>${color.name }</option>
		</c:forEach>
		</select>
	</div>
	<div class="form-group">
		<label for="name">备注</label> 
		<input type="text" class="form-control"
			id="shoesRemarks" placeholder="备注" value="${product.remarks }">
	</div>
	<div class="col-md-12">
	<c:forEach var="picture" items="${product.picture}" varStatus="s">
			<div class="thumbnail col-md-2">
		      <img src="<%=path %>${picture}" alt="...">
		    </div>
	</c:forEach>
	</div>
	<form enctype="multipart/form-data">
		<div class="form-group">  
	     <label for="inputfile">上传图片</label> 
	     <input id="shoesPicture"  type="file"  name="file" multiple data-min-file-count="1"/> 
		</div>  
	</form>
	<div class="form-group">
		 <button type="button" class="btn btn-success" onclick="saveProduct();">
		提交
		</button>
		<button type="button" class="btn btn-danger" onclick="toProduct()">
		返回
		</button>
		</div>
</form>
</div>
  </body>
  <script src="http://cdn.bootcss.com/jquery/1.11.1/jquery.min.js"></script>
	<script src="<%=path%>/bootstrap/js/bootstrap.min.js"></script>
	<script src="<%=path%>/js/jtemplates.js"></script>
	<script src="<%=path%>/js/fileinput.min.js"></script>
	<script src="<%=path%>/js/common.js"></script>
	<script src="<%=path%>/js/zh.js"></script>
<script type="text/javascript">
var path = "<%=path%>";
function toIndex(){
	window.location.href= path+"/user/admin_index";
}
function editProduct(id){
	window.location.href= path+"/product/product_edit?id="+id;
}
function toCatalog(){
	renderTpl($("#content"),path+"/catalog/catalog_list",null);
}
function typeChange(){
	var type = parseInt($('#catalogtype').val())-1;
	if(type>0){
		$.get(path+"/catalog/getCatalogByType",{type:type},function(text){
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
	$.post(path+"/catalog/saveCatalog",{type:type,name:name,precatalog:precatalog},function(text){
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
	$.post(path+"/catalog/saveCatalog",{type:type,name:name,precatalog:precatalog,id:id},function(text){
		if(text!="1"){
			alert("保存失败！");
		}else{
			alert("保存成功！");
			renderTpl($("#content"),path+"/catalog/catalog_list",null);
		}
	}); 
}
function productPageChange(curPage){
	renderTpl($("#content"),path+"/product/product_list?curPage="+curPage,null);
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
function addProduct(){
	window.location.href= path+"/product/product_add";
}
function brandChange(){
	var shoesBrand = $('#shoesBrand').val();
		$.get(path+"/catalog/getCatalogListByPreCatalog",{id:shoesBrand},function(text){
			if(text!=null){
				var json =$.parseJSON(text);
				var option = "<option value='0'>请选择</option>";
				for(var i=0; i<json.length; i++){
					option+="<option value='"+json[i].id+"'>"+json[i].name+"</option>";
				}
				$("#shoesRange").html(option);
			}else{
				alert("请求失败！");
			}
		}); 
}

function rangeChange(){
	var shoesRange = $('#shoesRange').val();
		$.get(path+"/catalog/getCatalogListByPreCatalog",{id:shoesRange},function(text){
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
		$.get(path+"/catalog/getCatalogListByPreCatalog",{id:shoesName},function(text){
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
var picture = "";
$('#shoesPicture').fileinput({
    language: 'zh', //设置语言
    uploadUrl: path+"/product/uploadFile", //上传的地址
    allowedFileExtensions : ['png','jpg','gif','bpm'],//接收的文件后缀
    showUpload: false, //是否显示上传按钮
    showCaption: true,//是否显示标题
    browseClass: "btn btn-primary", //按钮样式             
    previewFileIcon: "<i class='glyphicon glyphicon-king'></i>"
}).on("filebatchselected", function(event, files) {
    $(this).fileinput("upload");
}).on("fileuploaded", function(event, data) {
    if(data.response.status="SUCCESS")
    {
    	if(picture==""){
    		picture+=data.response.path;
    	}else{
    		picture+=","+data.response.path;
    	}
    }
});
function saveProduct(){
	var shoesBrand = $('#shoesBrand').val();
	var shoesRange = $('#shoesRange').val();
	var shoesName = $('#shoesName').val();
	var shoesColor = $('#shoesColor').val();
	var shoesRemarks = $('#shoesRemarks').val();
	var introduction = $('#shoesBrand').find("option:selected").text()+$('#shoesName').find("option:selected").text()+$('#shoesColor').find("option:selected").text();
	var id = $('#productId').val();
	$.post(path+"/product/saveProduct",{id:id,brand:shoesBrand,shoesRange:shoesRange,name:shoesName,color:shoesColor,remarks:shoesRemarks,introduction:introduction,picture:picture},function(text){
		if(text!="1"){
			alert("保存失败！");
		}else{
			alert("保存成功！");
			renderTpl($("#content"),path+"/product/product_list",null);
		}
	}); 
	picture="";
}
</script>
</html>
