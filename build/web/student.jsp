<%-- 
    Document   : student
    Created on : Nov 8, 2019, 6:01:31 PM
    Author     : nohaw
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Student Page</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <style> 
        body{
            background-image: url("assets/3201.jpg");
             background-repeat: no-repeat;
             background-position: center;
             background-attachment: fixed;
             background-size: cover;
            }
            #takeexam{
                margin-top: 100px;
                text-align: center;
            }
         </style>     
    </head>
    <body>
        
        <div class="container">
            <div class="row">
                <div class="col" id="takeexam">
          <%
          String userid = request.getSession().getAttribute("session_userid").toString();
          String userpassword = session.getAttribute("session_password").toString();
          Connection Con = DriverManager.getConnection("jdbc:derby://localhost:1527/student","root","root");
          Statement Stmt = Con.createStatement(); 
          String query = "SELECT * FROM studentsanswers where sid = '" + userid + "'";
 
            PreparedStatement preparedStatement = Con.prepareStatement(query);
            ResultSet RS = preparedStatement.executeQuery();
            if(RS.next()){
           %>
           <h2>Hello Student <% out.println(userid); %> </h2> <br>
             <button type="button"  class="btn btn-secondary" disabled>Take exam</button>
             <p>You have taken exam already</p>
            <% }
            
           else{
             %> 
             <h2>Hello Student <% out.println(userid); %> </h2> <br>
             <form action="exam.jsp" method="post">
                <button type="submit" class="btn btn-primary">Take exam</button> 
                 <p>You can take the exam</p>
              </form>
            <%
            }
               Stmt.close();
               Con.close();
           %>
              </div>
           </div>
      </div> 
    </body>
</html>
