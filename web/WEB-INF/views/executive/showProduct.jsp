<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
<title>产品管理</title>

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
							<h1 class="col-md-5">产品管理</h1>
							<form class="bs-example bs-example-form col-md-5" role="form"
								style="margin: 20px 0 10px 0;"
								action="${pageContext.request.contextPath}/executive/searchProduct.html"
								id="form1" method="post">
								<div class="input-group">
									<select class="form-control" name="pid" >
										<option value="">产品类型</option>
										<option value="001" ${pid=="001"?'selected':''}>活期存款</option>
										<option value="002" ${pid=="002"?'selected':''}>定期存款</option>
										<option value="003" ${pid=="003"?'selected':''}>理财</option>
										<option value="004" ${pid=="004"?'selected':''}>基金</option>
										<option value="005" ${pid=="005"?'selected':''}>保险</option>
									</select>
									<select class="form-control" name="prisk" >
										<option value="">风险等级</option>
										<option value="0" ${prisk=="0"?'selected':''}>0级</option>
										<option value="1" ${prisk=="1"?'selected':''}>1级</option>
										<option value="2" ${prisk=="2"?'selected':''}>2级</option>
										<option value="3" ${prisk=="3"?'selected':''}>3级</option>
										<option value="4" ${prisk=="4"?'selected':''}>4级</option>
									</select>
									 <span class="input-group-addon btn"
										onclick="document.getElementById('form1').submit()" id="sub">搜索</span>
								</div>
							</form>
							<button class="btn btn-default col-md-2" style="margin-top: 20px"
								onClick="location.href='${pageContext.request.contextPath}/executive/addProduct.html'">
								添加新产品
								<sapn class="glyphicon glyphicon-plus" />
							</button>
						</div>
					</div>
					<table class="table table-bordered">
						<thead>
							<tr>
								<th>产品编号</th>
								<th>产品名称</th>
								<th>产品类型</th>
								<th>期限类型</th>
								<th>风险等级</th>
								<th>起点金额（元）</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${list}" var="item">
								<tr>
									<td>${item.id}</td>
									<td>${item.pname}</td>
									<td>${item.ptype}</td>
									<td>${item.ptime}</td>
									<td>${item.prisk}</td>
									<td>${item.pmoney}</td>
									<td>
										<button class="btn btn-default btn-xs btn-info"
											onClick="location.href='${pageContext.request.contextPath}/executive/editProduct.html?id=${item.id}'">修改</button>
										<button class="btn btn-default btn-xs btn-danger btn-primary"
											onClick="location.href='${pageContext.request.contextPath}/executive/removeProduct.html?id=${item.id}'">删除</button>
										<!--弹出框-->
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<%--<div class="panel-footer">
						<c:choose>
							<c:when test="${curpage> 1 }">
								<a href="${pageContext.request.contextPath}executive/showProduct.html?curpage=${curpage - 1 }"onclick="getListByPage(${curpage - 1 })" >上一页</a>
							</c:when>
							<c:otherwise>
								<a>上一页</a>
							</c:otherwise>
						</c:choose>

						<c:forEach begin="1" end="${totalpage }" varStatus="vs">
							<a href="${pageContext.request.contextPath}executive/showProduct.html?curpage=${curpage }" onclick="getListByPage(${vs.count })"
							   <c:if test="${vs.count == curpage }">class="current_page"</c:if> >${vs.count }</a>
						</c:forEach>

						<c:choose>
							<c:when test="${curpage < totalpage }">
								<a href="${pageContext.request.contextPath}executive/showProduct.html?curpage=${curpage + 1 }" onclick="getListByPage(${curpage + 1 })" >下一页</a>
							</c:when>
							<c:otherwise>
								<a>下一页</a>
							</c:otherwise>
						</c:choose>
					</div>--%>
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
		<%--设置菜单中--%>
		$("#nav li:nth-child(2)").addClass("active")

	</script>
</html>
