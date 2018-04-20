<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Trendy Travel</title>
<!-- static이후부터가 폴더명임. static/~ 여기 이후 -->
<script src="<c:url value="/static/js/jquery-3.3.1.min.js"/>" 
		type="text/javascript"></script>
<script type="text/javascript">
	$().ready(function(){
	
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
			

	       var mode = "${mode}";
	       if ( mode == "modify" ){
	    	   var url = "<c:url value="/modify/${communityVO.id}"/>";
	       }
	       else{
	    	   var url = "<c:url value="/write"/>"
	       }
	       
	       var writeForm = $("#writeForm"); 
		   writeForm.attr({ 
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


<jsp:include page="/WEB-INF/view/template/nav.jsp" />

<section id="home">

			<!-- Section title -->
			<h1 class="sr-only">TRAVEL DIARY</h1>

<section id="skills">
			
			<div class="container">

				<div class="row">
					
					<div class="col-md-6 col-md-offset-3">

						<div class="title-content">
							
							<h2 class="section-title">TRAVEL LOG</h2>

							<p>The happiest moment of my life</p>

						</div> <!-- /.title-content -->

					</div>

				</div> <!-- /.row -->

				<div class="row">
					
					<div class="col-md-8 col-md-offset-2">

						<div class="skills-container">

							<div class="container">
	

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
			카테고리: <textarea rows="10" cols="10" id="category" name="category" placeholder="카테고리">${communityVO.category}</textarea>
		</div>
		<div>
			<form:errors path="category" />
		</div>
		<div>
			장소: <textarea rows="10" cols="10" id="location" name="location" placeholder="장소">${communityVO.location}</textarea>
		</div>
		<div>
			<form:errors path="location" />
		</div>
		<div>
			교통: <textarea rows="10" cols="10" id="transportation" name="transportation" placeholder="교통">${communityVO.transportation}</textarea>
		</div>
		<div>
			<form:errors path="transportation" />
		</div>
		<div>
			경비: <textarea rows="10" cols="10" id="expense" name="expense" placeholder="경비">${communityVO.expense}</textarea>
		</div>
		<div>
			<form:errors path="expense" />
		</div>
		<div>
			숙소: <textarea rows="10" cols="10" id="accommodations" name="accommodations" placeholder="숙소">${communityVO.accommodations}</textarea>
		</div>
		<div>
			<form:errors path="accommodations" />
		</div>
		<div>
			준비물: <textarea rows="10" cols="10" id="luggage" name="luggage" placeholder="준비물">${communityVO.luggage}</textarea>
		</div>
		<div>
			<form:errors path="luggage" />
		</div>
		<div>
			여행경로: <textarea rows="10" cols="20" id="route" name="route" placeholder="여행경로">${communityVO.route}</textarea>
		</div>
		<div>
			<form:errors path="route" />
		</div>
		
		<div>
			내용: <textarea rows="10" cols="30" id="body" name="body" placeholder="내용">${communityVO.body}</textarea>
		</div>
		<div>
			<form:errors path="body" />
		</div>
		
		
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
			<input type="hidden" id="userId" name="userId" 
			value="${sessionScope.__USER__.id}"
			placeholder="사용자 ID">
		</div>
		

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

</div>

						</div> <!-- /.skills-container -->

					</div>

				</div> <!-- /.row -->

			</div> <!-- /.container -->
</section>
</section>

</body>
</html>