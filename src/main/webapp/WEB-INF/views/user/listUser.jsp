<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Manage Users - Octatech LaptopShop</title>
        <!-- Fonts and Icons matching index.jsp -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <link
            href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600;800&family=Righteous&family=Poppins:wght@300;400;500;600;700&display=swap"
            rel="stylesheet">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">

        <style>
            body {
                font-family: 'Inter', sans-serif;
                background-color: #f8f9fa;
                display: flex;
                flex-direction: column;
                min-height: 100vh;
            }

            .navbar-custom {
                background-color: #ffffff;
                box-shadow: 0 4px 15px rgba(0, 0, 0, 0.05);
            }

            .navbar-custom .navbar-brand,
            .footer-brand {
                font-family: 'Righteous', cursive;
                font-size: 1.8rem;
                letter-spacing: 1.5px;
                background: linear-gradient(45deg, #0d6efd, #0dcaf0);
                -webkit-background-clip: text;
                background-clip: text;
                -webkit-text-fill-color: transparent;
                text-transform: uppercase;
            }

            .navbar-custom .nav-link,
            footer {
                font-family: 'Poppins', sans-serif;
            }

            .navbar-custom .nav-link {
                color: #495057;
                font-weight: 600;
            }

            .navbar-custom .nav-link:hover,
            .navbar-custom .nav-link.active {
                color: #0d6efd;
            }

            footer {
                background-color: #f1f5f9;
                color: #64748b;
                padding: 40px 0 20px;
                margin-top: auto;
                border-top: 1px solid #e2e8f0;
            }

            footer h5 {
                color: #334155;
                font-weight: 700;
                margin-bottom: 20px;
            }

            /* Dashboard styling for the list page */
            .dashboard-header {
                background: linear-gradient(45deg, #0d6efd, #0dcaf0);
                color: white;
                padding: 40px 0;
                margin-bottom: 40px;
                border-bottom-left-radius: 50px;
                border-bottom-right-radius: 50px;
            }

            .table-card {
                background: white;
                border-radius: 15px;
                box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
                overflow: hidden;
                margin-bottom: 40px;
            }

            .table-card .card-header {
                background-color: #fff;
                border-bottom: 2px solid #f8f9fa;
                padding: 20px;
                font-weight: 800;
                font-size: 1.25rem;
            }

            .table> :not(caption)>*>* {
                padding: 1rem;
                vertical-align: middle;
            }

            .badge-admin {
                background-color: rgba(220, 53, 69, 0.1);
                color: #dc3545;
                font-weight: 700;
                padding: 6px 10px;
                border-radius: 20px;
            }

            .badge-user {
                background-color: rgba(13, 110, 253, 0.1);
                color: #0d6efd;
                font-weight: 700;
                padding: 6px 10px;
                border-radius: 20px;
            }
        </style>
    </head>

    <body>
        <!-- Navbar -->
        <nav class="navbar navbar-expand-lg navbar-custom sticky-top">
            <div class="container">
                <a class="navbar-brand" href="${pageContext.request.contextPath}/">
                    <i class="bi bi-pc-display-horizontal text-primary me-2"></i>Octatech Laptop Shop
                </a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav ms-auto align-items-center">
                        <li class="nav-item">
                            <a class="nav-link" href="${pageContext.request.contextPath}/">Home</a>
                        </li>
                        <li class="nav-item">
                            <c:if test="${sessionScope.user.role == 'ROLE_ADMIN'}">
                                <a class="nav-link" href="${pageContext.request.contextPath}/statistics"
                                   style="white-space: nowrap;">
                                    <i class="bi bi-bar-chart-fill"></i> Statistics
                                </a>
                            </c:if>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link position-relative" href="${pageContext.request.contextPath}/cart"
                               style="white-space: nowrap;">
                                <i class="bi bi-cart3 fs-5"></i> Cart
                                <c:if test="${not empty sessionScope.cartCount and sessionScope.cartCount > 0}">
                                    <span
                                        class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger"
                                        style="margin-left: -15px; margin-top: 10px;">
                                        ${sessionScope.cartCount}
                                    </span>
                                </c:if>
                            </a>
                        </li>
                        <c:choose>
                            <c:when test="${not empty sessionScope.user}">
                                <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle" href="#" role="button"
                                       data-bs-toggle="dropdown">
                                        <i class="bi bi-person-circle"></i> ${sessionScope.user.name}
                                    </a>
                                    <ul class="dropdown-menu dropdown-menu-end">
                                        <li><a class="dropdown-item"
                                               href="${pageContext.request.contextPath}/profile">Profile</a></li>
                                        <li><a class="dropdown-item"
                                               href="${pageContext.request.contextPath}/change-password">Change
                                                Password</a></li>
                                        <li>
                                            <hr class="dropdown-divider">
                                        </li>
                                        <li><a class="dropdown-item text-danger"
                                               href="${pageContext.request.contextPath}/logout">Logout</a></li>
                                    </ul>
                                </li>
                            </c:when>
                            <c:otherwise>
                                <li class="nav-item d-flex align-items-center">
                                    <a class="btn btn-outline-primary ms-2 px-4 rounded-pill fw-bold"
                                       style="border-width:2px;"
                                       href="${pageContext.request.contextPath}/login">Login</a>
                                </li>
                                <li class="nav-item d-flex align-items-center">
                                    <a class="btn btn-primary ms-2 px-4 rounded-pill text-white fw-bold shadow-sm"
                                       href="${pageContext.request.contextPath}/register">Register</a>
                                </li>
                            </c:otherwise>
                        </c:choose>
                    </ul>
                </div>
            </div>
        </nav>

        <!-- Header Box -->
        <div class="dashboard-header text-center">
            <div class="container">
                <h1 class="display-5 fw-bold"><i class="bi bi-people-fill me-2"></i> User Management</h1>
                <p class="lead mb-0 opacity-75">Admin panel to view and modify system users</p>
            </div>
        </div>

        <!-- Main Content -->
        <div class="container flex-grow-1">

            <div class="table-card">
                <div class="card-header d-flex justify-content-between align-items-center">
                    <span><i class="bi bi-person-lines-fill text-primary me-2"></i> Registered Accounts</span>
                </div>
                <div class="table-responsive">
                    <table class="table table-hover mb-0 align-middle">
                        <thead class="table-light text-uppercase text-secondary"
                               style="font-size: 0.85rem; letter-spacing: 0.5px;">
                            <tr>
                                <th class="ps-4">ID</th>
                                <th>Username</th>
                                <th>Name</th>
                                <th>Phone</th>
                                <th>Role</th>
                                <th class="text-center">Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${users}" var="u">
                                <tr>
                                    <td class="ps-4 text-muted fw-bold">#${u.id}</td>
                                    <td class="fw-bold">${u.username}</td>
                                    <td>${u.name}</td>
                                    <td class="text-muted"><i class="bi bi-telephone small me-1"></i> ${not empty
                                                                                                        u.phone ? u.phone : '-'}</td>
                                    <td>
                                        <span
                                            class="badge ${u.role == 'ROLE_ADMIN' ? 'badge-admin' : 'badge-user'}">
                                            <i
                                                class="bi ${u.role == 'ROLE_ADMIN' ? 'bi-shield-lock-fill' : 'bi-person-badge'} me-1"></i>
                                            ${u.role == 'ROLE_ADMIN' ? 'Admin' : 'User'}
                                        </span>
                                    </td>
                                    <td>
                                        <div class="d-flex justify-content-center gap-2">
                                            

                                            <c:if test="${u.username != 'ADMIN'}">
                                                <c:choose>
                                                    <c:when test="${u.role == 'ROLE_USER'}">
                                                        <a href="${pageContext.request.contextPath}/users/promote/${u.id}"
                                                           class="btn btn-sm btn-outline-success rounded-pill px-3"
                                                           title="Promote to Admin">
                                                            <i class="bi bi-arrow-up-circle-fill"></i> Promote
                                                        </a>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <a href="${pageContext.request.contextPath}/users/demote/${u.id}"
                                                           class="btn btn-sm btn-outline-warning rounded-pill px-3"
                                                           title="Demote to User">
                                                            <i class="bi bi-arrow-down-circle-fill"></i> Demote
                                                        </a>
                                                    </c:otherwise>
                                                </c:choose>
                                                
                                                <a href="${pageContext.request.contextPath}/users/update/${u.id}"
                                                    class="btn btn-sm btn-outline-primary rounded-pill px-3"
                                                    title="Edit User">
                                                     <i class="bi bi-pencil-fill"></i> Edit
                                                 </a>
                                                
                                                <a href="${pageContext.request.contextPath}/users/delete/${u.id}"
                                                   onclick="return confirm('Are you sure you want to completely delete user ${u.username}?')"
                                                   class="btn btn-sm btn-outline-danger rounded-pill px-3"
                                                   title="Delete User">
                                                    <i class="bi bi-trash-fill"></i> Delete
                                                </a>
                                            </c:if>
                                        </div>
                                    </td>
                                </tr>
                            </c:forEach>
                            <c:if test="${empty users}">
                                <tr>
                                    <td colspan="6" class="text-center text-muted py-4">No users found in the
                                        system.</td>
                                </tr>
                            </c:if>
                        </tbody>
                    </table>
                </div>

                <%-- Pagination nav --%>
                <c:if test="${totalPages > 1}">
                    <nav class="mt-3 pb-3 px-3">
                        <ul class="pagination justify-content-center mb-0">
                            <li class="page-item ${currentPage == 1 ? 'disabled' : ''}">
                                <a class="page-link" href="?page=${currentPage - 1}&size=${pageSize}">
                                    <i class="bi bi-chevron-left"></i>
                                </a>
                            </li>
                            <c:forEach begin="1" end="${totalPages}" var="i">
                                <li class="page-item ${currentPage == i ? 'active' : ''}">
                                    <a class="page-link" href="?page=${i}&size=${pageSize}">${i}</a>
                                </li>
                            </c:forEach>
                            <li class="page-item ${currentPage == totalPages ? 'disabled' : ''}">
                                <a class="page-link" href="?page=${currentPage + 1}&size=${pageSize}">
                                    <i class="bi bi-chevron-right"></i>
                                </a>
                            </li>
                        </ul>
                    </nav>
                </c:if>
            </div>

        </div>

        <!-- Footer -->
        <footer>
            <div class="container">
                <div class="row">
                    <div class="col-md-6 mb-4">
                        <h5 class="footer-brand mb-3"><i
                                class="bi bi-pc-display-horizontal text-primary me-2"></i>Octatech Laptop Shop</h5>
                        <p class="text-muted">Providing premium technology solutions and the best laptops for every
                            need.</p>
                    </div>
                    <div class="col-md-6 mb-4">
                        <h5 class="fw-bold text-dark">Contact Us</h5>
                        <ul class="list-unstyled text-muted">
                            <li class="mb-2"><i class="bi bi-geo-alt-fill text-primary me-2"></i> Address: FPT
                                University, Hanoi, Vietnam</li>
                            <li class="mb-2"><i class="bi bi-person-fill text-primary me-2"></i> Leader: Pham Quoc
                                Anh</li>
                            <li class="mb-2"><i class="bi bi-telephone-fill text-primary me-2"></i> Phone:
                                0981583316</li>
                            <li class="mb-2"><i class="bi bi-envelope-fill text-primary me-2"></i> Email:
                                team8prj301@gmail.com</li>
                        </ul>
                    </div>
                </div>
                <hr class="border-secondary opacity-50">
                <div class="text-center text-muted">
                    <small>&copy; 2026 Octatech Laptop Shop - Group 8. All Rights Reserved.</small>
                </div>
            </div>
        </footer>

        <!-- Floating Admin Button -->
        <c:if test="${sessionScope.user.role == 'ROLE_ADMIN'}">
            <div class="position-fixed bottom-0 end-0 m-4 z-3 d-flex flex-column align-items-end gap-3">
                <a href="${pageContext.request.contextPath}/laptops/manage"
                   class="btn btn-success rounded-pill fw-bold shadow-lg px-4">
                    <i class="bi bi-laptop me-2"></i> Manage Laptops
                </a>
            </div>
        </c:if>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    </body>

</html>