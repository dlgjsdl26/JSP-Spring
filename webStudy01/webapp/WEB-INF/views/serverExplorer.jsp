<%@page import="org.apache.commons.lang3.StringUtils"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h4>Model2 구조로 webStudy01 컨텍스트의 익스플로러 구현</h4>
<ul>
<%
	File[] listFiles =(File[]) request.getAttribute("listFiles");
	String contextRealPath = application.getRealPath("/");
	for(File file : listFiles){
		// JSP 쪽의 자바 코드 부담을 줄이려면? Adapter 패턴을 사용해 보시오!! 
		String clz = file.isDirectory()?"dir":"file";
		String fileAbPath = file.getAbsolutePath();
		String tmp = StringUtils.remove(fileAbPath, contextRealPath);
		String fileURI = tmp.replace(File.separatorChar, '/');
		fileURI = fileURI.startsWith("/")?fileURI:"/"+fileURI;
		%>
		<li class="<%=clz %>" id="<%=fileURI %>"><%=file.getName() %></li>
		<%
	}	
%>
</ul>
</body>
</html>










