

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <%
            String msg = "";
            if (request.getParameter("msg") != null) {
                msg = request.getParameter("msg");
            }
        %>
        <script type="text/javascript">
            
            function fun()
            {
                window.location='Login_mp.jsp?msg=<%=msg%>';
             
            }
         
            
        </script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body style="color:blueviolet" onload="setTimeout('fun()',6000)">
        <h3>Sign up completed Succesfully. A confirmation email with activation number has been sent to your email.. Please activate your account using the activation code asked when you Login...
            <br/><br/>Redirecting to Login Page in 5 seconds....
        </h3>
    </body>
</html>



