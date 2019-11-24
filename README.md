# OnlineStudentQuiz
The goal of this project is to develop a website for online tests which can be auto evaluted.

-Login.HTML where student have to enter his/her ID and password to login

-Once the student pressed login button, the servlet page called “validate” is fired. In this
page you have to connect to the database and check whether the entered ID and password
exist in student table or not. If those ID and password were existed declare a session to
store that parameters (ID, password) in it, then redirect to the third page “student.jsp”. On
the other hand, if those ID and password weren’t existed redirect back to login.HTML.

-In “student.jsp” you have to check whether the logged in student had took the exam before
or not –by checking if he/she exists in “Students answers “table or not- If he wasn’t he/she
wasn’t existed you have to allow him press button “start exam”, consequently redirect to
the final page called “exam.jsp”. On the other hand, if he was existed this button must be
impressed.

-Once the student pressed the button “start exam” and was redirected to the final page
called “exam.jsp”, the system has to select a random question with 3 random answers of
that question 1 correct and 2 incorrect. Each answer appeared with check box. Once the
student choose one answer and press “submit”, a new record with SID, QID, AID will be
added to “Students answers”.

