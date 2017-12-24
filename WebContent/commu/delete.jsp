<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
String masterID = (String)session.getAttribute("userID");
boolean ismasterLogin = false;
if (masterID != null && masterID.equals("subwaymaster")) {
	ismasterLogin = true;
}
%>
<html>
<head>
	<link rel="stylesheet" type="text/css" href="/OurSubway/commu/style.css">
	<title>자유게시판</title>
	<script>
		function deleteCheck() {
			var form = document.deleteform;
			if (!form.password.value) {
				alert("비밀번호를 적어주세요");
				form.password.focus();
				return;
			}
			form.submit();
		}
	</script>
</head>
<body>

<%
int num = Integer.parseInt(request.getParameter("num"));
if (!ismasterLogin) {
%>
	<form name=deleteform method=post action="/OurSubway/commu/delete_ok.jsp?num=<%= num %>">
		<table>
			<tr>
				<td></td>
				<td align="center">비밀번호</td>
				<td><input type="password" name="password" size="40" maxlength="80"></td>
				<td></td>
			</tr>
			<tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
			<tr align="center">
				<td></td>
				<td colspan="2">
					<input type="button" value="삭제" onClick="javascript:deleteCheck();">
					<input type="button" value="취소" onClick="javascript:history.back(-1)">
				</td>
				<td></td>
			</tr>		
		</table>
	</form>
<%
} else {
	try {
%>
		<%@ include file="/mysql/connector.jspf" %>
<%
		String sql = "SELECT password FROM commu WHERE num=" + num;
		ResultSet res = statement.executeQuery(sql);
		if (res.next()) {
			sql = "DELETE FROM commu WHERE num=" + num;
			statement.executeUpdate(sql);
%>
			<script>
				self.window.alert("글이 삭제되었습니다");
				location.href="/OurSubway/index.jsp?main=commu";
			</script>
<%
			res.close();
			statement.close();
			conn.close();
		}
	} catch (SQLException e) {
		e.printStackTrace();
	}
}
%>

</body>
</html>