<div class="modal fade" id="editCatalog" tabindex="-1" role="dialog"
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
							placeholder="目录名称" value="${catalogInfo.name }">
					</div>
					<div class="form-group">
						<label for="type">目录类型</label> 
						<select class="form-control" id="catalogtype" onchange="typeChange();" value="${catalogInfo.type }">
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