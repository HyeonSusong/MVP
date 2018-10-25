	
	function loginpwdcheck(){
		var pwd = $('#loginpwdbox').val();
		var pwdreg=/^(?=.*?[A-Za-z])(?=.*?[0-9])(?=.*?[\W]).{6,20}$/;
			if(!pwdreg.test(pwd)){
				alert("비밀번호는 대소문자와 숫자, 특수문자를 포함하여 6~20자리로 입력해주세요");
				$('#loginpwdbox').val('');
				$('#loginpwdbox').focus();
				return true;
			}
		return false;
	}
	
	function loginidcheck(){
		var reg = /^[\w+\d*-_.*]{3,}$/;
		var mail = $(loginid).val();
		if(!reg.test(mail)){
			alert("아이디형식이 잘못되었습니다");
			return true;
		}
		return false;
		}
	
	function logincheck(input){
		var val = $(input).val();
		if(val == null || val==''){
			input.focus();
			return true;
		}
		else{
			return false;
		}
	}
	var loginid = $("#loginidbox");
	var loginpwd= $("#loginpwdbox");
		
	$(function() {
	    //idck 버튼을 클릭했을 때 
	    $("#btn-login").click(function() {		        
	        //userid 를 param.
			if(logincheck($("#loginidbox"))){
				alert("아이디를 입력해주세요");
				return;
			}
			if(loginidcheck()){
				return;
			}	
			
			if(logincheck($($("#loginpwdbox")))){
				alert("비밀번호를 입력해주세요");
				return;
			}
			if(loginpwdcheck()){
				return;
			}	
	        var u_id =  $("#loginidbox").val();
	        var u_pwd = $("#loginpwdbox").val();
	        $.ajax({
	            async: true,
	            type : 'POST',
	            data : JSON.stringify({
	            	'u_id' : u_id,
	            	'u_pwd' : u_pwd 
	            }),
	            url : "loginPost.do",
	            dataType : "json",
	            contentType: "application/json; charset=UTF-8",
	            success : function(data) {
	                if (data.cnt == 2 ) {
	                	location.reload();
	                } else if(data.cnt == 1) {
	                	$('#default').text("");
	                	$('#default').append('비밀번호가 잘못되었습니다');
	                } else if(data.cnt == -1){
	                	$('#default').text("");
	                	$('#default').append('탈퇴된 회원입니다.');
	                }
	                else if(data.cnt == -2){
	                	$('#default').text("");
	                	$('#default').append('가입인증이 완료되지 않은 <br> 회원입니다.');
	                }
	                else{
	                	$('#default').text("");
	                	$('#default').append('존재하지 않는 아이디입니다');	                	
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
	    $("#admin-btn-login").click(function() {		        
	        //userid 를 param.
			if(logincheck($("#loginidbox"))){
				alert("아이디를 입력해주세요");
				return;
			}
			if(loginidcheck()){
				return;
			}	
			
			if(logincheck($($("#loginpwdbox")))){
				alert("비밀번호를 입력해주세요");
				return;
			}
			if(loginpwdcheck()){
				return;
			}	
	        var u_id =  $("#loginidbox").val();
	        var u_pwd = $("#loginpwdbox").val();
	        $.ajax({
	            async: true,
	            type : 'POST',
	            data : JSON.stringify({
	            	'u_id' : u_id,
	            	'u_pwd' : u_pwd 
	            }),
	            url : "/administrator/admincheck.do",
	            dataType : "json",
	            contentType: "application/json; charset=UTF-8",
	            success : function(data) {
	                if (data.cnt == 2 ) {
	                	$("#admin-login-form").submit();
	                } else if(data.cnt == 1) {
	                	$('#default').text("");
	                	$('#default').append('비밀번호가 잘못되었습니다');
	                }else{
	                	$('#default').text("");
	                	$('#default').append('존재하지 않는 아이디입니다');	                	
	                }
	            },
	            error : function(error) {		                
	                alert("error : " + error);
	            }
	        });
	    });
	});
	
	
