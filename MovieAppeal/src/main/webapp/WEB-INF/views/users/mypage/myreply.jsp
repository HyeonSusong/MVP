<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt" %>

<div class="col-md-12 container">
			<div class="page-header space align-middle">
			<br>
        	 	<h1 class="spaceLeft text-left spaceTop">My Reple</h1>
       		</div>
       		<div class="col-md-12">
       			<ul class="list-group listul">
	       			<li class="list-group-item list-title">
	       				<div class="title col-xs-9" style="font-size: 15px;">
	       				<strong>게시물/댓글내용</strong>
	       				</div>
	       				<div class="hit col-xs-3">
	       				<strong>등록일</strong>
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
    	   			
  -->   	   		<c:choose>
  					<c:when test="${not empty list}">
  					<c:forEach var="list" items="${list}">
		   			<li class="list-group-item replylist-Entity">
		   			<div class="review-wrap">
		   				<div class="title col-xs-8">
		   				<strong>게시글 :</strong>
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
		   					<input type="hidden" class="b_no" value="">
		   					</div>
	       				</div>
	       				<div class="text-right col-xs-4" style="margin-top:5px; overflow: hidden; text-overflow: ellipsis; white-space: nowrap;">
	       					리뷰작성일 : ${list.b_date}
						</div>
		   			</div>
		   			<div class="reply-wrap">
		   				<div class="replytext col-xs-9">
		   					${list.br_text}
		   					<input type="hidden" class="b_no" value="${list.b_no }">
		   					
	       				</div>
	       				<div class="redate col-xs-3">
						 ${list.br_date}			
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
    				<a href="/myreply.do?curPage=${pageset.firstPage-pageset.pageIndex}" aria-label="Previous">
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
   	 					<li><a href="/myreply.do?curPage=${i}">${i}</a></li>
   	 				</c:otherwise>
   	 			</c:choose>
   	 		</c:forEach>
			<c:if test="${pageset.firstPage+pageset.pageIndex <= pageset.maxPage}">
   	 			<li>
      				<a href="/myreply.do?curPage=${pageset.firstPage+pageset.pageIndex}" aria-label="Next">
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
		$('.replylist-Entity').click(function(){
			var b_no = $(this).children('.reply-wrap').find('.b_no').val();
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