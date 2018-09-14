<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<title>로그인</title>
	<script src="https://code.jquery.com/jquery-3.2.0.min.js"></script>
    <link href="/css/font-awesome.min.css" rel="stylesheet">
	<script src="js/login.js"></script>
	<style type="text/css">
		@import url(http://fonts.googleapis.com/earlyaccess/nanumgothic.css);
		*{ font-family: 'Nanum Gothic', arial, helvetica, sans-serif; font-size:15px;}
	.spaceLeft { margin-left: 10px;	}
	.spaceRight {margin-right: 10px;}
	.space{	margin : 10px;}
	.spaceTop{ 	margin-top: 10px;}
	.btn span.fa {	opacity: 0;}
	.btn.active span.fa {opacity: 1;}
	</style>
</head>
  <body cellpadding="0" cellspacing="0" marginleft="0" margintop="0" width="100%" height="100%" align="center">

	<div class="card align-middle" style="width:20rem; border-radius:20px;">
		<div class="card-title" style="margin-top:30px;">
			<h2 class="card-title text-center" style="color:#113366;">로그인</h2>
		</div>
		<div class="card-body">
      <form class="form-signin" method="POST" onSubmit="logincall();return false">
        <h5 class="form-signin-heading">로그인 정보를 입력하세요</h5>
        <label for="idbox" class="sr-only">아이디</label>
        <input type="text" id="idbox" class="form-control" placeholder="Your ID" required autofocus><BR>
        <label for="pwdbox" class="sr-only">비밀번호</label>
        <input type="password" id="pwdbox" class="form-control" placeholder="Password" required><br>
        <div class="checkbox">
          <label>
            <input type="checkbox" value="remember-me"> 기억하기
          </label>
        </div>
        <button id="btn-Yes" class="btn btn-lg btn-primary btn-block" type="submit">로 그 인</button>
      </form>
      
		</div>
	</div>

	



</body>
</html>