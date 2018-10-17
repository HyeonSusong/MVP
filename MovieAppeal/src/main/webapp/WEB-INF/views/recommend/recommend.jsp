<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt" %>
<%@ page session="false" %>
<div class="movieList">
<h1><strong><em><font color="#C71B1B">MVP</font> Movie List</em></strong></h1>
<div class="panel movie-list">
	<c:if test="${ not empty genre_movie_list}">
		<c:forEach var="glist" items="${genre_movie_list}">
			<h3><strong>${glist.genre}</strong> <span style="float: right; margin-right: 20px;"><small><a href="/movielist.do?m_genre=${glist.genre}" style="color:#ddd;"> <span class="glyphicon glyphicon-list" aria-hidden="true"></span>MORE</a></small></span></h3>
			<hr>
				<ul class="content-slider">
				<c:forEach var="list" items="${glist.movielist}">			
           		    	<li class="movie-poster-wrap">
                			<img class="slider-poster" height="165.56px" width="133.3px" alt="poster" src="${list.m_imgurl}">
                		    <div class="nameplate">
                		    <div class="moviename-wrap text-left">${list.m_title}</div>
                   			<div class="moviename-wrap text-left">
                    		평점 : ${list.m_rating} 
                    		<input class="m_no" type="hidden" value="${list.m_no}">
                    		</div>
                    		</div>
                		</li>	
           		</c:forEach>
           		</ul>			
		</c:forEach>
	</c:if>
</div>
</div>
<script type="text/javascript">
$(document).ready(function() {
	$(".content-slider").lightSlider({
     loop:true,
     keyPress:true,
     item:8
 });
});

$(function(){
	$('.movie-poster-wrap').click(function(){
		var m_no = $(this).children().find('.m_no').val();
		var url = "/moviedetail.do?m_no="+m_no;
		window.open(url);
	});
});
</script>
<link href="/css/recommend.css" rel="stylesheet">
