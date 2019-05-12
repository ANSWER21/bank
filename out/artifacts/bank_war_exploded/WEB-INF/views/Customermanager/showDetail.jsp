<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
<title>明细展示</title>

<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- 引入bootstrap -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/bootstrap.min.css">
<!-- 引入JQuery  bootstrap.js-->
<script src="${pageContext.request.contextPath}/js/jquery-3.2.1.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>

<%--<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">--%>

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
							<h1 class="col-md-5">明细展示</h1>
							<form class="bs-example bs-example-form col-md-5" role="form"
								  style="margin: 20px 0 10px 0;"
								  action="${pageContext.request.contextPath}/Customermanager/searchDetail.html"
								  id="form1" method="post">
								<div class="input-group">
									<input type="hidden" name="cid" value="${cid}">
									<div class="form-group">
										<label >产品类型</label>
										<div >
											<select class="form-control" name="pid">
												<option value="001">活期存款</option>
												<option value="002">定期存款</option>
												<option value="003">理财</option>
												<option value="004">基金</option>
												<option value="005">保险</option>
											</select>
										</div>
									</div>
									<span class="input-group-addon btn" onclick="document.getElementById('form1').submit()" id="sub">搜索</span>
								</div>
							</form>
							<button class="btn btn-default col-md-2" style="margin-top: 20px"
									onClick="location.href='${pageContext.request.contextPath}/Customermanager/addDetail.html'">
								添加新明细
								<sapn class="glyphicon glyphicon-plus" />
							</button>
						</div>
					</div>
					<table class="table table-bordered">
						<thead>
							<tr>
								<th>编号</th>
								<th>产品名称</th>
								<th>产品类型</th>
								<th>交易时间</th>
								<th>期限（天）</th>
								<th>到期日</th>
								<th>金额（元）</th>
								<th>操作</th>
							</tr>
						</thead>

						<tbody>
							<c:forEach items="${list}" var="item">
								<tr>
									<td>${item.did}</td>
									<td>${item.dname}</td>
									<td>${item.ptype}</td>
									<td>${item.dtime}</td>
									<td>${item.ddeadline}</td>
									<td>${item.dendtime}</td>
									<td>${item.dtotal}</td>
									<td>
										<button class="btn btn-default btn-xs btn-info"
												onClick="location.href='${pageContext.request.contextPath}/Customermanager/editDetail.html?cid=${cid}&did=${item.did}'">修改</button>
										<button class="btn btn-default btn-xs btn-danger btn-primary"
												onClick="location.href='${pageContext.request.contextPath}/Customermanager/removeDetail.html?cid=${cid}&did=${item.did}'">删除</button>
										<!--弹出框-->
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
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
