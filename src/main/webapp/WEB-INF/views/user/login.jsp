<%-- 
    Document   : createUser
    Created on : Mar 3, 2026, 2:51:55 PM
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
        <div class="login-container">
            <h2>Login</h2>

            <%-- Display error message if authentication fails --%>
            <c:if test="${not empty error}">
                <div class="error-msg">${error}</div>
            </c:if>

                <form action="${pageContext.request.contextPath}/login" method="post">
                    <div class="form-group">
                        <label for="username">Username:</label>
                        <%-- The value is pre-filled from the cookie if it exists --%>
                        <input type="text" id="username" name="username" value="${prefilledUsername}" required>
                    </div>

                    <div class="form-group">
                        <label for="password">Password:</label>
                        <input type="password" id="password" name="password" required>
                    </div>

                    <%-- NEW: Remember Me Checkbox --%>
                    <div class="form-group" style="display: flex; align-items: center; gap: 10px;">
                        <input type="checkbox" id="rememberMe" name="rememberMe" style="width: auto;">
                        <label for="rememberMe" style="margin: 0;">Remember Me</label>
                    </div>

                    <button type="submit">Login</button>
                </form>

            <div class="signup-link">
                Don't have an account? <a href="${pageContext.request.contextPath}/register">Sign up here</a>
            </div>
        </div>
    </body>
</html>
