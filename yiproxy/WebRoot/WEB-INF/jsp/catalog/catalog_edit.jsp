<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<form role="form">
		<div class="form-group">
		<input type="hidden" value="${catalogInfo.id }" id="catalogId"/>
			<label for="name">目录名称</label> <input
				type="email" class="form-control" id="catalogName"
				placeholder="目录名称" value="${catalogInfo.name }">
		</div>
		<div class="form-group">
			<label for="type">目录类型</label> 
			<select class="form-control" id="catalogType" onchange="typeChange();" value="${catalogInfo.type }">
			  <option <c:if test="${catalogInfo.type==1 }">selected</c:if> value="1" >1级目录</option>
			  <option <c:if test="${catalogInfo.type==2 }">selected</c:if> value="2" >2级目录</option>
			  <option <c:if test="${catalogInfo.type==3 }">selected</c:if> value="3" >3级目录</option>
			  <option <c:if test="${catalogInfo.type==4 }">selected</c:if> value="4" >4级目录</option>
			</select>
		</div>
		<div class="form-group">
			<label for="precatalog">上级目录</label> 
			
			<select class="form-control" id="Precatalog">
			<c:forEach var="catalog" items="${catalogList}" varStatus="s">
				<c:choose>
					<c:when test="${catalog.id==catalogInfo.precatalog}">  
				       <option selected value="${catalog.id}" >${catalog.name}</option>
				    </c:when>
				    <c:when test="${catalog.id!=catalogInfo.precatalog}">  
				       <option value="${catalog.id}" >${catalog.name}</option>
				    </c:when>
			    </c:choose>
			 </c:forEach>
			</select>
		</div>
		<div class="form-group">
		 <button type="button" class="btn btn-success" onclick="saveCatalog();">
		提交
		</button>
		<button type="button" class="btn btn-danger" onclick="toCatalogList()">
		返回
		</button>
		</div>
	</form>
