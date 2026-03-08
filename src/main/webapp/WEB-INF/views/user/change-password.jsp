<%-- 
    Document   : change-password
    Created on : Mar 7, 2026, 11:18:53 PM
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
        <div style="width: 350px; margin: 0 auto;">
            <h2>Change Your Password</h2>

            <c:if test="${not empty error}">
                <p style="color: red;">${error}</p>
            </c:if>
            <c:if test="${not empty message}">
                <p style="color: green;">${message}</p>
            </c:if>

            <form action="${pageContext.request.contextPath}/change-password" method="post">
                <div>
                    <label>Current Password:</label><br/>
                    <input type="password" name="oldPassword" required />
                </div>
                <br/>
                <div>
                    <label>New Password:</label><br/>
                    <input type="password" name="newPassword" required />
                </div>
                <br/>
                <div>
                    <label>Confirm New Password:</label><br/>
                    <input type="password" name="confirmPassword" required />
                </div>
                <br/>
                <button type="submit">Update Password</button>
                <a href="${pageContext.request.contextPath}/">Back to Home</a>
            </form>
        </div>
    </body>
</html>
