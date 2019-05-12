<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
	<title>生成报表</title>

	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<!-- 引入bootstrap -->
	<link rel="stylesheet" type="text/css"
		  href="${pageContext.request.contextPath}/css/bootstrap.min.css">
	<!-- 引入JQuery  bootstrap.js-->
	<script src="${pageContext.request.contextPath}/js/jquery-3.2.1.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/echarts.common.min.js"></script>
	<%--<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">--%>

</head>
<body>

<script type="text/javascript" src="http://echarts.baidu.com/gallery/vendors/echarts/echarts.min.js"></script>
<script type="text/javascript" src="http://echarts.baidu.com/gallery/vendors/echarts-gl/echarts-gl.min.js"></script>
<script type="text/javascript" src="http://echarts.baidu.com/gallery/vendors/echarts-stat/ecStat.min.js"></script>
<script type="text/javascript" src="http://echarts.baidu.com/gallery/vendors/echarts/extension/dataTool.min.js"></script>
<script type="text/javascript" src="http://echarts.baidu.com/gallery/vendors/echarts/map/js/china.js"></script>
<script type="text/javascript" src="http://echarts.baidu.com/gallery/vendors/echarts/map/js/world.js"></script>
<script type="text/javascript" src="http://echarts.baidu.com/gallery/vendors/echarts/extension/bmap.min.js"></script>
<script type="text/javascript" src="http://echarts.baidu.com/gallery/vendors/simplex.js"></script>
<!-- 顶栏 -->
<jsp:include page="top.jsp"></jsp:include>
<!-- 中间主体 -->
<div class="container" id="content">
	<div class="row">
		<jsp:include page="menu.jsp"></jsp:include>
		<div class="col-md-10">
			<div class="panel panel-default">
				<!-- 为ECharts准备一个具备大小（宽高）的Dom -->
				<div id="Performance" style="width: 600px;height:400px;"></div>
				<script type="text/javascript">
					var Performance = echarts.init(document.getElementById('Performance'));
					// 显示标题，图例和空的坐标轴
					Performance.setOption({
						title : {
							text: '客户分布报表',
							x:'center'
						},
						tooltip : {
							trigger: 'item',
							formatter: "{a} <br/>{b} : {c} ({d}%)"
						},
						legend: {
							orient: 'vertical',
							left: 'left',
							data: []
						},
						series : [
							{
								name: '访问来源',
								type: 'pie',
								radius : '55%',
								center: ['50%', '60%'],
								data:[
								],
								itemStyle: {
									emphasis: {
										shadowBlur: 10,
										shadowOffsetX: 0,
										shadowColor: 'rgba(0, 0, 0, 0.5)'
									}
								}
							}
						]
					});

					Performance.showLoading();    //数据加载完之前先显示一段简单的loading动画
					var dataname = [];
					var data = [];    //销量数组（实际用来盛放Y坐标值）
					$.ajax({
						type: "post",
						async: true,            //异步请求（同步请求将会锁住浏览器，用户其他操作必须等待请求完成才可以执行）
						url: "<%=request.getContextPath()%>/executive/showDistribution.html",    //请求发送到TestServlet处
						data: {},
						dataType: "json",        //返回数据形式为json
						success: function (performance) {
							//请求成功时执行该函数内容，result即为服务器返回的json对象
							if (performance) {
								for (var i = 0; i < performance.length; i++) {
									dataname.push(performance[i].level);
								}
								for (var i = 0; i < performance.length; i++) {
									console.log(performance[i])
									data.push({value:performance[i].id,name:performance[i].level});//挨个取出类别并填入类别数组
									console.log(data)
								}
								Performance.hideLoading();    //隐藏加载动画
								Performance.setOption({        //加载数据图表
									legend:[{
										data:dataname
									}],
									series: [{
										// 根据名字对应到相应的系列
										name: '客户分布',
										data: data
									}]
								});

							}

						},
						error: function (errorMsg) {
							//请求失败时执行该函数
							alert("图表请求数据失败!");
							Performance.hideLoading();
						}
					});
				</script>
			</div>
		</div>
	</div>
</div>

</body>
<script type="text/javascript">
	<%--设置菜单中--%>
	$("#nav li:nth-child(9)").addClass("active");
</script>
</html>
