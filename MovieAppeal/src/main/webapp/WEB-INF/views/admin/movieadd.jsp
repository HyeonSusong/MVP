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
					<tr class="dager movieEntity">
					<td class="m_imgarea">
					<img  class="m_imgurl" src="${list.imageUrl}">
					</td>
					<td><label class="fa" >${list.movieCd}</label>
					<input class="m_no" type="hidden" value="${list.movieCd}"> 
					</td>
					<td><label class="fa">${list.movieNm}</label>
					<input class="m_title" type="hidden" value="${list.movieNm}"> 
					</td>
					<td><label class="fa">${list.movieNmEn}</label>
					</td>
					<td><label class="fa">${list.openDt}</label>
					</td>
					<td><label class="fa">${list.genreAlt}</label>
					</td>
					<td><label class="fa">${list.repGenreNm}</label>
					<input class="m_genre" type="hidden" value="${list.repGenreNm}">
					</td>
					<td>
						<c:forEach var="direct" items="${ list.directors}">
						<label class="fa">${ direct} &nbsp;</label>
						</c:forEach>
					</td>
					<td>
						<div class="checkbox">
							<input class="movieAddCheck" id="movieAddCheck" type="checkbox">
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
		<button class ="btn" type="button" id="btnMovieAdd"> <i>영화 추가</i>
		</button>
	<form>
	<input type="text" id="m_imgurl" name="m_imgurl" >
	<input type="text" id="m_no" name="m_no">
	<input type="text" id="m_title" name="m_title">
	<input type="text" id="m_genre" name="m_genre">
	</form>
	</div>
</div>
</div>
<script type="text/javascript">
	$(function(){
		$("#btnMovieAdd").click(function(){
			var dataname = '';
			for (i=0; i<$(".movieAddCheck").length;i++){
				if($(".movieAddCheck").eq(i).is(":checked")){
					var m_imgurl = $(".movieAddCheck").eq(i).parents('.movieEntity').children().children('.m_imgurl').attr('src');
					var m_no = $(".movieAddCheck").eq(i).parents('.movieEntity').children().children('.m_no').val();
					var m_title = $(".movieAddCheck").eq(i).parents('.movieEntity').children().children('.m_title').val();
					var m_genre = $(".movieAddCheck").eq(i).parents('.movieEntity').children().children('.m_genre').val();
					
			        $.ajax({
			            async: true,
			            type : 'POST',
			            data : JSON.stringify({
			            	'm_no' : m_no,
			            	'm_title' : m_title,
			            	'm_genre' : m_genre,
			            	'm_imgurl' : m_imgurl
			            }),
			            url : "/administrator/postmovieadd.do",
			            dataType : "json",
			            contentType: "application/json; charset=UTF-8",
			            success : function(data) {
			            	if(data.cnt==0){
			            	dataname = dataname + m_title+",";
		            		location.reload();
			            	}
			            	if(data.cnt>0){
			            		alert(m_title+"은 이미 등록된 영화입니다.");
			            		}
			            },
			            error : function(error) {		                
			                alert("error : " + error);
			            }
			        });
				}
			}
			alert( dataname + "등록완료");
		});
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