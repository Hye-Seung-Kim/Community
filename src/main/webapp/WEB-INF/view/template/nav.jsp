<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>

<html>
<head>
    <title>Trendy Travel</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="Free singlepage web template created by GraphBerry">
    <meta name="keywords" content="HTML5, Bootstrap 3, CSS3, javascript, PHP, Responsive, Mobile">
    <meta name="author" content="GraphBerry.com"/>
    <!-- Latest compiled and minified CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
    <!-- Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Lora:400,400i" rel="stylesheet">
    <!-- Styles -->
    <link rel="stylesheet" type="text/css" href="/static/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css"  href="/static/css/gonex-icons.css">
    <link rel="stylesheet" type="text/css" href="/static/css/style.css">
</head>
<body>

	<header id="header">
		
		<!-- Section title -->
		<h1 class="sr-only">Gonex | Home page</h1>
		
		<nav id="main-navigation" class="navbar navbar-default navbar-fixed-top">
		  <!-- Section title -->
		  <h1 class="sr-only">Main navigation</h1>

		  <div class="container">
		    <!-- Brand and toggle get grouped for better mobile display -->
		    <div class="navbar-header">
		      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#main-navbar" aria-expanded="false">
		        <span class="icon-bar"></span>
		        <span class="icon-bar"></span>
		        <span class="icon-bar"></span>
		        <span class="sr-only">Toggle navigation</span>
		      </button>
		      <a id="brand-mobile" class="navbar-brand navbar-brand-center smoothScroll" href="<c:url value="/"/>">
		        <img alt="Gonex" src="/static/img/svg/logo.svg">
		      </a>
		    </div>

		    <!-- Collect the nav links, forms, and other content for toggling -->
		    <div class="collapse navbar-collapse" id="main-navbar">

		    	<form class="navbar-form navbar-right" role="search">

		    		<button type="button" id="btn-togglesearch" class="btn-search">
		    			<span class="ico ico-search-icon" aria-hidden="true"></span>
						<span class="sr-only">Toggle search</span>
					</button>

					<div id="search-input" class="search-input">
						<input type="text" placeholder="Search">
					</div>

					<button type="submit" id="btn-submitsearch" class="btn-search">
						<span class="ico ico-search-icon" aria-hidden="true"></span>
						<span class="sr-only">Submit search</span>
					</button>

				</form>
			  
				<ul class="nav navbar-nav navbar-right">
					<li class="active"><a class="smoothScroll" href="<c:url value="/"/>">Home <span class="sr-only">(current)</span></a></li>
					<li><a class="smoothScroll" href="<c:url value="/list"/>">TRAVEL DIARY</a></li>
					<li><a class="smoothScroll" href="<c:url value="http://localhost:3000/rooms"/>">TIP</a></li>
					<li><a class="smoothScroll" href="<c:url value="http://localhost:3000/rooms"/>">FESTIVAL</a></li>
					<li><a class="smoothScroll" href="#contact">CONTACT</a></li>
				</ul>
				

				
				
		    </div><!-- /.navbar-collapse -->

		  </div><!-- /.container -->

		</nav>

	</header>
	
	
	
	
	
	
	
	

</body>
</html>