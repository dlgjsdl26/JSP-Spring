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
String str = "!10 =";
	int j = 0;
for(int i = 1; i <=10; i++){
	j += i;
}
%>
	<%= String.format("%s %d", str, j)%>
</body>
</html>