<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt" %>   
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
    
<meta charset="UTF-8">

<ul class="list-unstyled list_user">
					<li class="list_categoty">
						<a class="" href="/myprofile.do">
							<label class="control-label">선호장르변경</label>
						</a>
					</li>
					<li class="list_categoty">
						<a class="" href="/passwordmodify.do">
							<label class="control-label">비밀번호변경</label>
						</a>
					</li>
					<li class="list_categoty">
						<a class="" href="/myfavorite.do">
							<label class="control-label">나의추천영화</label>
						</a>
					</li>
					<li class="list_categoty">
						<a href="/myrating.do">
							<label class="control-label">나의별점리스트</label>							
						</a>
					</li>
					<li class="list_categoty">
						<a href="/myreview.do">
							<label class="control-label">나의리뷰</label>							
						</a>
					</li>
					<li class="list_categoty">
						<a href="/myreply.do">
							<label class="control-label">나의댓글</label>							
						</a>
					</li>
					<li class="list_categoty">
						<a href="/userdelete.do">
							<label class="control-label">회원탈퇴</label>							
						</a>
					</li>				</ul>