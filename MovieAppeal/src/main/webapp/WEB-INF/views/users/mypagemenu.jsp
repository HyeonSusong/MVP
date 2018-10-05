<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html>
   <head>
    <title>MovieAppeal</title>
    
 	<tiles:insertAttribute name="libinsert"/>
	
  </head>
  <body>
  <!--  header -->
    <div id="header">
		<tiles:insertAttribute name="header"/>
	</div>
	
	<!-- cotnet -->	
  	<div style="padding-top:80px; ">
  		<div class="visible-xs-block dropdown">
			<button id="categry-btn" class="btn btn_linen dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
				<i class="fa" style="color:#030303">카테고리</i>
			  <span class="caret"></span>
			</button>
			
			  <ul class="dropdown-menu" role="menu" aria-labelledby="categry-btn">
					<li class="list_categoty">
						<a class="" href="/myprofile.do">
							<label class="control-label">프로필편집</label>
						</a>
					</li>
					<li class="list_categoty">
						<a class="" href="/myfavorite.do">
							<label class="control-label">나의추천영화</label>
						</a>
					</li>
					<li class="list_categoty">
						<a href="/myrating.do">
							<label class="control-label">나의별점리스트</label>							
						</a>
					</li>
					<li class="list_categoty">
						<a href="/myreview.do">
							<label class="control-label">나의게시글</label>							
						</a>
					</li>
					<li class="list_categoty">
						<a href="/myreply.do">
							<label class="control-label">나의댓글</label>							
						</a>
					</li>
					<li class="list_categoty">
						<a href="/userdelete.do">
							<label class="control-label">회원탈퇴</label>							
						</a>
					</li>
			  </ul>
		</div>
		<div class="container back">
			<div class=" left_float">
			<div class="hidden-xs list-area" >
				<tiles:insertAttribute name="mymenu"/>
			</div>
			</div>
			<div class="article">
				<tiles:insertDefinition name="${page}"/>
			</div>
		</div>
	</div>
	
	<!-- footer -->
	<div id="footer">
		<tiles:insertAttribute name="footer"/>
	</div>
</body>
</html>