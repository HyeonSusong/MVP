<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<title>회원 가입</title>
	<script src="https://code.jquery.com/jquery-3.2.0.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="/css/font-awesome.min.css" rel="stylesheet">
	<script src="js/signup.js"></script>
	<style type="text/css">
		@import url(http://fonts.googleapis.com/earlyaccess/nanumgothic.css);
		*{ font-family: 'Nanum Gothic', arial, helvetica, sans-serif; font-size:15px;}
	.spaceLeft { margin-left: 10px;	}
	.spaceRight {margin-right: 10px;}
	.space{	margin : 10px;}
	.spaceTop{ 	margin-top: 10px;}
	.btn span.fa {	opacity: 0;}
	.btn.active span.fa {opacity: 1;}
	    .card {
        margin: 0 auto; /* Added */
        float: none; /* Added */
        margin-bottom: 10px; /* Added */
        box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
		align: center;
	}
	</style>
</head>
<body>
	<div class="container">
		<div class="col-md-offset-12 card align-middle" style=" border-radius:20px;">
			<div class="page-header space align-middle">
			<br>
        	 	<h1 class="spaceLeft spaceTop">회원가입</h1>
       		</div>
			<form class="form-horizontal" id="signupform" method="post" action="usercreate.do">
       			<!-- id -->
				<div class="form-group space">
          			<label class="col-sm-3 control-label" for="idbox">아이디</label>
        				<div class="col-sm-6">
							<input class="form-control" placeholder="아이디" id="idbox" name="u_id" onchange="flagreset(this);" type="text" maxlength="20"/>
							<span class="input-group-btn spaceLeft">
								<button class="btn btn-default spaceTop" id="idck" type="button" >
								<i class=fa> 아이디중복체크</i>
								</button>
							</span>
						</div>
						
				</div>
				<div class="form-group space">
          			<label class="col-sm-3 control-label" for="pwdbox1">비밀번호</label>
        			<div class="col-sm-6">
						<input class="form-control" placeholder="비밀번호" id="pwdbox1" name="u_pwd" type="password" maxlength="20">
					</div>
				</div>
				<div class="form-group space">
          			<label class="col-sm-3 control-label" for="pwdbox2">비밀번호 재입력</label>
        				<div class="col-sm-6">
							<input class="form-control" placeholder="비밀번호 재입력" id="pwdbox2" type="password" maxlength="20">
						</div>
				</div>
				<div class="form-group space">
          			<label class="col-sm-3 control-label" for="mailbox">이메일</label>
        				<div class="col-sm-6">
							<input class="form-control" placeholder="이메일" id="mailbox" onchange="flagreset(this);" name="u_mail_id" type="text">
        					<span class="input-group-btn spaceTop spaceLeft">
								<button class="btn btn-default spaceTop" id="mailck" type="button" >
									<i class=fa> 메일중복체크</i>
								</button>								
							</span>
						</div>		
				</div>
			<p>


				<div class="col-sm-offset-3" >
				<div class="form-group space">
							<small class="space">* 선호하시는 장르를 5개이상 선택해주세요</small>
				<div class="checkbox">
					<p>
					<label>
					<input class="checkSelect" name="u_mygenre" type="checkbox" value="액션">액션
					</label>
					<label>
					<input class="checkSelect" name="u_mygenre" type="checkbox" value="범죄">범죄
					</label>
					<label>
					<input class="checkSelect" name="u_mygenre" type="checkbox" value="드라마">드라마
					</label>
					<label>
					<input class="checkSelect" name="u_mygenre" type="checkbox" value="멜로">멜로
					</label>
					<label>
					<input class="checkSelect" name="u_mygenre" type="checkbox" value="코미디">코미디
					</label>
				</div>
			</div>
			<div class="form-group space">
				<div class="checkvox">
					<label>
					<input class="checkSelect" name="u_mygenre" type="checkbox" value="공포">공포
					</label>
					<label>
					<input class="checkSelect" name="u_mygenre" type="checkbox" value="스릴러">스릴러
					</label>
					<label>
					<input class="checkSelect" name="u_mygenre" type="checkbox" value="SF">SF
					</label>
					<label>
					<input class="checkSelect" name="u_mygenre" type="checkbox" value="판타지">판타지
					</label>
					<label>
					<input class="checkSelect" name="u_mygenre" type="checkbox" value="애니메이션">애니메이션
					</label>				
				</div>
				</div>
			</div>
			
			<div class="col-sm-6 space">
				<div align="center">
					<button class="btn btn-primary btn-lg" id="submit_btn" type="button" >
					<i class="fa fa-check spaceLeft">회원가입</i>
					</button>
					<button class="btn btn-danger btn-lg" id="cancel_btn" type="button" >
					 <i class="fa fa-times spaceLeft">가입취소</i>
					</button> 
				</div>
			</div>
		</form>
	</div>
	</div>
</body>
</html>