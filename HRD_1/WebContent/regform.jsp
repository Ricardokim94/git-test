<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="dbconn.jsp" %>    

<%
request.setCharacterEncoding("UTF-8");
String sql = "SELECT max(custno) + 1 as custno, "
		   + "TO_CHAR(sysdate, 'YYYYMMDD') as joindate FROM member_tbl_02 ";

Statement stmt = con.createStatement();
ResultSet rs = stmt.executeQuery(sql);
rs.next();
int custno = rs.getInt("custno");
String joindate = rs.getString("joindate"); 

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
<center><h3>홈쇼핑 회원 등록</h3></center>
<center>
<form name="regform" method="post" action="regProc.jsp" onsubmit="return formCheck()">
<table border="1">
  <tr>
    <td>회원번호(자동발생)</td>
    <td><input type="text" name="custno" value="<%= custno %>" readonly></td>
  </tr>
  <tr>
    <td>회원성명</td>
    <td><input type="text" name="custname" ></td>
  </tr>
  <tr>
    <td>회원전화</td>
    <td><input type="text" name="phone" style="width:300px;"></td>
  </tr>
  <tr>
    <td>회원주소</td>
    <td><input type="text" name="address" style="width:500px;"></td>
  </tr>
  <tr>
    <td>가입일자</td>
    <td><input type="text" name="joindate" value="<%= joindate %>"></td>
  </tr>
  <tr>
    <td>고객등급[A:VIP, B:일반, C:직원]</td>
    <td><input type="text" name="grade" ></td>
  </tr>
  <tr>
    <td>도시코드</td>
    <td><input type="text" name="city" ></td>
  </tr>
  <tr>
    <td colspan="2" align="center">
      <input type="submit" value="등록">
      <input type="button" value="조회" onclick="location.href='list.jsp'">
    </td>
  </tr>
</table>
</form>
</center>
</section>

<%@ include file="footer.jsp" %>

</body>
</html>










