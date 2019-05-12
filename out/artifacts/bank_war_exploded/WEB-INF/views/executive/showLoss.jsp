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
								<th>用户编号</th>
								<th>用户名</th>
								<th>上次交易时间</th>
								<th>资产总额</th>
								<th>流失状态</th>
								<th>原因</th>
								<th>操作</th>
							</tr>
						</thead>

						<tbody>
							<c:forEach items="${list}" var="item">
								<tr>
									<td>${item.cid}</td>
									<td>${item.cname}</td>
									<td>${item.ltime}</td>
									<td>${item.lmoney}</td>
									<td>${item.lentity}</td>
									<td>${item.lcause}</td>
									<td>
                                        <button class="btn btn-default btn-xs btn-info"
                                                onClick="location.href='${pageContext.request.contextPath}/executive/editLoss.html?cid=${item.cid}&lcause=${item.lcause}'">编辑</button>
                                        <button class="btn btn-default btn-xs btn-danger btn-primary"
                                                onClick="location.href='${pageContext.request.contextPath}/executive/removeLoss.html?cid=${item.cid}'">删除</button>
                                        <!--弹出框-->
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
                    <div class="panel-footer">
                        <c:choose>
                            <c:when test="${curpage> 1 }">
                                <a href="${pageContext.request.contextPath}Customermanager/showLoss.html?curpage=${curpage - 1 }"onclick="getListByPage(${curpage - 1 })" >上一页</a>
                            </c:when>
                            <c:otherwise>
                                <a>上一页</a>
                            </c:otherwise>
                        </c:choose>

                        <c:forEach begin="1" end="${totalpage }" varStatus="vs">
                            <a href="${pageContext.request.contextPath}Customermanager/showLoss.html?curpage=${curpage }" onclick="getListByPage(${vs.count })"
                               <c:if test="${vs.count == curpage }">class="current_page"</c:if> >${vs.count }</a>
                        </c:forEach>

                        <c:choose>
                            <c:when test="${curpage < totalpage }">
                                <a href="${pageContext.request.contextPath}Customermanager/showLoss.html?curpage=${curpage + 1 }" onclick="getListByPage(${curpage + 1 })" >下一页</a>
                            </c:when>
                            <c:otherwise>
                                <a>下一页</a>
                            </c:otherwise>
                        </c:choose>
                    </div>
				</div>
			</div>
		</div>
	</div>

</body>
<script type="text/javascript">
    $("#nav li:nth-child(5)").addClass("active")

	</script>
</html>
