<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
	    src="<c:url value="/static/js/jquery-3.3.1.min.js"/>"></script>
<script type="text/javascript">
	$().ready(function(){
		<c:if test="${sessionScope.status eq 'emptyId'}">
			$("#errorId").show();
		</c:if>
		<c:if test="${sessionScope.status eq 'emptyPassword'}">
			$("#errorPassword").show();
		</c:if>  //이거 대신에 쓰는게 form:form model~~ 이거*/
		
		$("#loginBtn").click(function(){
		/* 
			if( $("#id").val() == "" ){
				//alert("아이디를 입력하세요!"); 밑에 튀어나오게 지정해줬음
				$("#errorId").slideDown(300);
				$("#id").focus(); //id쪽에 포커스가 됨
				return false;
			}else{
				$("#errorId").slideUp(300);
			}
			
			if ( $("#password").val() == "" ){
				//alert("비밀번호를 입력하세요!");
				$("#errorPassword").slideDown(300);
				$("#password").focus(); //id쪽에 포커스가 됨
				return false;
			}else{
				$("#errorPassword").slideUp(300);
			} */
			 
			
			$("#loginForm").attr({
				"action": "<c:url value="/login"/>",
				"method": "post"
			}).submit();
		});
		
	});
</script>
</head>
<body>

	<div id="wrapper">
	<jsp:include page="/WEB-INF/view/template/menu.jsp" />
	<form id="loginForm">
	
		<c:if test="${sessionScope.status eq 'fail'}">
			<div id="invalidIdAndPassword">
				<div>아이디 혹은 비밀번호가 잘못되었습니다.</div>
				<div>한번 더 확인 후 시도해 주세요</div>
			</div>	
		</c:if>
		
		
		<div>
			<input type="text" id="email" name="email" placeholder="Email" />
			<!-- <form:erros path="email" /> -->
		</div>
		<div>
			<form:erros path="email" />
		</div>
		
		<!-- <div id="error" style="display:none;">아이디를 입력하세요!</div> -->
		<!-- displaynone하면 안보임 필요할때 나옴-->
		
		<div>
			<input type="password" id="password"
				   name="password" placeholder="Password"/>
		</div>
		
		<div id="errorPassword" style="display:none;">비밀번호를 입력하세요!</div>
		
		<div>
			<input type="button" id="loginBtn" value="Login" />			
		</div>	
	</form>
	
	<div>
		<a href="<c:url value="/regist" />">아직 회원이 아니신가요?</a>
	</div>
	
	
	
	</div>
</body>
</html>