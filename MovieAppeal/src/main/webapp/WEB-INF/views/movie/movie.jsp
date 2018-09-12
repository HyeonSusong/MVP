<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>APITest화면</title>
</head>
<body id="page-top">
   <div style="margin-top:100px; margin-left:100px;">
    <h1>API테스트 화면223</h1>
    </div>
       
    <center>
    <form>
            <input type="text" name="keyword" >
            <input type="submit" value="검색">
    </form>
    </center>
    	 <table>
       		<tr>
            <td colspan="7" width="100%" bgcolor="black"></td>
             <c:forEach items="${movie}" var ="m">
            <tr>
                <td rowspan="2"><img src="${m.image}"></td>
                <td rowspan="4" width="800">${m.title}(${m.subtitle})</td>
                <td width="200">${m.actor}</td>
            </tr>
            <tr>
                <td width="200">${m.userRating }</td>
                <td width="200">${m.yearfrom}-${m.yearto}</td>
                <td width="200">${m.director }</td>
                <td width="200">${m.country }</td>
                <td width="200">${m.pubDate}</td>
            </tr>
            <tr>
                <td colspan="7">${m.link }</td>
            </tr>
            <tr>
                <td colspan="7" width="100%" bgcolor="black"></td>
            </tr>
        </c:forEach>
        </tr>
        </table>
</body>
</html>
