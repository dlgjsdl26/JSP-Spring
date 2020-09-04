<%@page import="java.io.FilenameFilter"%>
<%@page import="java.io.File"%>
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
//       var imgPtrn = "<img src='image.do?image=%s'/>";
//       var videoPtrn = "<video src='image.do?image=%s'/>";
      var imgPtrn = "<img src='<%=request.getContextPath()%>/image/image.do?image=%s'/>";
      var videoPtrn = "<video src='<%=request.getContextPath()%>/image/image.do?image=%s'/>";
      var resultArea = $('#resultArea');
      $("select").on("change", function(){
         let value = $(this).val();
         let option = $(this).find("option:selected");
//          $(option).attr("value")
//          option[0].value
         let clzName = $(option).attr("class");
         let innerTag = null;
         if(clzName.startsWith("image")){
            innerTag = imgPtrn.replace("%s", value);
         }else if(clzName.startsWith("video")){
            innerTag = videoPtrn.replace("%s", value);
         }
         if(innerTag){
            resultArea.html(innerTag);
         }
      });
   });
</script>

</head>
<body>
   
   <select>
      <%
      File folder = new File("D:/contents/");
      String pattern = "<option class='%s'>%s</option>\n";
      
      FilenameFilter fnf = new FilenameFilter() {
         
         @Override
         public boolean accept(File dir, String name) {
            boolean accept = false;
            String mime = application.getMimeType(name);
            accept = mime!=null && (mime.startsWith("image/")) || (mime.startsWith("video/"));
            return accept;
         }
      };
      String[] listFiles = folder.list(fnf);
      for(String file : listFiles) {
         String fileMime = application.getMimeType(file);
         out.println(String.format(pattern, fileMime, file));
      }
      %>
   </select>
   <div id="resultArea">
   </div>
</body>
</html>