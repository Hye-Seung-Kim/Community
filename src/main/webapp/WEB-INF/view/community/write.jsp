<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<script src="<c:url value="/static/js/jquery-3.3.1.min.js"/>"></script> 

<title>Insert title here</title>
<style>
ul{
   list-style:none;
   padding-left:0px;

   }
</style>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="/static/css/form.css">

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



<script>

//Test for placeholder support
$.support.placeholder = (function(){
    var i = document.createElement('input');
    return 'placeholder' in i;
})();

//Hide labels by default if placeholders are supported
if($.support.placeholder) {
    $('.form li').each(function(){
        $(this).addClass('js-hide-label');
    });  
 
    // Code for adding/removing classes here
};

</script>
 
</head>
<body>
<!-- Form Markup Will Go Here -->
 
    <!-- Google's hosted version of jQuery -->
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
     
    <!-- Link to the javascript file we will create --> 

<section class="container">
    <h1 class="title">Travel Diary</h1>
   
    <form:form modelAttribute="writeForm" enctype="multipart/form-data">
        <ul>
            <li>
                <label for="title">Title:</label>
                 <input type="text" id="title" name="title" placeholder="제목 명"
						 value="${communityVO.title}" /> 
            </li>
            <div id="errorTitle" style="display:none;">제목을 입력하세요!</div>
            <div>
			<form:errors path="title" />
			</div>	
            <li>
                <label for="email">Category:</label>
            	<input id="category" name="category" placeholder="카테고리">${communityVO.category}</textarea>
            <div>
			 	<form:errors path="category" />
		    </div>
            </li>
            <li>
                <label for="location">Location:</label>
            	<input id="location" name="location" placeholder="장소">${communityVO.location}</textarea>
            </li>
            <div>
				<form:errors path="location" />
			</div>
            <li>
                <label for="transportation">Transportation:</label>
            	<input id="transportation" name="transportation" placeholder="교통">${communityVO.transportation}</textarea>		
            </li>
            <div>
				<form:errors path="transportation" />
			</div>
            <li>
                <label for="expense">Expense:</label>
            	<input id="expense" name="expense" placeholder="경비">${communityVO.expense}</textarea>
            </li>
            <div>
				<form:errors path="expense" />
			</div>
            <li>
                <label for="accommodations">Accommodation:</label>
                <input id="accommodations" name="accommodations" placeholder="숙소">${communityVO.accommodations}</textarea>
			</li>
			<div>
				<form:errors path="accommodations" />
			</div>
            <li>
                <label for="luggage">CheckList:</label>
                <textarea id="luggage" name="luggage" placeholder="준비물">${communityVO.luggage}</textarea>
			</li>
			<div>
				<form:errors path="luggage" />
			</div>
			<li>
                <label for="route">Route:</label>
                <textarea id="route" name="route" placeholder="여행경로">${communityVO.route}</textarea>
			</li>
			<div>
				<form:errors path="route" />
			</div>
			<li>
                <label for="body">Text:</label>
              	<textarea id="body" name="body" placeholder="내용">${communityVO.body}</textarea>		   
            </li>
            <div>
				<form:errors path="body" />
			</div>
			
    		<c:if test="${mode == 'modify' &&
						not empty communityVO.displayFilename}">
			
			<li>
               <input type="checkbox" 
					   id = "displayFilename"
					   name= "displayFilename"
					   value="${communityVO.displayFilename}" />
				<label for="displayFilename">
					${communityVO.displayFilename}
				</label>
			</li>			
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
     		<input type="button" value="등록" id="writeBtn"/>	
		</div>
			
        </ul>
       
		
    
    
    </form:form>
</section>


</body>
</html>