<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html lang="en">

  <head>
	
	<script> 
$(document).ready(function(){
    $("#flip").click(function(){
        $("#panel").slideToggle("slow");
    });
});
$(function(){
	$('.listrow').click(function(){
		var m_no = $(this).children(".m_no").val();
		var url = "/moviedetail.do?m_no="+m_no;
		alert(m_no);
		alert(url);
		window.open(url);
	});
	
});
</script>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>MVP TOP</title>
   

  </head>
  
 <body id="page-top">
   <div class="panel panel-body rank-wrap">
    <h1 style=""><strong><em>MVP MOVIE RANK</em> &nbsp;&nbsp;&nbsp;</strong>
	    <div class="btn-group rank-btn-wrap">
	    <button type="button" class="btn btn-link btn-lg" onclick="location.href='/rank.do?query=m_rating'"><strong style="color:#D6BA8A;">평점순</strong></button>
	    <button type="button" class="btn btn-link btn-lg" onclick="location.href='/rank.do?query=m_likes'"><strong style="color:#D6BA8A;">추천순</strong></button>
   		</div>
   	</h1>
   	<hr>
    <div class="list-wrap">
    <ul class="list-group">
    	<li class="list-group-item text-left" id="headrow">
    		<div class="headrow row">
    			<div class="list-img cell text-right" ><strong>영화</strong></div>
    			<div class="list-title cell"></div>
    			<div class="list-rating cell"><strong>평점</strong></div>
    			<div class="list-like cell" style="width: 120px;"><strong>추천수</strong></div>
    		</div>    	
    	</li>
    	<c:forEach var="list" items="${list}">
 	    	<li class="list-group-item text-left" id="listrow">
    			<div class="listrow row">
    			<input class="m_no" type="hidden" value="${list.m_no}">
    				<div class="list-img cell"><img src="${list.m_imgurl}" width="105px" height="148px"></div>
    				<div class="list-title cell"><strong style="color:#D6BA8A;"><em>${list.rn}위</em></strong><br>
    					<strong>${list.m_title}</strong></div>
    				<div class="list-content cell" >${list.m_plot}</div>
    				<div class="list-rating cell">
    				<input class="rating" type="number" min=0 max=10 step=1 data-size="xs" data-show-clear="false" data-show-caption="false" value="${list.m_rating}" readonly>
    				 &nbsp;&nbsp;&nbsp;<strong style="color:#D6BA8A;"><em>${list.m_rating}점</em></strong></div>
    				<div class="list-like cell"> <span class="glyphicon glyphicon-heart" style="color: red;"></span> ${list.m_likes}</div>
    				<input type="hidden" value="${list.m_no}">
    			</div>    	
   		 	</li>
	     </c:forEach> 
    </ul>
   </div>
</div>

  </body>

</html>
