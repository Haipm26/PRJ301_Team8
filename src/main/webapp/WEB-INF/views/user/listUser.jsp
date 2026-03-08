<%-- 
    Document   : list
    Created on : Mar 3, 2026, 2:36:08 PM
    Author     : Pham Minh Hai
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <table border="1">
            <tr>
                <th>ID</th>
                <th>Username</th>
                <th>Name</th>
                <th>Phone</th>
                <th>Role</th>
                <th>Actions</th>
            </tr>
            <c:forEach items="${users}" var="u">
                <tr>
                    <td>${u.id}</td>
                    <td>${u.username}</td>
                    <td>${u.name}</td>
                    <td>${u.phone}</td>
                    <td>${u.role}</td>
                    <td>
                        <a href="${pageContext.request.contextPath}/users/update/${u.id}">Edit</a>

                        <c:if test="${u.username != 'ADMIN'}">
                            | <a href="${pageContext.request.contextPath}/users/delete/${u.id}" 
                                 onclick="return confirm('Delete this user?')">Delete</a>

                            <c:choose>
                                <c:when test="${u.role == 'ROLE_USER'}">
                                    | <a href="${pageContext.request.contextPath}/users/promote/${u.id}">Promote</a>
                                </c:when>
                                <c:otherwise>
                                    | <a href="${pageContext.request.contextPath}/users/demote/${u.id}" style="color: orange;">Demote</a>
                                </c:otherwise>
                            </c:choose>
                        </c:if>
                    </td>
                </tr>
            </c:forEach>
                <a href="${pageContext.request.contextPath}/">BACK</a>
        </table>
    </body>
</html>
