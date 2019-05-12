<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
<title>资本展示</title>

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
							<h1 class="col-md-5">资金展示</h1>
						</div>
					</div>
					<table class="table table-bordered">
						<thead>
							<tr>
								<th>客户名称</th>
								<th>活期存款（元）</th>
								<th>定期存款（元）</th>
								<th>理财（元）</th>
								<th>基金（元）</th>
								<th>保险（元）</th>
								<th>金融资产总额（元）</th>
								<th>客户等级</th>
								<th>操作</th>
							</tr>
						</thead>

						<tbody>
							<c:forEach items="${list}" var="item">
								<tr>
									<td>${item.cname}</td>
									<td>${item.dcurrent}</td>
									<td>${item.dterminal}</td>
									<td>${item.dfinancing}</td>
									<td>${item.dfund}</td>
									<td>${item.dinsurance}</td>
									<td>${item.dtotal}</td>
									<td>${item.level}</td>
									<td>
										<button class="btn btn-default btn-xs btn-info"
												onClick="location.href='${pageContext.request.contextPath}/executive/showDetail.html?cid=${item.cid}'">查看明细</button>
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
