var currReview = -1;
var maxReview = 99999;
$(function(){
		const multiBoard = document.querySelector('.multipleBoardWrap');
        multiBoard.onscroll = scrollFunc;
        addBoard(++currReview);
        addBoard(++currReview);
        addBoard(++currReview);
        addBoard(++currReview);
     
        $("a[data-target='#reviewModal']").on('click',function(){
        	setTimeout(slickLoad,200);
        	setTimeout(slickLoad,500);
        });
        
        function scrollFunc(){
            if(isEndScroll(this.scrollTop) && currReview <= maxReview-1){
                addBoard(++currReview);
               	setTimeout(slickLoad,200);
        		setTimeout(slickLoad,500);
            }
        }
        function addBoard(currReview){
            $.ajax({
                url:'/boardModal.do',
                data : {currReview : currReview},
                success:function(data){
                    const addBody = $.parseHTML(data.addBody);
                    maxReview = data.maxReview;
                    $(multiBoard).append(addBody[1]);
                    
                },
                beforeSend: function() {
                    $(multiBoard).append('<div class="loadingContent"></div>');
                },
                complete: function(){
                    $('.loadingContent').remove();
                }	
                
            })
        }
        function isEndScroll(currScroll){
            const maxScroll = multiBoard.scrollHeight- multiBoard.offsetHeight;
            return currScroll >= maxScroll-100;
        }
      
});