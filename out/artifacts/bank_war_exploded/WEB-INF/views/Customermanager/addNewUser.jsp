<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
	<title></title>

	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<!-- 引入bootstrap -->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
	<!-- 引入JQuery  bootstrap.js-->
	<script src="${pageContext.request.contextPath}/js/jquery-3.2.1.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
</head>
<body>

<!-- 顶栏 -->
<jsp:include page="top.jsp"></jsp:include>
<!-- 中间主体 -->
<div class="container" id="content">
	<div class="row">
		<jsp:include page="menu.jsp"></jsp:include>
		<div class="col-md-10">
			<div class="panel panel-default">
				<div class="panel-heading">
					<div class="row">
						<h1 style="text-align: center;">添加新营销用户</h1>
					</div>
				</div>
				<div class="panel-body">
					<form class="form-horizontal" role="form" action="${pageContext.request.contextPath}/Customermanager/addNewUsered.html" id="editfrom" method="post">
						<div class="form-group">
							<label  class="col-sm-2 control-label">用户名称</label>
							<div class="col-sm-10">
								<input  type="text" class="form-control" name="nname" placeholder="请输入用户名称">
							</div>
						</div>

						<div class="form-group">
							<label  class="col-sm-2 control-label">手机号码</label>
							<div class="col-sm-10">
								<input  type="tel" class="form-control" name="nphone" placeholder="请输入手机号码">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">咨询内容</label>
							<div class="col-sm-10">
								<input type="text" class="form-control"  name="ncontent" placeholder="请输入咨询内容">
							</div>
						</div>

						<div class="form-group">
							<label class="col-sm-2 control-label">成功几率</label>
							<div class="col-sm-10">
								<input type="text" class="form-control"  name="nsuccess" placeholder="请输入成功几率">
							</div>
						</div>
						<div class="form-group" style="text-align: center">
							<button class="btn btn-default" type="submit">提交</button>
							<button class="btn btn-default" type="reset">重置</button>
						</div>
					</form>
				</div>

			</div>

		</div>
	</div>
</div>
<div class="container" id="footer">
	<div class="row">
		<div class="col-md-12"></div>
	</div>
</div>
</body>
<script type="text/javascript">
</script>
</html>
