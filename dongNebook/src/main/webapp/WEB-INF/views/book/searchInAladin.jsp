<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
</head>
<style>
	@charset "UTF-8";
/*
 *  Imports
*/
@import url(https://fonts.googleapis.com/css?family=Lato:400,300,700,900);
@import url(https://fonts.googleapis.com/css?family=Roboto+Slab:400,700);
@import url("https://netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.min.css");
/*
 *  Variables
*/
/* Single Line truncation */
/* Multiline truncation */
/*
 *  Global styles
*/
html,
body,
.main,
.main-container {
  height: 100%;
}

body {
  font-family: "Lato", "Helvetica Neue", Helvetica, Arial, sans-serif;
  color: #313131;
  background: #ecf0f1;
}

.row {
  max-width: 1024px;
}

/*
 *  Typography
*/

.main-container a {
  color: #219e9a;
}

.main-container h2,h3 {
  margin-top: 6px;
  margin-bottom: 6px;
  font-size: 28px;
  font-weight: bold;
  letter-spacing: -1px;
  color: #313131;
}

.main-container h2 {
  font-size: 28px;
}

.main-container h3 {
  font-size: 24px;
}

.main-container h4 {
  margin-bottom: 12px;
  font-size: 22px;
  line-height: 40px;
  color: rgba(49, 49, 49, 0.7);
}

.main-container p:not(.author) {
  font-size: 15px;
  font-weight: 300;
  line-height: 1.4;
}

.main-container p.author {
  margin-bottom: 10px;
  letter-spacing: -1px;
  font-weight: 400;
  color: rgba(49, 49, 49, 0.5);
}

/*
 *  Button
*/
.main-container a.button {
  margin-bottom: 0;
  padding: 8px 14px;
  font-size: 14px;
  font-weight: 600;
  border-radius: 3px;
  background-color: white;
  text-decoration:none;
}
.main-container a.button:hover, a.button:focus {
  background-color: #219e9a;
  color:black;
}

/*
 *  Header
*/
.page-header {
  position: relative;
  width: 100%;
  background-color: #fff;
  text-align:center;
}

.main-logo {
  display: inline-block;
  padding: 1em;
  width: auto;
}
.main-logo a.logo {
  display: block;
  width: 150px;
  height: 40px;
  text-indent: -9999px;
  background: url("http://interactivejoe.com/book-viewer/assets/images/logo.svg");
  background-color: #fff;
  transition: background-color 250ms ease-out;
}
.main-logo a.logo:hover, .main-logo a.logo:focus {
  background-color: #ecf0f1;
}

.menu-search {
  float: right;
  width: calc(100% - 200px);
}

/*
 *  Search Input
*/
.catalog-search {
  position: relative;
  margin: 0 20px;
  max-width: 275px;
  width: calc(100% - 2em);
  vertical-align: top;
  overflow: hidden;
  float: right;
}

.input_field {
  position: relative;
  display: block;
  float: right;
  margin-top: 10px;
  padding: 14px 7px 0;
  width: 100%;
  border: none;
  border-radius: 0;
  color: #313131;
  font-weight: normal;
  font-family: "Lato", "Helvetica Neue", Helvetica, Arial, sans-serif;
  background: none;
  box-shadow: none;
  -webkit-appearance: none;
  /* for box shadows to show on iOS */
}
.input_field:focus {
  outline: none;
  border: none;
  background: none;
  box-shadow: none;
  -webkit-appearance: none;
}
.input_field:focus .input_label-content {
  bottom: 20px;
}

.input_label {
  position: absolute;
  display: inline-block;
  bottom: 0;
  left: 0;
  padding: 0 0.25em;
  width: 100%;
  height: calc(100% - 1em);
  color: #d2d6d5;
  font-weight: light;
  font-size: 15px;
  text-align: left;
  pointer-events: none;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  -webkit-touch-callout: none;
  -webkit-user-select: none;
     -moz-user-select: none;
      -ms-user-select: none;
          user-select: none;
}
.input_label:before {
  content: "";
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: calc(100% - 10px);
  border-bottom: 1px solid rgba(49, 49, 49, 0.45);
}
.input_label:after {
  content: "";
  position: absolute;
  top: 0;
  left: 0;
  margin-top: 2px;
  width: 100%;
  height: calc(100% - 10px);
  border-bottom: 3px solid #219e9a;
  transform: translate3d(-100%, 0, 0);
  transition: transform 0.3s;
}

.input_label-content {
  position: absolute;
  width: 100%;
  bottom: 14px;
}

.input_label-search {
  position: relative;
  display: block;
  color: rgba(49, 49, 49, 0.45);
}
.input_label-search:after {
  content: "";
  position: absolute;
  top: 7px;
  right: 5px;
  font-family: "fontawesome";
}

.input_field:focus + .input_label::after,
.input--filled .input_label::after {
  transform: translate3d(0, 0, 0);
}

.input_field:focus + .input_label .input_label-content,
.input--filled .input_label-content {
  -webkit-animation: anim-1 0.3s forwards;
  animation: anim-1 0.3s forwards;
}

@-webkit-keyframes anim-1 {
  50% {
    opacity: 0;
    transform: translate3d(1em, 0, 0);
  }
  51% {
    opacity: 0;
    transform: translate3d(-1em, -40%, 0);
  }
  100% {
    opacity: 1;
    transform: translate3d(0, -40%, 0);
  }
}
@keyframes anim-1 {
  50% {
    opacity: 0;
    bottom: 24px;
    transform: translate3d(5em, 0, 0);
  }
  51% {
    opacity: 0;
    bottom: 24px;
    transform: translate3d(-5em, -40%, 0);
  }
  100% {
    opacity: 1;
    bottom: 24px;
    transform: translate3d(0, -40%, 0);
  }
}
/*
 *  Menu
*/
.main-navigation {
  position: relative;
  float: right;
  margin: 16px 0;
  padding: 0 20px;
  height: 40px;
  border-left: 1px solid #d2d6d5;
}
.main-navigation a {
  display: inline-block;
  line-height: 40px;
  vertical-align: middle;
  font-size: 14px;
  font-weight: bold;
  text-transform: uppercase;
  color: #313131;
}
.main-navigation a:before {
  content: "";
  position: relative;
  display: inline-block;
  padding-right: 10px;
  font-family: "fontawesome";
  font-size: 18px;
  font-weight: 400;
  color: rgba(49, 49, 49, 0.45);
  vertical-align: middle;
}

/*
 *  Off Canvas Menu
*/
.main-container {
  position: relative;
  overflow-x: hidden;
}
.main-container.prevent-scroll, .main-container.nav-menu-open {
  overflow: hidden;
}

.nav-menu {
  position: absolute;
  top: 0;
  right: 0;
  z-index: 100;
  visibility: visible;
  width: 300px;
  height: 100%;
  background: #219e9a;
  transition: all 0.5s;
  transform: translate3d(100%, 0, 0);
}
.nav-menu:after {
  position: absolute;
  top: 0;
  right: 0;
  width: 100%;
  height: 100%;
  background: rgba(0, 0, 0, 0.2);
  content: "";
  opacity: 1;
  transition: opacity 0.5s;
  display: none;
}
.nav-menu h2 {
  margin: 0;
  padding: 1em;
  color: rgba(0, 0, 0, 0.4);
  text-shadow: 0 0 1px rgba(0, 0, 0, 0.1);
  font-weight: 300;
  font-size: 2em;
}
.nav-menu ul {
  margin: 0;
  padding: 0;
  list-style-type: none;
}
.nav-menu li a {
  display: block;
  padding: 1em 1em 1em 1.2em;
  outline: none;
  box-shadow: inset 0 -1px rgba(0, 0, 0, 0.2);
  color: #f3efe0;
  text-transform: uppercase;
  text-shadow: 0 0 1px rgba(255, 255, 255, 0.1);
  letter-spacing: 1px;
  font-weight: 400;
  transition: background 0.3s, box-shadow 0.3s;
}
.nav-menu li:first-child a {
  box-shadow: inset 0 -1px rgba(0, 0, 0, 0.2), inset 0 1px rgba(0, 0, 0, 0.2);
}
.nav-menu li:hover {
  background: rgba(0, 0, 0, 0.2);
  box-shadow: inset 0 -1px rgba(0, 0, 0, 0);
  color: #fff;
}

.nav-menu-open .nav-menu {
  visibility: visible;
  transform: translate3d(0, 0, 0);
}
.nav-menu-open .nav-menu:after {
  width: 0;
  height: 0;
  opacity: 0;
  transition: opacity 0.5s, width 0.1s 0.5s, height 0.1s 0.5s;
}

/*
 *  book List
*/


#grid {
  margin-bottom: 60px;
}

.book-item {
	position:relative;
  margin: 15px 0;
  padding: 15px;
  list-style-type: none;
  width:90%;
}
.book-item:hover .button{
	background-color:#ecf0f1;
}

.book-item:hover:after {
    box-shadow: 0px 1px 1px 1px rgba(210, 214, 213, 0.5);
    background-color: lightgray;
    
}
.book-item:after{
	content: "";
    position: absolute;
    top: 0;
    right: 15px;
    width: calc(100% - 105px);
    height: 100%;
    border-radius: 3px;
    box-shadow: 0 0 0 0 transparent;
    background-color: rgba(255, 255, 255, 0);
    z-index: -1;
    transition: all 250ms ease-out;
}

.book-item:hover .book-item_title{
	background-color:lightgray;
	transition: all 900ms ease-out;
}
.book-item:hover .item-img img {
  box-shadow: 0px 0px 10px 0px rgba(49, 49, 49, 0.25);
}

.book-item:hover .bk-bookdefault {
  transform: rotate3d(0, 1, 0, 25deg);
}
.book-item:hover .bk-back {
  opacity: 1;
}
.book-item .item-img {
  display: inline-block;
  float: left;
  padding-right: 30px;
}
.book-item .item-img img {
  box-shadow: 0 0 0 0 transparent;
  transition: all 250ms ease-out;
}
.book-item .item-details {
  padding-right: 30px;
}
.book-item h3 {
  white-space: nowrap;
  overflow: hidden;
  text-overflow: ellipsis;
}
.book-item p:not(.author) {
  display: block;
  display: -webkit-box;
  height: 63px;
  /* Fallback for non-webkit */
  font-size: 15px;
  line-height: 1.4;
  -webkit-line-clamp: 3;
  -webkit-box-orient: vertical;
  overflow: hidden;
  text-overflow: ellipsis;
}

/*
 *  Book Rotate
*/
.bk-img {
  position: relative;
  display: inline-block;
  float: left;
  padding-right: 30px;
  list-style: none;
  /* Individual style & artwork */
}
.bk-img .bk-wrapper {
  position: relative;
  width: 150px;
  height: 215px;
  float: left;
  z-index: 1;
  perspective: 1400px;
}
.bk-img .bk-wrapper:last-child {
  margin-right: 0;
}
.bk-img .bk-book {
  position: absolute;
  width: 100%;
  height: 215px;
  transform-style: preserve-3d;
  transition: transform 0.5s;
}
.bk-img .bk-book > div,
.bk-img .bk-front > div {
  display: block;
  position: absolute;
}
.bk-img .bk-front {
  transform-style: preserve-3d;
  transform-origin: 0% 50%;
  transition: transform 0.5s;
  transform: translate3d(0, 0, 20px);
  z-index: 10;
}
.bk-img .bk-front > div {
  z-index: 1;
  -webkit-backface-visibility: hidden;
  backface-visibility: hidden;
  transform-style: preserve-3d;
  border-radius: 0 3px 3px 0;
  box-shadow: inset 4px 0 10px rgba(0, 0, 0, 0.1);
}
.bk-img .bk-front:after {
  content: "";
  position: absolute;
  top: 1px;
  bottom: 1px;
  left: -1px;
  width: 1px;
}
.bk-img .bk-front,
.bk-img .bk-back,
.bk-img .bk-front > div {
  width: 150px;
  height: 215px;
}
.bk-img .bk-left,
.bk-img .bk-right {
  width: 40px;
  left: -20px;
}
.bk-img .bk-back {
  transform: rotate3d(0, 1, 0, -180deg) translate3d(0, 0, 20px);
  box-shadow: 5px 7px 15px rgba(0, 0, 0, 0.3);
  border-radius: 3px 0 0 3px;
  opacity: 0;
  transition: opacity 250ms ease-out;
}
.bk-img .bk-back:after {
  content: "";
  position: absolute;
  top: 0;
  left: 10px;
  bottom: 0;
  width: 3px;
  background: rgba(0, 0, 0, 0.06);
  box-shadow: 1px 0 3px rgba(255, 255, 255, 0.1);
}
.bk-img .bk-left {
  height: 215px;
  transform: rotate3d(0, 1, 0, -90deg);
}
.bk-img .bk-left h2 {
  width: 215px;
  height: 40px;
  transform-origin: 0 0;
  transform: rotate(90deg) translateY(-40px);
}
.bk-img .bk-cover {
  /*background-image: url(../images/1.png);*/
  background-repeat: no-repeat;
  background-position: 10px 40px;
}
.bk-img .bk-cover:after {
  content: "";
  position: absolute;
  top: 0;
  left: 10px;
  bottom: 0;
  width: 3px;
  background: rgba(0, 0, 0, 0.06);
  box-shadow: 1px 0 3px rgba(255, 255, 255, 0.1);
}
.bk-img .bk-cover {
  background-repeat: no-repeat;
  background-position: top left !important;
}
.bk-img .bk-front > div,
.bk-img .bk-left {
  background-color: gray;
}

/*
 *  Lightbox
*/
.main-overlay {
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  display: none;
  background-color: rgba(49, 49, 49, 0.65);
}
.main-overlay .overlay-full {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
}
.main-overlay .overlay-details {
  position: absolute;
  display: block;
  z-index: 1;
  top: 50%;
  left: 50%;
  width: 100%;
  max-width: 800px;
  max-height: 480px;
  padding: 40px;
  overflow: hidden;
  border-radius: 3px;
  background-color: #fff;
  box-shadow: 0px 2px 1px 2px rgba(0, 0, 0, 0.3);
  transform: translate(-50%, -50%);
}
.main-overlay .overlay-image {
  display: inline-block;
  margin-right: 30px;
  max-width: 275px;
  vertical-align: top;
}
.main-overlay .overlay-image img {
  position: relative;
  display: inline-block;
  z-index: 1;
  box-shadow: -12px 12px 15px -5px rgba(0, 0, 0, 0.3);
}
.main-overlay .overlay-image .back-color {
  position: absolute;
  top: 0;
  left: 0;
  width: 275px;
  height: 100%;
  border-top-left-radius: 3px;
  border-bottom-left-radius: 3px;
  background-color: green;
}
.main-overlay .close-overlay-btn {
  position: absolute;
  top: 15px;
  right: 15px;
  width: 30px;
  height: 30px;
  opacity: 0.3;
  text-indent: -9999px;
  transition: opacity 250ms ease-out;
}
.main-overlay .close-overlay-btn:hover {
  opacity: 1;
}
.main-overlay .close-overlay-btn:before {
  content: " ";
  position: absolute;
  left: 15px;
  width: 2px;
  height: 33px;
  background-color: #313131;
}
.main-overlay .close-overlay-btn:after {
  content: " ";
  position: absolute;
  left: 15px;
  width: 2px;
  height: 33px;
  background-color: #313131;
}
.main-overlay .close-overlay-btn:before {
  transform: rotate(45deg);
}
.main-overlay .close-overlay-btn:after {
  transform: rotate(-45deg);
}
.main-overlay .back-preview-btn {
  position: absolute;
  top: 7px;
  left: -34px;
  width: 30px;
  height: 30px;
  opacity: 0.3;
  text-indent: -9999px;
  transition: opacity 250ms ease-out;
}
.main-overlay .back-preview-btn:hover {
  opacity: 1;
}
.main-overlay .back-preview-btn:before {
  content: " ";
  position: absolute;
  left: 15px;
  width: 2px;
  height: 15px;
  background-color: #313131;
}
.main-overlay .back-preview-btn:after {
  content: " ";
  position: absolute;
  top: 10px;
  left: 15px;
  width: 2px;
  height: 15px;
  background-color: #313131;
}
.main-overlay .back-preview-btn:before {
  transform: rotate(45deg);
}
.main-overlay .back-preview-btn:after {
  transform: rotate(-45deg);
}
.main-overlay .overlay-desc {
  display: inline-block;
  margin-top: -400px;
  width: calc(100% - 320px);
  vertical-align: top;
  transition: all 500ms ease-out;
}
.main-overlay .overlay-desc.activated {
  display: inline-block;
  margin-top: 0;
}
.main-overlay .overlay-preview {
  position: relative;
  display: inline-block;
  float: right;
  margin-top: 40px;
  width: calc(100% - 310px);
  vertical-align: top;
  transition: all 500ms ease-out;
}
.main-overlay .overlay-preview.activated {
  margin-top: -430px;
}
.main-overlay .preview-content {
  padding-right: 24px;
  padding-top: 10px;
  display: block;
  display: -webkit-box;
  height: 360px;
  /* Fallback for non-webkit */
  font-size: 15px;
  line-height: 1.5;
  -webkit-line-clamp: 16;
  -webkit-box-orient: vertical;
  overflow: hidden;
  text-overflow: ellipsis;
  overflow: scroll;
  text-overflow: clip;
  font-weight: 400;
}
.main-overlay .preview-content h5,
.main-overlay .preview-content p {
  font-family: "Roboto Slab", serif;
}
.main-overlay .preview-content h5 {
  font-weight: bold;
}
.main-overlay .preview-content p {
  font-weight: normal;
}
.main-overlay .preview-content:before {
  content: "";
  position: absolute;
  left: 0;
  top: 40px;
  width: 100%;
  height: 30px;
  background: rgba(255, 255, 255, 0);
  background: linear-gradient(to top, rgba(255, 255, 255, 0) 0%, rgba(255, 255, 255, 0) 0%, rgba(255, 255, 255, 0.8) 30%, white 80%);
}
.main-overlay .preview-content:after {
  content: "";
  position: absolute;
  left: 0;
  bottom: 0;
  width: 100%;
  height: 50px;
  background: rgba(255, 255, 255, 0);
  background: linear-gradient(to bottom, rgba(255, 255, 255, 0) 0%, rgba(255, 255, 255, 0) 0%, rgba(255, 255, 255, 0.8) 30%, white 80%);
}

.overlay-details {
  display: none;
}

.page-header{
	height:50px;
	border-bottom:1px solid lightgray;
}
#kwd{
	float:right;
	width:180px;
}


.select-choose-sort{
	height:20px;
	margin:0 auto;
	
}
.bk-cover{
	background-size:152px  218px;
}
.form-inline{
	height:50px;
	text-align:right;
	width:260px;
	float:right;
}
.input-group-prepend{
	
}
.indicator{
	background-image: url("/image/common/loading.svg");
}
.adminSideMenu li:nth-child(1) a{
         background:#a8dba8;
		color:white;
         }
.aladin-img{
	height: 50px;
    width: 14%;
    float: left;
}
.aladin-img img{
	height:50px;
}
.page-link{
	margin-left:0px;
	color:none !important;
	border:0px !important;
}
.pagination>li>.selectPage{
	color:black;
}
.informSearch{
	text-align:center;
}
.contents-frame{
	width: 100vw;
    height: 100%;
    min-width: 1800px;
}
.main-container{
	height:100% !important;
}
</style>
<body>
<jsp:include page="/views/common/header.jsp" />
	<div class="contents-frame">
	<div class="contents">
	<jsp:include page="/views/common/adminSide.jsp" />
	<div class="admin-contents">
	
	<div id="main-container" class="main-container nav-effect-1">
<h1 style="font-size:30px;">도서등록</h1>
		<hr>
 

  <div class="main clearfix">

    <!-- Header Content -->
    <header id="headerContent" class="page-header">
      
      <div class="aladin-img"><img src="/image/book/aladin.png"></div>
      <div align="right" class="form-inline">
	  	
		  <input type="text" class="form-control" placeholder="검색어를 입력하세요" id="kwd">
		  <button type="submit" class="btn btn-primary searchBtn" onclick="bookSearch(1)">Submit</button>
		</div>
    </header>
	<div class="informSearch" id="informSearch">
		<h4>알라딘 검색 시스템입니다. 책을 검색하여 도서를 신청하세요.</h4>
	</div>

    <!-- Main Section -->
    <div class="page-container">

      <div class="page-title category-title">
        <!-- <h1>Book Viewer</h1> -->
      </div>

      <section id="book_list">


        <div class="grid-shuffle">
          <ul id="grid" class="row">

            
          </ul>
        </div>

      </section>

    </div>

<div class = "pagination justify-content-center" id="pageNavi"></div>
  </div>
  <!-- /main -->

  <div class="main-overlay">
    <div class="overlay-full"></div>
  </div>
</div>
</div>
<!-- /main-container -->
</div>
</div>
<script>
var pageSize=10;
var searchKeyword;
const resultFunc = function(success, data){//const = final  상수형변수 
	if(success){
		for(var i=0;i<10;i++){
			
			let cover500 = data.item[i].cover.replace(/coversum/g,'cover500');
		
			//특수문자 제거중.....
			var tmp=data.item[i].description;
			var description = tmp.replace(/\'/g,'');
			var title=(data.item[i].title).replace(/[\☆♡\[\]★]/g,'');
			data.item[i].description=description;
			data.item[i].title=title;
		
			var sendData= JSON.stringify(data.item[i]);
			//특수문자 제거완료.....
			$("#grid").append("<li class='book-item small-12 medium-6 columns' data-groups='[classic]' data-date-created='1937' data-title='Of Mice and Men' data-color='#fcc278'>"+"<div class='bk-img'>"+"<div class='bk-wrapper'>"+"<div class='bk-book bk-bookdefault'>"+"<div class='bk-front'>"+"<div class='bk-cover' style='background-image: url("+cover500+")'>"+"</div>"+"</div>"+"<div class='bk-back'>"+"</div>"+"<div class='bk-left'></div></div></div></div><div class='item-details'><h3 class='book-item_title'>"+data.item[i].title+"</h3><p class='author'>"+data.item[i].author+"</p><p>"+(data.item[i].description)+"</p><a onclick='bookinsert("+sendData+")' class='button'>신청</div></li>");
		}	
		$.ajax({
			method: "get",
			url:"/aladin/aladinPage.do",
			data: {totalCount:data.totalResults,reqPage:data.startIndex},
			success: function(data){
				document.getElementById("pageNavi").innerHTML="";
				$("#pageNavi").append(data);
							}
		});
	
	}else{
		
	}
};
function bookinsert(item){
	
	$.ajax({
		method: "get",
		url:"/book/insertAsJson.do",
		data: {item:JSON.stringify(item)},
		complete: function(data){
			
		},
		success: function(data){
			
			alert("등록완료");
		}
	});
};
function bookSearch(page){
	var inform=document.getElementById("informSearch");
	inform.style.display="none";
	var pageNo=page;
	
	$(".book-item").remove();
	searchKeyword=$("#kwd").val();
	$.ajax({ 
		method:"GET",//api POST X 
		url:"http://www.aladin.co.kr/ttb/api/ItemSearch.aspx",
		beforeSend: function() {
			$('.searchBtn').append('<img style="width:25px;height:25px" alt="loading" src="/image/common/loading.svg">');
		},
		complete: function(){
			$('.searchBtn').html('Submit');
		},
		data : {ttbkey:'ttboptta922158008',Query:searchKeyword,maxresult:'10',Start:page,Output:'js',SearchTarget:'Book',Sort:'SalesPoint',Cover:'Big'}, 
		jsonpCallback : "resultFunc", //response받을때 동작하는 함수명  resultFunc 위 함수
		dataType:"jsonp"	//cors우회..	 해킹
	});
};
</script>
</body>
</html>