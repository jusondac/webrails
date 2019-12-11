function submitFrmAjax(){
	Rails.ajax({
		url:"/articles",
		type: "GET",
		data: $("#get_search").serialize()
	});
}