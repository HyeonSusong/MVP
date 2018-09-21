
$(function(){
	$('#scroll').on('click', function(e){
		$('html, body').animate({
			scrollTop:0
		}, 800);
	});
});

	//================================= 아이디 비번 찾기 ==============================

	
	function resize(img){ //이미지의 비율에 맞춰서 잘라내기
		var divAspect = 100 / 100; 
		var imgAspect = img.height / img.width;
		
		if (imgAspect <= divAspect) {
		    $('#header .member .profile100 .nowimg').css({'width': 'auto', 'height': '100%'})
		    $('#header .nav .profile100 .nowimg').css({'width': 'auto', 'height': '100%'})
		    $('.profile200 img').css({'width': 'auto', 'height': '100%'})
		} else {
			$('#header .member .profile100 .nowimg').css({'width': '100%', 'height': 'auto'})
			$('#header .nav .profile100 .nowimg').css({'width': '100%', 'height': 'auto'})
			$('.profile200 img').css({'width': '100%', 'height': 'auto'})
		}
	}
	