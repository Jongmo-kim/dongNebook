$(function(){
		const multiBoard = document.querySelector('.multipleBoardWrap');
        multiBoard.onscroll = scrollFunc;
        addBoard();
        addBoard();
        function scrollFunc(){
            console.log(this.scrollTop);
            if(isEndScroll(this.scrollTop)){
                addBoard();
            }
        }
        function addBoard(){
            $.ajax({
                url:'http://127.0.0.1:3001/boardModal',
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