<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- Button trigger modal -->
<!-- <button type="button" class="btn btn-primary" id="fixedModalBtn" data-toggle="modal" data-target="#reviewModal">
  Launch demo modal
</button> -->

<!--review Modal-->
<div class="modal fade" id="reviewModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle">도서 추천</h5>
        <div style="text-align:right;">
                <a href="/review/main.do?reqPage=1">게시판으로 보기</a>
                </div>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      	<div class="multipleBoardWrap">
		</div>
      </div>
      <div class="modal-footer">

        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>
<script src="/lib/slick/slick.min.js" type="text/javascript"></script>
	<script src="/js/review/reviewModal.js" type="text/javascript"></script>

<!--  -->
