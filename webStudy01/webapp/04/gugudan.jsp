<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String pattern = "%d * %d = %d";
for(int i = 2; i <=9; i++){
%>
<table border="1">
	<tr>
<%for(int j = 1; j <= 9; j++){ %>
	
		<td><%=String.format(pattern, i, j, i*j)%></td>
<%} %>
	</tr>
</table>


<% 
}
%>
</body>
</html>