<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Manage Users - Octatech Laptop Shop</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Righteous&family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
        <style>
            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
            }
            body {
                font-family: 'Poppins', sans-serif;
                background: #f0f4ff;
                min-height: 100vh;
                display: flex;
                flex-direction: column;
            }

            .navbar-custom {
                background: #fff;
                box-shadow: 0 4px 15px rgba(0,0,0,0.05);
                padding: 12px 0;
            }
            .navbar-brand {
                font-family: 'Righteous', cursive;
                font-size: 1.6rem;
                letter-spacing: 1.5px;
                background: linear-gradient(45deg, #0d6efd, #0dcaf0);
                -webkit-background-clip: text;
                background-clip: text;
                -webkit-text-fill-color: transparent;
                text-decoration: none;
            }
            .nav-link {
                font-family: 'Poppins', sans-serif;
                color: #495057 !important;
                font-weight: 600;
            }
            .nav-link:hover {
                color: #0d6efd !important;
            }

            .page-header {
                background: linear-gradient(135deg, #0d6efd 0%, #0dcaf0 100%);
                padding: 32px 0 28px;
                position: relative;
                overflow: hidden;
            }
            .page-header::before {
                content: '';
                position: absolute;
                width: 300px;
                height: 300px;
                background: rgba(255,255,255,0.07);
                border-radius: 50%;
                top: -100px;
                right: -60px;
            }
            .page-header h2 {
                font-family: 'Righteous', cursive;
                color: white;
                font-size: 1.8rem;
                margin-bottom: 4px;
                position: relative;
                z-index: 1;
            }
            .page-header p {
                color: rgba(255,255,255,0.8);
                font-size: 0.9rem;
                margin: 0;
                position: relative;
                z-index: 1;
            }

            .main-content {
                flex: 1;
                padding: 32px 0;
            }

            /* Stats Cards */
            .stat-card {
                background: white;
                border-radius: 16px;
                padding: 20px 24px;
                box-shadow: 0 4px 20px rgba(13,110,253,0.08);
                display: flex;
                align-items: center;
                gap: 16px;
            }
            .stat-icon {
                width: 48px;
                height: 48px;
                border-radius: 12px;
                display: flex;
                align-items: center;
                justify-content: center;
                font-size: 1.3rem;
            }
            .stat-label {
                font-size: 0.8rem;
                color: #94a3b8;
                font-weight: 600;
                text-transform: uppercase;
                letter-spacing: 0.5px;
            }
            .stat-value {
                font-size: 1.6rem;
                font-weight: 800;
                color: #1e293b;
                line-height: 1;
            }

            /* Table Card */
            .table-card {
                background: white;
                border-radius: 20px;
                box-shadow: 0 4px 20px rgba(13,110,253,0.08);
                overflow: hidden;
            }
            .table-card-header {
                padding: 20px 24px;
                border-bottom: 1px solid #f1f5f9;
                display: flex;
                align-items: center;
                justify-content: space-between;
            }
            .table-card-header h5 {
                font-weight: 700;
                color: #1e293b;
                margin: 0;
                font-size: 1rem;
            }

            .table {
                margin: 0;
            }
            .table thead th {
                background: #f8fafc;
                color: #64748b;
                font-size: 0.75rem;
                font-weight: 700;
                text-transform: uppercase;
                letter-spacing: 0.5px;
                border: none;
                padding: 14px 20px;
            }
            .table tbody td {
                padding: 14px 20px;
                vertical-align: middle;
                border-bottom: 1px solid #f8fafc;
                font-size: 0.9rem;
                color: #334155;
            }
            .table tbody tr:last-child td {
                border-bottom: none;
            }
            .table tbody tr:hover td {
                background: #f8fafc;
            }

            /* User Info Cell */
            .user-info {
                display: flex;
                align-items: center;
                gap: 10px;
            }
            .user-avatar {
                width: 36px;
                height: 36px;
                border-radius: 50%;
                background: linear-gradient(135deg, #0d6efd, #0dcaf0);
                display: flex;
                align-items: center;
                justify-content: center;
                color: white;
                font-size: 0.85rem;
                font-weight: 700;
                flex-shrink: 0;
                overflow: hidden;
            }
            .user-avatar img {
                width: 100%;
                height: 100%;
                object-fit: cover;
            }
            .user-name {
                font-weight: 600;
                color: #1e293b;
                font-size: 0.875rem;
            }
            .user-id {
                font-size: 0.75rem;
                color: #94a3b8;
            }

            /* Role Badge */
            .badge-admin {
                background: rgba(239,68,68,0.1);
                color: #dc2626;
                padding: 4px 12px;
                border-radius: 20px;
                font-size: 0.75rem;
                font-weight: 700;
                display: inline-flex;
                align-items: center;
                gap: 4px;
            }
            .badge-user {
                background: rgba(13,110,253,0.1);
                color: #0d6efd;
                padding: 4px 12px;
                border-radius: 20px;
                font-size: 0.75rem;
                font-weight: 700;
                display: inline-flex;
                align-items: center;
                gap: 4px;
            }

            /* Action Buttons */
            .btn-action {
                padding: 5px 12px;
                border-radius: 8px;
                font-size: 0.8rem;
                font-weight: 600;
                border: none;
                cursor: pointer;
                text-decoration: none;
                display: inline-flex;
                align-items: center;
                gap: 4px;
                transition: all 0.2s;
                font-family: 'Poppins', sans-serif;
            }
            .btn-edit {
                background: rgba(13,110,253,0.1);
                color: #0d6efd;
            }
            .btn-edit:hover {
                background: #0d6efd;
                color: white;
            }
            .btn-delete {
                background: rgba(239,68,68,0.1);
                color: #dc2626;
            }
            .btn-delete:hover {
                background: #dc2626;
                color: white;
            }
            .btn-promote {
                background: rgba(34,197,94,0.1);
                color: #16a34a;
            }
            .btn-promote:hover {
                background: #16a34a;
                color: white;
            }
            .btn-demote {
                background: rgba(245,158,11,0.1);
                color: #d97706;
            }
            .btn-demote:hover {
                background: #d97706;
                color: white;
            }

            .btn-back {
                display: inline-flex;
                align-items: center;
                gap: 6px;
                padding: 10px 20px;
                border: 2px solid rgba(255,255,255,0.4);
                border-radius: 12px;
                color: white;
                font-weight: 600;
                font-size: 0.875rem;
                text-decoration: none;
                transition: all 0.2s;
                font-family: 'Poppins', sans-serif;
                position: relative;
                z-index: 1;
            }
            .btn-back:hover {
                background: rgba(255,255,255,0.15);
                color: white;
            }

            footer {
                background: #f1f5f9;
                text-align: center;
                padding: 16px;
                font-size: 0.8rem;
                color: #94a3b8;
                border-top: 1px solid #e2e8f0;
            }
        </style>
    </head>
    <body>

        <!-- Navbar -->
        <nav class="navbar navbar-expand-lg navbar-custom sticky-top">
            <div class="container">
                <a class="navbar-brand" href="${pageContext.request.contextPath}/">
                    <i class="bi bi-pc-display-horizontal" style="-webkit-text-fill-color:#0d6efd;"></i>
                    Octatech Laptop Shop
                </a>
                <ul class="navbar-nav ms-auto align-items-center">
                    <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/"><i class="bi bi-house me-1"></i>Home</a></li>
                    <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/statistics"><i class="bi bi-bar-chart-fill me-1"></i>Statistics</a></li>
                    <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/cart"><i class="bi bi-cart3 me-1"></i>Cart</a></li>
                </ul>
            </div>
        </nav>

        <!-- Page Header -->
        <div class="page-header">
            <div class="container">
                <div class="d-flex align-items-center justify-content-between">
                    <div>
                        <h2><i class="bi bi-people-fill me-2"></i>Manage Users</h2>
                        <p>View, edit, promote or remove user accounts</p>
                    </div>
                    <a href="${pageContext.request.contextPath}/" class="btn-back">
                        <i class="bi bi-arrow-left"></i> Back to Home
                    </a>
                </div>
            </div>
        </div>

        <div class="main-content">
            <div class="container">

                <!-- Stats Row -->
                <div class="row g-3 mb-4">
                    <div class="col-md-4">
                        <div class="stat-card">
                            <div class="stat-icon" style="background: rgba(13,110,253,0.1);">
                                <i class="bi bi-people-fill text-primary"></i>
                            </div>
                            <div>
                                <div class="stat-label">Total Users</div>
                                <div class="stat-value">${users.size()}</div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="stat-card">
                            <div class="stat-icon" style="background: rgba(239,68,68,0.1);">
                                <i class="bi bi-shield-fill" style="color:#dc2626;"></i>
                            </div>
                            <div>
                                <div class="stat-label">Admins</div>
                                <div class="stat-value">
                                    <c:set var="adminCount" value="0"/>
                                    <c:forEach items="${users}" var="u">
                                        <c:if test="${u.role == 'ROLE_ADMIN'}">
                                            <c:set var="adminCount" value="${adminCount + 1}"/>
                                        </c:if>
                                    </c:forEach>
                                    ${adminCount}
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="stat-card">
                            <div class="stat-icon" style="background: rgba(34,197,94,0.1);">
                                <i class="bi bi-person-check-fill" style="color:#16a34a;"></i>
                            </div>
                            <div>
                                <div class="stat-label">Regular Users</div>
                                <div class="stat-value">${users.size() - adminCount}</div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Table -->
                <div class="table-card">
                    <div class="table-card-header">
                        <h5><i class="bi bi-table me-2 text-primary"></i>All Accounts</h5>
                    </div>
                    <div class="table-responsive">
                        <table class="table">
                            <thead>
                                <tr>
                                    <th>User</th>
                                    <th>Phone</th>
                                    <th>Address</th>
                                    <th>Role</th>
                                    <th>Actions</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${users}" var="u">
                                    <tr>
                                        <td>
                                            <div class="user-info">
                                                <div class="user-avatar">
                                                    <c:choose>
                                                        <c:when test="${not empty u.avatar}">
                                                            <img src="${u.avatar}" alt="avatar">
                                                        </c:when>
                                                        <c:otherwise>
                                                            ${u.name != null ? u.name.substring(0,1).toUpperCase() : u.username.substring(0,1).toUpperCase()}
                                                        </c:otherwise>
                                                    </c:choose>
                                                </div>
                                                <div>
                                                    <div class="user-name">${u.name != null ? u.name : u.username}</div>
                                                    <div class="user-id">@${u.username} · #${u.id}</div>
                                                </div>
                                            </div>
                                        </td>
                                        <td>${not empty u.phone ? u.phone : '<span style="color:#cbd5e1;">—</span>'}</td>
                                        <td>${not empty u.address ? u.address : '<span style="color:#cbd5e1;">—</span>'}</td>
                                        <td>
                                            <c:choose>
                                                <c:when test="${u.role == 'ROLE_ADMIN'}">
                                                    <span class="badge-admin"><i class="bi bi-shield-fill"></i> Admin</span>
                                                </c:when>
                                                <c:otherwise>
                                                    <span class="badge-user"><i class="bi bi-person-fill"></i> User</span>
                                                </c:otherwise>
                                            </c:choose>
                                        </td>
                                        <td>
                                            <div class="d-flex gap-2 flex-wrap">
                                                <a href="${pageContext.request.contextPath}/users/update/${u.id}" class="btn-action btn-edit">
                                                    <i class="bi bi-pencil-fill"></i> Edit
                                                </a>
                                                <c:if test="${u.username != 'ADMIN'}">
                                                    <a href="${pageContext.request.contextPath}/users/delete/${u.id}"
                                                       class="btn-action btn-delete"
                                                       onclick="return confirm('Delete user ${u.username}?')">
                                                        <i class="bi bi-trash-fill"></i> Delete
                                                    </a>
                                                    <c:choose>
                                                        <c:when test="${u.role == 'ROLE_USER'}">
                                                            <a href="${pageContext.request.contextPath}/users/promote/${u.id}" class="btn-action btn-promote">
                                                                <i class="bi bi-arrow-up-circle-fill"></i> Promote
                                                            </a>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <a href="${pageContext.request.contextPath}/users/demote/${u.id}" class="btn-action btn-demote">
                                                                <i class="bi bi-arrow-down-circle-fill"></i> Demote
                                                            </a>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </c:if>
                                            </div>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>

            </div>
        </div>

        <footer>&copy; 2026 Octatech Laptop Shop - Group 8. All Rights Reserved.</footer>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
