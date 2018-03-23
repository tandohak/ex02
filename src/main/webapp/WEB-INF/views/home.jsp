<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script>
		$(function(){
			$("#btn1").click(function(){
				$.ajax({
					type:"get",
					dataType:"json", 
					url:"/ex02/json/map",
					success:function(result){
						console.log(result);
					}
				})
			})
			$("#btn2").click(function(){
				$.ajax({
					type:"get",
					dataType:"json",
					url:"/ex02/json/sendList",
					success:function(res){
						console.log(res);
					}
				})
			})
			  
			$("#btn3").click(function(){
				$.ajax({
					type:"get",
					dataType:"json",
					data:{test:"test",test2:123},
					url:"/ex02/json/sendMapAuth",
					success:function(res){
						console.log(res);
					}
				})
			})
			
		})  
	</script>
</head>
<body>
	<button id='btn1'>map test</button>
	<button id="btn2">list test</button>
	<button id="btn3">list test</button>
	
</body>
</html>
