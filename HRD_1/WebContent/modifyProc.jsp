<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="dbconn.jsp" %>
  
<%
request.setCharacterEncoding("UTF-8");
String custno = request.getParameter("custno");
String custname = request.getParameter("custname");
String phone = request.getParameter("phone");
String address = request.getParameter("address");
String joindate = request.getParameter("joindate");
String grade = request.getParameter("grade");
String city = request.getParameter("city");

String sql = "update member_tbl_02 set "
		   + " custname=?, phone=?, address=?, grade=?, city=? "
		   + " where custno = ? ";

PreparedStatement stmt = con.prepareStatement(sql); 
	stmt.setString(1, custname);
	stmt.setString(2, phone);
	stmt.setString(3, address);
	stmt.setString(4, grade);
	stmt.setString(5, city);
	stmt.setString(6, custno);
	
	stmt.executeQuery();

out.println("<script>");
out.println("alert('회원등록이 완료 되었습니다.')");
out.println("history.back()");
out.println("</script>");

stmt.close();
con.close();

 %>