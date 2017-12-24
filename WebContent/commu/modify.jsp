<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<html>
<head>

<link rel="stylesheet" type="text/css" href="/OurSubway/commu/style.css">
<script>
	function modifyCheck() {
		var form = document.modifyform;

		if (!form.password.value) {
			alert("비밀번호를 적어주세요");
			form.password.focus();
			return;
		} else if (!form.title.value) {
			alert("제목을 적어주세요");
			form.title.focus();
			return;
		} else if (!form.content.value) {
			alert("내용을 적어주세요");
			form.content.focus();
			return;
		} else {
			form.submit();
		}
	}
</script>

<%
String name = "";
String password = "";
String title = "";
String content = "";
int num = Integer.parseInt(request.getParameter("num"));

try {
%>
<%@ include file="/mysql/connector.jspf" %>
<%
	String sql = "SELECT name, password, title, content FROM commu WHERE num=" + num;
	ResultSet res = statement.executeQuery(sql);
	
	if(res.next()){
		name = res.getString(1);
		password = res.getString(2);
		title = res.getString(3);
		content = res.getString(4);
	}
	
	res.close();
	statement.close();
	conn.close();
}catch(SQLException e) {
	e.printStackTrace();
}
%>

</head>
<body>

<table>
	<tr class="tr_top">
		<td class="td_top"></td>
		<td width="399">수정</td>
		<td class="td_bottom"></td>
	</tr>
</table>
<form name=modifyform method=post action="/OurSubway/commu/modify_ok.jsp?num=<%=num%>">
<table>
	<tr>
		<td></td>
		<td align="center">제목</td>
		<td><input name="title" size="40" maxlength="80" value="<%=title %>"></td>
		<td></td>
	</tr>
	<tr height="1" bgcolor="#dddddd">
		<td colspan="4"></td>
	</tr>
	<tr>
		<td></td>
		<td align="center">비밀번호</td>
		<td><input type="password" name="password" size="40" maxlength="50"></td>
		<td></td>
	</tr>
	<tr height="1" bgcolor="#dddddd">
		<td colspan="4"></td>
	</tr>
	<tr>
		<td></td>
		<td align="center">내용</td>
		<td><textarea name="content" cols="45" rows="13"><%=content %></textarea></td>
		<td></td>
	</tr>
	<tr height="1" bgcolor="#dddddd">
		<td colspan="4"></td>
	</tr>
	<tr align="center">
		<td></td>
		<td colspan="2">
			<input type=button value="수정" onClick="javascript:modifyCheck();">
			<input type=button value="취소" onClick="javascript:history.back(-1)">
		</td>
		<td></td>
	</tr>
</table>
</form>

</body>
</html>