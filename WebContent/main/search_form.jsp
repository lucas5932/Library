<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<style type="text/css">
#searchWrap {
	border: 5px solid orange;
	border-radius: 5px;
	box-shadow: 2px 2px 2px gray;
	width : 600px;
	height : 60px;
}

.search_txt{
	margin : 5px;
	padding : 10px;
	font-size : 20px;
	width : 80%;
}
.search_img{
	float : right;
	margin: 5px 10px;
	width : 50px
}

</style>
<script type="text/javascript">
	function fastSearch(){
		var t = $('input[name=title]').val();
		var url = "../search/search_title.jsp?title="+t;
		document.location.href= url;
	}
</script>

<div id="searchWrap">
	<input type="text" name="title" class="search_txt" placeholder="책 제목을 입력하세요">
	<input type="image" src="../images/find.png" class="search_img" onclick="fastSearch()">
</div>
