<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입</title>
</head>
<body>
<script src="https://code.jquery.com/jquery-3.2.0.min.js"></script>
	<script type="text/javascript">
	
	var id_overlap_flag=false;
	var mail_overlap_flag=false;
	
	var genre_cnt = 0;
		
		$(function(){
			$('.submit_btn').click(
					function(){		
						if(check($('#idbox'))){
							alert("아이디를 입력해주세요");
							return;
						}
						if(check($('#pwdbox1'))){
							alert("비밀번호를 입력해주세요");
							return;
						}
						if(check($('#pwdbox2'))){
							alert("비밀번호를 한번더 입력해주세요");
							return;
						}
						if(check($('#mailbox1'))){
							alert("메일 아이디입력해주세요");
							return;
						}
						if(check($('#mailbox2'))){
							alert("메일 도메인을 입력해주세요");
							return;
						}
						if(pwdcheck()){
							return;
						}
						if(mailcheck()){
							alert("이메일형식을 확인해주세요");
							return;
						}/*
						if(!id_overlap_flag){
							alert("아이디 중복체크를 해주세요");
							return;
						}
						if(!mail_overlap_flag){
							alert("메일 중복체크를 해주세요");
							return;
						}*/
						
						if(genre_ck()<5){
							alert("선호하시는 장르를 5개이상 체크해주세요")
							genre_cnt=0;
							return;
						}
						$('#signupform').submit();				
					});
			});
		
		function pwdcheck(){
			var pwd1 = $('#pwdbox1').val();
			var pwd2 = $('#pwdbox2').val();	
			var pwdreg=/^(?=.*?[A-Za-z])(?=.*?[0-9])(?=.*?[\W]).{6,20}$/;
				if(!pwdreg.test(pwd1)){
					alert("비밀번호는 대소문자와 숫자, 특수문자를 포함하여 6~20자리로 입력해주세요");
					$('#pwdbox1').val('');
					$('#pwdbox1').focus();
					return true;
				}
				if(!pwdreg.test(pwd2)){
					alert("비밀번호는 대소문자와 숫자, 특수문자를 포함하여 6~20자리로 입력해주세요");
					$('#pwdbox2').val('');
					$('#pwdbox2').focus();
					return true;
				}
			if(pwd1!=pwd2){
				alert("비밀번호가 일치하지 않습니다");
				return true;
			}
			return false;
		}
		
		function check(input){
			var val = $(input).val();
			if(val == null || val==''){
				input.focus();
				return true;
			}
			else{
				return false;
			}
		}
		
		function mailcheck(){
			var idreg = /^\w+\d*$/;
			var domainreg = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/;
			var id = $('#mailbox1').val();
			var domain = $('#mailbox2').val();
			if(!idreg.test(id)){
				alert("이메일 아이디형식이 잘못되었습니다");
				return true;
			}
			if(!domainreg.test(domain)){
				alert("이메일 도메인형식이 잘못되었습니다");
				return true;	
			}
			return false;
			}
		
		function copy(){		
					$('#mailbox2').val($('#domain').val());
		}
		
		$(function() {
		    //idck 버튼을 클릭했을 때 
		    $("#idck").click(function() {		        
		        //userid 를 param.
		        var userid =  $("#idbox").val();		        
		        $.ajax({
		            async: true,
		            type : 'POST',
		            data : userid,
		            url : "idcheck.do",
		            dataType : "json",
		            contentType: "application/json; charset=UTF-8",
		            success : function(data) {
		                if (data.cnt > 0) {		                    
		                    alert("아이디가 존재합니다. 다른 아이디를 입력해주세요.");
		                    //아이디가 존제할 경우 빨깡으로 , 아니면 파랑으로 처리하는 디자인
		                    $("#idbox").addClass("has-error")
		                    $("#idbox").removeClass("has-success")
		                    $("#idbox").focus();		                    		                
		                } else {
		                    alert("사용가능한 아이디입니다.");
		                    //아이디가 존제할 경우 빨깡으로 , 아니면 파랑으로 처리하는 디자인
		                    $("#divInputId").addClass("has-success")
		                    $("#divInputId").removeClass("has-error")
		                    $("#userpwd").focus();
		                    //아이디가 중복하지 않으면  idck = 1 
		                    id_overlap_flag = true;
		                }
		            },
		            error : function(error) {		                
		                alert("error : " + error);
		            }
		        });
		    });
		});
		
		$(function() {
		    //idck 버튼을 클릭했을 때 
		    $("#mailck").click(function() {		        
		        //userid 를 param.
		        var userid =  $("#mailbox1").val();
		        var domain = $("#mailbox2").val();
		        $.ajax({
		            async: true,
		            type : 'POST',
		            data : {
		            			u_email_id : userid,
		            			u_mail_domain : domain
		            },
		            url : "mailcheck.do",
		            dataType : "json",
		            contentType: "application/json; charset=UTF-8",
		            success : function(data) {
		                if (data.cnt > 0) {		                    
		                    alert("아이디가 존재합니다. 다른 아이디를 입력해주세요.");
		                    //아이디가 존제할 경우 빨깡으로 , 아니면 파랑으로 처리하는 디자인
		                    $("#mailbox1").addClass("has-error");
		                    $("#mailbox1").removeClass("has-success");
		                    $("#mailbox1").focus();		                    		                
		                } else {
		                    alert("사용가능한 아이디입니다.");
		                    //아이디가 존제할 경우 빨깡으로 , 아니면 파랑으로 처리하는 디자인
		                    $("#mailbox1").addClass("has-success");
		                    $("#mailbox1").removeClass("has-error");
		                    $("#mailbox1").focus();
		                    //아이디가 중복하지 않으면  idck = 1 
		                    mail_overlap_flag = true;
		                }
		            },
		            error : function(error) {		                
		                alert("error : " + error);
		            }
		        });
		    });
		});
		
		function genre_ck(){
			var chkbox = $(".checkSelect");
			for(i=0;i<chkbox.length;i++) {
			    if (chkbox[i].checked == true){
			        genre_cnt++; 
			    }
			}
			return genre_cnt;
		}
		
		

	</script>
<form id="signupform">
<label>id</label>
<input id="idbox" name="u_id" type="text" maxlength="20"/>
<input id="idck" type="button"  value="아이디중복체크">
<br>
<label>비밀번호</label>
<input id="pwdbox1" name="u_pwd" type="password" maxlength="20">

<input id="pwdbox2" type="password" maxlength="20">
<br>
<label>이메일</label>
<input id="mailbox1" name="u_email_id" type="text">@
<input id="mailbox2" name="u_email_domain">
<select id="domain" onchange="copy();">
	<option value="">도메인</option>
	<option value="naver.com">naver.com</option>
	<option value="daum.net">daum.net</option>
	<option value="gmail.com">gmail.com</option>
</select>
<input id="mailbox3" style="display:none">
<input id="mailck" type="button" value="메일중복체크">
<br>
<p>장르</p>
<p><input class="checkSelect" name="u_genre" type="checkbox" value="액션">액션
<input class="checkSelect" name="u_genre" type="checkbox" value="범죄">범죄
<input class="checkSelect" name="u_genre" type="checkbox" value="드라마">드라마
<input class="checkSelect" name="u_genre" type="checkbox" value="멜로">멜로
<input class="checkSelect" name="u_genre" type="checkbox" value="코미디">코미디
<p><input class="checkSelect" name="u_genre" type="checkbox" value="공포">공포
<input class="checkSelect" name="u_genre" type="checkbox" value="스릴러">스릴러
<input class="checkSelect" name="u_genre" type="checkbox" value="SF">SF
<input class="checkSelect" name="u_genre" type="checkbox" value="판타지">판타지
<input class="checkSelect" name="u_genre" type="checkbox" value="애니메이션">애니메이션</p>


<input class="submit_btn" type="button">

</form>

</body>
</html>