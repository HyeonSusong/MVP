<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<div id="scroll"><i class="fa fa-chevron-up fa-lg"></i></div>

<div class="backcolor"></div>
<div class="header-wrap">
	
	<span class="logo">
		<a href="/main.do"><img id="logoimg" src="/img/MVP.png"></a>
	</span>
	<ul class="nav">
		<li class="list_categoty">
						<a class="" href="/administrator/movietable.do">
							<label class="control-label">영화관리</label>
						</a>
					</li>
					<li class="list_categoty">
						<a class="" href="/administrator/movieadd.do">
							<label class="control-label">영화추가</label>
						</a>
					</li>
					<li class="list_categoty">
						<a href="/administrator/usersmanage.do">
							<label class="control-label">회원관리</label>							
						</a>
					</li>
					<li class="list_categoty">
						<a href="/administrator/reviewmanage.do">
							<label class="control-label">게시글관리</label>							
						</a>
					</li>
					<li class="list_categoty">
						<a href="/administrator/replymanage.do">
							<label class="control-label">댓글관리</label>							
						</a>
					</li>
					<li class="list_categoty">
						<a href="/administrator/admincreate.do">
							<label class="control-label">관리자생성</label>							
						</a>
					</li>

			<li>
			<c:if test="${LOGIN != null}">
			<button id="memberbt" onclick="location.href='/logout.do'">
			LOGOUT
			</button>
			</c:if>
			</li>
	</ul>
	</div>
