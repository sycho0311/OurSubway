<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO" %>
<%@ page import="java.io.PrintWriter" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JSP 게시판 웹 사이트</title>
</head>
<body>
  <%
    session.invalidate();//현재 이 페이지에 접속한 인원이 세션을 뺏기게 되어  로그아웃시켜줌
  %>
   <script>
     location.href='/OurSubway/index.jsp';
   </script>
</body>
</html>