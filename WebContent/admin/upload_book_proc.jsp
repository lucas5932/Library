<%@page import="admin.bookDTO"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="admin.bookDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");

	MultipartRequest mr = null;

	String saveFolder = "/images";
	ServletContext sc = config.getServletContext();
	String uploadDir = sc.getRealPath(saveFolder);
	int maxSize = 1024 * 1024 * 5;
	String encType = "UTF-8";

	mr = new MultipartRequest(request, uploadDir, maxSize, encType);

	Enumeration<String> files = mr.getFileNames();
	String file = (String) files.nextElement();
	String fn = mr.getFilesystemName(file);
	String requestFolder = request.getContextPath() + saveFolder;
	String fullPath = requestFolder + "/" + fn;
	
	bookDAO bdao = bookDAO.getInstance();
	int cnt = bdao.insertBook(mr);
	bookDTO bdto = bdao.makeNumber(mr.getParameter("s_code"),mr.getParameter("title")); 
	String title = bdto.getTitle();
	int h_code = bdto.getH_code();
	int w_code = bdto.getW_code();
	if(w_code==99){
		if(h_code==9){
			cnt = -1;
		}else{
			h_code += 1;
		}
		w_code = 0;
	}else{
		w_code += 1;
	}
	String msg = "";
	if (cnt > 0) {
		bdao.updateCode(title, h_code, w_code);
		msg = "도서 등록 성공";
	} else {
		msg = "도서 등록 실패";
	}
%>
<script type="text/javascript">
    	alert("<%=msg%>");
    	location.href="upload_book.jsp";
</script>
