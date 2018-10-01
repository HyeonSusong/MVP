<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- 이미지썸네일 슬라이드 -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description" content="">
<link rel="stylesheet" href="css/lightslider.css" />
<style>
ul {
	list-style: none outside none;
	padding-left: 0;
	margin: 0;
}

.d_middle .item {
	margin-top: 70px;
	margin-bottom: 150px;
}

#image-gallery data-thumb {
	background-color: #ed3020;
	text-align: center;
	color: #FFF;
	width: 200px;
	height: 120px;
	padding: 10px;
}

#image-gallery li img {
	width: 660px;
	height: 430px;
}
</style>
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script src="js/lightslider.js"></script>
<script>
	$(document).ready(function() {
		$("#content-slider").lightSlider({
			loop : true,
			auto : true,
			keyPress : true
		});
		$('#image-gallery').lightSlider({
			gallery : true,
			item : 1,
			thumbItem : 9,
			slideMargin : 0,
			speed : 1000,
			auto : true,
			loop : true,
			onSliderLoad : function() {
				$('#image-gallery').removeClass('cS-hidden');
			}
		});
	});
	
	
</script>


<div id="movieDetail">
	<div class="mdbg"></div>
	<div class="movieDetail-wrap" align="center">
		<div class="moviedetail-top">
			<div class="movieDetail-poster">
				<img src="${DTO.m_imgurl}">
			</div>
			<div class="movieDetail-title">
				<h1>${DTO.m_title }</h1>
			</div>
			<div class="movieDetail-info">${DTO.openDt} , ${DTO.genres} 한국 
			<br>
			감독 : ${DTO.directors}
			<br>
			출연 : ${DTO.actors}
			</div>
			<div class="movieDetail-rate">
				평점: <i class="fas fa-star">${DTO.m_rating}</i>
			</div>
			<div class="movieDetail-like">
				<i class="fas fa-heart">${DTO.m_likes}</i>
			</div>

		</div>

		<div class="movieDetail-bottom">


			<div class="d_middle"><strong>줄거리</strong> 
				<div class="summary" style="text-align: left; margin-left: 55px;" > 
				${DTO.m_plot}
				</div>
				<hr>

				<div class="item">
					<strong>사진</strong>
					<div class="clearfix" style="max-width: 650px;">
						<ul id="image-gallery" class="gallery list-unstyled cS-hidden">
							<li data-thumb="img/movie/AS_01.jpg"><img
								src="img/movie/AS_01.jpg" /></li>
							<li data-thumb="img/movie/AS_02.jpg"><img
								src="img/movie/AS_02.jpg" /></li>
							<li data-thumb="img/movie/AS_03.jpg"><img
								src="img/movie/AS_03.jpg" /></li>
							<li data-thumb="img/movie/AS_04.jpg"><img
								src="img/movie/AS_04.jpg" /></li>
							<li data-thumb="img/movie/AS_05.jpg"><img
								src="img/movie/AS_05.jpg" /></li>
							<li data-thumb="img/movie/AS_06.jpg"><img
								src="img/movie/AS_06.jpg" /></li>
						</ul>
					</div>
					
					
				</div>
				<strong>영상</strong>
					<div class="youtube_wrap">
					<iframe width="700" height="350" src="${DTO.m_trailerurl}" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>
					</div>
			</div>



		</div>
	</div>
</div>
