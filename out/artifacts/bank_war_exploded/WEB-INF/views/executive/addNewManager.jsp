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
<script type="text/javascript">
	//利用ajax进行工号校验
	$(function() {
		$("#mid").blur(function () {
					var mid = $(this).val();
					if (mid === "") {
						alert("请先填写编号")
					}
					else {
						var url = "<%=request.getContextPath()%>/executive/checkmid.html";  // 请求的url
						$.post(
								url,
								{'mid': mid},
								function (data) {
									if (data === "exist") {
										alert("编号已存在请重新输入");
										$(this).val("");
									}else {

									}
								}
						);
					}
				}
		);
	});

</script>
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
						<h1 style="text-align: center;">添加新用户</h1>
					</div>
				</div>
				<div class="panel-body">
					<form class="form-horizontal" role="form" action="${pageContext.request.contextPath}/executive/addNewManagered.html" id="editfrom" method="post">
						<div class="form-group">
							<label  class="col-sm-2 control-label">经理编号</label>
							<div class="col-sm-10">
								<input type="number" class="form-control" id="mid" name="mid" placeholder="请输入编号，建议格式：1000*">
							</div>
						</div>
						<div class="form-group">
							<label for="inputPassword3" class="col-sm-2 control-label">名称</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="inputPassword3" name="mname" placeholder="请输入名称">
							</div>
						</div>
						<div class="form-group">
							<label for="inputPassword3" class="col-sm-2 control-label">年龄</label>
							<div class="col-sm-10">
								<input type="number" class="form-control" name="mage" placeholder="请输入年龄">
							</div>
						</div>
						<div class="form-group">
							<label  class="col-sm-2 control-label">电话号码</label>
							<div class="col-sm-10">
								<input type="tel" class="form-control" name="mphone" placeholder="请输入电话号码">
							</div>
						</div>
						<div class="form-group">
							<label  class="col-sm-2 control-label">电子邮箱</label>
							<div class="col-sm-10">
								<input type="email" class="form-control" name="memail" placeholder="请输入电子邮箱">
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
