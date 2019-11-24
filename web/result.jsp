<%-- 
    Document   : result
    Created on : Nov 23, 2019, 4:08:55 PM
    Author     : nohaw
--%>

<%@page import="java.sql.ResultSetMetaData"%>
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
        <title>Result</title>
             <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    </head>
    <body>
     
        <%
           try{
           String userid = request.getSession().getAttribute("session_userid").toString();
           Connection Con = DriverManager.getConnection("jdbc:derby://localhost:1527/student","root","root");
           Statement Stmt = Con.createStatement(); 
           String ans = request.getParameter("answer").trim();
             
            if(ans != null) {   
             
                String query = "select aid,qid from answer where text ='" + ans+"'";
                
//                Stmt.execute(query);
//                preparedStatement.setString(1,ans);
                 
                ResultSet RS = Stmt.executeQuery(query);
//                out.println("3amlha" );
//     ResultSetMetaData rsMetaData = RS.getMetaData();
//    int numberOfColumns = rsMetaData.getColumnCount();
// out.println(numberOfColumns);
//    // get the column names; column indexes start from 1
//    for (int i = 1; i < numberOfColumns + 1; i++) {
//      String columnName = rsMetaData.getColumnName(i);
//      String tableName = rsMetaData.getTableName(i);
//      out.println(columnName);
//      out.println(tableName);
//     
//    }
//                out.print(RS.getMetaData());
                
                if(RS.next()){
           
                String ansid = RS.getString(1);
           
                String quesid = RS.getString(2);
               
                Stmt.executeUpdate("INSERT INTO STUDENTSANSWERS(QID,AID,SID) VALUES("+quesid+","+ ansid + " , '" + userid + "')");
           
                
           }
                  RS.close();
           }
             
               Stmt.close();
               Con.close();
           }
          
          catch(Exception e){
              out.println(e); 
          } 
        %>
       <div class="jumbotron">
           
            <p class="lead">Your Quiz have submitted successfully</p>
            
</div>
    </body>
</html>
