<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="user" class="user.User" scope="page"/>
<jsp:setProperty name="user" property="userID"/><!-- login.jsp에서 받은 userID받아오기 -->
<jsp:setProperty name="user" property="userPassword"/><!-- login.jsp에서 받은 userPassword받아오기 -->
<jsp:setProperty name="user" property="userName"/>
<%
	String storedID = application.getInitParameter("MasterID");
	String storedPW = application.getInitParameter("MasterPassword");

	String userID = null;

	String id = request.getParameter("userID");
	String pw = request.getParameter("userPassword");
   
	if(id.equals(storedID) && pw.equals(storedPW)){
		session.setAttribute("userID", user.getUserID());
		PrintWriter script= response.getWriter();
		script.println("<script>");
		script.println("location.href='/OurSubway/index_master.jsp'");
		script.println("</script>"); 
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JSP 게시판 웹 사이트</title>
</head>
<body>
<%
	} else {
		if(session.getAttribute("userID")!=null) {
			userID=(String) session.getAttribute("userID");
		}
		if(userID!=null){
%>
			<script>
				alert('이미 로그인이 되어있습니다.');
				location.href='/OurSubway/index.jsp';
			</script>
<%
		}
		UserDAO userDAO = new UserDAO();
		int result = userDAO.login(user.getUserID(),user.getUserPassword());
		if(result==1){ //로그인 성공인 경우
			session.setAttribute("userID", user.getUserID());
			session.setAttribute("userName", user.getUserName());
%>
			<script>location.href='/OurSubway/index.jsp';</script>;
<%
		} else if(result==0) {
%>
			<script>
				alert('비밀번호가 틀립니다.');
				history.back();
			</script>
<%
		} else if(result==-1) {
%>
			<script>
				alert('아이디가 존재하지 않습니다.');
				history.back();
			</script>
<%
		} else if(result==-2) {
%>
			<script>
				alert('DB에 오류가 발생했습니다.');
				history.back();
			</script>
<%
		}
	}
%>
</body>
</html>