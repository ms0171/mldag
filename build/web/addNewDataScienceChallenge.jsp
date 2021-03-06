<%-- 
    Document   : addNewPublication
    Created on : 9 Sep, 2018, 7:18:04 PM
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
        <title>Add New Project - MLDAG Charusat</title>
    </head>
    <body>
        <%
            boolean isGrant = true;
            if(session.getAttribute("addNewGrant")!=null){
                String user = session.getAttribute("addNewGrant").toString();
                Class.forName("com.mysql.jdbc.Driver");
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/charusat-research-website","root","");
                PreparedStatement ps;
                Statement st = conn.createStatement();
                ResultSet grants = st.executeQuery("select grants from teammembers where username='"+user+"'");
                while(grants.next()){
                    if(grants.getString("grants").equals("addDataScienceChallenge")){
                        isGrant = false;
                        String title = request.getParameter("title");
                        String description = request.getParameter("description");
                        String form = request.getParameter("form");
                        String file = request.getParameter("file");
                        if(title.trim().length()>00&&file.trim().length()>0&&form.trim().length()>0&&description.trim().length()>0){
                            ps = conn.prepareStatement("insert into datasciencechallenge(title,description,file,form) " + "values(?,?,?,?)");
                                ps.setString(1,title);
                                ps.setString(2,description);
                                ps.setString(3,file);
                                ps.setString(4,form);
                                ps.executeUpdate();
                                session.removeAttribute("addNewGrant");
                                session.invalidate();
                                response.sendRedirect("login.jsp");
                        }else{
                            response.sendRedirect("addNewDataScienceChallenge.html");
                        }
                    }
                }
                    if(isGrant){
            %>
                        <h3 style="color: red">You do not have the grants to add new data science challenge.Contact Admin to provide you this grant</h3>
                        <a href="login.jsp">Click Here to go to login Page</a>
            <%
                    }                
            }else{
                    response.sendRedirect("login.jsp");
                }
        %>
    </body>
</html>
