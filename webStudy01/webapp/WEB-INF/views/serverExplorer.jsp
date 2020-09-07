<%@page import="org.apache.commons.lang3.StringUtils"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript" src = "<%=request.getContextPath() %>/js/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
	$(function() {
		
		$("ul").on("click", "li", function(event) {
			event.stopPropagation();
			let li = $(this);
			
			if(li.attr("class") == "dir"){
				let child = li.find("ul").get(0);
				if(child){
					let vis = $(child).is(":visible");
					if(vis){
						$(child).hide();
					}else{
						$(child).show();
					}
				}else{
					let data = $(this).attr("id");
					console.log(li);
					$.ajax({
						url : "serverExplorer.do",
						data : {uri : data},
						dataType : "html",
						success : function(resp) {
							li.append(resp);
						},
						error : function() {
		
						}
					});
				}
				
			}// if문 끝
			
			
		});
		
		
	});
</script>
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










