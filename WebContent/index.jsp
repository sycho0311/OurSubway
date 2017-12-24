<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<link rel="subway icon" type="image/x-icon" href="/OurSubway/images/sullivan.ico" />
<link rel="stylesheet" type="text/css" href="/OurSubway/notification/style.css">
<style>
	.layer {
		width: 80%;
		height: 720;
		margin: auto;
	}
	
	.nav {
		background-color: #DAEFFF;
	}
</style>
<title>Sullivanway</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
	String main = request.getParameter("main");
%>

<table class="layer">
	<tr>
		<td class="nav" width="180" height="1" align="center">
			<jsp:include page="/index/top.jsp" flush="false" />
		</td>
		<td rowspan="3" align="center">
<%
			if (main == null) {
%>
				<jsp:include page="/subway/linemap.jsp" flush="false" />
<%
			/* 게시판: 공지사항 */
			} else if (main.equals("notification")) {
%>
				<jsp:include page="/notification/list.jsp" flush="false" />
<%
			} else if (main.equals("notification_write")) {
%>
				<jsp:include page="/notification/write.jsp" flush="false" />
<%
			} else if (main.equals("notification_content")) {
%>
				<%@ include file="/notification/view.jsp" %>
<%
			} else if (main.equals("notification_delete")) {
%>
				<jsp:include page="/notification/delete.jsp" flush="false" />
<%
			} else if (main.equals("notification_modify")) {
%>
				<jsp:include page="/notification/modify.jsp" flush="false" />
<%
			/* 게시판: 문의사항 */
			} else if (main.equals("contact")) {
%>
				<jsp:include page="/contact/list.jsp" flush="false" />
<%
			} else if (main.equals("contact_write")) {
%>
				<jsp:include page="/contact/write.jsp" flush="false" />
<%
			} else if (main.equals("contact_content")) {
%>
				<%@ include file="/contact/view.jsp" %>
<%
			} else if (main.equals("contact_delete")) {
%>
				<jsp:include page="/contact/delete.jsp" flush="false" />
<%
			} else if (main.equals("contact_modify")) {
%>
				<jsp:include page="/contact/modify.jsp" flush="false" />
<%
			/* 게시판: 분실물알림 */
			} else if (main.equals("commu")) {
%>
				<jsp:include page="/commu/list.jsp" flush="false" />
<%
			} else if (main.equals("commu_write")) {
%>
				<jsp:include page="/commu/write.jsp" flush="false" />
<%
			} else if (main.equals("commu_content")) {
%>
				<%@ include file="/commu/view.jsp" %>
<%
			} else if (main.equals("commu_delete")) {
%>
				<jsp:include page="/commu/delete.jsp" flush="false" />
<%
			} else if (main.equals("commu_modify")) {
%>
				<jsp:include page="/commu/modify.jsp" flush="false" />
<%
			} else if (main.equals("login")) {
%>
				<jsp:include page="/login/login.jsp" flush="false" />
<%
			} else if (main.equals("join")) {
%>
				<jsp:include page="/join/join.jsp" flush="false" />
<%
			} else if (main.equals("fndID")) {
%>
				<jsp:include page="/fndid/fndID.jsp" flush="false" />
<%
			} else if (main.equals("route")) {
%>
				<%@ include file="/subway/route.jsp" %>
<%
			} 			
%>

		</td>
	</tr>
	<tr>
		<td  class="nav" align="center" width="180" height="1">
			<jsp:include page="/index/mid.jsp" flush="false" />
		</td>
	</tr>
	<tr>
		<td class="nav" valign="top">
			<jsp:include page="/index/nav.jsp" flush="false" />
		</td>
	</tr>
</table>
</body>
</html>

<!--
	참고 사이트
	서울메트로 지하철 안내용 웹사이트: http://dmzap1.seoulmetro.co.kr/station/linemap.action

	개체 크기 단위에 대해서....
	- em : font_size, 해당폰트의 대문자 M의 너비를 기준으로 함.
	- ex : x-height, 해당폰트의 소문자 x의 높이를 기준으로 함.
	- px : pixel, 표시장치(모니터)에 따라서 상대적인 크기를 가짐.
	- %  : percent, 기본글꼴의 크기에 대하여 상대적인 값을 가짐.
	- pt  : point, 일반 문서(워드 등)에서 많이 사용하는 단위
	대부분의 브라우저는 폰트 사이즈의 기본값이 12pt, 16px, 1em, 100% 입니다. 예를 들어, 본문 전체가 12pt으로 설정되어 있는 상태에서 본문내의 테이블에서는 좀더 작은 9pt를 사용하고자 한다면, em단위로 본문의 폰트사이즈는 1em이 되고 테이블내 폰트사이즈는 0.75em이 되는 것입니다.
	#출처: http://zinee-world.tistory.com/131 [zineeworld]


	실행방법
	 : 서버 최상위폴더에 OurSubway 폴더를 넣고 실행시킨다

-->