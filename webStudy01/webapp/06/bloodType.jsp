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
	
	$("select:first").on("change",function(){
		let value = event.target.value;
		let select = event.target;
		console.log(value);
<%-- 		location.href="<%=request.getContextPath()%>/getblood.do?blood="+value; --%>
		
		$.ajax({
			url : "<%=request.getContextPath()%>/getblood.do",
			data : {blood:value},
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
<select name="bloodType">
	<option values>혈액형 선택</option>
	<%
		String pattern = "<option value='%s'>%s</option>";
		Map<String, String[]> bloodMap = (Map)getServletContext().getAttribute("bloodMap");
		Set<String> keySet = bloodMap.keySet();
		Iterator<String> it = keySet.iterator();
		while(it.hasNext()){
			String mapKey = it.next();
			String[] value = bloodMap.get(mapKey);
			
			out.println(String.format(pattern, mapKey, value[0]));
		}
	%>
</select>
</body>
</html>