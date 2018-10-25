<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- 이미지썸네일 슬라이드 -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description" content="">
<link rel="stylesheet" href="/css/lightslider.css" />
<link href="/css/movieDetail.css" rel="stylesheet">
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
<script>
	$(document).ready(function() {
		$("#content-slider").lightSlider({
			loop : true,
			auto : false,
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
	<div class="mdbg"></div>
	<div style="/* background: url(/img/firmback.jpg); */  overflow: hidden;">
	
<div id="movieDetail">

	<div class="movieDetail-wrap" >
		<div class="moviedetail-top">
			<div class="movieDetail-poster">
				<img src="img/movie/ansi_poster.jpg">
			</div>
			<div class="title-wrap">
			<div class="movieDetail-title">
				<h1>안시성</h1>
			</div>
			<div class="movieDetail-info">
				2018 .09.19' 시대극' 한국 <br> 감독 : 머시기리리
			</div>
			<div class="rating-wrap">
				<input class="poster-star rating" type="number" min=0 max=10 step=1
					data-size="sm" data-show-clear="false" data-show-caption="true">
			</div>
			<div class="poster-like2">
				<button type="button" class="likebt2">
					<i class="fa fa-heart"></i>
				</button>
			</div>
			</div>

		</div>

		<div role="tabpanel" class="movieDetail-bottom">
		<div class="tabul-wrap">
		<ul class="nav nav-tabs" role="tablist" id="movieTab">
		<li role="presentation" class="active"><a href="#profile" aria-controls="profile" role="tab" data-toggle="tab">Home</a></li>
  		<li role="presentation"><a href="#review" aria-controls="review" role="tab" data-toggle="tab">Profile</a></li>
		</ul>
		</div>

		<div class="tab-content">
			<div  role="tabpanel" class="tab-pane active d_middle" id="profile">
				<strong>출연진</strong>
				<div class="actor" style="text-align: left; margin-left: 55px;">
				 양만춘(조인성) , ...................
				</div>
				<strong>줄거리</strong>
				<div class="summary" style="text-align: left; margin-left: 55px;">
					<br>우리는 물러서는 법을 배우지 못했다! <br>우리는 무릎 꿇는 법을 배우지 못했다! <br>
					우리는 항복이라는 걸 배우지 못했다! <br> 천하를 손에 넣으려는 당 태종은 수십만 대군을 동원해 고구려의
					변방 안시성을 침공한다.
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
					<iframe width="700" height="350"
						src="https://www.youtube.com/embed/dmMjjsMLxLk" frameborder="0"
						allow="autoplay; encrypted-media" allowfullscreen></iframe>
				</div>
				

			</div>
			<div  role="tabpanel" class="tab-pane d_middle" id="review">
				<div class="likeBoard">
				<h3>
						<strong style="color: #ff5555; font-size:18pt">
								<span class="glyphicon glyphicon-thumbs-up" style="color:#ff5555; font-size: 30px; "></span>
							좋아요
						</strong>
				</h3>
				<hr>
				</div>
				<div class="hateBoard">
						<strong style="color: #4ca7d8; font-size:18pt">
								<span class="glyphicon glyphicon-thumbs-down" style="color:#4ca7d8;font-size: 30px;"></span>
						글쎄요
						</strong>
				</div>
			</div>
		</div>


		</div>
	</div>
</div>
</div>
