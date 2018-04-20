<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
			$().ready(function(){
				<c:if test="${sessionScope.status eq 'emptyId'}">
					$("#errorId").show();
				</c:if>
				<c:if test="${sessionScope.status eq 'emptyPassword'}">
					$("#errorPassword").show();
				</c:if>
		
			$("#loginBtn").click(function(){
		
				$("#loginForm").attr({
					"action": "<c:url value="/login"/>",
					"method": "post"
					}).submit();
				});
		
			});
</script>
		
		
	</head>
	<body>
		<div class="container">
			<div class="row main">
				<div class="panel-heading">
	               <div class="panel-title text-center">
	               		<h1 class="title">Trendy Travel</h1>
	               		<hr />
	               	</div>
	            </div>
				<div class="main-login main-center">
					<form class="form-horizontal" method="post" action="#" id="loginForm">
						<div class="form-group">
							<c:if test="${sessionScope.status eq 'fail'}">
								<div id="invalidIdAndPassword">
									<div>아이디 혹은 비밀번호가 잘못되었습니다.</div>
									<div>한번 더 확인 후 시도해 주세요</div>
								</div>	
							</c:if>
							<label for="username" class="cols-sm-2 control-label">Username</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<span class="input-group-addon"><i class="fa fa-user fa" aria-hidden="true"></i></span>
									<input type="text" id="email" name="email" placeholder="Email"/>
								</div>
							</div>
						</div>

						<div class="form-group">
							<label for="password" class="cols-sm-2 control-label">Password</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<span class="input-group-addon"><i class="fa fa-lock fa-lg" aria-hidden="true"></i></span>
									<input type="password" id="password"
				   						   name="password" placeholder="Password"/>
								</div>
							</div>
						</div>

						<div class="form-group ">
							<button type="button" class="btn btn-primary btn-lg btn-block login-button" id="loginBtn" value="Login">Login</button>
						</div>
						<div class="login-register">
				            <c:if test="${empty sessionScope.__USER__}">
									<a href="<c:url value="/regist" />">Regist</a>
							</c:if>				
				         </div>
				         <div class="login-register">
				            <c:if test="${not empty sessionScope.__USER__}">
			<li>(${sessionScope.__USER__.nickname}님)
			    <a href="<c:url value="/logout" />">Logout</a>
			</li>
		</c:if>
		
		
		<li>
			<a href="<c:url value="/list"/>">Community</a>
		</li>
				         </div>
					</form>
				</div>
			</div>
		</div>

		
	</body>
</html>