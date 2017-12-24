<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>

<script>
	function emailCheck() {
		var form = document.fndidform;
		if (!form.email.value) {
			alert("이메일을 적어주세요");
			form.email.focus();
			return;
		}
		form.submit();
	}
</script>

</head>
<body>

<form name="fndidform" method="POST" action="/OurSubway/fndid/fndID_ok.jsp">
<div><strong>가입할 때 사용한 이메일을 입력해주세요</strong></div>
<br>
<table>
	<tr>
		<td></td>
		<td align="center">이메일</td>
		<td><input type="email" name="email" size="40" maxlength="80"></td>
		<td></td>
	</tr>
	<tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
	<tr align="center">
		<td></td>
		<td colspan="2">
			<input type="button" value="확인" onClick="javascript:emailCheck();">
			<input type="button" value="취소" onClick="javascript:history.back(-1)">
		</td>
		<td></td>
	</tr>		
</table>
</form>

</body>
</html>