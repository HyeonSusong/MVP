<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html>
<head>
    <title>MovieAppeal</title>
    
	<tiles:insertAttribute name="libinsert"/>

  </head>
  
  <body style="background-color: #eee; overflow:auto;">

    <div id="header">
		<tiles:insertAttribute name="header"/>
	</div>

	  	<div>
	<div id="main">
		<tiles:insertDefinition name="${page}"/>
	</div>
		</div>
	
	<div id="footer">
		<tiles:insertAttribute name="footer"/>
	</div>
  </body>

</html>
