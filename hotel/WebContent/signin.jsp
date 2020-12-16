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
<% 
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hotel", "root", "Sakthi_23");
            %><%
            String una = request.getParameter("email");
            String pd = request.getParameter("password");
            PreparedStatement ps = con.prepareStatement("select email ,password from users where email=?");
            ps.setString(1, una);
            ResultSet rs = ps.executeQuery();
            if(rs==null)
            {
            	%>create account if u dont have one already!<%	
            }
            while (rs.next()) {
              
                if (rs.getString("email") == null)
                {
                	%>Wrong email<%	
                }
                else
                {
        			String ck = rs.getString("password");
        
        			if (ck.equals(pd))  {
                        PrintWriter ou = response.getWriter();
                        con.close();
						response.sendRedirect("/hotel/bookings.html");
                	}
					else {
						%>wrong password.<%
						//response.sendRedirect("/hotel/signup.html");
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