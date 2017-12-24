<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/openAPI/getShortestRoute.jspf" %>
<%
if (xml != null) {
	String statnFnm = "", statnTnm = "";
	String route1 = "", numStn1 = "", time1 = "", trans1 = "";
	String route2 = "", numStn2 = "", time2 = "", trans2 = "";
	String coord1 = "", coord2 = "";
	
	Iterator<String> it = routeInfo.iterator();
%>
	<html>
	<head>
	</head>
	<body>
<%
	if (it.hasNext()) {
		statnFnm = it.next(); //5
		statnTnm = it.next(); //6
		
		route1 = it.next(); //8
		numStn1 = it.next(); //11
		time1 = it.next(); //12
		trans1 = it.next(); //13
		
		route2 = it.next(); //15
		numStn2 = it.next(); //18
		time2 = it.next(); //19
		trans2 = it.next(); //20
		
		coord1 = it.next(); //21
		coord2 = it.next(); //22
	
%>
		<h3>최단시간</h3>
<%
		StringTokenizer cutter = new StringTokenizer(route1, " ,");
		String arrow_route1 = "";
		int count = 0;
		if (cutter.hasMoreTokens()) {
			arrow_route1 += cutter.nextToken();
			count++;
		}
		while (cutter.hasMoreTokens()) {
			arrow_route1 += " -> " + cutter.nextToken();
			count++;
			if (count % 5 == 0)
				arrow_route1 += "<BR>";
		}
%>
		<%=arrow_route1 + "<BR><BR>" %>
		<%=numStn1 + " 개 역 경유<BR>" %>
		<%=time1 + " 분 소요<BR>" %>
		<%=trans1 + " 회 환승<BR>" %>

<%
		cutter = new StringTokenizer(route2, " ,");
		String arrow_route2 = "";
		count = 0;
		if (cutter.hasMoreTokens()) {
			arrow_route2 += cutter.nextToken();
			count++;
		}
		while (cutter.hasMoreTokens()) {
			arrow_route2 += " -> " + cutter.nextToken();
			count++;
			if (count % 5 == 0)
				arrow_route2 += "<BR>";
		}
		%>
		<h3>최소환승</h3>
		<%=arrow_route2 + "<BR><BR>" %>
		<%=numStn2 + " 개 역 경유<BR>" %>
		<%=time2 + " 분 소요<BR>" %>
		<%=trans2 + " 회 환승<BR>" %>
<%
	} else {
%>
		역 이름을 잘못 입력하셨습니다<BR><BR>
		출발역: <%=paramList[0] %><BR>
		도착역: <%=paramList[1] %>
<%
	}
} else {
%>
요청이 지연되었습니다. 다시 시도해주세요
<%
}
%>
</body>
</html>