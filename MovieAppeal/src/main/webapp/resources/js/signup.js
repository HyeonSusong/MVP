
	var id_overlap_flag=false;
	var mail_overlap_flag=false;
	
	var genre_cnt = 0;
		
		$(function(){
			$('#submit_btn').click(
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
						if(check($('#mailbox'))){
							alert("이메일을 입력해주세요");
							return;
						}
						if(pwdcheck()){
							return;
						}
						if(mailcheck()){
							alert("이메일형식을 확인해주세요");
							return;
						}						
						if(genre_ck()<5){
							alert("선호하시는 장르를 5개이상 체크해주세요");
							genre_cnt=0;
							return;
						}
						if(!id_overlap_flag){
							alert("아이디 중복체크를 해주세요");
							id_overlap_flag=false;
							return;
						}
						if(!mail_overlap_flag){
							alert("메일 중복체크를 해주세요");
							mail_overlap_flag=false;
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
			var reg = /^[\w+\d*]+@[0-9a-zA-Z]+([-_.]?[0-9a-zA-Z])\.[a-zA-Z]{2,3}$/;
			var mail = $('#mailbox').val();
			if(!reg.test(mail)){
				alert("이메일형식이 잘못되었습니다");
				return true;
			}
			return false;
			}
		

		$(function() {
		    //idck 버튼을 클릭했을 때 
		    $("#idck").click(function() {		        
		        //userid 를 param.
				if(check($('#idbox'))){
					alert("아이디를 입력해주세요");
					return;
				}
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
		                    $("#idbox").focus();		                    		                
		                } else {
		                    alert("사용가능한 아이디입니다.");
		                    //아이디가 존제할 경우 빨깡으로 , 아니면 파랑으로 처리하는 디자인
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
		        //userid 를 param
				if(check($('#mailbox'))){
					alert("메일 아이디입력해주세요");
					return;
				}
				if(mailcheck()){
					alert("이메일형식을 확인해주세요");
					return;
				}
		        var mail =  $("#mailbox").val();
		        $.ajax({
		            async: true,
		            type : 'POST',
		            data : JSON.stringify({
		            			u_mail : mail
		            }),
		            url : "mailcheck.do",
		            dataType : "json",
		            contentType: "application/json; charset=UTF-8",
		            success : function(data) {
		                if (data.cnt > 0) {		                    
		                    alert("아이디가 존재합니다. 다른 아이디를 입력해주세요.");
		                    //아이디가 존제할 경우 빨깡으로 , 아니면 파랑으로 처리하는 디자인
		                    $("#mailbox").addClass("has-error");
		                    $("#mailbox").removeClass("has-success");
		                    $("#mailbox").focus();		                    		                
		                } else {
		                    alert("사용가능한 아이디입니다.");
		                    //아이디가 존제할 경우 빨깡으로 , 아니면 파랑으로 처리하는 디자인
		                    $("#mailbox").addClass("has-success");
		                    $("#mailbox").removeClass("has-error");
		                    $("#mailbox").focus();
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
		
		function flagreset(box){
			if($(box).attr("id")=="idbox"){
				var id_overlap_flag=false;
			}
 			if($(box).attr("id")=="mailbox1" || $(box).attr("id")=="mailbox2"){
				var mail_overlap_flag=false;
			} 
		}
		
		
