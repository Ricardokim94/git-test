<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="dbconn.jsp" %>    

<%@page import="java.text.*" %>
<%
request.setCharacterEncoding("UTF-8");
String custno = request.getParameter("custno");
String sql = "SELECT * from member_tbl_02 where custno = " + custno; 

PreparedStatement stmt = con.prepareStatement(sql);
ResultSet rs = stmt.executeQuery(sql);
rs.next();

SimpleDateFormat sf = new SimpleDateFormat("YYYY-MM-DD");
String joindate = sf.format(rs.getDate("joindate"));
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="style.css">
<script src="script.js"></script>
</head>
<body>

<%@ include file="menu.jsp" %>

<section>
<center><h3>홈쇼핑 회원정보 수정</h3></center>
<center>
<form name="regform" method="post" action="modifyProc.jsp" onsubmit="return formCheck()">
<table border="1">
  <tr>
    <td>회원번호(자동발생)</td>
    <td><input type="text" name="custno" value="<%= rs.getString("custno") %>"></td>
  </tr>
  <tr>
    <td>회원성명</td>
    <td><input type="text" name="custname" value="<%= rs.getString("custname") %>"></td>
  </tr>
  <tr>
    <td>회원전화</td>
    <td><input type="text" name="phone" value="<%= rs.getString("phone") %>"> </td>
  </tr>
  <tr>
    <td>회원주소</td>
    <td><input type="text" name="address" value="<%= rs.getString("address") %>"></td>
  </tr>
  <tr>
    <td>가입일자</td>
    <td><input type="text" name="joindate" value="<%= rs.getString("joindate") %>"></td>
  </tr>
  <tr>
    <td>고객등급[A:VIP, B:일반, C:직원]</td>
    <td><input type="text" name="grade" value="<%= rs.getString("grade") %>"></td>
  </tr>
  <tr>
    <td>도시코드</td>
    <td><input type="text" name="city" value="<%= rs.getString("city") %>"></td>
  </tr>
  <tr>
    <td colspan="2" align="center">
      <input type="submit" value="등록">
      <input type="button" value="조회">
    </td>
  </tr>
</table>
</form>
</center>
</section>

<%@ include file="footer.jsp" %>

</body>
</html>










