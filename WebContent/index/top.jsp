<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head></head>
<body>

<table style="text-align: center;">
	<tr>
		<td style="text-align: center">
			<a href="/OurSubway/index.jsp">
				<img alt="subway" src="/OurSubway/images/Sullivanway.png" width="100%" height="60%">
			</a>
		</td>
	</tr>
<%
	String userID = null;
	if (session.getAttribute("userID") != null) {
		userID = (String) session.getAttribute("userID");
	}

	if (userID == null) {
%>
	<tr>
		<td>
			<!-- 로그인 안되어 있는 경우 -->
			<a href="/OurSubway/index.jsp?main=login">
				<img src="/OurSubway/images/login.png" width="100%">
			</a>
		</td>
	</tr>
	<tr>
		<td>
			<a href="/OurSubway/index.jsp?main=join">
				<font size="2em" color="black">회원가입</font>
			</a>
			|
			<a href="/OurSubway/index.jsp?main=fndID">
				<font size="2em" color="black">아이디 찾기</font>
			</a>
		</td>
	</tr>
<%
	} else {
%>
	<tr>
		<td align="center" valign="middle">
			<!-- 로그인 되어 있는 경우 -->
			<table style="width: 100%">
				<tr class="tr_top">
					<td class="td_top"></td>
					<td><%= userID + " 님" %></td>
					<td class="td_bottom"></td>
				</tr>
			</table>
			<a href="/OurSubway/login/logoutAction.jsp">
				<img src="/OurSubway/images/logout.png" width="100%">
			</a>
		</td>
	</tr>
<%
	}
%>
</table>

</body>
</html>