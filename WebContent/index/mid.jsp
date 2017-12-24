<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head></head>
<body>

<form name="SearchFastWay" action="/OurSubway/index.jsp" method="POST" target="_self">
	<input type="hidden" name="main" value="route">
	<table>
		<tr>
			<td colspan="2">
				<img src="/OurSubway/images/fndRoute.png" width="100%">
			</td>
		</tr>
		<tr>
			<td>
				<!-- 출발역 입력 후 키보드 tab을 누르면 포커스가 도착역으로 가도록 하기 위해 table 안에 묶었다
					rowspan을 사용하면 포커스가 '검색버튼'으로 가버린다 -->
				<table>
					<tr><td><input type="text" name="statnFnm" size="9" placeholder="출발역(예:서울)"></td></tr>
					<tr><td><input type="text" name="statnTnm" size="9" placeholder="도착역(예:서울)"></td></tr>
				</table>
			</td>
			<td align="center" style="margin: auto;">
				<input type="image" src="/OurSubway/images/search.png" width="100%" />
			</td>
		</tr>
		<tr><td height="5"></td><td></td></tr>
	</table>
</form>

</body>
</html>

<!-- <tr><td>출발역 <input type="text" name="DEPT" size="15" placeholder="출발역"></td></tr>
		<tr><td>도착역 <input type="text" name="ARRV" size="15" placeholder="도착역"></td></tr> -->