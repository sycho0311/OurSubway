<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
request.setCharacterEncoding("utf-8");
String userID = null;
String email = request.getParameter("email");
try {
%>
<%@ include file="/mysql/connector.jspf" %>
<%
	String sql = "SELECT userID FROM user WHERE userEmail='" + email + "'";
	ResultSet res = statement.executeQuery(sql);
	if (res.next()) {
		userID = res.getString(1);
%>
		<script>
			self.window.alert("아이디는 '<%=userID %>'입니다");
			location.href="/OurSubway/index.jsp";
		</script>
<%
		res.close();
		statement.close();
		conn.close();
	} else {
%>
		<script>
			self.window.alert("해당 이메일로 가입한 ID가 없습니다");
			location.href="javascript:history.back()";
		</script>
<%
	}
} catch (SQLException e) {
	e.printStackTrace();
}
%>