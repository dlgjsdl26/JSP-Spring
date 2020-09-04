<%@page import="java.io.FilenameFilter"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<script type = "text/javascript" src = "<%=request.getContextPath()%>/js/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
		$(function(){
			var imgPtrn = "<img src='<%=request.getContextPath()%>/images/image.do?image=%S'/>";
			var videoPtrn = "<video src='<%=request.getContextPath()%>/images/image.do?image=%s'/>";
			var resultArea = $("#resultArea");
			$("select").on("change",function(){
				let value = $(this).val();
				let option = $(this).find("option:selected");
				let clzName = $(option).attr("class");
				let innerTag = null;
				if(clzName.startsWith("image")){
					innerTag = imgPtrn.replace("%S", value);
				}else if(clzName.startsWith("video")){
					innerTag = videoPtrn.replace("%s", value);
				}
				if(innerTag){
				resultArea.html(innerTag);
				}
			});
		});
</script>
<title>Insert title here</title>
</head>
<body>
	<select>
	<%
	File file = new File("e:/contents/");
	String pattern = "<option class='%s'>%s</option>\n";
	FilenameFilter fileName = new FilenameFilter(){
		public boolean accept(File dir, String name){
			boolean accept = false;
			String mime = application.getMimeType(name);
			accept = mime!=null && (mime.startsWith("image/")) || (mime.startsWith("video/"));
			return accept;
		}
	};
		String[] list = file.list(fileName);
		for(String files : list){
			String mime = application.getMimeType(files);
			out.println(String.format(pattern, mime, files));
		}
	%>
	</select>
	<div id="resultArea">
	
	</div>
</body>
</html>