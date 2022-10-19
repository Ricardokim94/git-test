<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="dbconn.jsp" %>
<%
String sql = "select custno,custname, phone, address, "
       + "to_char(joindate, 'YYYY-MM-DD') as joindate, "  
       + "DECODE(grade, 'A', 'VIP', 'B', '일반', 'C', '직원') as grade, city "
       + "from member_tbl_02";
PreparedStatement stmt = con.prepareStatement(sql);
ResultSet rs = stmt.executeQuery();	
%>        
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="style.css">
</head>
<body>

<%@ include file="menu.jsp" %>

<section>
<center><h3>쇼핑회원관리프로그램</h3>
<br>

<table border="1" style="text-align:center; width:90%;"> 
  <tr>
    <td>회원번호</td>
    <td>회원성명</td>
    <td>전화번호</td>
    <td>주소</td>
    <td>가입일자</td>
    <td>고객등급</td>
    <td>거주지역</td>
  </tr>
  <%
  while(rs.next()){
  %>
    <tr>
        <td><a href="modify.jsp?custno=<%=rs.getString("custno") %>"><%=rs.getString("custno") %></a></td>
	    <td><%= rs.getString("custname") %></td>
	    <td><%= rs.getString("phone") %></td>
	    <td><%= rs.getString("address") %></td>
	    <td><%= rs.getString("joindate") %></td>
	    <td><%= rs.getString("grade") %></td>
	    <td><%= rs.getString("city") %></td>
    </tr>      
  <%	  
  }  
  %>
</table>
</center>

</section>

<%@ include file="footer.jsp" %>

</body>
</html>