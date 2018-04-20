<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="stylesheet" type="text/css" href="static/css/style.css">

		<!-- Website CSS style -->
		<link rel="stylesheet" type="text/css" href="static/css/login.css">

		<!-- Website Font style -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.1/css/font-awesome.min.css">
		
		<!-- Fonts -->
		<link href='https://fonts.googleapis.com/css?family=Passion+One' rel='stylesheet' type='text/css'>
		<link href='https://fonts.googleapis.com/css?family=Oxygen' rel='stylesheet' type='text/css'>

		<title>Admin</title>
		<link href="//netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
		<script src="//netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
		<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
		<script type="text/javascript"
	    src="<c:url value="/static/js/jquery-3.3.1.min.js"/>"></script>
	    <script type="text/javascript" src="assets/js/bootstrap.js"></script>
<script type="text/javascript">
	$().ready(function() {

		$("#email").keyup(function() {
			var value = $(this).val();
			if (value != "") {

				// Ajax Call (http://localhost:8080/api/exists/email)
				$.post("<c:url value="/api/exists/email"/>", {
					email : value
				}, function(response) {
					console.log(response.response);

					if (response.response) {
						$("#email").removeClass("valid");
						$("#email").addClass("invalid");
					} else { //지우면 빨간색 
						$("#email").removeClass("invalid");
						$("#email").addClass("valid");
					}
				});

			}

		});

		$("#nickname").keyup(function() {
			var value = $(this).val();
			if (value != "") {
				
				$.post("<c:url value="/api/exists/nickname"/>", {
					nickname : value
				}, function(response) {
					console.log(response.response);

					if (response.response) {
						$("#nickname").removeClass("valid");
						$("#nickname").addClass("invalid");
					} else { //지우면 빨간색 
						$("#nickname").removeClass("invalid");
						$("#nickname").addClass("valid");
					}
				});
			}
		});

		$("#password").keyup(function() {
			var value = $(this).val();
			if (value == "") {
				$(this).removeClass("valid");
				$(this).addClass("invalid");
			} else { //지우면 빨간색 
				$(this).removeClass("invalid");
				$(this).addClass("valid");
			}

			var password = $("#password-confirm").val();

			if (value != password) {
				$(this).removeClass("valid");
				$(this).addClass("invalid");
				$("#password-confirm").removeClass("valid");
				$("#password-confirm").addClass("invalid");
			} else {
				$(this).removeClass("invalid");
				$(this).addClass("valid");
				$("#password-confirm").removeClass("invalid");
				$("#password-confirm").addClass("valid");
			}

		});

		$("#password-confirm").keyup(function() {
			var value = $(this).val();
			var password = $("#password").val();

			if (value != password) {
				$(this).removeClass("valid");
				$(this).addClass("invalid");
				$("#password").removeClass("valid");
				$("#password").addClass("invalid");
			} else {
				$(this).removeClass("invalid");
				$(this).addClass("valid");
				$("#password").removeClass("invalid");
				$("#password").addClass("valid");
			}
		});

		$("#registBtn").click(function() {

			if ($("#email").val() == "") {
				alert("이메일을 입력하세요!");
				$("#email").focus();
				$("#email").addClass("invalid");
				return false;
			}

			if ($("#email").hasClass("invalid")) {
				alert("작성한 이메일은 사용할 수 없습니다.");
				$("#email").focus();
				return false;

			} else {
				$.post("<c:url value="/api/exists/email"/>", {
					email : $("#email").val()
				}, function(response) {
					if (response.response) {
						alert("작성한 이메일은 사용할 수 없습니다.");
						$("#email").focus();
						return false;
					}
					
					if ($("#nickname").val() == "") {
						alert("Nickname을 입력하세요!");
						$("#nickname").focus();
						$("#nickname").addClass("invalid");
						return false;
					}
					if ($("#nickname").hasClass("invalid")) {
						alert("작성한 닉네임은 사용할 수 없습니다.");
						$("#nickname").focus();
						return false;
					}
					else {
						$.post("<c:url value="/api/exists/nickname"/>", {
							nickname : $("#nickname").val()
						}, function(response) {
							console.log(response.response);

							if (response.response) {
								alert("작성한 닉네임은 사용할 수 없습니다.");
								$("#nickname").removeClass("valid");
								$("#nickname").addClass("invalid");
							} else { //지우면 빨간색 
								if ($("#password").val() == "") {
									alert("Password을 입력하세요!");
									$("#password").focus();
									$("#password").addClass("invalid");
									return false;
								}

								$("#registForm").attr({
									"method" : "post",
									"action" : "<c:url value="/regist"/>"
								}).submit();
							}
						});
						
					}

				});
			}

		});
	});
</script>
</head>
<body>
	
	<jsp:include page="/WEB-INF/view/template/menu.jsp" />
	<div class="container">
			<div class="row main">
				<div class="panel-heading">
	               <div class="panel-title text-center">
	               		<h1 class="title">Trendy Travel</h1>
	               		<hr />
	               	</div>
	            </div>
				<div class="main-login main-center">
					<form:form modelAttribute="registForm" class="form-horizontal">
						<div class="form-group">
							<label for="username" class="cols-sm-2 control-label">Username</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<span class="input-group-addon"><i class="fa fa-user fa" aria-hidden="true"></i></span>
									<input type="email" id="email" name="email" placeholder="Email"
											value="${registForm.email}" />
									<div>
										<form:errors path="email" />
									</div>
								</div>
							</div>
						</div>
						
						<div class="form-group">
							<label for="username" class="cols-sm-2 control-label">Username</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<span class="input-group-addon"><i class="fa fa-user fa" aria-hidden="true"></i></span>
									<input type="text" id="nickname" name="nickname"
										   placeholder="Nickname" value="${registForm.nickname}" />
									<form:errors path="nickname" />
								</div>
							</div>
						</div>
						

						<div class="form-group">
							<label for="password" class="cols-sm-2 control-label">Password</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<span class="input-group-addon"><i class="fa fa-lock fa-lg" aria-hidden="true"></i></span>
									<input type="password" id="password" name="password"
										   placeholder="Password" />
								</div>
							</div>
						</div>
						
						<div class="form-group">
							<label for="password" class="cols-sm-2 control-label">Password</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<span class="input-group-addon"><i class="fa fa-lock fa-lg" aria-hidden="true"></i></span>
									<input type="password" id="password-confirm" placeholder="Password" />
								</div>
							</div>
						</div>
						
						
						<div class="form-group ">
							<button type="button" class="btn btn-primary btn-lg btn-block login-button" id="registBtn" value="Regist">Regist</button>
						</div>
						
		
	
				</form:form>
	
			

		
	</div>
	</div>
</div>
</body>
</html>