<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- static이후부터가 폴더명임. static/~ 여기 이후 -->
<script src="<c:url value="/static/js/jquery-3.3.1.min.js"/>" 
		type="text/javascript"></script>
<script type="text/javascript">
	$().ready(function(){
	
	   /*    <c:if test="${sessionScope} eq 'emptyTitle'">
	         $("#errorTitle").show();
	      </c:if>
	      <c:if test="${sessionScope} eq 'emptyBody'">
	         $("#errorBody").show();
	      </c:if> */
	   <c:if test="${mode == 'modify' && not empty communityVO.displayFilename}">
	   		$("#file").closest("div").hide();
	   </c:if> 
	      
	      
	    $("#displayFilename").change(function() {
	    	var isChecked = $(this).prop("checked");
	    	if( isChecked ){
	    		$("label[for=displayFilename]").css({
	    			"text-decoration-line":"line-through",
	    			"text-decoration-style":"double",
	    			"text-decoration-color":"#FF0000"
	    		});
	    		$("#file").closest("div").show();
	    	}
	    	else{
	    		$("label[for=displayFilename]").css({
	    			"text-decoration":"none"
	    		});
	    		$("#file").closest("div").hide();
	    	}
	    	
	    });
	      
		$("#writeBtn").click(function(){
			
/* 	         // submit 직전에 제목, 내용, 날짜 유효성 검증
	         if($("#title").val() == "") {
	            $("#errorTitle").slideDown(300);
	            $("#title").focus();
	            return false;
	         }
	         else {
	            $("#errorTitle").slideUp();
	         }
	         if($("#body").val() == "") {
	            $("#errorBody").slideDown(300);
	            $("#body").focus();
	            return false;
	         }
	         else {
	            $("#errorBody").slideUp();
	         }
	       */
	       
	       //if안에 유알엘 하여 호이스팅 되어 밑부분의 action을 url로 바꿈
	       var mode = "${mode}";
	       if ( mode == "modify" ){
	    	   var url = "<c:url value="/modify/${communityVO.id}"/>";
	       }
	       else{
	    	   var url = "<c:url value="/write"/>"
	       }
	       
	       var writeForm = $("#writeForm"); 
		   writeForm.attr({ //객체리터럴
				//method는 post로 전송할거야
				"method" : "post",
				"action" : url
		   });
			writeForm.submit();
		});
	});
</script>
</head>
<body>
<div>

<div id="wrapper">
	<jsp:include page="/WEB-INF/view/template/menu.jsp" />
	<form:form modelAttribute="writeForm" enctype="multipart/form-data">
		<div>
			제목: <input type="text" id="title" name="title" placeholder="제목 명"
						 value="${communityVO.title}" /> 
		</div>	
		<div id="errorTitle" style="display:none;">제목을 입력하세요!</div>
		<div>
			<form:errors path="title" />
		</div>
		
		<div>
			내용: <textarea rows="10" cols="30" id="body" name="body" placeholder="내용">${communityVO.body}</textarea>
		</div>
		<!-- <div id="errorBody" style="display:none;">내용을 입력하세요!</div>
		 -->
		<c:if test="${mode == 'modify' &&
						not empty communityVO.displayFilename}">
			<div>
				<input type="checkbox" 
					   id = "displayFilename"
					   name= "displayFilename"
					   value="${communityVO.displayFilename}" />
				<label for="displayFilename">
					${communityVO.displayFilename}
				</label>
			</div>							
		</c:if>
		<div>
			<form:errors path="body" />
		</div>
		
		
	<%-- 	<div>
			<!-- hidden할경우 안보이지만 데이터는 입력되어 있음. -->
			<input type="hidden" id="nickname" name="nickname" 
			value="${sessionScope.__USER__.nickname}"
			placeholder="작성자 명">
		</div> --%>
		<div>
			<input type="hidden" id="userId" name="userId" 
			value="${sessionScope.__USER__.id}"
			placeholder="사용자 ID">
		</div>
		

		
	<%-- 	<div>
			작성일: <input type="date" id="writeDate" name="writeDate" placeholder="작성 일자"
						   value="${communityVO.writeDate}">
		</div> --%>
		<div>
			<form:errors path="writeDate" />
		</div>
		<div>
			<input type="file" id="file" name="file"/>
		</div>
		<div>
			등록버튼: <input type="button" id="writeBtn" value="등록">
		</div>
	</form:form>
	</div>
</div>
</body>
</html>