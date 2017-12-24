<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<!-- id가 user이고 join에서 입력받은 user정보 세팅하기-->
<jsp:useBean id="user" class="user.User" scope="page"/>
<jsp:setProperty name="user" property="userID"/>
<jsp:setProperty name="user" property="userPassword"/>
<jsp:setProperty name="user" property="userName"/>
<jsp:setProperty name="user" property="userGender"/>
<jsp:setProperty name="user" property="userEmail"/>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JSP 게시판 웹 사이트</title>
</head>
<body>
<%
String userID = null;
if (session.getAttribute("userID") != null) {
	userID = (String) session.getAttribute("userID");
}
if (userID != null) {
%>
	<script>
		alert('이미 로그인이 되어있습니다.');
		location.href='/OurSubway/index.jsp'
	</script>
<%
}
if (user.getUserID() == null || user.getUserPassword() == null || user.getUserName() == null
		|| user.getUserGender() == null || user.getUserEmail() == null) {
%>
	<script>
		alert('입력이 안 된 사항이 있습니다.');
		history.back();
	</script>
<%
} else {
	UserDAO userDAO = new UserDAO();
	int result = userDAO.join(user); //데이터베이스에 세팅할 user객체 입력
	if (result == -1) { //이미 존재하는 아이디일 때
%>
		<script>
			alert('이미 존재하는 이이디입니다.');
			history.back();
		</script>
<%
	} else { //회원가입이 성공한 경우
		session.setAttribute("userID", user.getUserID());
%>
		<script>
			alert('회원가입이 정상적으로 처리됐습니다.');
			location.href='/OurSubway/index.jsp';
		</script>
<%
	}
}
%>
</body>
</html>