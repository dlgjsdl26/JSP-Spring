<%@ page import="java.util.Objects"%>
<%@ page import="org.apache.commons.lang3.StringUtils"%>
<%@ page language="java" pageEncoding="UTF-8"%>

<%!
private long factorial(int num, StringBuffer expr){
	if(num <= 0){
		throw new IllegalArgumentException("음수는 연산 불가");
	}else if(num == 1){
		expr.append(num);
		return num;
	}else{
		expr.append(num + "* ");
		return num*factorial(num-1, expr);
	}
}
%>

<%
	String accept = request.getHeader("Accept");
	String mime = "text/html;charset=UTF-8";
	if(accept.contains("json")){
		mime = "application/json;charset=UTF-8";
	}
	response.setContentType(mime);
	String value = request.getParameter("op");

	int num = 0;
	if(StringUtils.isNotBlank(value) && StringUtils.isNumeric(value)){
		
	num = Integer.parseInt(value);
	StringBuffer expr = new StringBuffer();
	long result = factorial(num, expr);
%>	
{	
	"expression":"<%= String.format("!%d = %s = %d", num, expr, result)%>"
}
<%
	}else{
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-3.5.1.min.js"></script>
</head>
<body>

<form>
	피연산자 : <input type="text" name="op" value="<%=Objects.toString(num, "")%>"/>
	<input type="submit" value="전송" />
</form>
<div id="resultArea">
</div>
<script type="text/javascript">
	var resultArea = $("#resultArea");
	$("form").on("submit", function(event){
		event.preventDefault();
		//동기요청을 비동기로 전환
		let url = this.action?this.action : "";
		let data = {}
		let inputs = $(this).find(":input"); // : - 입력할 수 있는(input) 모든 tag 불러옴
		$.each(inputs, function(index, input){
			let nameAttr = input.name;
			if(nameAttr){
				let valueAttr = input.value;
// 				data.op=8;
				data[nameAttr] = valueAttr;
			}
		})
		let method = this.method ? this.method : "get";
		
		$.ajax({
			url:url,
			data:data,
			method:method,
			dataType:"html", // request header : Accept, response header : content-Type
			success : function(resp){
				resultArea.html(resp);
			},
			error:function(errorResp){
				console.log(errorResp);
			}
		});
		return false;
	});
</script>
</body>
</html>
<%
}
%>