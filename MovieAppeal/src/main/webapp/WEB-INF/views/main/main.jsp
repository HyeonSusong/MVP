<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page session="false"%>
<!DOCTYPE html>
<html lang="UTF-8">
<title>MovieAppeal</title>
<script>
	function posterhover(s) {
		//    	 		$(s).children().find('.rating').rating("clear");
		$(s).children().find('.rating-container').css("display", "block");
		$(s).children('.poster-like').css("display", "block");
	}

	function posterleave(s) {
		//    	 		$(s).children().find('poster-star').rating("clear");
		$(s).children().find('.rating-container').css("display", "none");
		$(s).children('.poster-like').css("display", "none");
	};
	
	 $(document).ready(function() {
			$(".content-slider").lightSlider({
             loop:true,
             keyPress:true,
             item:5
         });
	 });
	 
	 $(function(){
			$('.slider-poster').click(function(){
				var m_no = $(this).parent().children('.m_no').val();
				var url = "/moviedetail.do?m_no="+m_no;
				window.open(url);
			});
		});
	 $(function(){
		$('.boxoffiecelist').click(function(){
			var m_no = $(this).children().find(".m_no").val();
			var url = "/moviedetail.do?m_no="+m_no;
			window.open(url);
		});
	 });
</script>

<div class="fotorama" data-fit="cover" data-autoplay="6000"
	data-transition="dissolve" data-arrows="true" data-click="true"
	data-swipe="true" data-trackpad="true" data-loop="true"
	style="margin: 0;">
	<div data-img="img/venom_1600x600.jpg" class="banner-text">
		<div>
			베놈<br>Venom
		</div>
		<div class="banner-text2">마블 최초의 빌런 히어로!</div>
	</div>
	<div data-img="img/ansi_1600x600.jpg" class="banner-text">
		<div></div>
		<div class="banner-text2"></div>
	</div>
	<div data-img="img/MD_1600x600.jpg" class="banner-text">
		<div></div>
		<div class="banner-text2"></div>
	</div>
</div>

<!--  -------------------------------------------------------- -->

<div class="container" id="main-panel">
	<div class="clearfix">
	<div class="column_left">
		<div class="left_top panel panel-body">
		<h4><strong>MVP 최고 별점 영화 랭킹 Top10</strong></h4>
		<hr>
			<ul id="content-slider" class="content-slider">
			<c:if test="${likelist != null}">
            <c:forEach var="list" items="${ratelist}">   
                <li class="poster-li">
                    <input class="m_no" type="hidden" value="${list.m_no}">
                    <img class="slider-poster" height="165.56px" width="133.3px" alt="poster" src="${list.m_imgurl}">
                    <div class="nameplate">
                    <div class="moviename-wrap text-left">${list.m_title}</div>
                    <div class="moviename-wrap text-left">
                    <span class="glyphicon glyphicon-star" style="color: rgb(214, 186, 138); " aria-hidden="true"></span> ${list.m_rating} 
                    </div>
                    </div>
                </li>
                </c:forEach>
             </c:if>   
            </ul>
		</div>
		<div class="left_bottom panel panel-body">
		<h4><strong>MVP 최다 추천 영화 랭킹 Top10</strong></h4>
		<hr>
		<div>
			<ul id="content-slider" class="content-slider">
			<c:if test="${ratelist != null}">
            <c:forEach var="list" items="${ratelist}">   
                <li class="poster-li">
                	<input class="m_no" type="hidden" value="${list.m_no}">
                	<img class="slider-poster" height="165.56px" width="133.3px" alt="poster" src="${list.m_imgurl}">
                    <div class="nameplate">
                    <div class="moviename-wrap text-left">${list.m_title}</div>
                    <div class="moviename-wrap text-left">
                    <span class="glyphicon glyphicon-heart" style="color: rgb(255, 0, 0); " aria-hidden="true"></span> ${list.m_likes} 
                    </div>
                    </div>
                </li>
                </c:forEach>
             </c:if>   
            </ul>
            </div>
		</div>
	</div>
	<div class="column_right">
		<div class="panel panel-body boxoffice" >
			<div>
				<ul class="list-group">
					<li class="list-group-item text-center" style=" background-color:#2a2e33; padding: 5px;">
						<h3><strong><em>BOX OFFICE TOP 10</em></strong></h3>
					</li>
					<c:if test="${boxOfiiceTop10 != null}">
					
						<c:forEach var="top10" items="${boxOfiiceTop10}" >
							<li class="list-group-item boxoffiecelist">
								<div class="movierank">
								<strong><em>${top10.rank}.</em></strong>
								</div>
								<div class="movietitle">
									<strong>${top10.movieNm}</strong>
									<input type="hidden" class="m_no" value="${top10.movieCd}">
								</div>
								<div class="movieacc">
									${top10.audiAcc}명
								</div>
							</li>						
						</c:forEach>
					</c:if>
				</ul>
				<div class ="text-right">
				<small style="color:#D6BA8A;">${week} 기준</small>
				</div>
			</div>
		</div>
		
		<div class="serchbar-wrap panel panel-body">
		<h4><strong>&nbsp;&nbsp;영화검색</strong></h4>
			<form action="/movieserch.do" method="post">
			<div class="input-group">
   				<input type="text" class="form-control" name="query" placeholder="Search for...">
      			<span class="input-group-btn">
        		<button class="btn btn-default" type="submit"><span class="glyphicon glyphicon-search" aria-hidden="true"></span></button>
      			</span>
	    	</div>
	    	</form>	
		</div>
	</div>
<!-- 게시판 미리보기 -->
	<div class="column_bottom">
		<div class="panel panel-body prelist bottom_left">
				<div id="prelist-hit">
				<div>
				<span style="font-size:28px;"><strong><font style="color:#C71B1B">Best</font> MVP Movie Review</strong></span>
				 <span style=" padding-top:15px;  float: right;"> <small><a style="color:#ddd;"> <span class="glyphicon glyphicon-list" aria-hidden="true"></span>MORE</a></small></span>
				<hr>
				</div>
					<table class="table table-condensed">
						<tr>
							<td colspan="5" bgcolor="black"></td>
						</tr>
						<thead>
							<tr>
								<th>글번호</th>
								<th>제목</th>
								<th>영화</th>
								<th>작성자</th>
								<th><i class="far fa-heart" style="color: red;">like</i></th>
							</tr>
						</thead>
						<tbody>
						<c:forEach var="i" step="1" begin="1" end="5">
						<tr>
							<td>${i}</td>
							<td>인기게시판</td>
							<td>쫘르르륵블라블라내용...</td>
							<td>testman</td>
							<td>77</td>
							</tr>
						</c:forEach>
						<tr>
							<td colspan="7" width="100%" bgcolor="black"></td>
						</tr>
						</tbody>
					</table>
				</div>
			</div>
		<div class="panel panel-body prelist bottom_right" >
				<div id="prelist-new">
				<div>
				<span style="font-size:28px;"><strong><font style="color:#017467">New</font> MVP Movie Review</strong></span>
				 <span style=" padding-top:15px;  float: right;"> <small><a style="color:#ddd;"> <span class="glyphicon glyphicon-list" aria-hidden="true"></span>MORE</a></small></span>
				</div>
				<hr>
					<table>
						<tr>
							<td colspan="7" bgcolor="#030303"></td>
						</tr>
						<thead>
						<tr>
							<th>글번호</th>
							<th>제목</th>
							<th>영화</th>
							<th>작성자</th>
							<th>date<img src="/img/New_icons_44.gif"></th>
						</tr>
						</thead>
						<tbody>
						<c:forEach var="i" begin="1" end="5" step="1">
						<tr>
							<td>${i}</td>
							<td>최신게시판</td>
							<td>쫘르르륵블라블라내용...</td>
							<td>testman</td>
							<td>2018.09.12</td>
						</tr>
						</c:forEach>
						<tr>
							<td colspan="7" bgcolor="#030303"></td>
						</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div> <!-- column bottom end -->	
	</div>
</div>

<!-- 게시판미리보기 end -->



</html>
