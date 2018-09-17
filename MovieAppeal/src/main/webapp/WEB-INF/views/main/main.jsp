<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html lang="UTF-8">
  <head>
    <title>MovieAppeal</title>
  </head>

  <body>
  	<div>
	  <div class="main-top">
		<h1>MVP TOP120</h1>
	      <div class="main-rank">
	       <div class="main-rank-item">
	          <a href="#">
	            <img class="main-rank-num1" src="img/rank1.jpg" alt="">
	          </a>
	          </div>
	          <div class="main-rank-item">
	          <a href="#">
	            <img class="main-rank-num2" src="img/rank2.jpg" alt="">
	          </a>
	          </div>
	          <div class="main-rank-item">
	          <a href="#">
	            <img class="main-rank-num3" src="img/rank3.jpg" alt="">
	          </a>
	          </div>
	          </div>
			
			<div id="boxoffice">
			<h2>boxoffice Top10</h2>
	      	 <table>
	             <thead>
	            <tr>
	                <th>순위</th>
	                <th>제목</th>
	                <th>평점</th>
	                <th>개봉일</th>
	                <th>누적관객</th>
	            </tr>
	            </thead>
	            
	            <tbody>
	            <tr>
	                <td>1</td>
	                <td>영화제목</td>
	                <td>별 9.7</td>
	                <td>2018-09-13</td>
	                <td>77777777</td>
	            </tr>
	            <tr>
	                <td>2</td>
	                <td>인기게시판</td>
	                <td>별 9.6</td>
	                <td>2018-09-13</td>
	                <td>753351</td>
	            </tr>
	            <tr>
	                <td>2</td>
	                <td>인기게시판</td>
	                <td>별 9.6</td>
	                <td>2018-09-13</td>
	                <td>753351</td>
	            </tr>
	            <tr>
	                <td>2</td>
	                <td>인기게시판</td>
	                <td>별 9.6</td>
	                <td>2018-09-13</td>
	                <td>753351</td>
	            </tr>
	            <tr>
	                <td>2</td>
	                <td>인기게시판</td>
	                <td>별 9.6</td>
	                <td>2018-09-13</td>
	                <td>753351</td>
	            </tr>
	            <tr>
	                <td>2</td>
	                <td>인기게시판</td>
	                <td>별 9.6</td>
	                <td>2018-09-13</td>
	                <td>753351</td>
	            </tr>
	            <tr>
	                <td>2</td>
	                <td>인기게시판</td>
	                <td>별 9.6</td>
	                <td>2018-09-13</td>
	                <td>753351</td>
	            </tr>
	            <tr>
	                <td>2</td>
	                <td>인기게시판</td>
	                <td>별 9.6</td>
	                <td>2018-09-13</td>
	                <td>753351</td>
	            </tr>
	            <tbody>
	       </table>
	      	  
      	</div>
	  </div>
	  
	<hr>
      <!-- Project Three -->
      <div class="main-rank2">
        <div class="mr-row">
         <div class="mr-row-item">
          <a href="#">
            <img src="img/rank6.jpg">
          </a>
        </div>
        <div class="mr-row-item">
          <a href="#">
            <img src="img/rank7.jpg" >
          </a>
        </div>
        <div class="mr-row-item">
          <a href="#">
            <img src="img/rank5.jpg"  alt="">
          </a>
         </div>
         <div class="mr-row-item" >
          <a href="#">
            <img  src="img/rank4.jpg"   alt="">
          </a>
        </div>
        <div class="mr-row-item">
          <a href="#">
            <img  src="img/rank8.jpg"   alt="">
          </a>
        </div>
        <div class="mr-row-item">
          <a href="#">
            <img src="img/rank9.jpg"   alt="">
          </a>
        </div>
        <div class="mr-row-item">
          <a href="#">
            <img src="img/rank10.jpg"   alt="">
          </a>
        </div>
      </div>
     </div>
      <!-- /.row -->

      <hr>
      
      <div id="prelist" >
      	
      	<div id="prelist-hit">
      	 <table>
       		<tr>
            <td colspan="5"  bgcolor="black"></td>
            </tr>
             <thead>
            <tr>
                <th>rn</th>
                <th>title</th>
                <th>content</th>
                <th>writer</th>
                <th><i class="far fa-heart" style="color:red;">like</i></th>
            </tr>
            </thead>
            
            <tbody>
            <tr>
                <td>1</td>
                <td>인기게시판</td>
                <td>쫘르르륵블라블라내용...</td>
                <td>testman</td>
                <td>77</td>
            </tr>
            <tr>
                <td>1</td>
                <td>인기게시판</td>
                <td>쫘르르륵블라블라내용...</td>
                <td>testman</td>
                <td>77</td>
            </tr>
            <tr>
                <td colspan="7" width="100%" bgcolor="black"></td>
            </tr>
            <tbody>
       </table>
      	  
      	</div>
      	<div id="prelist-new">
      	<table>
      	 <tr>
            <td colspan="7" width="40%" bgcolor="black"></td></tr>
         	   <thead>
         	   <tr>
                <th>rn</th>
                <th>title</th>
                <th>content</th>
                <th>writer</th>
                <th>date<img src="img/New_icons_44.gif"></th>
                </tr>
                </thead>
             <tbody>
             <tr>
                <td>1</td>
                <td>최신게시판</td>
                <td>쫘르르륵블라블라내용...</td>
                <td>testman</td>
                <td>2018.09.12</td>
            </tr>
            <tr>
                <td>1</td>
                <td>최신게시판</td>
                <td>쫘르르륵블라블라내용...</td>
                <td>testman</td>
                <td>2018.09.12</td>
            </tr>
            <tr>
                <td colspan="7" width="100%" bgcolor="black"></td>
            </tr>
            </tbody>
       </table>
      	
      	</div>
      </div><!-- 게시판미리보기 end -->
      
      <div class="main-recommend">
      </div>

	</div>
  </body>

</html>
