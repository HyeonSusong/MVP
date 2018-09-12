<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt" %>
<%@ page session="false" %>

<!DOCTYPE html>
<html lang="en">

  <head>
 
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>MovieAppeal</title>
   
	
  </head>

  <body id="page-top">
   <div style="margin-top:100px; margin-left:100px;">
    <h1>영화 추천 리스트</h1>
    </div>
       
    <div class="rec-list" style="margin-top: 100px; margin-left: 100px">
    	<div class="rec-row">
    		<h3 class="rec-row_title">어떤 추천 목록
    		 <a  href="#" style="font-size:10pt"><span>모두 보기</span><i class="fas fa-angle-right"></i></a>
    		</h3>
    		<div class="row">
    		 <div class="slider">
    		  <div class="slider-list">
    		   <div class="slider-content">
    		   	<div class="slider-item">
    		   	 <div class="item" onclick="detailpopup">
    		   	  <div class="item-img" ><img src="img/rec/DJ_06.jpg" ></div>
    		   	  <div class="item-title">동주</div>
    		   	 </div>
    		   	</div>
    		   </div>
    		  </div>
    		 </div>
    		 &nbsp;&nbsp;&nbsp;
    		 <div class="slider">
    		  <div class="slider-list">
    		   <div class="slider-content">
    		   	<div class="slider-item">
    		   	 <div class="item"   style="position: relative;">
    		   	  <div class="item-img"><img src="img/rec/DJ_06.jpg" ></div>
    		   	  <div class="item-title"style="position: relative;top: -45px;""><span style="color:white; position:relative; left:-120px;">동주</span></div>
    		   	 </div>
    		   	</div>
    		   </div>
    		  </div>
    		 </div>
    		 &nbsp;&nbsp;&nbsp;
    		 <div class="slider">
    		  <div class="slider-list">
    		   <div class="slider-content">
    		   	<div class="slider-item">
    		   	 <div class="item">
    		   	  <div class="item-img" ><img src="img/rec/DJ_06.jpg" ></div>
    		   	  <div class="item-title">동주</div>
    		   	 </div>
    		   	</div>
    		   </div>
    		  </div>
    		 </div>
    		</div>
    	  </div>
    		
    		<br><br>
    	<div class="rec-row">
    		<h3 class="rec-row_title">신기한 추천 목록
    		 <a  href="#" style="font-size:10pt"><span>모두 보기</span><i class="fas fa-angle-right"></i></a>
    		</h3>
    		<div class="row">
    		 <div class="slider">
    		  <div class="slider-list">
    		   <div class="slider-content">
    		   	<div class="slider-item">
    		   	 <div class="item">
    		   	  <div class="item-img" ><img src="img/rec/RV_06.jpg" ></div>
    		   	  <div class="item-title">레버넌트 죽음에서</div>
    		   	 </div>
    		   	</div>
    		   </div>
    		  </div>
    		 </div>
    		  &nbsp;&nbsp;&nbsp;
    		  <div class="slider">
    		  <div class="slider-list">
    		   <div class="slider-content">
    		   	<div class="slider-item">
    		   	 <div class="item">
    		   	  <div class="item-img" ><img src="img/rec/RV_06.jpg" ></div>
    		   	  <div class="item-title">레버넌트 죽음에서</div>
    		   	 </div>
    		   	</div>
    		   </div>
    		  </div>
    		 </div>
    		  &nbsp;&nbsp;&nbsp;
    		  <div class="slider">
    		  <div class="slider-list">
    		   <div class="slider-content">
    		   	<div class="slider-item">
    		   	 <div class="item">
    		   	  <div class="item-img" ><img src="img/rec/RV_06.jpg" ></div>
    		   	  <div class="item-title">레버넌트 죽음에서</div>
    		   	 </div>
    		   	</div>
    		   </div>
    		  </div>
    		 </div>
    		  &nbsp;&nbsp;&nbsp;
    		</div>
    		<br><br>
    		
    		<div class="rec-row">
    		<h3 class="rec-row_title">저런 추천 목록
    		 <a  href="#" style="font-size:10pt"><span>모두 보기</span><span class="css-arrow:after">></span></a>
    		</h3>
    		<div class="row">
    		 <div class="slider">
    		  <div class="slider-list">
    		   <div class="slider-content">
    		   	<div class="slider-item">
    		   	 <div class="item">
    		   	  <div class="item-img" ><img src="img/rec/DP_01.jpg" ></div>
    		   	  <div class="item-title">데드풀</div>
    		   	 </div>
    		   	</div>
    		   </div>
    		  </div>
    		 </div>
    		 &nbsp;&nbsp;&nbsp;
    		 <div class="slider">
    		  <div class="slider-list">
    		   <div class="slider-content">
    		   	<div class="slider-item">
    		   	 <div class="item">
    		   	  <div class="item-img" ><img src="img/rec/DP_01.jpg" ></div>
    		   	  <div class="item-title">데드풀</div>
    		   	 </div>
    		   	</div>
    		   </div>
    		  </div>
    		 </div>
    		 &nbsp;&nbsp;&nbsp;
    		 <div class="slider">
    		  <div class="slider-list">
    		   <div class="slider-content">
    		   	<div class="slider-item">
    		   	 <div class="item">
    		   	  <div class="item-img" ><img src="img/rec/DP_01.jpg" ></div>
    		   	  <div class="item-title">데드풀</div>
    		   	 </div>
    		   	</div>
    		   </div>
    		  </div>
    		 </div>
    		 &nbsp;&nbsp;&nbsp;
    		</div>
    	   </div>	
    		
    		<br><br>
    		
    		<div class="rec-row">
    		<h3 class="rec-row_title">이런 추천 목록
    		 <a  href="#" style="font-size:10pt"><span>모두 보기</span><span class="css-arrow:after">></span></a>
    		</h3>
    		<div class="row">
    		 <div class="slider">
    		  <div class="slider-list">
    		   <div class="slider-content">
    		   	<div class="slider-item">
    		   	 <div class="item">
    		   	  <div class="item-img" ><img src="img/rec/PD_01.jpg" ></div>
    		   	  <div class="item-title">겁쟁이 페달</div>
    		   	 </div>
    		   	</div>
    		   </div>
    		  </div>
    		 </div>
    		 &nbsp;&nbsp;&nbsp;
    		 <div class="slider">
    		  <div class="slider-list">
    		   <div class="slider-content">
    		   	<div class="slider-item">
    		   	 <div class="item">
    		   	  <div class="item-img" ><img src="img/rec/PD_01.jpg" ></div>
    		   	  <div class="item-title">겁쟁이 페달</div>
    		   	 </div>
    		   	</div>
    		   </div>
    		  </div>
    		 </div>
    		  &nbsp;&nbsp;&nbsp;
    		 <div class="slider">
    		  <div class="slider-list">
    		   <div class="slider-content">
    		   	<div class="slider-item">
    		   	 <div class="item">
    		   	  <div class="item-img" ><img src="img/rec/PD_01.jpg" ></div>
    		   	  <div class="item-title">겁쟁이 페달</div>
    		   	 </div>
    		   	</div>
    		   </div>
    		  </div>
    		 </div>
    		 
    		</div>
    	   </div>
    		<br><br>
			</div>
	</div> 
	<div class='detailpopup mfp-hide'>
	<div class="d_hidden"></div>
	<button type='button' class='mfp-close'>×</button>
	<div class="d_top">
		<div class="d_POSTER"> <img src=""> </div>
		<div class="d_top_right">
			<div class="d_title">
				<div class="d_AGE"><img src="./resources/img/movie/movie12.png"></div>
				<div class="d_NAME_K">번개맨</div>
				<div class="d_NAME_E">Bungaeman</div>
			</div>
			<div class="d_rev">
				<div class="popupstar"><div class="star-empty"><span class="star-wrap"  style="width:118;"><span class="star"></span></span></div>
			</div>
		</div>
	</div>
	
    <div id="jssor_1" style="position: relative; margin: 80px auto 50px; top: 0px; left: 0px; width: 920px; height: 580px; overflow: hidden; visibility: hidden;">
        <!-- Loading Screen -->
        <div data-u="loading" style="position: absolute; top: 0px; left: 0px;">
            <div style="filter: alpha(opacity=70); opacity: 0.7; position: absolute; display: block; top: 0px; left: 0px; width: 100%; height: 100%;"></div>
            <div style="position:absolute;display:block;background:url('./img/loading.gif') no-repeat center center;top:0px;left:0px;width:100%;height:100%;"></div>
        </div>
        <div data-u="slides" style="cursor: default; position: relative; top: 0px; left: 0px; width: 920px; height: 580px; overflow: hidden;">
            <div data-p="112.50" style="display: none;">
                <img data-u="image" src="./resources/img/movie/BG_01.jpg" />
            </div>
            <div data-p="112.50" style="display: none;">
                <img data-u="image" src="./resources/img/movie/BG_02.jpg" />
            </div>
            <div data-p="112.50" style="display: none;">
                <img data-u="image" src="./resources/img/movie/BG_03.jpg" />
            </div>
            <div data-p="112.50" style="display: none;">
                <img data-u="image" src="./resources/img/movie/BG_04.jpg" />
            </div>
            <div data-p="112.50" style="display: none;">
                <img data-u="image" src="./resources/img/movie/BG_05.jpg" />
            </div>
            <div data-p="112.50" style="display: none;">
                <img data-u="image" src="./resources/img/movie/BG_06.jpg" />
            </div>
            <div data-p="112.50" style="display: none;">
                <img data-u="image" src="./resources/img/movie/BG_07.jpg" />
            </div>
        </div>
        <!-- Thumbnail Navigator -->
        <div u="thumbnavigator" class="jssort03" style="position:absolute;left:0px;top:-80px;width:920px;height:80px;" data-autocenter="1">
            <div style="position: absolute; top: 0; left: 0; width: 100%; height:100%; background-color: #D6BA8A000; filter:alpha(opacity=30.0); opacity:0.3;"></div>
            <!-- Thumbnail Item Skin Begin -->
            <div u="slides" style="cursor: default; width:920px; height:80px;" data-hello="asdf">
                <div u="prototype" class="p" style="width:130px; height:80px;">
                    <div class="w" style="width:130px; height:80px;">
                        <div u="thumbnailtemplate" class="t" style="width:130px; height:80px;"></div>
                    </div>
                    <div class="c" style="width:130px; height:80px;"></div>
                </div>
            </div>
            <!-- Thumbnail Item Skin End -->
        </div>
        <!-- Arrow Navigator -->
        <span data-u="arrowleft" class="jssora02l" style="top:200px;left:8px;width:55px;height:55px;" data-autocenter="2"></span>
        <span data-u="arrowright" class="jssora02r" style="top:200px;right:8px;width:55px;height:55px;" data-autocenter="2"></span>
    </div>
    <div class="youtube_wrap">
    <iframe width="920" height="518" src="https://www.youtube.com/embed/9FS0YFIJU7Q?rel=0&amp;controls=0&amp;showinfo=0" frameborder="0" allowfullscreen></iframe>
	</div>
 </div>
</div> 
<!-- rec-listend -->
	<br><p>
	<!-- Bootstrap core JavaScript -->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  </body>
</html>
