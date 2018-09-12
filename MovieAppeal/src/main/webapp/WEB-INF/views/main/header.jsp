<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt" %>
<%@ page session="false" %>
<!DOCTYPE html>
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>MovieAppeal</title>
    <!-- Custom styles for this template -->
    <link href="css/modern-business.css" rel="stylesheet">
  </head>
  <body id="#page-top">
    <!-- Navigation -->
    <nav class="navbar navbar-expand-lg bg-secondary fixed-top text-uppercase" id="mainNav">
      <div class="container">
        <a class="navbar-brand js-scroll-trigger" href="main.do">
         <img src="img/MVP.jpg" width="135" height="70" /></a>
        <button class="navbar-toggler navbar-toggler-right text-uppercase bg-primary text-white rounded" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
          Menu
          <i class="fa fa-bars"></i>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
          <ul class="navbar-nav">
            <li class="nav-item mx-0 mx-lg-1">
              <a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="rank.do"><i class="fas fa-flag" ></i>Rank</a>
            </li>
            <li class="nav-item mx-0 mx-lg-1">
              <a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="recommend.do"><i class="fas fa-thumbs-up"></i>Recommend</a>
            </li>
            <li class="nav-item mx-0 mx-lg-1">
              <a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="review.do"><i class="fas fa-pen"></i>Review</a>
            </li>
          </ul>
          
        </div>
      </div>
		<div class="login">
  <div class="dropdown">
    <button class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown"><i class="fas fa-user">Login</i>
    <span class="caret"></span></button>
    <ul class="dropdown-menu">
      <li><a href="#">login</a></li>
      <li><a href="#">join</a></li>
    </ul>
  </div>
</div>
		</nav>
  </body>
</html>
