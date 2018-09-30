<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt" %>

<div style="position:static;">


			<div id="favorite" >
			<ul>
			
			<li>
				<div class = "poster-wrap" onmouseover="posterhover(this);" onmouseleave="javascript:posterleave(this);">
					<img class="poster" src="/img/rank1.jpg" >
					<div class="rating-wrap">
						<input class="poster-star rating" type="number" min=0 max=10 step=1 data-size="sm" data-show-clear="false" data-show-caption="false" >
					</div>
					<div class="poster-like">
						<button type="button" class="likebt">
						<i class="fa fa-heart"></i>
						</button>
					</div>
				</div>
				
				</li>
				
				<li>
				<div class = "poster-wrap" onmouseover="posterhover(this);" onmouseleave="javascript:posterleave(this);">
					<img class="poster" src="/img/rank2.jpg" >
					<div class="rating-wrap">
						<input class="poster-star rating" type="number" min=0 max=10 step=1 data-size="sm" data-show-clear="false" data-show-caption="false" >
					</div>
					<div class="poster-like">
						<button type="button" class="likebt">
						<i class="fa fa-heart"></i>
						</button>
					</div>
				</div>
				
				</li>
				
				</ul>
			</div>	

</div>

<script type="text/javascript">
 function posterhover(s){
//		$(s).children().find('.rating').rating("clear");
		$(s).children().find('.rating-container').css("display", "block");
		$(s).children('.poster-like').css("display", "block");
 }
 
 function posterleave(s){
//		$(s).children().find('poster-star').rating("clear");
		$(s).children().find('.rating-container').css("display", "none");
		$(s).children('.poster-like').css("display", "none");
}
</script>		
		
<style type="text/css">
#favorite .poster-wrap{
	width: 210px;
	height: 297px;
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
 
 }

 #favorite .poster{
	width: 100%;
	height: 297px;
	cursor: pointer;
	margin-top: 0px;
	transition : all 0.3s;
}
	
 #favorite .poster-wrap:hover .poster{
	-webkit-filter: brightness(50%);
    filter: brightness(50%);	
}


.poster-wrap .rating-container{
	position: relative;
    top: -190px;
    left: 15px;
    display: none;
}

.poster-like .likebt{
	z-index: 2;
    width: 60px;
    height: 60px;
    font-size: 27px;
    font-weight: 700;
    color: #fff;
 	background-color: rgba( 255, 255, 255, 0.5 );
    position: relative;
    left: 75px;
    border-radius: 60px;
    transition : all 0.4s;
}

.poster-like {
	display: inline-flex;
    position: relative;
    top: -160px;
    display : none;
   /*  transition : all 0.4s; */
}

 .poster-like .likebt:hover{
	background-color: #E08F23;
	border-color: #E08F23;
}



</style>