<!-- 글 보기 -->
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.Calendar"
		import="java.text.SimpleDateFormat"
		import="java.net.*" %>
<html>
<head>
<!-- tr_top, td_top, td_bottom 정의 -->
<link rel="stylesheet" type="text/css" href="/OurSubway/commu/style.css">
<title>자유게시판</title>
</head>
<body>

<%
int num = Integer.parseInt(request.getParameter("num"));

try {
%>
<%@ include file="/mysql/connector.jspf" %>
<%
	String sql = "SELECT name, title, content, date, hit FROM commu WHERE num=" + num;
	ResultSet res = statement.executeQuery(sql);
	SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
	Calendar cal = Calendar.getInstance();
	String now = format.format(cal.getTime());

	if (res.next()) {
		String name = res.getString(1);
		String title = res.getString(2);
		String content = res.getString(3);
		String date = res.getString(4);
		String[] token = date.substring(0, 16).split(" ");
		if (!now.equals(token[0]))	// 이전날짜에 작성되었으면 날짜만 표시
			date = token[0];
		else						// 오늘 작성되었으면 시간만 표시
			date = token[1];
		int hit = res.getInt(5);
		hit++;
%>

<table>
	<tr>
		<td>
			<table>
				<tr>
					<td></td>
					<td align="center">글번호</td>
					<td width="319"><%=num %></td>
					<td></td>
				</tr>
				<tr height="1">
					<td></td>
					<td colspan="2" bgcolor="#D2D2D2"></td>
				</tr>
				<tr>
					<td></td>
					<td align="center">조회수</td>
					<td width="319"><%=hit %></td>
					<td></td>
				</tr>
				<tr height="1">
					<td></td>
					<td colspan="2" bgcolor="#D2D2D2"></td>
				</tr>
				<tr>
					<td></td>
					<td align="center">이름</td>
					<td width="319"><%= name %></td>
					<td></td>
				</tr>
				<tr height="1">
					<td></td>
					<td colspan="2" bgcolor="#D2D2D2"></td>
				</tr>
				<tr>
					<td></td>
					<td align="center">작성일</td>
					<td width="319"><%=date %></td>
					<td></td>
				</tr>
				<tr height="1">
					<td></td>
					<td colspan="2" bgcolor="#D2D2D2"></td>
				</tr>
				<tr>
					<td></td>
					<td align="center">제목</td>
					<td width="319"><%=title %></td>
					<td></td>
				</tr>
				<tr height="1">
					<td></td>
					<td colspan="2" bgcolor="#D2D2D2"></td>
				</tr>
				<tr>
					<td></td>
					<td width="399" colspan="2" height="200" valign="top"><%=content %></td>
				</tr>
				<tr align="center">
					<td></td>
					<td colspan="2" width="399">
						<a href="/OurSubway/index.jsp?main=commu"><input type="button" value="목록"></a>
						<a href="/OurSubway/index.jsp?main=commu_write"><input type="button" value="글쓰기"></a>
						<a href="/OurSubway/index.jsp?main=commu_modify&num=<%=num%>"><input type="button" value="수정"></a>
						<a href="/OurSubway/index.jsp?main=commu_delete&num=<%=num %>"><input type="button" value="삭제"></a>
					<td></td>
				</tr>
			</table>
		</td>
	</tr>
</table>
<%
		sql = "UPDATE commu SET hit=" + hit + " WHERE num=" + num;
		statement.executeUpdate(sql);
		res.close();
		conn.close();
	}
} catch (SQLException e) {
	e.printStackTrace();
}
%>

</body>
</html>