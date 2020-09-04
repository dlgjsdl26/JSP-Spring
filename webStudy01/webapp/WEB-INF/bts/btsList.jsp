<%@page import="java.util.Collection"%>
<%@page import="com.sun.xml.internal.bind.v2.util.CollisionCheckStack"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
$(function(){
	
	$("select:first").on("change", function() {
		let value = event.target.value;
		let select = event.target;
		console.log(value);
<%-- 		location.href="<%=request.getContextPath()%>/bts/getMemberPage.do?member="+value; --%>
		$.ajax({
			url : "<%=request.getContextPath()%>/bts/getMemberPage.do",
			data : {member:value},
			method : "get",
			dataType : "html",
			success : function(resp) {
				$(select).after(resp);
			},
			error : function(errResp) {

			}
		});
	});
});

</script>
</head>
<body>
<select name="memberType">
	<option value>BTS멤버 선택</option>
	<%
		String pattern = "<option value='%s'>%s</option>\n";
		Map<String, String[]> btsMap = (Map)getServletContext().getAttribute("btsMap");
		Set<String> keySet = btsMap.keySet();
		Iterator<String> it = keySet.iterator();
		while(it.hasNext()){
			String mapKey = it.next();
			String[] value = btsMap.get(mapKey);
			
		out.println(String.format(pattern, mapKey, value[0]));
		}
	%>
</select>

하나의 멤버를 선택하면, change 이벤트 핸들러에서
"/bts/getMemberPage.do?member=B001" 요청발생.
해당 요청의 결과로 멤버의 개인 페이지 랜더링.
단, bts 폴더 아래에 있는 개인 페이지의 주소를 클라이언트가 모르도록.
</body>
</html>