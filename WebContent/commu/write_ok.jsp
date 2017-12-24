<!--
	write.jsp에서 등록 버튼 클릭 시,
	 1. 입력값을 검사하고
	 2. INSERT INTO로 게시글을 commu table에 저장한다
-->
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%
	request.setCharacterEncoding("utf-8");

	try {
%>

<%@ include file="/mysql/connector.jspf" %>
<%
		String name = request.getParameter("name");
		String password = request.getParameter("password");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		String sql = "INSERT INTO commu(name, password, title, content) VALUES(?, ?, ?, ?)";
		PreparedStatement pStatement = conn.prepareStatement(sql);
		pStatement.setString(1, name);
		pStatement.setString(2, password);
		pStatement.setString(3, title);
		pStatement.setString(4, content);
		pStatement.executeUpdate();
		pStatement.close();
		conn.close();
	} catch (SQLException e) {
		out.println(e.toString());
	}
%>
<script>
	self.window.alert("입력한 글을 저장하였습니다.");
	location.href="/OurSubway/index.jsp?main=commu"; 
</script>