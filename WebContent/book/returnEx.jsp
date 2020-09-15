<%@page import="admin.bookDAO"%>
<%@page import="rental.rentalDTO"%>
<%@page import="rental.rentalDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%

	request.setCharacterEncoding("UTF-8");
	String title = request.getParameter("title");
	String func = request.getParameter("func");
	String id = (String)session.getAttribute("id");

	rentalDAO rent = rentalDAO.getInstance();
	bookDAO bdao = bookDAO.getInstance();
	
	String msg = "";
	int cnt = 0;
	if(func.equals("1")){//기간연장
		rentalDTO rentBean = rent.getDataByTitle(id, title);
		if(rentBean.getReturn_ex()==0){
			cnt = rent.rentExt(id, title, 7);
			msg = "7일 연장 되었습니다. [연장 가능 횟수 1회 남음]";
		}else if(rentBean.getReturn_ex()==1){
			cnt = rent.rentExt(id, title, 3);
			msg = "3일 연장 되었습니다. [연장 가능 회수 0회 남음]";
		}else if(rentBean.getReturn_ex()==2){
			msg = "연장이 불가능합니다.";
		}
	}else{//반납하기
		int c1 = 0, c2 = 0;
		c1 = rent.delData(id, title); 
		c2 = bdao.updateP(title,"가능");
		if(c1 > 0 && c2 > 0){
			msg = "반납되었습니다.";
		}
		else{
			msg ="반납 오류";
		}
	}
%>
<script type="text/javascript">
	alert('<%=msg%>');
	location.href="info.jsp";
</script>