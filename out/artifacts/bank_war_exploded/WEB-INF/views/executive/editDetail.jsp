<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
	<title>修改明细信息</title>

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
						<h1 style="text-align: center;">修改明细信息</h1>
					</div>
				</div>
				<div class="panel-body">
					<form class="form-horizontal" role="form" action="${pageContext.request.contextPath}/executive/editDetailed.html" id="editfrom" method="post">
						<input type="hidden" name="cid" value="${cid}">
						<div class="form-group">
							<label  class="col-sm-2 control-label">编号</label>
							<div class="col-sm-10">
								<input readonly="readonly" type="number" class="form-control" name="did" value="${list.did}">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label" >产品类型</label>
							<div class="col-sm-10">
								<select class="form-control" name="pdid">
									<c:forEach items="${productlist}" var="item">
										<option value="${item.id},${item.pid}" ${list.pid==item.pid ?'selected':''}>${item.ptype}  ${item.pname}</option>
									</c:forEach>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label  class="col-sm-2 control-label">交易时间</label>
							<div class="col-sm-10">
								<input type="date" class="form-control" name="dtime" value="${list.dtime}">
							</div>
						</div>
						<div class="form-group">
							<label  class="col-sm-2 control-label">截止日期</label>
							<div class="col-sm-10">
								<input type="date" class="form-control" name="dendtime" value="${list.dendtime}">
							</div>
						</div>
						<div class="form-group">
							<label  class="col-sm-2 control-label">金额</label>
							<div class="col-sm-10">
								<input type="number" class="form-control"  name="money" value="${list.dtotal}">
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
