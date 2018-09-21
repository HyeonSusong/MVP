<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt" %>

<div class="col-md-12 container">
	<div class="table-responsive">
		<table class="table table-striped table-hover">
				<tr class="info"> 
					<td colspan="3" align="center"><label class="fa">영 화 제 목</label>
					</td>
				</tr>
			<c:forEach var="i" step="1" end="10" begin="1">
				<tr class="dager">
					<td>
					<td>
						<img class="mystar-rating-poster" src="/img/rank${i}.jpg">
					</td>
					<td>
						<label class="fa"> 영화제목</label>
					</td>
					<td class="inline-block">
						<label></label>
						<input  class="poster-star rating" type="number" min=0 max=10 step=1 data-size="md" data-show-clear="false" data-show-caption="false">
					</td>
				</tr>
			</c:forEach>
		</table>
	
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