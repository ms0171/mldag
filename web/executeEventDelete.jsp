<%-- 
    Document   : executeStudentUpdate
    Created on : 25 Sep, 2018, 11:58:29 PM
    Author     : Maulin Sheth
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            if(session.getAttribute("view")!=null){
                String button = request.getParameter("button");
               if(button!=null){
                    String oldName = request.getParameter("name");
                    String sd = request.getParameter("startdate");
                    String ed = request.getParameter("enddate");
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/charusat-research-website","root","");
                    Statement st = conn.createStatement();
                    out.print(oldName);
                    String query = "delete from events where name='"+oldName+"' and startdate='"+sd+"' and enddate='"+ed+"'";
                    st.executeUpdate(query);
                   response.sendRedirect("viewAllEvent.jsp");
               }
            }
        %>
    </body>
</html>
