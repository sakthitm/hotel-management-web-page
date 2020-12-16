
    
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
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hotel", "root", "Sakthi_23");
            %>test<%
            String una = request.getParameter("email");
            String pd = request.getParameter("password");
            PreparedStatement ps = con.prepareStatement("select email ,password from user where email=?");
            ps.setString(1, una);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                %>test1<%
                if (rs.getString("email") == null)
                {}
                else
                {
        			String ck = rs.getString("password");
        
        			if (ck.equals(pd))  {
                        PrintWriter ou = response.getWriter();
                        con.close();
						response.sendRedirect("http://localhost:8080/hotel/bookings.html");
                	}
					else {
						response.sendRedirect("http://localhost:8080/hotel/signup.html");
					}
        		}
         	}
      }

catch (Exception e) {
            %><%=e%><%
        }

    %>

</body>
</html>