<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<link href="/css/movielist.css" rel="stylesheet">
<meta charset="UTF-8">
<div class="movielist" id="movielist" style="width: auto;">
	<div class="page-header space align-middle">
			<br>
	<h1><strong><em><font color="#dadada">My Movie Scrap</font></em></strong></h1>
	</div>
	<c:if test="${not empty movielist}">
		<ul class="movie-row">
		<c:forEach var="list" items="${movielist}">
		<li>
			<div class="poster-wrap">
				<img class="poster" src="${list.m_imgurl}">
				<div class="rating-wrap">
						<input class="poster-star rating" type="number" min="0" max="10" step="1" data-size="sm" data-show-clear="false" data-show-caption="false" >
				</div>
				<div class="poster-like">
					<button type="button" class="likebt" id="likebt">
						<i class="fa fa-heart"></i>
					</button>
				</div>
				
				<div class="nameplate">
                    <div class="moviename-wrap text-left"><strong>${list.m_title}</strong></div>
                    <div class="moviename-wrap text-left">
                    <span class="glyphicon glyphicon-star" style="color: #f7e600 " aria-hidden="true"></span>
                    <span class="m_rating">${list.m_rating}</span>
                    </div>
                    <div class="moviename-wrap text-left">
                    <span class="glyphicon glyphicon-heart" style="color: rgb(255, 0, 0); " aria-hidden="true"></span> ${list.m_likes}
                    </div>
                </div>
				<input type="hidden" class="m_no" value="${list.m_no}">
			</div>
		</li>
		</c:forEach>
		</ul>
	</c:if>
	<input type="hidden" id="curPage" value="${curPage}">
	<input type="hidden" id="query" value="${query}">
</div>

<script type="text/javascript">

$(function(){
	$('.poster-wrap').hover(function(){
		var m_no = $(this).children('.m_no').val();
		var likebt = $(this).children('.poster-like').children('.likebt');
		var ratingbtn = $(this).children().find(".rating");
		$.ajax({
   		 	async: true,
         	type : 'POST',
         	data : JSON.stringify({
         		"m_no" : m_no
         	}),
         	url : "/movielikecnt.do",
        	dataType : "json",
         	contentType: "application/json; charset=UTF-8",
         	success : function(data) {
         		if(data.cnt > 0 ){
         			likebt.removeClass('likebt-white');
         			likebt.removeClass('likebt-hover');
         			likebt.addClass('likebt-hover');
         		}else{
         			likebt.removeClass('likebt-white');
         			likebt.removeClass('likebt-hover');
         			likebt.addClass('likebt-white');
         		}
         	},
         	error : function(error) {		                
            	alert("error : " + error);
         	}
		});
		
		$.ajax({
   		 	async: true,
         	type : 'POST',
         	data : JSON.stringify({
         		"m_no" : m_no
         	}),
         	url : "/ratecheck.do",
        	dataType : "json",
         	contentType: "application/json; charset=UTF-8",
         	success : function(data) {
         		if(data.cnt > 0 ){
         			ratingbtn.val(data.rate);
         			ratingbtn.rating("clear");
         			ratingbtn.rating('update', data.rate);
         		}else{
         			return;
         		}
         	},
         	error : function(error) {		                
         	}
		});
	});
});

$(function(){
	$('.likebt').click(function(){
		var m_no = $(this).parents('.poster-wrap').children('.m_no').val();
		var likebt = $(this);
		$.ajax({
   		 	async: true,
         	type : 'POST',
         	data : JSON.stringify({
         		"m_no" : m_no
         	}),
         	url : "/movielike.do",
     	   	dataType : "json",
        	contentType: "application/json; charset=UTF-8",
       		success : function(data) {
         		if(data.cnt > 0 ){
         			alert("'보고싶은영화'에 스크랩되었습니다.")         		
         			likebt.removeClass('likebt-white');
         			likebt.removeClass('likebt-hover');
         			likebt.addClass('likebt-hover');
         		}else{
         			alert("'보고싶은영화'에서 스크랩해제되었습니다.")         		       
         			likebt.removeClass('likebt-white');
         			likebt.removeClass('likebt-hover');
         			likebt.addClass('likebt-white');
         			  location.reload();
         		}
         	},
         	error : function(error) {		                
            	alert("error : " + error);
         	}
		});
	});
});

$(function(){
	$('.rating-container').click(function(){
		var m_no = $(this).parents('.poster-wrap').children('.m_no').val();
		var ratingbtn = $(this).find(".rating");
		var mr_rating = ratingbtn.val();
		var m_rating = $(this).parents('.poster-wrap').children('.nameplate').find('.m_rating');
		$.ajax({
   		 	async: true,
         	type : 'POST',
         	data : JSON.stringify({
         		"m_no" : m_no,
         		"mr_rating" : mr_rating
         	}),
         	url : "/movierate.do",
        	dataType : "json",
         	contentType: "application/json; charset=UTF-8",
         	success : function(data) {
         		if(data.cnt > 0 ){
         			ratingbtn.val(data.rate);
         			ratingbtn.rating("clear");
         			ratingbtn.rating('update', data.rate);
         			m_rating.text("");
         			m_rating.append(data.m_rating.toFixed(1));
         		}else{
         			return;
         		}
         	},
         	error : function(error) {		                
            	alert("error : " + error);
         	}
		});
	});
});

$(function(){
	$(".poster").click(function(){
		var m_no = $(this).parent(".poster-wrap").children(".m_no").val();
		var url = "/moviedetail.do?m_no="+m_no;
		window.open(url);
	});
});
</script>
