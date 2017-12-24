<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%

try {
	String password = null;

	request.setCharacterEncoding("utf-8");
	int num = Integer.parseInt(request.getParameter("num"));
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	String request_pw = request.getParameter("password");
%>
<%@ include file="/mysql/connector.jspf" %>
<%
	String sql = "SELECT password FROM notification WHERE num=" + num;
	ResultSet res = statement.executeQuery(sql);
	if (res.next()) {
		password = res.getString(1);

		if (password.equals(request_pw)) {
			sql = "UPDATE notification SET title='" + title + "' , content='"+ content +"' WHERE num=" + num;
			statement.executeUpdate(sql);
%>
			<script>
				self.window.alert("글이 수정되었습니다");
				location.href="/OurSubway/index.jsp?main=notification";
			</script>
<%
			res.close();
			statement.close();
			conn.close();
		} else {
%>
			<script>
				self.window.alert("비밀번호를 틀렸습니다.");
				location.href="javascript:history.back()";
			</script>
<%
		}
	}
} catch (SQLException e) {
	e.printStackTrace();
}
%>