<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html lang="en">

  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>MovieAppeal</title>
	<!-- 폰트어썸 -->
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
	<link href="./resources/css/movie.css" rel="stylesheet">
	<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
	<link href="./resources/css/jquery.datePicker.css" rel="stylesheet">
	<link rel="stylesheet" href="./resources/css/magnific-popup.css">
	<!-- 제작파일 css -->
    <link href="./resources/css/rank.css" rel="stylesheet">
    <link href="./resources/css/main.css" rel="stylesheet">
    <link href="./resources/css/recommend.css" rel="stylesheet">
  
    <!-- Bootstrap core CSS -->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom fonts for this template -->
    <link href="vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic" rel="stylesheet" type="text/css">
    <!-- Plugin CSS -->
    <link href="vendor/magnific-popup/magnific-popup.css" rel="stylesheet" type="text/css">
    <!-- Custom styles for this template -->
    <link href="css/freelancer.min.css" rel="stylesheet">
     <!-- Bootstrap core CSS -->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom styles for this template -->
    <link href="css/modern-business.css" rel="stylesheet">
    

	<!-- js.파일 추가방식 <script src="./resources/js/main.js"></script> -->
	<script src="./resources/js/movie.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	<script src="//code.jquery.com/jquery-1.10.2.js"></script>
  	<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
	<script src="./resources/js/jquery.datePicker.js"></script>
	<script src="./resources/js/jquery.magnific-popup.js"></script>
	<link href="./resources/css/flip-carousel.css" rel="stylesheet">
	<script src="./resources/js/flip-carousel.js"></script>
	<link href="./resources/css/star-rating.css" media="all" rel="stylesheet" type="text/css" />
	<script src="./resources/js/star-rating.js" type="text/javascript"></script>
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	<script type="text/javascript" src="./resources/js/jssor.slider.mini.js"></script>
  </head>
  
  
  <body id="page-top">
    <div id="header">
		<tiles:insertAttribute name="header"/>
	</div>
	
	<div id="main">
		<tiles:insertDefinition name="${page}"/>
	</div>
	
	<div id="footer">
		<tiles:insertAttribute name="footer"/>
	</div>
  </body>

</html>
