<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html>
    <title>MovieAppeal</title>
    
    
    	<script src="https://code.jquery.com/jquery-3.2.0.min.js"></script>
	<!-- 폰트어썸 -->

	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
	<link href="/css/movie.css" rel="stylesheet">
	<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
	<link href="/css/jquery.datePicker.css" rel="stylesheet">
	
	<!-- 제작파일 css -->
	<link href="http://fonts.googleapis.com/earlyaccess/nanumpenscript.css" rel="stylesheet">	
    <link href="css/main.css" rel="stylesheet">
    <link href="css/rank.css" rel="stylesheet">
    <link href="css/header.css" rel="stylesheet">
    <link href="css/footer.css" rel="stylesheet">
    <link href="css/recommend.css" rel="stylesheet">
     
    <!-- Custom fonts for this template -->
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic" rel="stylesheet" type="text/css">
    <!-- Plugin CSS -->

     <!-- Bootstrap core CSS -->
    <link href="css/bootstrap-theme.css" rel="stylesheet">
    <link href="css/bootstrap.css" rel="stylesheet">
    <link href="css/bootstrap-select.css" rel="stylesheet">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
    
    
    <!-- 나눔 손글씨 펜 -->
	<link href="http://fonts.googleapis.com/earlyaccess/nanumpenscript.css" rel="stylesheet">
	<!-- js.파일 추가방식 <script src="/js/main.js"></script> -->
	<script src="/js/movie.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	<script src="//code.jquery.com/jquery-1.10.2.js"></script>
  	<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
	<link href="/css/flip-carousel.css" rel="stylesheet">
	<link href="/css/star-rating.css" media="all" rel="stylesheet" type="text/css" />
	<script src="/js/star-rating.js" type="text/javascript"></script>
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	<link href="css/mypage.css" rel="stylesheet"/>
	<link href="css/poster.css" rel="stylesheet"/>
  </head>
  <body>
  <!--  header -->
    <div id="header">
		<tiles:insertAttribute name="header"/>
	</div>
	
	<!-- cotnet -->	
  	<div style="padding-top:80px; ">
  		<div class="visible-xs-block dropdown">
			<button id="categry-btn" class="btn btn_linen dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
				<i class="fa" style="color:#030303">카테고리</i>
			  <span class="caret"></span>
			</button>
			
			  <ul class="dropdown-menu" role="menu" aria-labelledby="categry-btn">
					<li class="list_categoty">
						<a class="" href="/myprofile.do">
							<label class="control-label">프로필편집</label>
						</a>
					</li>
					<li class="list_categoty">
						<a class="" href="/myfavorite.do">
							<label class="control-label">나의추천영화</label>
						</a>
					</li>
					<li class="list_categoty">
						<a href="/myrating.do">
							<label class="control-label">나의별점리스트</label>							
						</a>
					</li>
					<li class="list_categoty">
						<a href="/myreview.do">
							<label class="control-label">나의게시글</label>							
						</a>
					</li>
					<li class="list_categoty">
						<a href="/myreply.do">
							<label class="control-label">나의댓글</label>							
						</a>
					</li>
					<li class="list_categoty">
						<a href="/userdelete.do">
							<label class="control-label">회원탈퇴</label>							
						</a>
					</li>
			  </ul>
		</div>
		<div class="container back">
			<div class=" left_float">
			<div class="hidden-xs list-area" >
				<tiles:insertAttribute name="mymenu"/>
			</div>
			</div>
			<div class="article">
				<tiles:insertDefinition name="${page}"/>
			</div>
		</div>
	</div>
	
	<!-- footer -->
	<div id="footer">
		<tiles:insertAttribute name="footer"/>
	</div>
</body>
</html>