<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인 페이지</title>
</head>
<body>

<!-- 좌측 상단에 표시 -->
<div id="lu"><a href="<%= request.getContextPath() %>/main.khs">KHS</a></div>

<!-- 좌측 중단에 표시 -->
<div id="lm">
<c:if test="${ empty sessionScope.login_user }" var="r">
	<form action="<%= request.getContextPath() %>/login.khs" method="get">
			<input type="submit" value="로그인">
	</form>
	<form action="<%= request.getContextPath() %>/regist.khs" method="get">
			<input type="submit" value="가입하기">
	</form>
	
	
	<a href="<%= request.getContextPath() %>/board.khs">게시판 목록으로 가기</a>
</c:if>

<c:if test="${ not r }">
<table>
	<tr>
		<td>${ login_user.user_nick } 님 환영합니다.</td>
	</tr>
	<tr>
		<td>
		<form action="<%= request.getContextPath() %>/logout.khs" method="post">
			<input type="submit" value="로그아웃">
		</form>
		</td>
		<td>
		<form action="<%= request.getContextPath() %>/user_info.khs" method="post">
			<input type="submit" value="회원 정보 보기">
		</form>
		</td>
	</tr>
	<tr>
		<td>
			<a href="<%= request.getContextPath() %>/board.khs">게시판 목록으로 가기</a>
		</td>
	</tr>
</table>

</c:if>

</div>


</body>
</html>