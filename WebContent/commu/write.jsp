<!-- 글쓰기 -->
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>

<link rel="stylesheet" type="text/css" href="/OurSubway/commu/style.css">
<script>
	function writeCheck() {
		var form = document.writeform;

		if (!form.title.value) {
			alert("제목을 적어주세요");
			form.title.focus();
			return;
		}

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
	String userID = (String)session.getAttribute("userID");
	if (userID == null)
		userID = "비회원";
	else if (userID.equals("subwaymaster"))
		userID = "관리자";
%>

<form name="writeform" method="post" action="/OurSubway/commu/write_ok.jsp">
<table>
	<tr>
		<td colspan="4">
			<table style="width:100%">
				<tr class="tr_top">
					<td class="td_top"></td>
					<td>글쓰기</td>
					<td class="td_bottom"></td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td></td>
		<td align="center">제목</td>
		<td><input name="title" size="50" maxlength="100"></td>
		<td></td>
	</tr>
	<tr height="1" bgcolor="#dddddd">
		<td></td>
		<td colspan="4"></td>
		<td></td>
	</tr>
	<tr>
		<td></td>
		<td align="center">작성자</td>
		<td><input type="hidden" name="name" value="<%=userID %>"><%=userID %></td>
		<td></td>
	</tr>
	<tr height="1" bgcolor="#dddddd">
		<td></td>
		<td colspan="4"></td>
		<td></td>
	</tr>
	<tr>
		<td></td>
		<td align="center">비밀번호</td>
		<td><input type="password" name="password" size="50" maxlength="50"></td>
		<td></td>
	</tr>
	<tr height="1" bgcolor="#dddddd">
		<td></td>
		<td colspan="4"></td>
		<td></td>
	</tr>
	<tr>
		<td></td>
		<td align="center">내용</td>
		<td><textarea name="content" cols="50" rows="13"></textarea></td>
		<td></td>
	</tr>
	<tr height="1" bgcolor="#dddddd">
		<td></td>
		<td colspan="4"></td>
		<td></td>
	</tr>
	<tr align="center">
		<td></td>
		<td colspan="2">
			<input type=button value="등록" onClick="javascript:writeCheck();">
			<input type=button value="취소" onClick="javascript:history.back(-1)">
		</td>
		<td></td>
	</tr>
</table>
</form>

</body>
</html>

<!--
게시판 만들기 참고 블로그: http://seinarin.tistory.com/5


-->