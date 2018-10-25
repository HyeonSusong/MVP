<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt" %>

<div class="col-md-12 container">
			<div class="page-header space align-middle">
			<br>
        	 	<h1 class="spaceLeft text-left spaceTop">My Review</h1>
       		</div>
       		<div class="col-md-12">
       			<ul class="list-group listul">
	       			<li class="list-group-item list-title">
	       				<div class="title col-xs-7" style="font-size: 15px;">
	       				<strong>제목</strong>
	       				</div>
	       				<div class="date col-xs-2">
	       				<strong>작성일</strong>
	       				</div>
	       				<div class="hit col-xs-3">
	       				<strong>추천수/조회수</strong>
	       				</div>
	       			</li>
<!-- 		   			<li class="list-group-item list-Entity">
		   				<div class="title col-xs-7">
		   					<div class="cate">
		   					아이콘
		   					</div>
		   					<div class="movieNm">
		   					[영화명]
		   					</div>
		   					<div class="reviewtitle">
		   					제목
		   					</div>
	       				</div>
	       				<div class="date col-xs-2">
	       				2018.01.02
	       				</div>
	       				<div class="hit col-xs-3">따봉 1 / 눈 2</div>
    	   			</li>
    	   			-->
    	   		<c:choose>
  					<c:when test="${not empty list}">
  					<c:forEach var="list" items="${list}">
		   			<li class="list-group-item list-Entity">
		   				<div class="title col-xs-7">
		   					<div class="cate">
							<c:choose>
							<c:when test="${list.b_category eq 'like'}">
								<span class="glyphicon glyphicon-thumbs-up" style="color:#ff5555; font-size: 20px; "></span>
							</c:when>
							<c:when test="${list.b_category eq 'dislike'}">
								<span class="glyphicon glyphicon-thumbs-down" style="color:#4ca7d8; font-size: 20px;"></span>
								
							</c:when>
							</c:choose>
		   					</div>
		   					<div class="movieNm">
		   					[${list.m_title}]
		   					</div>
		   					<div class="reviewtitle">
		   					${list.b_title }
		   					<input type="hidden" class="b_no" value="${list.b_no}">
		   					</div>
	       				</div>
	       				<div class="date col-xs-2">
	       				${list.b_date}
	       				</div>
	       				<div class="hit col-xs-3">
	       					<div style="float: left;">
			 				<i class="fas fa-thumbs-up"></i> ${list.b_likes }
			 				</div>	
			 				<div style="float: right;">
			 				<i class="far fa-eye"></i> ${list.b_count }
			 				</div>
						
						</div>
    	   			</li>  					
  					</c:forEach>
  					</c:when>
  					<c:otherwise>
  						<li class="list-group-item text-center list-Entity">
  							<h4><strong>검색된 결과가 없습니다</strong></h4>
  						<li>
  					</c:otherwise>
  					</c:choose>

       			</ul>
       			<div class="text-center">
       			<ul class="pagination">
			<c:if test="${pageset.firstPage > pageset.pageIndex}">
		   		<li>
    				<a href="/myreview.do?curPage=${pageset.firstPage-pageset.pageIndex}" aria-label="Previous">
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
   	 					<li><a href="/myreview.do?curPage=${i}">${i}</a></li>
   	 				</c:otherwise>
   	 			</c:choose>
   	 		</c:forEach>
			<c:if test="${pageset.firstPage+pageset.pageIndex <= pageset.maxPage}">
   	 			<li>
      				<a href="/myreview.do?curPage=${pageset.firstPage+pageset.pageIndex}" aria-label="Next">
        				<span aria-hidden="true">&raquo;</span>
      				</a>
    			</li>
    		</c:if>
    	</ul>
       			</div>
       		</div>
		
</div>
<script type="text/javascript">
	$(function(){
		$('.list-Entity').click(function(){
			var b_no = $(this).find('.b_no').val();
			var url = "/reviewdetail.do?b_no="+b_no;
			window.open(url);
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