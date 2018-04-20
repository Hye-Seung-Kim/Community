<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Trendy Travel</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="Free singlepage web template created by GraphBerry">
    <meta name="keywords" content="HTML5, Bootstrap 3, CSS3, javascript, PHP, Responsive, Mobile">
    <meta name="author" content="GraphBerry.com"/>
    <!-- Latest compiled and minified CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <!-- Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Lora:400,400i" rel="stylesheet">
    <!-- Styles -->
    <link rel="stylesheet" type="text/css" href="static/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css"  href="static/css/gonex-icons.css">
    <link rel="stylesheet" type="text/css" href="static/css/style.css">
    
    <link href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <link rel="stylesheet" type="text/css" href="static/css/pagination.css">
	<link rel="stylesheet" type="text/css" href="static/css/list.css">

    
<script type="text/javascript" src="<c:url value="/static/js/jquery-3.3.1.min.js"/>"></script>
<script src="//netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<!-- Scripts -->
	<script type="text/javascript" src="/static/js/libs/smooth-scroll.min.js"></script>
	<script type="text/javascript" src="/static/js/libs/modernizr.mq.js"></script>
	<script type="text/javascript" src="/static/js/libs/mixitup.min.js"></script>
	<!-- Latest compiled and minified JavaScript Bootstrap-->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<!-- Custom JS -->
	<script type="text/javascript" src="/static/js/google-map.js"></script>
	<script type="text/javascript" src="/static/js/custom.js"></script>
	
	<script type="text/javascript">
		$().ready(function() {
			$("#searchKeyword").keyup(function(event) {
				if (event.key == "Enter") {
					movePage('0');
				}
				
			});
		});
	</script>


</head>

<body>

<jsp:include page="/WEB-INF/view/template/nav.jsp"/>


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
	
	<c:forEach items="${pageExplorer.list}" var="community">
		<div class="row">
			
			<div class="row"> 
                   	
                    <div class="col-xs-12 col-sm-3 col-md-3">
                        <a href="#">
                            <img src="http://wanderluxe.theluxenomad.com/wp-content/uploads/2014/10/http-www.urchinbali.comgallery.jpg" class="img-responsive img-box img-thumbnail"> 
                        </a> <!-- 여기에 Filename~~넣기 -->
                    </div> 
                    <div class="col-xs-12 col-sm-9 col-md-9">
                        <div class="list-group">
                            <div class="list-group-item">
                                
                                <div class="row-content">
                                    <div class="list-group-item-heading">
                                        <a href="<c:url value="/read/${community.id}" />" title="sintret">
                                         
													${community.title}
                                        </a>
                                    </div>
                                    <small>
                                        <i class="glyphicon g
                                        
                                        lyphicon-user"></i>${community.memberVO.nickname}
                                        <br>
                                        <i class="glyphicon glyphicon-envelope"></i> ${community.memberVO.email} 
                                      	<br>
                                      	<i class="glyphicon glyphicon-eye-open"></i>${community.viewCount}
                                        <i class="glyphicon glyphicon-thumbs-up"></i>${community.recommendCount}
                                    </small>
                                </div>
                            </div>
                             <p>${community.category}</p>
                        </div>
                        
                       
                    </div> 
                </div>
                <hr>

		</div>

	</c:forEach>
	
	<c:if test="${empty pageExplorer.list }">
				<tr>
					<td colspan="5">등록된 게시글이 없습니다.</td>
				</tr>
	</c:if>
	
		
		
		
		

	
	
	
		<form id="searchForm" onsubmit="movePage('0')">
				<div class="pagination-container wow zoomIn mar-b-1x" data-wow-duration="0.5s">
					${pageExplorer.make()}			
				</div>
				<div>
					<select id="searchType" name="searchType">
						<option value="1" ${search.searchType eq 1 ? 'selected' : ''}> 글 제목 </option>
						<option value="2" ${search.searchType eq 2 ? 'selected' : ''}> 글 내용 </option>
						<option value="3" ${search.searchType eq 3 ? 'selected' : ''}> 글 제목 + 글 내용</option>
						<option value="4" ${search.searchType eq 4 ? 'selected' : ''}> 작성자 Nickname </option>
						<option value="5" ${search.searchType eq 5 ? 'selected' : ''}> 작성자 Email </option>
						<option value="6" ${search.searchType eq 6 ? 'selected' : ''}> 첨부파일 이름 </option>
						<option value="7" ${search.searchType eq 7 ? 'selected' : ''}> 첨부파일 형식 </option>
					</select>
					
				</div>
				<div>
                   <input type="text" class="form-control" id="searchKeyword" name="searchKeyword"
							value="${search.searchKeyword}">
                	<a href="<c:url value="/reset"/>">검색 초기화</a>
                    
                </div>  
              
        
	
 		</form>		
		
		
		
		<div>
			<a href="<c:url value= "/write"/>">글쓰기</a>
		</div>
		<div>
			<a href="<c:url value="/delete/process1"/>">탈퇴하기</a>
		</div>
		
		</div>

						</div> <!-- /.skills-container -->

					</div>

				</div> <!-- /.row -->

			</div> <!-- /.container -->

		</section>
</section>

<footer id="footer">

		<!-- Section title -->
		<h1 class="sr-only">Footer</h1>

		<p class="copyright text-green"> © <span id="year">2016</span> - Gonex All Rights Reserved. More Templates <a href="http://www.cssmoban.com/" target="_blank" title="模板之家">模板之家</a> - Collect from <a href="http://www.cssmoban.com/" title="网页模板" target="_blank">网页模板</a></p>

</footer>




</body>
</html>
