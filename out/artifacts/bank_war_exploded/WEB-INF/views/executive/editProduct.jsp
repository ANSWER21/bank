<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
	<title>修改产品信息</title>

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
						<h1 style="text-align: center;">修改产品信息</h1>
					</div>
				</div>
				<div class="panel-body">
					<form class="form-horizontal" role="form" action="${pageContext.request.contextPath}/executive/editProducted.html" id="editfrom" method="post">
						<div class="form-group">
							<label for="inputPassword3" class="col-sm-2 control-label">编号</label>
							<div class="col-sm-10">
								<input readonly="readonly" type="text" class="form-control"  name="id" value="${id}">
							</div>
						</div>
						<div class="form-group">
						<label for="inputPassword3" class="col-sm-2 control-label">产品类型</label>
						<div class="col-sm-10">
							<select class="form-control" name="pid">
								<option value="001" ${list.pid=="001"?'selected':''}>活期存款</option>
								<option value="002" ${list.pid=="002"?'selected':''}>定期存款</option>
								<option value="003" ${list.pid=="003"?'selected':''}>理财</option>
								<option value="004" ${list.pid=="004"?'selected':''}>基金</option>
								<option value="005" ${list.pid=="005"?'selected':''}>保险</option>
							</select>
						</div>
					</div>
						<div class="form-group">
							<label for="inputPassword3" class="col-sm-2 control-label">产品名称</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="inputPassword3" name="pname" placeholder="请输入产品名称" value="${list.pname}">
							</div>
						</div>
						<div class="form-group">
							<label for="inputPassword3" class="col-sm-2 control-label">期限类型</label>
							<div class="col-sm-10">
								<input type="text" class="form-control"  name="ptime" placeholder="请输入产品名称" value="${list.ptime}">
							</div>
						</div>
						<div class="form-group">
							<label for="inputPassword3" class="col-sm-2 control-label" >风险等级</label>
							<div class="col-sm-10">
								<select class="form-control" name="prisk">
									<option value="0" ${list.prisk=="0"?'selected':''}>0级</option>
									<option value="1" ${list.prisk=="1"?'selected':''}>1级</option>
									<option value="2" ${list.prisk=="2"?'selected':''}>2级</option>
									<option value="3" ${list.prisk=="3"?'selected':''}>3级</option>
									<option value="4" ${list.prisk=="4"?'selected':''}>4级</option>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label for="inputPassword3" class="col-sm-2 control-label">期限类型</label>
							<div class="col-sm-10">
								<input type="text" class="form-control"  name="ptime" placeholder="请输入产品名称" value="${list.ptime}">
							</div>
						</div>
						<div class="form-group">
							<label for="inputPassword3" class="col-sm-2 control-label">起点金额（元）</label>
							<div class="col-sm-10">
								<input type="number" class="form-control"  name="pmoney" placeholder="请输入起点金额" value="${list.pmoney}">
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
