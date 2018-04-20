<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>

<html>
<head>
<style>
.service img{
position: absolute; top:0; left: 0;
width: 100%;
height: 100%;
}


</style>


    <title>Trendy Travel</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="Free singlepage web template created by GraphBerry">
    <meta name="keywords" content="HTML5, Bootstrap 3, CSS3, javascript, PHP, Responsive, Mobile">
    <meta name="author" content="GraphBerry.com"/>
    <!-- Latest compiled and minified CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <!-- Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Lora:400,400i" rel="stylesheet">
    <!-- Styles -->
    <link rel="stylesheet" type="text/css" href="static/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css"  href="static/css/gonex-icons.css">
    <link rel="stylesheet" type="text/css" href="static/css/style.css">
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
		        <img alt="Gonex" src="static/img/svg/logo.svg">
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
					<li><a class="smoothScroll" href="#work">TIP</a></li>
					<li><a class="smoothScroll" href="<c:url value="http://localhost:3000/rooms"/>">FESTIVAL</a></li>
					<li><a class="smoothScroll" href="#contact">CONTACT</a></li>
				</ul>
				

				
				
		    </div><!-- /.navbar-collapse -->

		  </div><!-- /.container -->

		</nav>

	</header>

	<main>

		<section id="home">

			<!-- Section title -->
			<h1 class="sr-only">Home</h1>

			<div id="carousel-hero" class="carousel slide" data-ride="carousel">

				<!-- Wrapper for slides -->
				<div class="carousel-inner" role="listbox">
			
					<div class="item active">

						<div class="overlay"></div>

						<div class="carousel-caption">

							<span class="h1">We are Trendy Travel</span>

							<p>Dui aliquam quisque. Nec feugiat ut neque odio quo, proin interdum, quis elit varius et duis, dui augue vehicula nam tinc.</p>

							<a href="#" class="btn btn-default green-white">Show me more</a>

						</div>

					</div> <!-- /.item -->

					<div class="item">

						<div class="overlay"></div>

						<div class="carousel-caption">

							<span class="h1">We are gonex</span>

							<p>Dui aliquam quisque. Nec feugiat ut neque odio quo, proin interdum, quis elit varius et duis, dui augue vehicula nam tinc.</p>

							<a href="#" class="btn btn-default green-white">Show me more</a>

						</div>

					</div> <!-- /.item -->

					<div class="item">

						<div class="overlay"></div>

						<div class="carousel-caption">

							<span class="h1">We are gonex</span>

							<p>Dui aliquam quisque. Nec feugiat ut neque odio quo, proin interdum, quis elit varius et duis, dui augue vehicula nam tinc.</p>

							<a href="#" class="btn btn-default green-white">Show me more</a>

						</div>

					</div> <!-- /.item -->
				
				</div> <!-- /.carousel-inner -->

				<!-- Controls -->
				<a class="left carousel-control" href="#carousel-hero" role="button" data-slide="prev">
					<span class="ico ico-arrow_left" aria-hidden="true"></span>
					<span class="sr-only">Previous</span>
				</a>
				<a class="right carousel-control" href="#carousel-hero" role="button" data-slide="next">
					<span class="ico ico-arrow_right" aria-hidden="true"></span>
					<span class="sr-only">Next</span>
				</a>

			</div> <!-- /.carousel -->

		</section>

		<section id="services">

			<!-- Section title -->
			<h1 class="sr-only">Services</h1>

			<div class="container">

				<div class="row">
					
					<div class="col-md-4">

						<div class="punchbox">
							
							<h2 class="punchline">
								<span>What we do</span>
								<span>best</span>
								<span>see it for yourself</span>
							</h2>

						</div> <!-- /.punchbox -->
						
					</div>

					<div class="col-md-4">
						
						<div class="service">

							<h4>${imageList[0].displayFilename}</h4>

							<p><img src="<c:url value="/get/${imageList[0].id}" />"></p>
							
							<a href="${imageList[0]}" class="service-link">See projects</a>
						</div> <!-- /.service -->

					</div>

					<div class="col-md-4">
						
						<div class="service">

							<h4>Graphic design</h4>

							<p>Nec feugiat ut neque odio quo, interdum, quis elit varius.</p>

							<a href="#" class="service-link">See projects</a>

						</div> <!-- /.service -->

					</div>

				</div> <!-- /.row -->

				<div class="row">
					
					<div class="col-md-4">
						
						<div class="service">

							<h4>App development</h4>

							<p>Nec feugiat ut neque odio quo, interdum, quis elit varius.</p>

							<a href="#" class="service-link">See projects</a>

						</div> <!-- /.service -->

					</div>

					<div class="col-md-4">
						
						<div class="service">

							<h4>Programming</h4>

							<p>Nec feugiat ut neque odio quo, interdum, quis elit varius.</p>

							<a href="#" class="service-link">See projects</a>

						</div> <!-- /.service -->

					</div>

					<div class="col-md-4">
						
						<div class="service">

							<h4>Web coding</h4>

							<p>Nec feugiat ut neque odio quo, interdum, quis elit varius.</p>

							<a href="#" class="service-link">See projects</a>

						</div> <!-- /.service -->

					</div>

				</div> <!-- /.row -->

			</div> <!-- /.container -->
			
		</section>

		
        <div class="copyrights">Collect from <a href="http://www.cssmoban.com/"  title="网站模板">网站模板</a></div>

		<section id="work">

			<div class="container">

				<div class="row">
					
					<div class="col-md-6 col-md-offset-3">

						<div class="title-content">
							
							<h2 class="section-title">Works</h2>

							<p>Dui aliquam quisque. Nec feugiat ut neque odio quo, proin interdum, 
							quis elit varius et duis, dui augue vehicula nam tinc.</p>

						</div> <!-- /.title-content -->

					</div>

				</div> <!-- /.row -->

			<div class="row">
					
					<div class="col-md-12">
						
						<nav id="works-navigation" class="navbar">

							<!-- Section title -->
							<h1 class="sr-only">Works navigation</h1>

							<ul class="nav navbar-nav">
								<li><button class="filter mixitup-control-active" type="button" data-mixitup-control data-filter="all">All</button></li>
								<li><button class="filter" type="button" data-mixitup-control data-filter=".photography">Photography</button></li>
								<li><button class="filter" type="button" data-mixitup-control data-filter=".graphic_design">Graphic design</button></li>
								<li><button class="filter" type="button" data-mixitup-control data-filter=".app">App</button></li>
								<li><button class="filter" type="button" data-mixitup-control data-filter=".programming">Programming</button></li>
								<li><button class="filter" type="button" data-mixitup-control data-filter=".web">Web</button></li>
							</ul>

						</nav> <!-- /#works-navigation -->

					</div>

				</div> <!-- /.row -->

			</div> <!-- /.container -->

			<div class="works-container">
				
				<div id="works-grid" class="grid">

					<div class="grid-sizer"></div>

					<div class="grid-item -width3 -height2 mix all app">
						<img src="static/img/works/works_01.jpg" alt="Picture of work number 1">
						
						<div class="overlay">
							<div class="content">
								<p class="description">Awesome image</p>
								<p class="likes">
									<a href="#"><span class="ico ico-heart_icon" aria-hidden="true"></span></a>
									<span class="count">76</span> Likes
								</p>
							</div>
						</div>

					</div>

					<div class="grid-item -width2 mix all programming">
						<img src="static/img/works/works_02.jpg" alt="Picture of work number 2">

						<div class="overlay">
							<div class="content">
								<p class="description">Awesome image</p>
								<p class="likes">
									<a href="#"><span class="ico ico-heart_icon" aria-hidden="true"></span></a>
									<span class="count">76</span> Likes
								</p>
							</div>
						</div>
						
					</div>

					<div class="grid-item -width2 mix all graphic_design">
						<img src="static/img/works/works_03.jpg" alt="Picture of work number 3">

						<div class="overlay">
							<div class="content">
								<p class="description">Awesome image</p>
								<p class="likes">
									<a href="#"><span class="ico ico-heart_icon" aria-hidden="true"></span></a>
									<span class="count">76</span> Likes
								</p>
							</div>
						</div>
						
					</div>

					<div class="grid-item -width3 mix all graphic_design">
						<img src="static/img/works/works_04.jpg" alt="Picture of work number 4">

						<div class="overlay">
							<div class="content">
								<p class="description">Awesome image</p>
								<p class="likes">
									<a href="#"><span class="ico ico-heart_icon" aria-hidden="true"></span></a>
									<span class="count">76</span> Likes
								</p>
							</div>
						</div>
						
					</div>

					<div class="grid-item -width2 mix all web">
						<img src="static/img/works/works_05.jpg" alt="Picture of work number 5">

						<div class="overlay">
							<div class="content">
								<p class="description">Awesome image</p>
								<p class="likes">
									<a href="#"><span class="ico ico-heart_icon" aria-hidden="true"></span></a>
									<span class="count">76</span> Likes
								</p>
							</div>
						</div>
						
					</div>

					<div class="grid-item -width5 mix all photography">
						<img src="static/img/works/works_06.jpg" alt="Picture of work number 6">

						<div class="overlay">
							<div class="content">
								<p class="description">Awesome image</p>
								<p class="likes">
									<a href="#"><span class="ico ico-heart_icon" aria-hidden="true"></span></a>
									<span class="count">76</span> Likes
								</p>
							</div>
						</div>
						
					</div>

				</div> <!-- /.grid -->

			</div> <!-- /.works-container -->
			
		</section>

		<section id="about">
			
			<div class="container">

				<div class="row">
					
					<div class="col-md-10 col-md-offset-1">

						<div class="title-content">
							
							<h2 class="section-title">
								About us
							</h2>

							<p class="subtitle">Some simple word about our company</p>

							<p>Ad graeci omnium minimum sit, augue discere complectitur est te. Mea expetenda intellegebat no, reque signiferumque qui te, ad denique omittam mei. Veri numquam inciderint pri ad, saepe essent ut sea, nam ei civibus denique eleifend. Dicat pertinax ut vix, mazim platonem ea has. Partiendo intellegam ex eos, eos putant alienum ea. Ut malorum ponderum vituperata eum.</p>

						</div> <!-- /.title-content -->

					</div>

				</div> <!-- /.row -->

			</div> <!-- /.contact -->

		</section>

		<section id="skills">
			
			<div class="container">

				<div class="row">
					
					<div class="col-md-6 col-md-offset-3">

						<div class="title-content">
							
							<h2 class="section-title">Gonex statistic</h2>

							<p>Dui aliquam quisque. Nec feugiat ut neque odio quo, proin interdum, 
							quis elit varius et duis, dui augue vehicula nam tinc.</p>

						</div> <!-- /.title-content -->

					</div>

				</div> <!-- /.row -->

				<div class="row">
					
					<div class="col-md-8 col-md-offset-2">

						<div class="skills-container">

							<div class="skill">
								
								<p class="name">Photography</p>

								<span class="percent" style="left: 93%;">93%</span>

								<div class="progress">

									<div class="progress-bar" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 93%;">

										<span class="sr-only">93%</span>

									</div>

									<div class="overlay" style="width: 7%"></div>

								</div> <!-- /.progress -->

							</div> <!-- /.skill -->

							<div class="skill">
								
								<p class="name">Graphic design</p>

								<span class="percent" style="left: 95%;">95%</span>

								<div class="progress">

									<div class="progress-bar" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 95%;">

										<span class="sr-only">95%</span>

									</div>

									<div class="overlay" style="width: 5%"></div>

								</div> <!-- /.progress -->

							</div> <!-- /.skill -->

							<div class="skill">
								
								<p class="name">App</p>

								<span class="percent" style="left: 75%;">75%</span>

								<div class="progress">

									<div class="progress-bar" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 75%;">

										<span class="sr-only">75%</span>

									</div>

									<div class="overlay" style="width: 25%"></div>

								</div> <!-- /.progress -->

							</div> <!-- /.skill -->

							<div class="skill">
								
								<p class="name">Programming</p>

								<span class="percent" style="left: 53%;">53%</span>

								<div class="progress">

									<div class="progress-bar" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 53%;">

										<span class="sr-only">53%</span>

									</div>

									<div class="overlay" style="width: 47%"></div>

								</div> <!-- /.progress -->

							</div> <!-- /.skill -->

							<div class="skill">
								
								<p class="name">Web</p>

								<span class="percent" style="left: 84%;">84%</span>

								<div class="progress">

									<div class="progress-bar" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 84%;">

										<span class="sr-only">84%</span>

									</div>

									<div class="overlay" style="width: 16%"></div>

								</div> <!-- /.progress -->

							</div> <!-- /.skill -->

						</div> <!-- /.skills-container -->

					</div>

				</div> <!-- /.row -->

			</div> <!-- /.container -->

		</section>

		<section id="contact">

			<!-- Section title -->
			<h1 class="sr-only">Contact</h1>

			<div class="container">
				
				<div class="row">

					<div class="col-md-6 col-md-offset-3">

						<h2 class="sr-only">Subscribe to our newsletter</h2>
							
						<form class="subscribe-form">

							<div class="row">

								<div class="col-sm-8">

									<label class="sr-only" for="Email">Email</label>
									<input type="email" id="Email" placeholder="Email Address">

								</div>

								<div class="col-sm-4">

									<button type="submit" class="btn btn-default red-white">Subscribe</button>

								</div>

							</div> <!-- /.row -->

						</form> <!-- /.subscribe-form -->
						
					</div>
					
				</div> <!-- /.row -->

				<div class="row contact-holder">
					
					<div class="col-md-4 col-sm-6">

						<div class="contact-info">

							<a href="tel:998-776-54321098">
							
								<img class="icon" src="static/img/contact/phone.png" alt="Phone Icon">

								<span class="data">998 776 54321098</span>

							</a>

						</div> <!-- /.contact-info -->

					</div>

					<div class="col-md-4 col-sm-6">

						<div class="contact-info">

							<a href="mailto:gonex@mail.com">
							
								<img class="icon" src="static/img/contact/mail.png" alt="Mail Icon">

								<span class="data">gonex@mail.com</span>

							</a>

						</div> <!-- /.contact-info -->

					</div>

					<div class="col-md-4 col-sm-6">

						<div class="contact-info">

							<button id="toggle-map" data-toggle="modal" data-target="#map-modal">
							
								<img class="icon" src="static/img/contact/map.png" alt="Map Icon">

								<span class="data">787 Gonex Avenue, New York</span>

							</button>

						</div> <!-- /.contact-info -->

					</div>

				</div> <!-- /.row -->

				<div class="row social-holder">
					
					<div class="col-md-4 col-md-offset-4">
						
						<div class="social-info">
							
							<a href="#" class="-facebook"><span class="ico ico-facebook" aria-hidden="true"></span></a>

							<a href="#" class="-twitter"><span class="ico ico-twitter" aria-hidden="true"></span></a>

							<a href="#" class="-dribbble"><span class="ico ico-dribbble" aria-hidden="true"></span></a>

							<a href="#" class="-googleplus"><span class="ico ico-google-plus" aria-hidden="true"></span></a>

							<a href="#" class="-youtube"><span class="ico ico-youtube" aria-hidden="true"></span></a>

						</div>

					</div>

				</div> <!-- /.row -->


			</div> <!-- /.container -->
			
		</section>

	</main>

	<footer id="footer">

		<!-- Section title -->
		<h1 class="sr-only">Footer</h1>

		<p class="copyright text-green"> © <span id="year">2016</span> - Gonex All Rights Reserved. More Templates <a href="http://www.cssmoban.com/" target="_blank" title="模板之家">模板之家</a> - Collect from <a href="http://www.cssmoban.com/" title="网页模板" target="_blank">网页模板</a></p>

	</footer>

	<div id="map-modal" class="modal fade" tabindex="-1" role="dialog">

		<div class="modal-dialog modal-lg" role="document">

			<div class="modal-content">

				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
					<h1 class="modal-title h4">787 Gonex Avenue, New York</h1>
				</div>

				<div class="modal-body">
					<!-- GOOGLE MAP -->
					<div id="google-map" class="google-map"></div>
				</div>

			</div><!-- /.modal-content -->

		</div><!-- /.modal-dialog -->

	</div><!-- /.modal -->

<!-- Scripts -->
	<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	<script type="text/javascript" src="static/js/libs/smooth-scroll.min.js"></script>
	<script type="text/javascript" src="static/js/libs/modernizr.mq.js"></script>
	<script type="text/javascript" src="static/js/libs/mixitup.min.js"></script>
	<!-- Latest compiled and minified JavaScript Bootstrap-->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
	<!-- Custom JS -->
	<script type="text/javascript" src="static/js/google-map.js"></script>
	<script type="text/javascript" src="static/js/custom.js"></script>
	

</body>
</html>