<%@page import="admin.bookDAO"%>
<%@page import="reserve.reserveDAO"%>
<%@page import="rental.rentalDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");
	String title = request.getParameter("title");
	String id = (String)session.getAttribute("id");
	
	rentalDAO rent = rentalDAO.getInstance();
	reserveDAO reserve = reserveDAO.getInstance();
	bookDAO book = bookDAO.getInstance();
	
	int cnt1 = rent.addRental(id, title);
	int cnt2 = reserve.delReserve(id, title);
	int cnt3 = book.updateP(title, "불가능");
			
	if(cnt1 > 0 && cnt2 > 0){
		response.sendRedirect("info.jsp");
	}
%>

