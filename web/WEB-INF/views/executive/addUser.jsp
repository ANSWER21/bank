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
		$("#cid").blur(function () {
					var cid = $(this).val();
					if (cid === "") {
						alert("请先填写编号")
					}
					else {
						var url = "<%=request.getContextPath()%>/executive/checkcid.html";  // 请求的url
						$.post(
								url,
								{'cid': cid},
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
					<form class="form-horizontal" role="form" action="${pageContext.request.contextPath}/executive/addUsered.html" id="editfrom" method="post">
						<div class="form-group">
							<label for="cid" class="col-sm-2 control-label">编号</label>
							<div class="col-sm-10">
								<input type="number" class="form-control" id="cid" name="cid" placeholder="请输入编号，建议格式：10*">
							</div>
						</div>
						<div class="form-group">
							<label for="inputPassword3" class="col-sm-2 control-label">用户名称</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="inputPassword3" name="cname" placeholder="请输入用户名">
							</div>
						</div>
						<div class="form-group">
							<label for="inputPassword3" class="col-sm-2 control-label">性别</label>
							<div class="col-sm-10">
								<label class="checkbox-inline">
									<input type="radio" name="csex" value="男" checked>男
								</label>
								<label class="checkbox-inline">
									<input type="radio" name="csex" value="女">女
								</label>
							</div>
						</div>
						<div class="form-group">
							<label for="inputPassword3" class="col-sm-2 control-label">年龄</label>
							<div class="col-sm-10">
								<input type="number" class="form-control" name="cage" placeholder="请输入年龄">
							</div>
						</div>
						<div class="form-group">
							<label for="inputPassword3" class="col-sm-2 control-label">身份证号</label>
							<div class="col-sm-10">
								<input type="number" class="form-control" name="cIDcard" placeholder="请输入身份证号">
							</div>
						</div>
						<div class="form-group">
							<label  class="col-sm-2 control-label">电话号码</label>
							<div class="col-sm-10">
								<input type="tel" class="form-control" name="cphone" placeholder="请输入电话号码">
							</div>
						</div>
						<div class="form-group">
							<label for="inputPassword3" class="col-sm-2 control-label">职业</label>
							<div class="col-sm-10">
								<input type="text" class="form-control"  name="coccupation" placeholder="请输入职业">
							</div>
						</div>
						<div class="form-group">
							<label for="inputPassword3" class="col-sm-2 control-label" >风险承受能力</label>
							<div class="col-sm-10">
								<select class="form-control" name="crisk">
									<option value="0">0级</option>
									<option value="1">1级</option>
									<option value="2">2级</option>
									<option value="3">3级</option>
									<option value="4">4级</option>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label  class="col-sm-2 control-label">开户账号</label>
							<div class="col-sm-10">
								<input type="number" class="form-control" name="cIDnumber" placeholder="请输入开户账号">
							</div>
						</div>

						<div class="form-group">
							<label for="inputPassword3" class="col-sm-2 control-label" >经理编号</label>
							<div class="col-sm-10">
								<select class="form-control" name="mid">
									<c:forEach items="${managerList}" var="item">
										<option value="${item.mid}">${item.mname}</option>
									</c:forEach>
								</select>
							</div>
						</div>

						<div class="form-group">
							<label for="inputPassword3" class="col-sm-2 control-label" >开户产品</label>
							<div class="col-sm-10">
								<select class="form-control" name="pdid">
									<c:forEach items="${productlist}" var="item">
										<option value="${item.id},${item.pid}">${item.ptype}  ${item.pname}</option>
									</c:forEach>
								</select>
							</div>
						</div>

						<div class="form-group">
							<label for="cid" class="col-sm-2 control-label">金额</label>
							<div class="col-sm-10">
								<input type="number" class="form-control"  name="money" placeholder="请输入金额">
							</div>
						</div>

						<div class="form-group">
							<label  class="col-sm-2 control-label">截止日期</label>
							<div class="col-sm-10">
								<input type="date" class="form-control" name="dendtime" placeholder="请输入截止日期">
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
