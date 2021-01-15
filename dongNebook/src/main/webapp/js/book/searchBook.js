const exitDiv = 
`
	<div class="exit-icon">
		<div class="icon-wrap exit-btn">
			<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-x" viewBox="0 0 16 16">
				<path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z"/>
			</svg>
		</div>
	</div>
`

$(function(){
	/* Selectbox Choices*/
    const defaultSelect = () => {
        const element = document.querySelector('.default');
        const choices = new Choices(element, {
            searchEnabled: false,
            itemSelectText: ''
        });
    };
    defaultSelect();
	/* event Listener */
	const inputTag = $("#searchFrm");
	const searchBtn = $(".icon-wrap");

	$(searchBtn).on('click',submitBtn);
	$(inputTag).on('keyup',searchFrmKeyupFunc);
});
/* book search */
function exitBtnFunc(){
	emptyGuessedBox();
}
function searchFrmKeyupFunc(){
	const inputVal = $(this).val();
	
	if(inputVal.length > 1){
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
	$('.guessedBox').hide();
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
	addExitBtn(guessedBox);
	addGuessedTag(guessedBox,data);
	if(data.length == 0){
		$('.guessedBox').hide();
	} else{
		$('.guessedBox').show();
	}

}
function addExitBtn(guessedBox){
	$(guessedBox).append(exitDiv);
	const exitBtn = $(".exit-btn");
	$(exitBtn).on('click', exitBtnFunc);
}
function addGuessedTag(guessedBox,data){
	for(var i = 0 ; i < data.length ; ++i){
		$(guessedBox).append('<div class="guessed"><a href="#">' + data[i] + '</a></div>');
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


		