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
	}
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

<div class="main-top">
	<div class="main-rank2">
		<ul id="favorite">
			<li>
				<div class="poster-wrap" onmouseover="posterhover(this);"
					onmouseleave="javascript:posterleave(this);">
					<img class="poster" src="img/rank1.jpg">
					<div class="rating-wrap">
						<input class="poster-star rating" type="number" min=0 max=10
							step=1 data-size="sm" data-show-clear="false"
							data-show-caption="false">
					</div>
					<div class="poster-like">
						<button type="button" class="likebt">
							<i class="fa fa-heart"></i>
						</button>
					</div>
				</div>
			</li>
			<li>
				<div class="poster-wrap" onmouseover="posterhover(this);"
					onmouseleave="javascript:posterleave(this);">
					<img class="poster" src="img/rank2.jpg">
					<div class="rating-wrap">
						<input class="poster-star rating" type="number" min=0 max=10
							step=1 data-size="sm" data-show-clear="false"
							data-show-caption="false">
					</div>
					<div class="poster-like">
						<button type="button" class="likebt">
							<i class="fa fa-heart"></i>
						</button>
					</div>
				</div>
			</li>
			<li>
				<div class="poster-wrap" onmouseover="posterhover(this);"
					onmouseleave="javascript:posterleave(this);">
					<img class="poster" src="img/rank3.jpg">
					<div class="rating-wrap">
						<input class="poster-star rating" type="number" min=0 max=10
							step=1 data-size="sm" data-show-clear="false"
							data-show-caption="false">
					</div>
					<div class="poster-like">
						<button type="button" class="likebt">
							<i class="fa fa-heart"></i>
						</button>
					</div>
				</div>
			</li>
			<li>
				<div class="poster-wrap" onmouseover="posterhover(this);"
					onmouseleave="javascript:posterleave(this);">
					<img class="poster" src="img/rank4.jpg">
					<div class="rating-wrap">
						<input class="poster-star rating" type="number" min=0 max=10
							step=1 data-size="sm" data-show-clear="false"
							data-show-caption="false">
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
	<div class="boxoffice">
		<div class="boxtop">
			<h2>
			<img src="img/office.jpg" alt="박스 오피스">
			</h2>
		</div>
		<div class="officecontent">
		 <ol class="offcierank">
		  <li>
		   <span class="grade_12">12</span>
		   <span>안시성</span>
		  </li>
		  <li>
		   <span class="grade_12">12</span>
		   <span>명당</span>
		  </li>
		   <li>
		   <span class="grade_12">12</span>
		   <span>협상</span>
		  </li>
		   <li>
		   <span class="grade_19">청불</span>
		   <span>암수살인</span>
		  </li>
		   <li>
		   <span class="grade_15">15</span>
		   <span>베놈</span>
		  </li>
		   <li>
		   <span class="grade_15">15</span>
		   <span>더넌</span>
		  </li>
		   <li>
		   <span class="grade_12">12</span>
		   <span>서치</span>
		  </li>
		   <li>
		   <span class="grade_all">전체</span>
		   <span>푸곰돌이 </span>
		  </li>
		   <li>
		   <span class="grade_12">12</span>
		   <span>셜록놈즈</span>
		  </li>
		   <li>
		   <span class="grade_12">12</span>
		   <span>어쩌구</span>
		  </li>
		  
		 </ol>
		</div>
		<div class="boxfoot">
			<h2></h2>
		</div>
	</div>
</div>

<hr>
<!-- 게시판 미리보기 -->
<div id="prelist">

	<div id="prelist-hit">
		<table>
			<tr>
				<td colspan="5" bgcolor="black"></td>
			</tr>
			<thead>
				<tr>
					<th>rn</th>
					<th>title</th>
					<th>content</th>
					<th>writer</th>
					<th><i class="far fa-heart" style="color: red;">like</i></th>
				</tr>
			</thead>

			<tbody>
				<tr>
					<td>1</td>
					<td>인기게시판</td>
					<td>쫘르르륵블라블라내용...</td>
					<td>testman</td>
					<td>77</td>
				</tr>
				<tr>
					<td>1</td>
					<td>인기게시판</td>
					<td>쫘르르륵블라블라내용...</td>
					<td>testman</td>
					<td>77</td>
				</tr>
				<tr>
					<td colspan="7" width="100%" bgcolor="black"></td>
				</tr>
			<tbody>
		</table>

	</div>
	<div id="prelist-new">
		<table>
			<tr>
				<td colspan="7" width="40%" bgcolor="black"></td>
			</tr>
			<thead>
				<tr>
					<th>rn</th>
					<th>title</th>
					<th>content</th>
					<th>writer</th>
					<th>date<img src="img/New_icons_44.gif"></th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>1</td>
					<td>최신게시판</td>
					<td>쫘르르륵블라블라내용...</td>
					<td>testman</td>
					<td>2018.09.12</td>
				</tr>
				<tr>
					<td>1</td>
					<td>최신게시판</td>
					<td>쫘르르륵블라블라내용...</td>
					<td>testman</td>
					<td>2018.09.12</td>
				</tr>
				<tr>
					<td colspan="7" width="100%" bgcolor="black"></td>
				</tr>
			</tbody>
		</table>

	</div>
</div>
<!-- 게시판미리보기 end -->



</html>
