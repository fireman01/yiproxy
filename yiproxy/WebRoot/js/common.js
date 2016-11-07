// 渲染url指定的模板到targetObj指定的标签
function renderTpl(targetObj, templateURL, data) {
	//var splitor = templateURL.indexOf("?") == -1 ? "?" : "&";
	$(targetObj).setTemplateURL(
			templateURL,// + splitor + "date=" + (+new Date()),
			null, {
				filter_data : false
			}).processTemplate(data);
}

// 渲染url指定的模板到targetObj指定的标签（异步方式）
function renderTpl_async(targetObj, templateURL, data, callback) {
  jQuery.ajax({
    url: templateURL,
    type: "POST", 
    async: true,
    cache: false,
    contentType:"application/x-www-form-urlencoded; charset=utf-8",
//    dataType: 'html',
    success: function(d) {
      $(targetObj)
        .setTemplate(d, null, {filter_data : false})
        .processTemplate(data);
        if(callback)callback();
    }
  });
}

