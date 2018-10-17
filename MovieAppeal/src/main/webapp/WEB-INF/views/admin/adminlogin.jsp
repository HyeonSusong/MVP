<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<title>로그인</title>
	<script src="/js/login.js"></script>
	<link href="/css/login.css" rel="stylesheet">
	<style type="text/css">
		@import url(http://fonts.googleapis.com/earlyaccess/nanumgothic.css);
		*{ font-family: 'Nanum Gothic', arial, helvetica, sans-serif; font-size:15px;}
	.spaceLeft { margin-left: 10px;	}
	.spaceRight {margin-right: 10px;}
	.space{	margin : 10px;}
	.spaceTop{ 	margin-top: 10px;}
	.btn span.fa {	opacity: 0;}
	.btn.active span.fa {opacity: 1;}
	.logincard{background-color:#fff;}
	</style>
	<div class="container" id="admin-loginarea">
		<div>
		<div class="logincard" >
		<div class="card-title" style="margin-top:30px;">
			<h2 class="card-title text-center" style="color:#113366;">Admin LOGIN</h2>
		</div>
		<div class="card-body">
      <form id="admin-login-form" class="form-signin" method="POST" action="/administrator/adminloginpost.do">
        <h5 class="form-signin-heading">로그인 정보를 입력하세요</h5>
        <label for="loginidbox"  class="sr-only">아이디</label>
        <input name="u_id" type="text" id="loginidbox" class="form-control" placeholder="Your ID" required autofocus><BR>
        <label for="loginpwdbox" class="sr-only">비밀번호</label>
        <input name="u_pwd" type="password" id="loginpwdbox" class="form-control" placeholder="Password" required><br>
        <label id = "default"></label>

        <button id="admin-btn-login" class="btn btn-lg btn-block btn-black" type="button">
        <i>로 그 인</i></button>
      </form>
		</div>
		</div>
	</div>
    </div>