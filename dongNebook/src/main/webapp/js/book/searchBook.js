
$(function(){
	const inputTag = $("#searchFrm");
	const searchBtn = $(".icon-wrap");
	$(searchBtn).on('click',submitBtn);
	$(inputTag).on('keyup',searchFrmKeyupFunc);
});
/* book search */
function searchFrmKeyupFunc(){
	const inputVal = $(this).val();
	
	if(inputVal.length > 1){
		$('.guessedBox').show();
		getAutocompleteBooks(inputVal);
	}else{
		emptyGuessedBox();
	}
}

function submitBtn(){
	const searchBook = document.searchBook;
	searchBook.submit();
}
function emptyGuessedBox(){
	const guessedBox = $('.guessedBox');
	$(guessedBox).html('');
	$('.guessedBox').hide();
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
	if(data.length == 0){
		$('.guessedBox').hide();
	}
	const guessedTag = $(".guessed > a");
	$(guessedTag).on('click', FillinputTag);
}
function FillinputTag(){
	const inputTag = $("#searchFrm");
	$(inputTag).val(this.innerHTML);
}

/* bookmark */
function bookmarkChkBox(chk,id,isbn){
			console.log(isbn);
			if(chk){
				$.ajax({
					url : "/book/insertBookmark.do",
					type :"get",
					data : {isbn:isbn},
					success:function(data){
						var book=document.getElementById(id);
						book.innerHTML="<img src='/image/bookmark/bookmark-true.png'>";						
					},error:function(request,status,error){

					}
				});
				
			}else if(chk==false){
				$.ajax({
					url : "/book/deleteBookmark.do",
					type :"get",
					data : {isbn:isbn},
					success:function(data){
						var book=document.getElementById(id);
						book.innerHTML="<img src='/image/bookmark/bookmark-false.png'>";						
					},error:function(request,status,error){
					}
				});
			}
		}
