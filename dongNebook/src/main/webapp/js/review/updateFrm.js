
$(function(){
  const inputTag = $(".choices__input");
  $(inputTag).on('keyup', keyupFunc);
  document.delete.addEventListener('submit',deleteFunc);
})
function deleteFunc(e){
  e.preventDefault();
  const swalWithBootstrapButtons = Swal.mixin({
  customClass: {
    confirmButton: 'btn btn-success',
    cancelButton: 'btn btn-danger'
  },
  buttonsStyling: false
})

swalWithBootstrapButtons.fire({
  title: 'Are you sure?',
  text: "You won't be able to revert this!",
  icon: 'warning',
  showCancelButton: true,
  confirmButtonText: 'Yes, delete it!',
  cancelButtonText: 'No, cancel!',
  reverseButtons: true
}).then((result) => {
  if (result.isConfirmed) {
    document.delete.action = "/review/delete.do";
    document.delete.submit();
  }
})
}


var multipleDefault = new Choices(
    document.getElementById('choices'),
    {
         removeItemButton: true,
         duplicateItemsAllowed: false
    }
    
  );
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
