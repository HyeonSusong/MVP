<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

		<div class="col-md-12" style=" border-radius:20px;">
			<div class="page-header space align-middle">
			<br>
        	 	<h1 class="spaceLeft spaceTop">회원탈퇴</h1>
       		</div>
       		
			<form class="form-horizontal" id="signupform" method="post" action="deletepost.do">
       			<!-- id -->
				<div class="form-group space">
        				<div class="col-sm-6">
							<input class="form-control" placeholder="아이디" id="idbox" name="u_id" onchange="flagreset(this);" type="text" maxlength="20" readonly/>
							<label class="col-sm-3 control-label" for="idbox" >님의 계정정보를 삭제합니다</label>
						</div>						
				</div>
				<div class="form-group space">
          			<label class="col-sm-3 control-label" for="pwdbox1">확인을 위해 비밀번호를 입력해주세요</label>
        			<div class="col-sm-6">
						<input class="form-control" placeholder="비밀번호" id="pwdbox1" name="u_pwd" type="password" maxlength="20">
					</div>
				</div>
			</form>
			</div>
			
	<div class="space2x" align="center">
		<button class="btn btn-primary btn-lg" id="submit_btn" type="button" >
			<i class="fa fa-check spaceLeft">회원탈퇴</i>
		</button>
		<button class="btn btn-danger btn-lg" id="cancel_btn" type="button" onclick="location.href='/main.do'" >
			 <i class="fa fa-times spaceLeft">취소</i>
		</button> 
	</div>