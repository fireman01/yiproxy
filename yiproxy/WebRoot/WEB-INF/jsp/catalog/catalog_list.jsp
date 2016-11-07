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
						 <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#addCatalog">
						 添加目录
						</button>
					</div>

				</div>
				<table
					class="table table-striped table-bordered bootstrap-datatable datatable responsive">
					<thead>
						<tr>
							<th style="width:13px"><input type="checkbox" class=""
								id="allCheckbox" name="checkbox" /></th>
							<th>目录名称</th>
							<th>目录类型</th>
							<th>上级目录</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="catalog" items="${catalogList}" varStatus="s">
							<tr name="checkList">
								<td class="systd"><input name="checkbox" type="checkbox"
									value="${catalog.id}" /></td>
								<td class="center">${catalog.name}</td>
								<td class="center">${catalog.type}级目录</td>
								<td class="center"><c:choose>
							<c:when test="${catalog.precatalogname==null}">  
						            无
						    </c:when>
							<c:when test="${catalog.precatalogname!='' }">  
						              ${catalog.precatalogname}
						   </c:when>
									</c:choose></td>
								<td class="center"><a href="javascript:void(0);" class="btn btn-warning" onclick="editCatalog('${catalog.id}')">
						  <i class="glyphicon glyphicon-edit icon-white"></i>&nbsp;修改目录
						</a>&nbsp;&nbsp;<a class="btn btn-danger" href="javascript:void(0);"
									onclick="deleteCatalog('${catalog.id}');"> <i
										class="glyphicon glyphicon-trash icon-white"></i> 删除目录
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
								      <li class="active"><a href="javascript:void(0);" onclick="pageChange(${i });">${i }</a></li>
								    </c:when>
									<c:when test="${i!=curPage }">  
								       <li><a href="javascript:void(0);" onclick="pageChange(${i });">${i }</a></li>
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
<div class="modal fade" id="addCatalog" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">
					<span aria-hidden="true">&times;</span><span class="sr-only">取消</span>
				</button>
				<h4 class="modal-title" id="myModalLabel">添加目录</h4>
			</div>
			<div class="modal-body">
				<form role="form">
					<div class="form-group">
						<label for="name">目录名称</label> <input
							type="email" class="form-control" id="name"
							placeholder="目录名称">
					</div>
					<div class="form-group">
						<label for="type">目录类型</label> 
						<select class="form-control" id="catalogtype" onchange="typeChange();">
						  <option value="1" >1级目录</option>
						  <option value="2" >2级目录</option>
						  <option value="3" >3级目录</option>
						  <option value="4" >4级目录</option>
						</select>
					</div>
					<div class="form-group">
						<label for="precatalog">上级目录</label> 
						<select class="form-control" id="precatalog">
						  <option value="0" >无</option>
						</select>
					</div>
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
				<button type="button" class="btn btn-primary" onclick="addCatalog();">提交</button>
			</div>
		</div>
	</div>
</div>

