<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
</head>
<body>

<ul>
	<c:forEach var="board" items="${ boardList }">
		<li><a href="<%= request.getContextPath() %>/article_list.khs?board_id=${ board.board_id }">${ board.board_name }</a></li>
	</c:forEach>
</ul>

</body>
</html>