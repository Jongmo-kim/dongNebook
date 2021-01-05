$(function(){

	$('#exampleModalLong').on('click',function(){
		var data = {};
		$.ajaxPrefilter(function(options, orig, jpXHR){
				console.log(options.url);
				console.log(options);
				options.url = "http://127.0.0.1:3001/";
				options.crossDomin = true;
		});
		
		$.ajax({
			url: "http://127.0.0.1:3000/",
			crossDomain: true
			, type: 'GET'
			, dataType: "jsonp"
			, data: data
			, success: function(data){ console.log(data);}
		});
	});
});