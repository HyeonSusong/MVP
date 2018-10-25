<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt" %>

		<div class="col-md-12" style=" border-radius:20px;">
			<div class="page-header space align-middle">
			<br>
        	 	<h1 class="spaceLeft text-left spaceTop">회원 탈퇴</h1>
       		</div>
       		
			<form class=""  id="userdeleteform" method="post" action="/userdeletepost.do">
       			<!-- id -->
        			<div class="text-center form-group" >
        			<br>
						<font color="#C71B1B"><strong>${LOGIN.u_id}님</strong></font>의 계정정보를 삭제합니다.
						<br>확인을 위해 <strong>비밀번호</strong>를 입력해주세요
						<br>
						<br>
					</div>
					<input type="hidden" name="u_id" value="${LOGIN.u_id}" >
					<div class="form-group space2x">
        				<label class="col-sm-4 control-label" for="#pwdbox">비밀번호 입력</label>
					<div class="col-sm-6">	
						<input class="form-control spaceBottom" placeholder="비밀번호" id="pwdbox" name="u_pwd" type="password" maxlength="20">
					</div>

					</div>
			</form>		
		<div>
			<div class="form-group space2x" align="center">
	
		<button class="btn btn_linen btn-lg" id="submit_btn" type="button" >
			<i class="fa fa-check spaceLeft">회원탈퇴</i>
		</button>
		<button class="btn btn-default btn-lg" style="width: 120px; text-align: left; font-weight: bold;" id="cancel_btn" type="button" onclick="location.href='/main.do'" >
			 <i class="fa fa-times spaceLeft">취소</i>
		</button> 
		</div>
		</div>
			</div>
	
	
	<script>
		$(function (){
			$('#submit_btn').click(function(){
				if (confirm("정말 삭제하시겠습니까??") == true){
					
					if(logincheck($('#pwdbox'))){
						alert("비밀번호를 입력해주세요");
						return;
					}
					if(check($('#pwdbox'))){
						return;
					}
					$('#userdeleteform').submit();
				}
			});
		});
		$(function(){
			$('#cancel_btn').click(function(){
				

				location.href="/mypage.do";
			});
		});
		function check(input){
			var pwd = input.val();
			var pwdreg=/^(?=.*?[A-Za-z])(?=.*?[0-9])(?=.*?[\W]).{6,20}$/;
			if(!pwdreg.test(pwd)){
				alert("비밀번호는 대소문자와 숫자, 특수문자를 포함하여 6~20자리로 입력해주세요");
				input.val('');
				input.focus();
				return true;
			}
		return false;
		}
	</script>