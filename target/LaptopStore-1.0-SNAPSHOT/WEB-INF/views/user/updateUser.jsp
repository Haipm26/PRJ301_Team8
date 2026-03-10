<%-- 
    Document   : update
    Created on : Mar 9, 2026, 1:41:40 AM
    Author     : Pham Minh Hai
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
    <title>Update User - LaptopStore</title>
</head>
<body>
    <h2>Edit User: ${user.username}</h2>
    <hr>

    <form action="${pageContext.request.contextPath}/users/update" method="post">
        
        <input type="hidden" name="id" value="${user.id}" />
        <input type="hidden" name="password" value="${user.password}" />
        
        <div>
            <label>Username:</label>
            <input type="text" value="${user.username}" disabled />
            <input type="hidden" name="username" value="${user.username}" />
        </div>
        <br>

        <div>
            <label>Full Name:</label>
            <input type="text" name="name" value="${user.name}" />
        </div>
        <br>

        <div>
            <label>Phone:</label>
            <input type="text" name="phone" value="${user.phone}" />
        </div>
        <br>

        <div>
            <label>Address:</label>
            <textarea name="address">${user.address}</textarea>
        </div>
        <br>

        <div>
            <label>Gender:</label>
            <select name="gender">
                <option value="MALE" ${user.gender == 'MALE' ? 'selected' : ''}>Male</option>
                <option value="FEMALE" ${user.gender == 'FEMALE' ? 'selected' : ''}>Female</option>
                <option value="OTHER" ${user.gender == 'OTHER' ? 'selected' : ''}>Other</option>
            </select>
        </div>
        <br>

        <div>
            <label>Role:</label>
            <select name="role">
                <option value="ROLE_USER" ${user.role == 'ROLE_USER' ? 'selected' : ''}>User</option>
                <option value="ROLE_ADMIN" ${user.role == 'ROLE_ADMIN' ? 'selected' : ''}>Admin</option>
            </select>
        </div>
        <br>

        <button type="submit">Save Changes</button>
        <a href="${pageContext.request.contextPath}/users/manage">Cancel</a>
    </form>
</body>
</html>