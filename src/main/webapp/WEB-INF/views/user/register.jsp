<%-- 
    Document   : resgister
    Created on : Mar 7, 2026, 6:23:43 PM
    Author     : Pham Minh Hai
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="${pageContext.request.contextPath}/register" method="post">
            <h2>Join LaptopStore</h2>
            Username: <input type="text" name="username" required><br>
            Password: <input type="password" name="password" required><br>
            Full Name: <input type="text" name="name"><br>
            Phone: <input type="text" name="phone"><br>
            Address: <textarea name="address"></textarea><br>
            Gender: <input type="radio" name="gender" value="MALE"> male <br/>
                    <input type="radio" name="gender" value="FEMALE"> female <br/>
                    <input type="radio" name="gender" value="other"> other <br/>
            <button type="submit">Sign Up</button>
            <p>Already have an account? <a href="${pageContext.request.contextPath}/login">Login here</a></p>
        </form>
    </body>
</html>
