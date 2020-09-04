<%@page import="java.util.Calendar"%>
<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<style>
   input{
      
      background-color: skyblue;
   }
</style>
<head>
<!-- <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> -->
<!-- <meta http-equiv="Refresh" content="1"> -->
<script type="text/javascript" src = "<%=request.getContextPath()%>/js/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
   $(function(){
      var jogId = null;
      var timeArea = $("#timeArea");

      $(".timeControl").on("click", function(){
         let value = this.value;
         console.log(value);
         $(this).prop("disabled",true);
         if(value == "STOP"){
        	 $("[value='start']").prop("disabled",false);
            clearInterval(jogId);
         }else if(value == "START"){
        	 $("[value='stop']").prop("disabled",false);
            jogId = setInterval(function(){
               $.ajax({
                  url : "<%=request.getContextPath()%>/getServerTime.do",
                  dataType : "json", //Accept, Content-Type
                  success : function(resp) {
                     timeArea.html(resp.now);            
                  },
                  error : function(errResp) {
            
                  }
               });
            }, 1000);
         }
      });
   })
//    setTimeout(function(){
//       location.reload();
//    }, 1000);

</script>
<title>Insert title here</title>
</head>
<body>
<h4>자동 요청을 발생시키는 방법</h4>
<pre>
   1) server side : Refresh 헤더 이용
      <%-- <% 
         response.setIntHeader("Refresh", 1); 
      %> --%>
      <span id = "timeArea"></span>
      <input id = "timeStart" type="button" value = "START" class = "timeControl"/>
      <input id = "timeStop" type="button" value = "STOP" class = "timeControl" disabled/>
   2) client side : HTML, Javascript
      HTML - meta
      Javascript - 
</pre>
<textarea rows="5" cols="100"></textarea>
</body>
</html>