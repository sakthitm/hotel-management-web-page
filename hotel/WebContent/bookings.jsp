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
<title>Booking</title>
</head>
<body>
<% 
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hotel", "root","Sakthi_23");

            String nam = request.getParameter("name");
            String numb = request.getParameter("mobile");
            String ema = request.getParameter("email");
            int nor= Integer.parseInt(request.getParameter("nor"));
            int noa= Integer.parseInt(request.getParameter("noa"));
            int noc= Integer.parseInt(request.getParameter("noc"));
            int nod= Integer.parseInt(request.getParameter("nod"));
            String fdate = request.getParameter("fdate");
            String tdate = request.getParameter("tdate");
            String services = request.getParameter("services");
            
            PreparedStatement ps = con.prepareStatement("insert into bookings(name,mobile,email,nor,noa,noc,nod,fdate,tdate,services) values(?,?,?,?,?,?,?,?,?,?)");
           
            ps.setString(1, nam);
            ps.setString(2, numb);
            ps.setString(3, ema);
            ps.setInt(4, nor);
            ps.setInt(5, noa);
            ps.setInt(6, noc);
            ps.setInt(7, nod);
            ps.setString(8,fdate);
            ps.setString(9,tdate);
            ps.setString(10,services);
            ps.executeUpdate();
            System.out.println("booking added");
            response.sendRedirect("/hotel/bill.html");
            }

catch (Exception e) {
            %><%=e%><%
        }

    %>
</body>
</html>