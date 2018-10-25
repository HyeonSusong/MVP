<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

		<div class="col-md-12 text-center" style=" border-radius:20px;">
			<div class="page-header space align-middle">
			<br>
        	 	<h1 class="spaceLeft text-left spaceTop">선호장르변경</h1>
       		</div>

			<form class="form-horizontal" id="profileform" method="post" action="useredit.do">
       			<!-- id -->
				<div class="form-group space2x">
					<div class="left-float text-right col-sm-4">
				    	<h4><strong><font color="#D6BA8A">아이디</font></strong></h4>
        			</div>
       				<div class="col-sm-6 text-left spaceTop">
						<strong>${LOGIN.u_id}</strong>			
					</div>
						
				</div>
				
				<div class="form-group space2x">
					<div class="left-float text-right col-sm-4">
				    	<h4><strong><font color="#D6BA8A">이메일</font></strong></h4>
					</div>
      				<div class="col-sm-6 text-left spaceTop">
					<strong>${LOGIN.u_mail}</strong>
					</div>		
				</div>
			<p>


				<div style="padding: 20px;">
				<input id="hiddengenre"type="hidden" value="${LOGIN.u_mygenre}">
				
							<small class="space">* 선호하시는 장르를 5개이상 선택해주세요</small>
				<div class="checkbox">
				<div class="form-group space">
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
					<div class="form-group space">
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
		</form>
	</div>
	<div class="space2x" align="center">
		<button class="btn btn_linen btn-lg" id="submit_btn" type="button" >
			<i class="fa fa-check spaceLeft">정보수정</i>
		</button>
	</div>
	
<script>
$(document).ready(function(){
	var genre = $("#hiddengenre").val();
	for(var i = 0 ; i<$(".checkSelect").length ;i++ ){
		var v = $(".checkbox").find(".checkSelect").eq(i).val();
		if (genre.match(v) == v){
			$(".checkbox").find(".checkSelect").eq(i).prop('checked', true);
		}
	}
});

$(function(){
	$('#submit_btn').click(function(){
		if(genre_ck()<5){
			alert("선호하시는 장르를 5개이상 체크해주세요");
			genre_cnt=0;
			return;
		}
		$('#profileform').submit();
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
	