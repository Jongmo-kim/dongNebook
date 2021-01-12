$(function(){
	const inputTag = $("#searchFrm");
	$(inputTag).on('keyup',searchFrmKeyupFunc);
});

function searchFrmKeyupFunc(){
	const inputVal = $(this).val();
	if(inputVal.length > 2){
		getAutocompleteBooks(inputVal);
	}
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
	console.log(data);
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
