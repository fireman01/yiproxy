<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
%>
<div class="row">
	<div class="box col-md-12">
		<div class="box-inner">
			<div class="box-content">
				<div class="row">
					<div class="col-md-6" style="padding:0px 0px 10px 23px;">
						 <a class="btn btn-primary" onclick="addProduct()">
						 添加产品
						</a>
					</div>

				</div>
				<table
					class="table table-striped table-bordered bootstrap-datatable datatable responsive">
					<thead>
						<tr>
							<th style="width:13px"><input type="checkbox" class=""
								id="allCheckbox" name="checkbox" /></th>
							<th>品牌</th>
							<th>系列</th>
							<th>名称</th>
							<th>颜色</th>
							<th>备注</th>
							<th>图片</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="product" items="${productList}" varStatus="s">
							<tr name="checkList">
								<td class="systd"><input name="checkbox" type="checkbox"
									value="${product.id}" /></td>
								<td class="center">${product.shoesBrand}</td>
								<td class="center">${product.shoesRange}</td>
								<td class="center">${product.shoesName}</td>
								<td class="center">${product.shoesColor}</td>
								<td class="center">${product.remarks}</td>
								<td class="center">
								<c:forEach var="picture" items="${product.picture}" varStatus="s">
								<img width="34" height="34" src="<%=path %>${picture}"/>
								</c:forEach>
								</td>
								<td class="center"><a href="javascript:void(0);" onclick="editProduct('${product.id}');"
								class="btn btn-warning">
						  <i class="glyphicon glyphicon-edit icon-white"></i>&nbsp;修改产品
						</a>&nbsp;&nbsp;<a class="btn btn-danger" href="javascript:void(0);"
									onclick="deleteProduct('${product.id}');"> <i
										class="glyphicon glyphicon-trash icon-white"></i> 删除产品
								</a></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				 <div class="row">
					   <div class="col-md-12">
							<nav>
							  <ul class="pagination" style="margin:0 0;" id="catalogPage">
							  <c:forEach var="i" begin="1" end="${totalPage}" step="1">   
							  <c:choose>
									<c:when test="${i==curPage}">  
								      <li class="active"><a href="javascript:void(0);" onclick="productPageChange(${i });">${i }</a></li>
								    </c:when>
									<c:when test="${i!=curPage }">  
								       <li><a href="javascript:void(0);" onclick="productPageChange(${i });">${i }</a></li>
								   </c:when>
									</c:choose>
									</c:forEach>  
							  </ul>
							</nav>
						</div>
					</div>
			</div>
		</div>
	</div>
</div>

