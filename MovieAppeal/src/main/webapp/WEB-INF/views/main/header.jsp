<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<div id="scroll"><i class="fa fa-chevron-up fa-lg"></i></div>

<div class="backcolor"></div>
<div class="header-wrap">
	
	<span class="logo">
		<a href="main.do"><img id="logoimg" src="img/MVP.png"></a>
	</span>
	<ul class="nav">
		<li><a href="/rank.do"><i class="fas fa-flag" ></i> RANK</a></li>
		<li><a href="/recommend.do"><i class="glyphicon glyphicon-film"></i> MOVIE</a></li>
		<li><a href="/review.do"><i class="fas fa-pen"> REVIEW</i></a></li>
		<c:choose> 
		<c:when test="${LOGIN==null}">
			<li><button id="loginbt" data-toggle="modal" data-target="#loginModal" data-backdrop="false" >LOGIN</button></li>
		</c:when>
		<c:otherwise>
			<li><button id="memberbt" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true" >
			${LOGIN.u_id}
			  <span class="caret"></span>
			</button>
			 <ul class="dropdown-menu" role="menu" aria-labelledby="memberbt">
					<li class="list_categoty">
						<a class="" href="/mypage.do">
							<label class="control-label">MYPAGE</label>
						</a>
					</li>
					<li class="list_categoty">
						<a class="" href="/logout.do">
							<label class="control-label">LOGOUT</label>
						</a>
					</li>
			</ul>
			</li>
		</c:otherwise>
	</c:choose>
	</ul>
	</div>

<c:import url="/login.do"></c:import>

