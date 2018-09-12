<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html lang="en">

  <head>
	
	<script> 
$(document).ready(function(){
    $("#flip").click(function(){
        $("#panel").slideToggle("slow");
    });
});
</script>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
		<style>
	#ranklist{
	margin-left: 5rem;
}
#ranklist {
    font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
    border-collapse: collapse;
    width: 40%;
}

#ranklist td, #ranklist th {
    border: 1px solid #ddd;
    padding: 8px;
}

#ranklist tr:nth-child(even){background-color: #f2f2f2;}

#ranklist tr:hover {
background-color: #ddd;
 -webkit-transform:scale(1.2);
    -moz-transform:scale(1.2);
    -ms-transform:scale(1.2);   
    -o-transform:scale(1.2);
    transform:scale(1.2);

}
#ranklist th {
    padding-top: 12px;
    padding-bottom: 12px;
    text-align: left;
    background-color:#6c757d;
    color: white;
}

#panel {
    padding: 50px;
    display: none;
}
	</style>
    <title>MVP TOP</title>
   

  </head>

  <body id="page-top">
    <div id="top-page">
    <h1 style="margin-left:10px;">영화 랭킹 &nbsp;&nbsp;&nbsp; 
	    <div class="btn-group">
	    <button type="button" class="btn btn-primary">조회순</button>
	    <button type="button" class="btn btn-primary">평점순</button>
    </div></h1>
    </div>
    
    <table id="ranklist">
    	<thead>
	    <tr id="thead">
	      <th>        </th>
	      <th>순위.제목</th>
	      <th align="center">내용</th>
	      <th colspan="2">평점 </th>
	      <th>좋아요</th>
	    </tr>
	    </thead>
	    
	    <tbody id="flip">
	     <tr>
	      <td ><img src="img/rank1.jpg" width="75"height="114"></td>
	      <td>1.서치</td>
	      <td>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ut</td>
	      <td ><a href="#"><img src="img/star.PNG"></a></td>
	      <td>9.7</td>
	      <td><a href="#"><img src="img/heart.PNG"></a></td>
	      </tr>
	      
	      
	     <tr>
	      <td ><img src="img/rank2.jpg" width="75"height="114"></td>
	      <td>2.너의 결혼식</td>
	      <td>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ut</td>
	      <td ><a href="#"><img src="img/star.PNG"></a></td>
	      <td>9.6</td>
	      <td><a href="#"><img src="img/heart.PNG"></a></td>
	      </tr>
	      
	      
	     <tr>
	      <td ><img src="img/rank3.jpg" width="75"height="114"></td>
	      <td>3.상류사회</td>
	      <td>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ut</td>
	      <td ><a href="#"><img src="img/star.PNG"></a></td>
	      <td>9.33</td>
	      <td><a href="#"><img src="img/heart.PNG"></a></td>
	      </tr>
	      
	      
	     <tr>
	      <td ><img src="img/rank4.jpg" width="75"height="114"></td>
	      <td>4.신과함께</td>
	      <td>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ut</td>
	      <td ><a href="#"><img src="img/star.PNG"></a></td>
	      <td>9.2</td>
	      <td><a href="#"><img src="img/heart.PNG"></a></td>
	      </tr>
	      
	      
	     <tr>
	      <td ><img src="img/rank5.jpg" width="75"height="114"></td>
	      <td>5.맘마미아2</td>
	      <td>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ut</td>
	      <td ><a href="#"><img src="img/star.PNG"></a></td>
	      <td><9.12</td>
	      <td><a href="#"><img src="img/heart.PNG"></a></td>
	      </tr>
	      
	      
	     <tr>
	      <td ><img src="img/rank6.jpg" width="75"height="114"></td>
	      <td>6.공작</td>
	      <td>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ut</td>
	      <td ><a href="#"><img src="img/star.PNG"></a></td>
	      <td>8.7</td>
	      <td><a href="#"><img src="img/heart.PNG"></a></td>
	      </tr>
	      
	      
	     <tr>
	      <td ><img src="img/rank7.jpg" width="75"height="114"></td>
	      <td>7.목격자</td>
	      <td>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ut</td>
	      <td ><a href="#"><img src="img/star.PNG"></a></td>
	      <td>8.65</td>
	      <td><a href="#"><img src="img/heart.PNG"></a></td>
	      </tr>
	      
	      
	     <tr>
	      <td ><img src="img/rank8.jpg" width="75"height="114"></td>
	      <td>8.미션 임파서블</td>
	      <td>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ut</td>
	      <td ><a href="#"><img src="img/star.PNG"></a></td>
	      <td>8.6</td>
	      <td><a href="#"><img src="img/heart.PNG"></a></td>
	      </tr>
	      
	      
	     <tr>
	      <td ><img src="img/rank9.jpg" width="75"height="114"></td>
	      <td>9.휘트니</td>
	      <td>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ut</td>
	      <td ><a href="#"><img src="img/star.PNG"></a></td>
	      <td>8.56</td>
	      <td><a href="#"><img src="img/heart.PNG"></a></td>
	      </tr>
	      
	      
	     <tr>
	      <td ><img src="img/rank10.jpg" width="75"height="114"></td>
	      <td>10.카메라를 멈추면 안 돼!</td>
	      <td>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ut</td>
	      <td ><a href="#"><img src="img/star.PNG"></a></td>
	      <td>7.9</td>
	      <td><a href="#"><img src="img/heart.PNG"></a></td>
	      </tr>
	      </tbody>	
	</table>
   
 <p><br>
     
      
      <hr>
      
      
      <!-- /.row -->
    
    
    


    <!-- About Section -->
    <section class="bg-primary text-white mb-0" id="about">
      <div class="container">
        <h2 class="text-center text-uppercase text-white">About</h2>
        <hr class="star-light mb-5">
        <div class="row">
          <div class="col-lg-4 ml-auto">
            <p class="lead">Freelancer is a free bootstrap theme created by Start Bootstrap. The download includes the complete source files including HTML, CSS, and JavaScript as well as optional LESS stylesheets for easy customization.</p>
          </div>
          <div class="col-lg-4 mr-auto">
            <p class="lead">Whether you're a student looking to showcase your work, a professional looking to attract clients, or a graphic artist looking to share your projects, this template is the perfect starting point!</p>
          </div>
        </div>
        <div class="text-center mt-4">
          <a class="btn btn-xl btn-outline-light" href="#">
            <i class="fa fa-download mr-2"></i>
            Download Now!
          </a>
        </div>
      </div>
    </section>

  </body>

</html>
