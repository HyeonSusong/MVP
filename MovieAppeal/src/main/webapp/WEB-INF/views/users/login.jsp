<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<title>로그인</title>
	<script src="/js/login.js"></script>
	<link href="/css/login.css" rel="stylesheet">
	<style type="text/css">
	.spaceLeft { margin-left: 10px;	}
	.spaceRight {margin-right: 10px;}
	.space{	margin : 10px;}
	.spaceTop{ 	margin-top: 10px;}
	.btn span.fa {	opacity: 0;}
	.btn.active span.fa {opacity: 1;}
	</style>
<div class="modal fade in" id="loginModal"  role="dialog"  aria-hidden="true" >

  <div class="modal-dialog modal-sm">
    <div class="modal-content">
      <div class="modal-body">
        <div align="center">
	<div class="logincard align-middle" style="width:20rem; border-radius:20px;">
		<div class="card-title" style="margin-top:30px;">
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
			<h2 class="card-title text-center" style="color:#113366;">로그인</h2>
		</div>
		<div class="card-body">
      <form class="form-signin" method="POST" >
        <h5 class="form-signin-heading">로그인 정보를 입력하세요</h5>
        <label for="loginidbox" class="sr-only">아이디</label>
        <input type="text" id="loginidbox" class="form-control" placeholder="Your ID" required autofocus><BR>
        <label for="loginpwdbox" class="sr-only">비밀번호</label>
        <input type="password" id="loginpwdbox" class="form-control" placeholder="Password" required><br>
        <label id = "default"></label>
        <br>
        <button id="btn-login" class="btn btn-lg btn-block btn-black" type="button"><font color="#D6BA8A">로 그 인</font></button>
      </form>
      <br>
      	<a href = "/signup.do">회원가입</a>&nbsp;/&nbsp;<a href="#">아이디찾기</a>
		</div>
	</div>
      </div>
    </div>
  </div>
</div>
</div>	
