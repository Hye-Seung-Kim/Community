<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
    
<!DOCTYPE html>
<html>
<head>
<style>
.thumbnail:hover {
background-color: #f1eded  ;
}
.thumbnail{
margin-bottom: 10px;
}
.thumbnail>img {
height: auto;
}
.date-of-post{
color: #0089d8;
}
.news-blog .page-header{
margin-bottom: 13px;
padding: 17px 14px 19px 30px;
margin-top: 12px;
}
.caption h2, h3 {
font-family: inherit;
font-weight: 500;
line-height: 1.1;
color: inherit;
}
.caption p{
display: block;
-webkit-margin-before: 1em;
-webkit-margin-after: 1em;
-webkit-margin-start: 0px;
-webkit-margin-end: 0px;
margin: 0 0 10px;
line-height: 1.42857143;
font-size: 14px;
text-align: justify;
}
</style>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="<c:url value="/static/css/style.css"/>">
<link href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script type="text/javascript" src="<c:url value="/static/js/jquery-3.3.1.min.js"/>"></script>
<script src="//netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/static/js/libs/smooth-scroll.min.js"></script>
<script type="text/javascript" src="/static/js/libs/modernizr.mq.js"></script>
<script type="text/javascript" src="/static/js/libs/mixitup.min.js"></script>
<!-- Latest compiled and minified JavaScript Bootstrap-->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript">
$().ready(function(){
	loadReplies(0);
	function loadReplies(scrollTop){
		$.get("<c:url value="/api/reply/${community.id}"/>",{}, 
				function(response){
					console.log(response);
					for (var i in response){
					appendReplies(response[i]);
				}
					
				$(window).scrollTop(scrollTop);	
		});
	};
	
	$("#writeReplyBtn").click(function(){
		$.post("<c:url value="/api/reply/${community.id}"/>",
				$("#writeReplyForm").serialize(),
				function(response){
					if(response.status){
						alert("댓글 등록 됨");
						
						$("#parentReplyId").val("0");
						$("#body").val("");
						$("#createReply").appendTo("#createReplyDiv");
						
						var scrollTop = $(window).scrollTop();
						
						
						$("#replies").html("");
						loadReplies(scrollTop);
					}else{
						alert("등록에 실패했습니다. 잠시 후에 다시 시도하세요.");
					}
					
				});
	});
	
	$("#replies").on("click", ".re-reply", function(){
		var parentReplyId = $(this).closest(".reply").data("id");
		$("#parentReplyId").val(parentReplyId);
		
		$("#createReply").appendTo( $(this).closest(".reply") );
	});
	
	
	function appendReplies(reply){
		var replyDiv = $("<div class='reply' style='padding-left:" + ((reply.level-1) * 20) + "px;' data-id='"
						+reply.id+"'></div>");
		var nickname  = reply.memberVO.nickname 
						+ "("+ reply.memberVO.email+ ")";
		
		var top = $("<span class='writer'>" + nickname 
						+ "</span><span class='regist-date'>"
						+ reply.registDate +"</span>");
		replyDiv.append( top );
		
		var body = $("<div class='body'>" 
					+ reply.body + "</div>");
		replyDiv.append( body );
			
		var registReReply = $("<div class='re-reply'>댓글달기</div>");
		replyDiv.append(registReReply);
		$("#replies").append(replyDiv);
		
	}
});
</script>

</head>
<body>
	<jsp:include page="/WEB-INF/view/template/nav.jsp" />
	<div class="container-fluid news-blog">
    	<div class="row">
       		<div class="col-lg-12">
          		<div class="page-header">
             		<h1>${community.title}<small><i class="glyphicon glyphicon-eye-open"></i>${community.viewCount} |<i class="glyphicon glyphicon-thumbs-up"></i>${community.recommendCount} |<i class="glyphicon glyphicon-calendar"></i>${community.writeDate} </small></h1>
          	</div>
          <div class="col-sm-6 col-md-6">
             <a href="#">
                <div class="thumbnail principal-post">
                   <img src="<c:url value="/get/${community.id}" />">
            			${community.displayFilename}
                    <div class="caption">
                      <p>내용</p>
                      <h3>${community.body}</h3>
                   </div>
                </div>
             </a>
          </div>
          <div class="col-sm-6 col-md-6">
             <div class="thumbnail">
                   <div class="caption">
                      <p>장소</p>
                      <h3>${community.location}</h3>
                   </div>
             </div>
             <div class="thumbnail">
                <a href="#">
                   <div class="caption">
                   	  <p>교통</p>
                      <h3>${community.transportation}</h3>   
                   </div>
                </a>
             </div>
             <div class="thumbnail">
                <a href="#">
                   <div class="caption"> 
                      <p>경비</p>
                      <h3>${community.expense}</h3>   
                   </div>
                </a>
             </div>
             <div class="thumbnail">
                <a href="#">
                   <div class="caption">
                   	  <p>숙소</p>
                      <h3>${community.accommodations}</h3>
                   </div>
                </a>
             </div>
             <div class="thumbnail">
                <a href="#">
                   <div class="caption">
                  	  <p>준비물</p>
                      <h3>${community.luggage}</h3>
                   </div>
                </a>
             </div>
             <div class="thumbnail">
                <a href="#">
                   <div class="caption">
                  	  <p>여행경로</p>
                      <h3>${community.route}</h3>
                   </div>
                </a>
             </div>
          </div>
       </div>
       <div class="col-lg-12">
       		<div class="description">
      <h3>댓글</h3>
      <div id="replies"></div>
      <div id="createReplyDiv">
  		<div id="createReply">
  			<form id="writeReplyForm">
  				<input type="hidden" id="parentReplyId" name="parentReplyId"
  					value="0" />
  				<div>
  					<textarea id="body" name="body"></textarea>
  				</div>
  				<div>
  					<input type="button" id="writeReplyBtn" value="등록" />
  				</div>
  			</form>
  		</div>
  	 </div>
    </div>
       
       </div>
       
   </div>
</div>

   <p>
      <a href="<c:url value="/list" />">돌아가기</a> 
      <a href="<c:url value="/recommend/${community.id}" />">추천하기</a>
      <c:if test="${sessionScope.__USER__.id == community.memberVO.id}">
         <a href="<c:url value="/modify/${community.id}" />">수정하기</a>
         <a href="<c:url value="/delete/${community.id}" />">삭제하기</a>
      </c:if>
   </p>


</body>
</html>