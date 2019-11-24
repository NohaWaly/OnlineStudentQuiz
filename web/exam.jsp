<%-- 
    Document   : exam
    Created on : Nov 8, 2019, 7:54:17 PM
    Author     : nohaw
--%>

<%@page import="java.util.Vector"%>
<%@page import="java.util.Collections"%>
<%@page import="java.util.ArrayList"%>
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
        <title>Exam Page</title>
                <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <style> 
        body{
            background-image: url("assets/3201.jpg");
             background-repeat: no-repeat;
             background-position: center;
             background-attachment: fixed;
             background-size: cover;
            }
            #exam h3, button{
                text-align: center;
                
            }
        form{
             margin-top: 50px; 
             padding:20px;
             background-color: white;
            }
         </style>   
    </head>
    <body>
        <div class="container">
            <div class="row">
                <div class="col" id="exam">
                    
         <%
          try{
           String userid = request.getSession().getAttribute("session_userid").toString();
           Connection Con = DriverManager.getConnection("jdbc:derby://localhost:1527/student","root","root");
           Statement Stmt = Con.createStatement(); 
           String query = "select q.text, a.text, b.text, c.text, q.qid from question as q, answer as a, answer as b, answer as c where a.qid = q.qid and b.qid= q.qid and  c.qid= q.qid and a.correct = true and b.correct = false and c.correct = false order by random() fetch next 1 row only";
           PreparedStatement preparedStatement = Con.prepareStatement(query);
           ResultSet RS = preparedStatement.executeQuery();
          Vector ans = new Vector(); 
           
           while(RS.next()){
               ans.add(RS.getString(2));
               ans.add(RS.getString(3));
               ans.add(RS.getString(4));
               Collections.shuffle(ans); 
              
            %>
           
           
            
            <form method="post" action="result.jsp">
                 <h3><% out.println(RS.getString(1)); %></h3>
                <div class="form-check">
                    <input type="radio" class="form-check-input" name="answer" value="<%  out.println(ans.get(0));%>">
                    <label class="form-check-label"><% out.println(ans.get(0));%></label><br>
                     <input type="radio" class="form-check-input" name="answer" value="<%  out.println(ans.get(1));%>">
                    <label class="form-check-label"><% out.println(ans.get(1));%></label><br>
                     <input type="radio" class="form-check-input" name="answer" value="<%  out.println(ans.get(2));%>">
                     <label class="form-check-label"><% out.println(ans.get(2)); %></label><br>
                     <button type="submit" class="btn btn-primary">Submit your answer</button>
                     
                   
                </div>
             </form>
              
                     
            <% 

           
           }
               ans.clear();
                RS.close();
               Stmt.close();
               Con.close();
          }
          
          catch(Exception e){
              out.println(e); 
          }
           %>
       
            </div>
           </div>
       </div>
            
    </body>
</html>
