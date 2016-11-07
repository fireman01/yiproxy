<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<title>易代理</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta content="width=device-width" name="all" />
<link rel="stylesheet" type="text/css"
	href="<%=path%>/bootstrap/css/bootstrap.min.css">
<link href="<%=path%>/css/style.css" rel="stylesheet" type="text/css"
	media="all" />
<script src="http://cdn.bootcss.com/jquery/1.11.1/jquery.min.js"></script>
<script src="<%=path%>/bootstrap/js/bootstrap.min.js"></script>
<script type="application/x-javascript">
	 addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } 
</script>
<script type="text/javascript" src="<%=path%>/js/move-top.js"></script>
<script type="text/javascript" src="<%=path%>/js/easing.js"></script>
</head>

<body>
	<div class="container">
		<div class="header-top">
			<h1>易代理</h1>
			<p>海量数据，便捷搜索，快速响应</p>
		</div>
	</div>
	<div class="content">
		<div class="container">
			<div class="load_more">
				<div class="l_g">
					<div class="col-md-3 col-sm-6 grid">
						<div class="l_g_r">
							<a href="<%=path%>/product/nike" class="port-grid"  target="_blank"><img class="img-responsive "
								src="<%=path%>/image/nike.jpg" alt=""></a>
							<!-- <div class="port">
					<p class="port-in">耐克</p>
					<div class="clearfix"> </div>
				</div> -->
						</div>
					</div>
					<div class="col-md-3  col-sm-6 grid">
						<div class="l_g_r">
							<a href="<%=path%>/product/adidas" class="port-grid"  target="_blank"><img
								class="img-responsive " src="<%=path%>/image/adidas.jpg" alt=""></a>
						</div>
					</div>
					<div class="col-md-3 col-sm-6 grid">
						<div class="l_g_r">
							<a href="<%=path%>/product/jordan" class="port-grid"  target="_blank"><img
								class="img-responsive " src="<%=path%>/image/jordan.jpg" alt=""></a>
						</div>
					</div>
					<div class="col-md-3 col-sm-6 grid">
						<div class="l_g_r">
							<a href="<%=path%>/product/puma" class="port-grid"  target="_blank"><img
								class="img-responsive " src="<%=path%>/image/puma.jpg" alt=""></a>
						</div>
					</div>
					<div class="clearfix"></div>
				</div>
				
				<div class="l_g">
					<div class="col-md-3 col-sm-6 grid">
						<div class="l_g_r">
							<a href="<%=path%>/product/vans" class="port-grid"  target="_blank"><img
								class="img-responsive " src="<%=path%>/image/vans.jpg" alt=""></a>
						</div>
					</div>
					<div class="col-md-3 col-sm-6 grid">
						<div class="l_g_r">
							<a href="<%=path%>/product/converse" class="port-grid"  target="_blank"><img class="img-responsive "
								src="<%=path%>/image/converse.jpg" alt=""></a>
						</div>
					</div>
					<div class="col-md-3 col-sm-6 grid">
						<div class="l_g_r">
							<a href="<%=path%>/product/newbalance" class="port-grid"  target="_blank"><img
								class="img-responsive " src="<%=path%>/image/newbalance.jpg" alt=""></a>
						</div>
					</div>
					<div class="col-md-3 col-sm-6  grid">
						<div class="l_g_r">
							<a href="<%=path%>/product/reebok" class="port-grid"  target="_blank"><img
								class="img-responsive " src="<%=path%>/image/reebok.jpg" alt=""></a>
						</div>
					</div>
					
					<div class="clearfix"></div>
				</div>
				
				<div class="l_g">
					<div class="col-md-3 col-sm-6 grid">
						<div class="l_g_r">
							<a href="<%=path%>/product/asics" class="port-grid"  target="_blank"><img
								class="img-responsive " src="<%=path%>/image/asics.jpg" alt=""></a>
						</div>
					</div>
					<div class="col-md-3 col-sm-6  grid">
						<div class="l_g_r">
							<a href="<%=path%>/product/ugg" class="port-grid"  target="_blank"><img class="img-responsive "
								src="<%=path%>/image/ugg.jpg" alt=""></a>
						</div>
					</div>
					<div class="col-md-3 col-sm-6 grid">
						<div class="l_g_r">
							<a href="<%=path%>/product/timberland" class="port-grid"  target="_blank"><img
								class="img-responsive " src="<%=path%>/image/timberland.jpg" alt=""></a>
						</div>
					</div>
					<%-- <div class="col-md-3  grid">
						<div class="l_g_r">
							<a href="single.html" class="port-grid"><img
								class="img-responsive " src="<%=path%>/image/reebok.jpg" alt=""></a>
						</div>
					</div> --%>
					
					<div class="clearfix"></div>
				</div>

			</div>
		</div>
		<div class="footer">
			<div class="container">
				<div class="footer-top">
					<p class="footer-class">Copyright © 2016 Constellation Template
						by yiproxy</p>
				</div>
			</div>
			<script type="text/javascript">
				$(document).ready(function() {
					/*
					var defaults = {
						containerID: 'toTop', // fading element id
						containerHoverID: 'toTopHover', // fading element hover id
						scrollSpeed: 1200,
						easingType: 'linear' 
					};
					 */

					$().UItoTop({
						easingType : 'easeOutQuart'
					});

				});
			</script>
			<a href="#" id="toTop" style="display: block;"> <span
				id="toTopHover" style="opacity: 1;"> </span></a>

		</div>
</body>

</html>
