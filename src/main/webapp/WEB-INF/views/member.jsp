<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
span {
	display: inline-block;
	width: 100px;
}

table {
	border-collapse: collapse;
}

tr, td {
	border: 1px solid black;
	padding: 10px;
}
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.0.11/handlebars.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script>
	function addMember() {
		var userid = $("#userid").val();
		var username = $("#username").val();
		var userpw = $("#userpw").val();
		var email = $("#email").val();

		var sendData = {
			userid : userid,
			username : username,
			userpw : userpw,
			email : email
		};

		$.ajax({
			url : "/ex02/member/",
			datatype : "text",
			headers : {
				"Content-Type" : "application/json"
			},
			type : "post",
			data : JSON.stringify(sendData),
			success : function(res) {
				alert(res);
				getList();
			}
		})
	}

	function getList() {
		$.ajax({
			url : "/ex02/member/",
			datatype : "json",
			type : "get",
			success : function(res) {
				console.log(res);
				var source = $("#template").html();
				var t_fn = Handlebars.compile(source);
				$("#list").html(t_fn(res));
			}
		})
	}
	
	function modifyMember() {
		var userid = $("#useridModal").val();
		var username = $("#usernameModal").val();
		var userpw = $("#userpwModal").val();
		var email = $("#emailModal").val();
		
		var sendData = {
			userid : userid,
			username : username,
			userpw : userpw,
			email : email
		};

		$.ajax({
			url : "/ex02/member/"+userid,
			datatype : "text",
			headers : {
				"Content-Type" : "application/json"
			},
			type : "put",
			data : JSON.stringify(sendData),
			success : function(res) {
				alert(res);
				getList();
			}
		})
	}

	$(function() {
		$("#list").on("click", ".delete", function() {
			var parent = $(this).parents("tr");
			console.log(parent.index());
			var userid = parent.find("td:eq(0)").text();/* 
									var username= parent.find("td:eq(1)").text();
									var userpw= parent.find("td:eq(2)").text();
									var email= parent.find("td:eq(3)").text(); */
			$.ajax({
				url : "/ex02/member/" + userid,
				datatype : "json",
				type : "delete",
				success : function(res) {
					alert(res);
					getList();
				}
			})
		})

		$("#list").on("click", ".modify", function() {
			var parent = $(this).parents("tr");
			console.log(parent.index());
			var userid = parent.find("td:eq(0)").text();
			var username = parent.find("td:eq(1)").text();
			var userpw = parent.find("td:eq(2)").text();
			var email = parent.find("td:eq(3)").text();
			
			$("#useridModal").val(userid);
			$("#usernameModal").val(username);
			$("#userpwModal").val(userpw);
			$("#emailModal").val(email); 
  
		});
	})
</script>
</head>
<body>
	<div>
		<p>
			<span>아이디</span> <input type="text" name="userid" id="userid">
		</p>
		<p>
			<span>이름</span> <input type="text" name="username" id="username">
		</p>
		<p>
			<span>비밀번호</span> <input type="text" name="userpw" id="userpw">
		</p>
		<p>
			<span>이메일</span> <input type="text" name="email" id="email">
		</p>
		<input type="submit" id="submit" value="추가" onclick="addMember()">
		<input type="button" id="getList" value="리스트 가져오기" onclick="getList()">
	</div>
	<table id="list">

	</table>

	<script id="template" type="text/x-handlerbars-template">
		{{#each.}}
		<tr>
			<td>{{userid}}</td>
			<td>{{username}}</td>
			<td>{{userpw}}</td>
			<td>{{email}}</td>  
			<td>
				<button class="modify"  data-toggle="modal" data-target="#myModal">수정</button>
				<button class="delete">삭제</button>
			</td>
		</tr>
		{{/each}}
	</script>
 

	<div class="modal fade" id="myModal" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">Modal Header</h4>
				</div>
				<div class="modal-body">
					<p>
						<span>아이디</span> <input type="text" name="userid" id="useridModal" readonly="readonly">
					</p>
					<p>
						<span>이름</span> <input type="text" name="username" id="usernameModal">
					</p>
					<p>
						<span>비밀번호</span> <input type="text" name="userpw" id="userpwModal">
					</p>
					<p>
						<span>이메일</span> <input type="text" name="email" id="emailModal">
					</p>
				</div>
				<div class="modal-footer"> 
					<button type="button" class="btn btn-default modifyOk"
						data-dismiss="modal" onclick="modifyMember()">ok</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>