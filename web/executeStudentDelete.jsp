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
                    String oldName = request.getParameter("oldName");
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/charusat-research-website","root","");
                    Statement st = conn.createStatement();
                    String query = "delete from students where name='"+oldName+"'";
                    st.executeUpdate(query);
                    response.sendRedirect("viewAllStudents.jsp");
               }
            }
        %>
    </body>
</html>
