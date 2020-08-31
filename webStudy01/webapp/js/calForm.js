/**
 * 
 */	
$.fn.convertForm=function(resultArea){

	resultArea = $(resultArea);
	var element = $("[name='calForm']").on("submit", function(event){
		event.preventDefault();
		var inputs = $(this).find(":input");
				let obj = {};
				let url = this.action;
		inputs.each(function(index, tag){
			let name = tag.name;
			if(name){
				console.log($(tag).val());
				let value = tag.value;
				//obj.leftOp = value;
				obj[name] = value;
			}
		})
		
		//동기처리를 비동기로 전환
		 $.ajax({
			url:url
			,data:obj
			,success:function(resp){
				resultArea.text(resp);
				console.log(resp);
			}
			
		}) 
		return false;
	});
	console.log(element);	
	
}
