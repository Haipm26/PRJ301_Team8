<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>My Profile - Octatech LaptopShop</title>
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

            .navbar-custom .nav-link:hover {
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

            .profile-card {
                border: none;
                border-radius: 20px;
                box-shadow: 0 10px 30px rgba(0, 0, 0, 0.08);
                background: white;
                overflow: hidden;
            }

            .profile-header {
                background: linear-gradient(45deg, #0d6efd, #0dcaf0);
                color: white;
                padding: 40px;
                text-align: center;
            }

            .profile-header h2 {
                font-weight: 800;
                margin-bottom: 5px;
            }

            .profile-avatar {
                width: 100px;
                height: 100px;
                background: rgba(255, 255, 255, 0.2);
                border-radius: 50%;
                display: flex;
                align-items: center;
                justify-content: center;
                font-size: 3rem;
                margin: 0 auto 15px;
                color: white;
                border: 3px solid rgba(255, 255, 255, 0.8);
            }

            .profile-body {
                padding: 40px;
            }

            .info-row {
                padding: 15px 0;
                border-bottom: 1px solid #f1f5f9;
            }

            .info-row:last-child {
                border-bottom: none;
            }

            .info-label {
                font-weight: 700;
                color: #64748b;
                font-size: 0.85rem;
                text-transform: uppercase;
                letter-spacing: 0.5px;
                display: block;
                margin-bottom: 5px;
            }

            .info-value {
                font-weight: 500;
                color: #1e293b;
                font-size: 1.1rem;
            }

            .badge-admin {
                background-color: #dc3545;
            }

            .badge-user {
                background-color: #0d6efd;
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
                        <c:choose>
                            <c:when test="${not empty sessionScope.user}">
                                <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle active" href="#" role="button"
                                       data-bs-toggle="dropdown">
                                        <i class="bi bi-person-circle"></i> ${sessionScope.user.name}
                                    </a>
                                    <ul class="dropdown-menu dropdown-menu-end">
                                        <li><a class="dropdown-item active"
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

        <!-- Main Content -->
        <div class="container my-5 flex-grow-1">
            <div class="row justify-content-center">
                <div class="col-md-8 col-lg-6">
                    <div class="card profile-card">
                        <div class="profile-header">
                            <div class="profile-avatar">
                                <i class="bi bi-person"></i>
                            </div>
                            <h2>${not empty userProfile.name ? userProfile.name : userProfile.username}</h2>
                            <div>
                                <span
                                    class="badge rounded-pill ${userProfile.role == 'ROLE_ADMIN' ? 'badge-admin' : 'badge-user'} fw-bold px-3 py-2 mt-2">
                                    <i
                                        class="bi ${userProfile.role == 'ROLE_ADMIN' ? 'bi-shield-lock-fill' : 'bi-person-badge'} me-1"></i>
                                    ${userProfile.role == 'ROLE_ADMIN' ? 'Administrator' : 'Customer'}
                                </span>
                            </div>
                        </div>

                        <div class="profile-body">
                            <div class="row info-row">
                                <div class="col-sm-4">
                                    <span class="info-label"><i class="bi bi-at text-primary me-1"></i>
                                        Username</span>
                                </div>
                                <div class="col-sm-8 text-sm-end">
                                    <span class="info-value">${userProfile.username}</span>
                                </div>
                            </div>

                            <div class="row info-row">
                                <div class="col-sm-4">
                                    <span class="info-label"><i class="bi bi-telephone text-primary me-1"></i>
                                        Phone</span>
                                </div>
                                <div class="col-sm-8 text-sm-end">
                                    <span class="info-value">${not empty userProfile.phone ? userProfile.phone :
                                                               '<em class="text-muted">Not provided</em>'}</span>
                                </div>
                            </div>

                            <div class="row info-row">
                                <div class="col-sm-4">
                                    <span class="info-label"><i
                                            class="bi bi-gender-ambiguous text-primary me-1"></i> Gender</span>
                                </div>
                                <div class="col-sm-8 text-sm-end">
                                    <span class="info-value">${not empty userProfile.gender ? userProfile.gender :
                                                               '<em class="text-muted">Not specified</em>'}</span>
                                </div>
                            </div>

                            <div class="row info-row">
                                <div class="col-sm-4">
                                    <span class="info-label"><i class="bi bi-geo-alt text-primary me-1"></i>
                                        Address</span>
                                </div>
                                <div class="col-sm-8 text-sm-end">
                                    <span class="info-value text-break">${not empty userProfile.address ?
                                                                          userProfile.address : '<em class="text-muted">Not provided</em>'}</span>
                                </div>
                            </div>

                            <div class="mt-4 pt-3 d-flex justify-content-center gap-3 border-top">
                                
                                <c:if test="${userProfile.username != 'ADMIN'}">
                                    <a href="${pageContext.request.contextPath}/profile/edit"
                                       class="btn btn-primary rounded-pill px-4 fw-bold">
                                        <i class="bi bi-pencil-square me-1"></i> Edit Profile
                                    </a>
                                </c:if>
                                
                                <a href="${pageContext.request.contextPath}/change-password"
                                   class="btn btn-outline-primary rounded-pill px-4 fw-bold">
                                    <i class="bi bi-key-fill me-1"></i> Change Password
                                </a>
                                
                            </div>
                        </div>
                    </div>
                </div>
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

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    </body>

</html>