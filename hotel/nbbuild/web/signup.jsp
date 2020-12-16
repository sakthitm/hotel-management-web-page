<%@page import="java.io.PrintWriter"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<% String eid = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hotel", "root","Sakthi_23");

            String nam = request.getParameter("name");
            String numb = request.getParameter("number");
            String ema = request.getParameter("email");
            String pd = request.getParameter("password");
            PreparedStatement ps = con.prepareStatement("insert into user values(?,?,?,?)");
            ps.setString(1, nam);
            ps.setString(2, numb);
            ps.setString(3, ema);
            ps.setString(4, pd);
            ps.executeUpdate();
            response.sendRedirect("http://localhost:8080/hotel/signin.jsp");
            }

catch (Exception e) {
            %><%=e%><%
        }

    %>


</body>
</html>