<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt" %>

<div style="float: none;">
	<div class="container" style="padding-top: 50px; padding-bottom: 80px;">
		<div class="table-responsive">
		<div>
		<header>
			<ul class="list-unstyled list-inline">
				<li>
					<select>
						<option>
						</option>
					</select>
				</li>
			</ul>	
		</header>
		</div>
		
		<table class="table table-striped table-hover">
			<tr class="info"> 
				<td></td>
				<td><label class="fa">영화코드</label>
				</td>
				<td><label class="fa">영화제목(kor)</label>
				</td>
				<td><label class="fa">영화제목(eng)</label>
				</td>
				<td><label class="fa">개봉연도</label>
				</td>
				<td><label class="fa">장르</label>
				</td>
				<td><label class="fa">대표장르</label>
				</td>
				<td><label class="fa">감독</label>
				</td>
				<td> 영화추가
				</td>		
			</tr>
			<c:if test="${not empty movielist}">
				<c:forEach var="list" items="${movielist}">
					<tr class="dager">
					<td>
					<img class="m_imgurl" src="${list.imageUrl}">
					</td>
					<td class="m_no"><label class="fa" >${list.movieCd}</label>
					</td>
					<td class="m_title"><label class="fa">${list.movieNm}</label>
					</td>
					<td><label class="fa">${list.movieNmEn}</label>
					</td>
					<td><label class="fa">${list.openDt}</label>
					</td>
					<td class="m_genre"><label class="fa">${list.genreAlt}</label>
					</td>
					<td><label class="fa">${list.repGenreNm}</label>
					</td>
					<td>
						<c:forEach var="direct" items="${ list.directors}">
						<label class="fa">${ direct} &nbsp;</label>
						</c:forEach>
					</td>
					<td>
						<div class="checkbox">
							<input class="movieAddCheck" type="checkbox">
						</div>
					</td>
					</tr>
				</c:forEach>
			</c:if>
			<tr>
				<td colspan="9">
				<ul class="pagination">
					<c:if test="${pageset.firstPage>10}">
				    <li>
    				<a href="/administrator/movieadd.do?curPage=${pageset.firstPage-pageset.pageIndex}" aria-label="Previous">
        			<span aria-hidden="true">&laquo;</span>
      				</a>
   	 				</li>
   	 				</c:if>
   	 				<c:forEach var="i" begin="${pageset.firstPage}" end="${pageset.lastPage}" step="1">
   	 					<c:choose>
   	 					<c:when test="${i == pageset.nowPage}">
   	 					<li><a class ="nowpage">${i}</a></li>
   	 					</c:when>
   	 					<c:otherwise>
   	 					<li><a href="/administrator/movieadd.do?curPage=${i}">${i}</a></li>
   	 					</c:otherwise>
   	 					</c:choose>
   	 				</c:forEach>
   	 				<li>
      					<a href="/administrator/movieadd.do?curPage=${pageset.firstPage+pageset.pageIndex}" aria-label="Next">
        				<span aria-hidden="true">&raquo;</span>
      					</a>
    				</li>
    			</ul>
				</td>
			</tr>
		</table>
		<button type="button" >
		</button>
	
	</div>
</div>
</div>
<script>
	$(function(){
		
	});
</script>
<style type="text/css">
	.mystar-rating-poster{
		height: 158px;
		width: auto;
	}
	.mystar-rating-poster:hover{
		-webkit-filter: brightness(50%);
    	filter: brightness(50%);	
	}

</style>