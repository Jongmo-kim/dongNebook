$(function(){
		var modalBody = $('.multipleBoardWrap');
		var str =' <div class="boardBody"> <div class="boardHeader"><p>김종모님</p><img src="../image/test/male-face-12.svg" /></div><div class="boardContent"><div class="imageContent"><img src="../image/test/800x0.jpg" alt="book"></div><div class="textContent"><p>이 책은 너무 재미있어서 5천억번이나 봤습니다.</p> <p>여러분도 꼭보세요!</p></div></div><div class="boardFooter"><div class="tagContent"><a href="#">#프리드버그_선형대수학5판</a></div></div></div> ';
		
	$('#exampleModalLong').on('click',function(){
		var addBody = $.parseHTML(str);
		$(modalBody).append(addBody);
		$.ajaxPrefilter(function(options, orig, jpXHR){
				console.log(options.url);
				console.log(options);
				options.url = "http://127.0.0.1:3001/";
		});
		
		$.ajax({
			url: "/",
			crossDomain: true
			, type: 'GET'
			, dataType: "jsonp"
			, data: data
			, success: function(data){ console.log(data);}
		});
	});
});