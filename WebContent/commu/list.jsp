<!-- 게시판 목록: 모든 게시글을 보여준다 -->
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.Calendar"
		import="java.text.SimpleDateFormat" %>
<%
int max = 15;
String page_num = request.getParameter("page");
if (page_num == null)
	page_num = "0";
%>
<html>
<head>
	<!-- tr_top, td_top, td_bottom 정의 -->
	<link rel="stylesheet" type="text/css" href="/OurSubway/commu/style.css">
</head>
<body>

<%
try {
%>
<%@ include file="/mysql/connector.jspf" %>
<% 
	/* 게시물 개수 */
	String count = "SELECT count(*) FROM commu";
	ResultSet res = statement.executeQuery(count);
	int total = 0;
	if (res.next())
		total = res.getInt(1);
	res.close();

	/* 게시물 가져오기 */
	String record = "SELECT num, title, name, date, hit FROM commu ORDER BY num DESC LIMIT " + page_num + ", " + max;
	res = statement.executeQuery(record);
%>
<table>
	<tr align="center"><td colspan="7"><font size="10em" color="#173068">자유게시판</font></td></tr>
	<tr><td colspan="7"><br></td></tr>
	<!-- 필드 -->
	<tr class="tr_top">
		<td class="td_top"></td>
		<td width="73">번호</td>
		<td width="379">제목</td>
		<td width="73">작성자</td>
		<td width="164">작성일</td>
		<td width="58">조회수</td>
		<td class="td_bottom"></td>
	</tr>

	<!-- 레코드(게시글) -->
<%		// 게시물 없음
		if (total == 0) {
%>
	<tr align="center" bgcolor="#FFFFFF" height="30">
		<td colspan="7">등록된 글이 없습니다.</td>
	</tr>

<%		// 게시물 있음
		} else {
			/* 현재날짜: 작성날짜와 비교하기 위함! */
			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
			Calendar cal = Calendar.getInstance();
			String now = format.format(cal.getTime());

			/* 게시물 정보 로드 */
			while (res.next()) {
				int num = res.getInt(1); // 게시물 번호
				String title = res.getString(2); // 제목
				String name = res.getString(3); // 작성자
				// 작성날짜
				String date = res.getString(4);
				String[] token = date.substring(0, 16).split(" ");
				if (!now.equals(token[0]))	// 이전날짜에 작성되었으면
					date = token[0];		// 날짜만 표시
				else						// 오늘 작성되었으면
					date = token[1];		// 시간만 표시

				int hit = res.getInt(5); // 조회수
%>
	<tr height="25" align="center" >
		<td></td>
		<td align="center"><%=num %></td>
		<td align="left"><a href="/OurSubway/index.jsp?main=commu_content&num=<%=num%>"><%=title %></a></td>
		<td align="center"><%=name %></td>
		<td align="center"><%=date %></td>
		<td align="center"><%=hit %></td>
		<td></td>
	</tr>
	<tr height="1">
		<td></td>
		<td colspan="5" bgcolor="#D2D2D2"/>
		<td></td>
	</tr>
<%
			} // while문 종료
%>
</table>
<%
			for (int i = 0, n = total / max; i <= n; i++) { //페이징
				if (i != 0) {
%>
 | 
<%
				}
%>
				<a href="/OurSubway/index.jsp?main=commu&page=<%=i * max%>"><%=i+1%></a>
<%
			}
		} // else문 종료

		res.close();
		statement.close();
		conn.close();
} catch (SQLException e) {
	out.print(e.toString());
} // try-catch 종료
%>
<table>
	<tr><td></td></tr>
	<tr>
		<td><input type="button" value="글쓰기" onClick="window.location='/OurSubway/index.jsp?main=commu_write'"/></td>
	</tr>
	<tr><td></td></tr>
</table>

</body>
</html>

<!--
게시판 만들기 참고 블로그: http://seinarin.tistory.com/3

<table style="border-collapse: collapse;width: 100%">
	<tr height="5"><td width="5"></td></tr>
	<tr style="background:url('img/table_mid.gif') repeat-x; text-align:center;">
		<td width="5"><img src="img/table_left.gif" width="5" height="30" /></td>
		<td width="73">번호</td>
		<td width="379">제목</td>
		<td width="73">작성자</td>
		<td width="164">작성일</td>
		<td width="58">조회수</td>
		<td width="7"><img src="img/table_right.gif" width="5" height="30" /></td>
	</tr>
	<tr height="25" align="center"></tr>
	<tr height="1" bgcolor="#D2D2D2"><td colspan="6"></td></tr>
	<tr height="1" bgcolor="#82B5DF"><td colspan="6" width="752"></td></tr>
</table>
 
<table style="border-collapse: collapse;width: 100%">
	<tr><td colspan="4" height="5"></td></tr>
	<tr align="center">
		<td><input type=button value="글쓰기"></td>
	</tr>
</table>

-->