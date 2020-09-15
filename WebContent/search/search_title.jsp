<%@page import="admin.bookDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="admin.bookDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../main/top.jsp"%>
<style>
.box{
	position : relative;
	border-radius : 10px;
	border : 1px solid black;
	padding : 5px;
	margin : 20px;
}
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
#filter{
	margin-top:5px;
}
.box_filter{
	border : 1px solid black;
	border-radius:10px;
	padding : 5px;
	float : left;
	margin: 5px;
}
font a{
	text-decoration: none;
}
</style>

<script type="text/javascript" src="../js/jquery.js"></script>
<script type="text/javascript">

function toggle(a){
	$(a).next().toggle('2000');
}
function move_page(){
	var t = $('input[name=title]').val();
	var url = "search_title.jsp?title="+t;
	document.location.href= url;
}
function filter(obj){
	var selected = document.getElementsByName("s_code");
	var cnt = 0;
	var str = new Array();
	if(obj.checked){
		addFilter(obj);
	}else {
		var objId = obj.value;
		var getObj = document.getElementById(objId);
		deleteFilter(getObj);
	}
}

function addFilter(obj){
	var objval = obj.value;
	var realval = "";
	var A_subject = ["소설", "시/에세이", "경제/경영", "자기계발", "인문", "역사/문화", "사회", "과학/공학", "예술/대중문화"
		, "종교", "유아", "어린이", "가정/생활/요리", "건강", "취미/레저", "여행/지도", "국어/외국어", "사전", "컴퓨터/IT",
		"청소년", "학습/참고서", "취업/수험서", "만화", "잡지"];
	var A_code = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X"];
	for(i=0;i<A_code.length;i++){
		if(objval == A_code[i]){
			realval = A_subject[i];
			break;
		}
	}
	$('#filter').append("<div class='box_filter' onclick='deleteFilter(this)'>x&nbsp;&nbsp;"+realval+"</div>");
	$('#filter div:last').attr("id",objval);
}
function deleteFilter(obj){
	var objval = obj.value;
	var namechk = document.getElementsByName("s_code");
	var idchk = document.getElementById(objval);
	var objval2 = $(idchk).attr("id");
	for(var i=0; i<namechk.length;i++){
		if($(namechk[i]).val()==objval || $(namechk[i]).val()==objval2){
			namechk[i].checked = false;
		}
	}
	obj.remove();
}
function popup(title){
	var url = "detailView.jsp?title="+title;

	var winW = 520;
	var winH = 500;
	
	var winLeft = (screen.width - winW)/2;
	var winTop = (screen.height - winH)/2;
	var options = "width="+winW+",height="+winH+",left="+winLeft+",top="+winTop;

	window.open(url,'pop',options);
}

</script>

<table class="table_Extented">
	<tr>
		<td valign="top" align="center" colspan="2">
			<div class="titleWrap">
				<span class="Title">도서 검색</span>
			</div>	
		</td>
	</tr>
	<tr>
		<td colspan="2" align="center">
			<div id="searchWrap">
				<input type="text" name="title" class="search_txt"	placeholder="책 제목을 입력하세요"> 
				<input type="image"	src="../images/find.png" class="search_img" onclick="move_page()">
			</div>
		</td>
	</tr>
	<tr>
		<td width="30%"  valign="top">
			 <div class="box">
				<table border="1" width="100%" cellpadding="5px">
					<tr>
						<td>검색결과 제한</td>
					</tr>
					<tr>
						<td>선택된 필터
							<div id="filter"></div>
						</td>
					</tr>
					<tr>
						<td><p onclick="toggle(this)">분야</p>
							<div>
							<%
								String[] subject = {"소설", "시/에세이", "경제/경영", "자기계발", "인문", "역사/문화", "사회", "과학/공학", "예술/대중문화"
										, "종교", "유아", "어린이", "가정/생활/요리", "건강", "취미/레저", "여행/지도", "국어/외국어", "사전", "컴퓨터/IT",
										"청소년", "학습/참고서", "취업/수험서", "만화", "잡지"};
								String[] s_code = {"A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X"};
								
								for(int i=0; i<subject.length;i++){%>
											<input type="checkbox" name="s_code" value="<%=s_code[i]%>" onclick="filter(this)"><%= subject[i] %><br>
							<%	}
							%>								
							
							</div>
						</td>
					</tr>
					<tr>
						<td id="lim2">
						<p onclick="toggle(this)">저자</p>
						<div>
							<input type="text" name="author">
							<input type="button" value="검색">
						</div>
						</td>
					</tr>
					<tr>
						<td id="lim3">
						<p onclick="toggle(this)">출판사</p>
						<div>
							<input type="text" name="author">
							<input type="button" value="검색">
						</div>
						</td>
					</tr>
				</table>
			</div>
		</td>
		<td align="center" valign="top" width="70%">
		<%
		bookDAO bdao = bookDAO.getInstance();
		int pageSize = 5;
		String pageNum = request.getParameter("pageNum");
		
		if(pageNum == null){
			pageNum = "1";
		}
		
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage-1) * pageSize +1;
		int endRow = currentPage * pageSize;
		int count = 0;

		String title = request.getParameter("title");
		ArrayList<bookDTO> list = new ArrayList<bookDTO>();
		if(title == null || title.equals("") || title.equals("all")){
			list = bdao.getBook(startRow, endRow);
			count = bdao.countBook(); 
		}else{
			list = bdao.getBookByTitle(startRow, endRow, title);
			count = bdao.countBook(title); 
		}
		
	
		%>
		<div class="box">
		검색결과 : 총 <%= count %> 권
		</div>
		<%
		if(count < 1){%>
			<div class="box">
				<table border="1" width="90%" cellpadding = "5px">
					<tr>
						<td align="center"> &lt;등록된 책 없거나 검색결과에 맞는 책이 없음.&gt; </td>
					</tr>
				</table>
			</div>
		<%}else{
		
		
		for(bookDTO bdto : list){
		String book_img = request.getContextPath()+"/images/"+bdto.getB_image();
		%>
			<div class="box">
				<table border="1" width="90%" cellpadding="5px">
					<tr>
						<td colspan="2"><input type="checkbox"></td>
					</tr>
					<tr>
						<td align="center" width="30%">
							<img src="<%= book_img %>" width="100px" height="150px;">
						</td>
						<td>
							<%for(int i = 0; i<s_code.length;i++){
								if(bdto.getS_code().equals(s_code[i])){
									out.print("["+subject[i]+"]<br>");				
								}
							}%>
							<font color="Blue" size="5">
								<a href="" onclick="popup('<%=bdto.getTitle()%>')">
								<%= bdto.getTitle() %>
								</a>
							</font><br><br>
							<font color="gray" size="2">
								<%= bdto.getWriter() %> 지음 | <%= bdto.getPublisher()  %> | <%= bdto.getP_date() %> 출간
							</font>
						</td>
					</tr>
					<tr>
						<td colspan="2">
							▶대출가능 여부 : 
							<% if(bdto.getPossible().equals("가능")){ %>
							<font color="blue" style="font-weight: bold"><%= bdto.getPossible() %></font>
							<%}else if(bdto.getPossible().equals("불가능")){
								%><font color="red" style="font-weight: bold"><%= bdto.getPossible() %></font>
							<%	} %>
							
						</td>
					</tr>
				</table>
			</div>
			<% }
		}
				if(count > 0){
					int pageCount = count / pageSize + (count % pageSize == 0? 0:1);
					int pageBlock = 5;
					int startPage = ((currentPage - 1) / pageBlock * pageBlock) +1;
					int endPage = startPage + pageBlock - 1;
					
					if(endPage > pageCount) endPage = pageCount;
					if(startPage > pageBlock) {%>
						<a href="search_title.jsp?pageNum=<%=startPage-pageBlock %>&title=<%=request.getParameter("title")%>">[이전]</a>
					<%}
					for(int i=startPage;i<=endPage;i++){%>
						<a href="search_title.jsp?pageNum=<%= i %>&title=<%=request.getParameter("title")%>">[<%= i %>]</a>
					<%}
					if(endPage < pageCount) {%>
						<a href="search_title.jsp?pageNum=<%=startPage+pageBlock %>&title=<%=request.getParameter("title")%>">[다음]</a>
					<%
					}
				}
			%>
		</td>
	</tr>
	
</table>

<%@ include file="../main/bottom.jsp"%>