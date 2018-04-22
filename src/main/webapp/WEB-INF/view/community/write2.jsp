<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<!-- Viewport tag to make things responsive -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
     
    <!-- Link to the stylesheet we will create -->
    <link rel="stylesheet" href="form.css">
 
    <!-- HTML5 shiv for older browsers -->
    <!--[if lt IE 9]>
        <script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->
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
}

</script>
<!-- Form Markup Will Go Here -->
 
    <!-- Google's hosted version of jQuery -->
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
     
    <!-- Link to the javascript file we will create -->
    <script src="scripts.js"></script>
</head>
<body>


<section class="container">
    <h1 class="title">Contact Me</h1>
    <form id="form" class="form" action="#" method="get">
        <ul>
            <li>
                <label for="name">Your Name:</label>
                <input type="text" placeholder="Your Name" id="name" name="name" tabindex="1"/>
            </li>
            <li>
                <label for="email">Your Email:</label>
                <input type="email" placeholder="Your Email" id="email" name="email" tabindex="2"/>
            </li>
            <li>
                <label for="message">Message:</label>
                <textarea placeholder="Message…" id="message" name="message" tabindex="3"></textarea>
            </li>
        </ul>
        <input type="submit" value="Send Message" id="submit"/>
    </form>
</section>


</body>
</html>