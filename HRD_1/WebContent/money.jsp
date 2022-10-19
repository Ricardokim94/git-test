<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="dbconn.jsp" %>
<%
String sql = "SELECT  c.custno, custname, " 
          + " DECODE(grade, 'A', 'VIP','B','일반','C','직원') as grade,"
          + "sum(price) as price  "       
          + "FROM  member_tbl_02 c, money_tbl_02 m "
          + "WHERE c.custno = m.custno "
          + "GROUP BY c.custno, custname, grade "
          + "ORDER BY price desc";

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
<center><h3>회원매출조회</h3>
<br>

<table border="1" style="text-align:center; width:60%;"> 
  <tr>
    <td>회원번호</td>
    <td>회원성명</td>
    <td>고객등급</td>
    <td>매출</td>
  </tr>
  <%
  while(rs.next()){
  %>
    <tr>
        <td><%= rs.getString("custno") %></td>
	    <td><%= rs.getString("custname") %></td>
	    <td><%= rs.getString("grade") %></td>
	    <td><%= rs.getString("price") %></td>
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