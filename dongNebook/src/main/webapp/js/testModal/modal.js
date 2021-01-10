$(function(){
		const multiBoard = document.querySelector('.multipleBoardWrap');
        multiBoard.onscroll = scrollFunc;
        addBoard();
        addBoard();
        function scrollFunc(){
            if(isEndScroll(this.scrollTop)){
                addBoard();
            }
        }
        function addBoard(){
            $.ajax({
                url:'/boardModal.do',
                success:function(data){
                    const addBody = $.parseHTML(data.addBody);
                    $(multiBoard).append(addBody[1]);
                },
                beforeSend: function() {
                    $(multiBoard).append('<div class="loadingContent"></div>');
                },
                complete: function(){
                    $('.loadingContent').remove();
                }	
                
            });
        }
        function isEndScroll(currScroll){
            const maxScroll = multiBoard.scrollHeight- multiBoard.offsetHeight;
            return currScroll >= maxScroll;
        }
      
});