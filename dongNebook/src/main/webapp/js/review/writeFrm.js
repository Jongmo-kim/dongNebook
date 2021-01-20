$(function(){
    const inputTag = $(".choices__input");
    $(inputTag).on('keyup', keyupFunc);
})
function keyupFunc(e){
    const inputVal = $(this).val();
    getAutocompleteBooks(inputVal);
}
function getAutocompleteBooks(inputVal){
	$.ajax({
		url : "/review/autocomplete.do",
		type :"get",
		data : {inputVal : inputVal},
		success: setAutocompleteBooks
	})
}

function setAutocompleteBooks(data ){
    multipleDefault.clearChoices();
    multipleDefault.setChoices(data);
}
var multipleDefault = new Choices(
    document.getElementById('choices'),
    {
         removeItemButton: true
    }
    
  );

multipleDefault.clearStore();
            
multipleDefault.setChoices(async () => {
  try {
         const items = await fetch('/review/item.do');
      return items.json();
  } catch (err) {
    console.error(err);
  }
});