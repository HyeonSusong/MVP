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
					<td><label class="fa">감독이름</label>
					</td>
					<td><label class="fa">장르</label>
					</td>
					<td> 영화추가
					</td>
										
				</tr>
			<c:if test="${not empty movielist}">
			<c:forEach var="list" items="${movielist.movieListResult.movieList}">
				<tr class="dager">
					<td><label class="fa">${list.movieCd}</label>
					</td>
					<td><label class="fa">${list.movieNm}</label>
					</td>
					<td><label class="fa">${list.movieNmEn}</label>
					</td>
					<td><label class="fa">${list.openDt}</label>
					</td>
					<td><label class="fa">${list.genreAlt}</label>
					</td>
					<td><label class="fa">${list.repGenreNm}</label>
					</td>
					<td><label class="fa">${list.directors}</label>
					</td>
					<td><label class="fa">${list.directors.peopleNm}</label>
					</td>
					<td><label class="fa">${list.companyNm}</label>
					</td>
					<td>
						<label class="fa">${list.typeNm}</label>
					</td>
					<td>
						<div class="checkbox">
							<input type="checkbox">
						</div>
					</td>
				</tr>
			</c:forEach>

			</c:if>
				<tr>
					<td colspan="9">
					</td>
				</tr>
		</table>
	
	</div>
</div>
</div>
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