<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt" %>
	<div class="col-md-12" style=" border-radius:20px;">
		<div class="page-header space align-middle">
			<br>
        	<h1 class="spaceLeft spaceTop">내가추천한영화</h1>
    	</div>
    	<div>

    	
    	</div>
	</div>
	<div class="3movie-wrap" id="3favorite">
	<ul class="list-inline list-unstyled">
	<c:forEach var="i" begin="1" end="9" >
	<li class="3item">
	<div class="3poster${i} " id="movie">
		<div class="3poster_wrap"  onmouseover="posterhover(${i});" onmouseleave="posterleave(${i});" >
		<img class="3poster" src="/img/rank${i}.jpg" onclick="moviedetail(i);">
			<input class="3poster_star rating" type="number" min=0 max=10 step=1 data-size="xs" data-show-clear="false" data-show-caption="false" >
		</div>
		
		
	</div>
	</li>
	<c:if test=" ${(i%3) eq 0}"><div></div></c:if>
	</c:forEach>
	</ul>
	<br>
	</div>
<%-- 	<div class="movieNum_${bean.MOVIE_ID }">
		<div class="poster-wrap" onmouseover="posterhover(${bean.MOVIE_ID}, '${NowUser}', '${bean.AVG}', '${bean.AVG_NUM}','now2')" onmouseleave="posterleave(${bean.MOVIE_ID})">
		<img class="poster" src="./resources/img/movie/${bean.POSTER }" onclick="moviedetail(${bean.MOVIE_ID}, '${NowUser}', 'now')">
		<div>
			<input class="poster_star rating" type="number" min=0 max=10 step=1 data-size="xs" data-show-clear="false" data-show-caption="false" onmouseover="starID('${NowUser}', ${bean.MOVIE_ID})"></div>
		<div class="poster_like">
			<button type="button" onclick="poster_likeplus(${bean.MOVIE_ID}, '${NowUser}')" class="likebt">
				<i class="fa fa-heart"></i>
			</button></div>
		/div> --%>
<script type="text/javascript">
 function posterhover(k){
		$('.3poster'+k+' .3poster_star').rating("clear");
		$('.3poster'+k+' .3poster-wrap .rating-container').css("display", "block");
 }

</script>		
		
<style type="text/css">
#favorite .3poster_wrap{
 
 }

#favorite .3movie-wrap{
	width: auto;
    position: relative;
    margin: 0 auto;
}

#favorite li.3item {
    display: block;
    width: 232px;
    height: auto;
    border: 1px solid #a4a4a4;
    margin: 12px;
    float: left;
    background-color: #fff;
}

 #favorite li.3item .3poster{
	width: 100%;
	height: 329px;
	cursor: pointer;
	margin-top: 0px;
	transition : all 0.3s;
}
	
 #favorite .3poster-wrap:hover .3poster{
	-webkit-filter: brightness(50%);
    filter: brightness(50%);	
}


.3poster-wrap .rating-container{
	position: relative;
    top: -148px;
    left: 38px;
    margin-top: -57px;
    display: none;
    width: 152px;
} 



/*  별점 양식  */


 .star-empty {
	background: url(../img/movie/star_empty.png) no-repeat;
    background-size: cover;
    width: 131px;
    height: 20px;
    float: left;
    position: relative;
    left: 72px;
    top: -22px;
}

 .star-wrap {
    width: 80px; /*수치 변화시 줄어듬 13.1*평점 */
    height: 20px;
    display: block;
    overflow: hidden;
}

 .star {
	background: url(../img/movie/star_fill_orange.png) no-repeat;
    background-size: 100%;
    width: 131px;
    height: 20px;
    display: block;
}
 .rating-xs {
    font-size: 2.15em;
}
</style>