<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	EnumClass ec;
	String res = "";

	String agent = request.getHeader("User-Agent");
	if(agent.contains("Chrome"))
		ec = EnumClass.CHROME;
	else if(agent.contains("Firefox"))
		ec = EnumClass.FIREFOX;
	else ec = EnumClass.EXPLORER;
	
	res = ec.getContext();
	out.println(res);
%>

<%!
	public static enum EnumClass{
	
	CHROME("chrome", "<h4>chrome을 사용하고있음</h4>"),
	FIREFOX("firefox", "<h4>firefox를 사용하고 있음</h4>"),
	EXPLORER("explorer", "<h4>explorer를 사용하고 있음</h4>");
	
	private String name;
	private String context;
		
	EnumClass(){
		
	}
	
	EnumClass(String name, String context){
		this.name = name;
		this.context =context;
	}
	
	public String getName() {
		return name;
	}

	public String getContext() {
		return context;
	}
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>