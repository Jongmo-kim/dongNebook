$(function(){
	const inputTag = $("#searchFrm");
	
	$(inputTag).on('keyup',searchFrmKeyupFunc);
});

function searchFrmKeyupFunc(){
	const inputVal = $(this).val();
	
	if(inputVal.length > 2){
		getAutocompleteBooks(inputVal);
	}else{
		emptyGuessedBox();
	}
}

function emptyGuessedBox(){
	const guessedBox = $('.guessedBox');
	$(guessedBox).html('');
}
function getAutocompleteBooks(inputVal){
	$.ajax({
		url : "/book/autocomplete.do",
		type :"get",
		data : {inputVal : inputVal},
		success: setAutocompleteBooks
	})
}
function setAutocompleteBooks(data){
	const guessedBox = $('.guessedBox');
	$(guessedBox).html('');
	for(var i = 0 ; i < data.length ; ++i){
		$(guessedBox).append('<div class="guessed"><a href="#">' + data[i] + '</a></div>');
	}
	const guessedTag = $(".guessed > a");
	$(guessedTag).on('click', FillinputTag);
}
function FillinputTag(){
	const inputTag = $("#searchFrm");
	console.log(1);
	$(inputTag).val(this.innerHTML);
}
function bookmarkChkBox(chk,id,isbn){
			console.log(isbn);
			if(chk){
				$.ajax({
					url : "/book/insertBookmark.do",
					type :"get",
					data : {isbn:isbn},
					success:function(data){
						console.log("성공");
						var book=document.getElementById(id);
						book.innerHTML="<img src='/image/bookmark/bookmark-true.png'>";						
					},error:function(request,status,error){

						console.log("실패");
					}
				});
				
			}else if(chk==false){
				$.ajax({
					url : "/book/deleteBookmark.do",
					type :"get",
					data : {isbn:isbn},
					success:function(data){
						console.log("성공");
						var book=document.getElementById(id);
						book.innerHTML="<img src='/image/bookmark/bookmark-false.png'>";						
					},error:function(request,status,error){

						console.log("실패");
					}
				});
			}
		}
