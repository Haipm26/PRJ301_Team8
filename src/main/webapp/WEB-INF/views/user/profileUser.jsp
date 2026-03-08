<%-- 
    Document   : profileUser
    Created on : Mar 9, 2026, 2:04:54 AM
    Author     : Pham Minh Hai
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
    <title>My Profile - LaptopStore</title>
    <style>
        .profile-card { width: 400px; margin: 50px auto; border: 1px solid #ddd; padding: 20px; border-radius: 10px; }
        .label { font-weight: bold; color: #555; }
        .value { margin-bottom: 15px; }
    </style>
</head>
    <body>
        <div class="profile-card">
            <h2>User Profile</h2>
            <hr>

            <div class="label">Username:</div>
            <div class="value">${userProfile.username}</div>

            <div class="label">Full Name:</div>
            <div class="value">${not empty userProfile.name ? userProfile.name : 'Not provided'}</div>

            <div class="label">Phone:</div>
            <div class="value">${not empty userProfile.phone ? userProfile.phone : 'Not provided'}</div>

            <div class="label">Address:</div>
            <div class="value">${not empty userProfile.address ? userProfile.address : 'Not provided'}</div>

            <div class="label">Gender:</div>
            <div class="value">${userProfile.gender}</div>

            <div class="label">Account Role:</div>
            <div class="value">
                <span class="badge ${userProfile.role == 'ROLE_ADMIN' ? 'bg-danger' : 'bg-primary'}">
                    ${userProfile.role}
                </span>
            </div>

            <hr>
            <a href="${pageContext.request.contextPath}/change-password">Change Password</a> | 
            <a href="${pageContext.request.contextPath}/">Back to Home</a>
        </div>
    </body>
</html>
