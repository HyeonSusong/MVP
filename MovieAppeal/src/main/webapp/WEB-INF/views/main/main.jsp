<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html lang="UTF-8">

  <head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
	
    <title>MovieAppeal</title>

    
  </head>

  <body id="page-top">
    <div style="margin-top:100px; margin-left:100px;">
    <h1>RANKING TOP 10</h1>
    </div>

      <div class="row text-center text-lg-left">

		<img src="img/g.png" width="50" height="70"/>
        <div class="col-lg-3 col-md-4 col-xs-4">
          <a href="#" class="d-block mb-4 h-50">
            <img class="img-fluid img-thumbnail" src="img/rank1.jpg" width="300" height="700" alt="">
          </a>
        </div>
        <img src="img/u.png" width="50" height="70"/>
        <div class="col-lg-3 col-md-4 col-xs-4">
          <a href="#" class="d-block mb-4 h-50">
            <img class="img-fluid img-thumbnail" src="img/rank2.jpg" width="300" height="700" alt="">
          </a>
        </div>
        <img src="img/d.png" width="50" height="70"/>
        <div class="col-lg-3 col-md-4 col-xs-4">
          <a href="#" class="d-block mb-4 h-50">
            <img class="img-fluid img-thumbnail" src="img/rank3.jpg" width="300" height="700" alt="">
          </a>
        </div>
        </div>
        


      <!-- Project Three -->
      <div class="row" style="margin-left:15px">
        <div class="col-md-3">
          <a href="#">
            <img class="img-fluid rounded mb-3 mb-md-0" src="img/rank6.jpg" width="150"height="50"  alt="">
          </a>
        </div>
        <div class="col-md-3">
          <a href="#">
            <img class="img-fluid rounded mb-3 mb-md-0" src="img/rank7.jpg" width="150"height="50"  alt="">
          </a>
        </div>
        <div class="col-md-3">
          <a href="#">
            <img class="img-fluid rounded mb-3 mb-md-0" src="img/rank5.jpg" width="150"height="50"  alt="">
          </a>
         </div>
         <div class="col-md-3" >
          <a href="#">
            <img class="img-fluid rounded mb-3 mb-md-0" src="img/rank4.jpg" width="150"height="50"  alt="">
          </a>
        </div>
      </div>
      <!-- /.row -->

      <hr>

      <!-- Project Four -->
      <div class="row" style="margin-left:35px">

        <div class="col-md-3">
          <a href="#">
            <img class="img-fluid rounded mb-3 mb-md-0" src="img/rank7.jpg" width="150"height="50"  alt="">
          </a>
        </div>
      </div>
      
      <hr>
      
      <!-- Project Four -->
      <div class="row" style="margin-left:35px">

        <div class="col-md-3">
          <a href="#">
            <img class="img-fluid rounded mb-3 mb-md-0" src="img/rank8.jpg" width="150"height="50"  alt="">
          </a>
        </div>
      </div>
      
      <hr>
      
      <!-- Project Four -->
      <div class="row" style="margin-left:35px">

        <div class="col-md-3">
          <a href="#">
            <img class="img-fluid rounded mb-3 mb-md-0" src="img/rank9.jpg" width="150"height="50"  alt="">
          </a>
        </div>
      </div>
      
      <hr>
      
      <!-- Project Four -->
      <div class="row" style="margin-left:35px">
        <div class="col-md-3">
          <a href="#">
            <img class="img-fluid rounded mb-3 mb-md-0" src="img/rank10.jpg" width="150"height="50"  alt="">
          </a>
        </div>
      </div>
      <br><br><p>
      <!-- /.row -->
      
      <div id="prelist" >
      	<h6>hit list</h6>
      	<div id="prelist-hit">
      	 <table>
       		<tr>
            <td colspan="7" width="40%" bgcolor="black"></td>
            </tr>
             <thead>
            <tr>
                <th>rn</th>
                <th>title</th>
                <th>content</th>
                <th>writer</th>
                <th>like<i class="far fa-heart" style="color:red;"></i></th>
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
      	<h6>new list</h6>
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
                <th>date</th>
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
      </div>


  </body>

</html>
