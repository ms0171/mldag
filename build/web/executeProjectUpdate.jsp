<%-- 
    Document   : executeStudentUpdate
    Created on : 25 Sep, 2018, 11:58:29 PM
    Author     : Maulin Sheth
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <link href='//fonts.googleapis.com/css?family=Montserrat:400,700&subset=latin,latin-ext' rel='stylesheet' type='text/css' />
        <link href='//fonts.googleapis.com/css?family=Lora:400,700,400italic,700italic&subset=latin,latin-ext' rel='stylesheet' type='text/css' />
        <link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            if(session.getAttribute("view")!=null){
                String button = request.getParameter("button");
               if(button!=null){
                   String project = request.getParameter("project");
                   String name = request.getParameter("name");
                   String students = request.getParameter("students");
                   String faculty = request.getParameter("faculty");
                   String status = request.getParameter("status");
                   String file = request.getParameter("file");
                   String description = request.getParameter("description");
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/charusat-research-website","root","");
                    Statement st = conn.createStatement();
                   String query = "update projects set name='"+name+"',students='"+students+"',faculty='"+faculty+"',status='"+status+"',file='"+file+"',description='"+description+"' where name='"+project+"'";
                    st.executeUpdate(query);
                    response.sendRedirect("viewAllProject.jsp");
               }
            }
        %>
    </body>
</html>
