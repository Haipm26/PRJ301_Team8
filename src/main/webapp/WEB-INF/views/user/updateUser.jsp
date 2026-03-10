<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="jakarta.tags.core" %>
        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Edit User - Octatech LaptopShop</title>
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

                .admin-card {
                    border: none;
                    border-radius: 20px;
                    box-shadow: 0 10px 30px rgba(0, 0, 0, 0.08);
                    background: white;
                    overflow: hidden;
                    border-top: 5px solid #0d6efd;
                }

                .admin-header {
                    padding: 30px 40px 0;
                }

                .admin-header h2 {
                    font-weight: 800;
                    color: #212529;
                    margin-bottom: 5px;
                    display: flex;
                    align-items: center;
                }

                .admin-body {
                    padding: 30px 40px 40px;
                }

                .form-control,
                .form-select {
                    border-radius: 10px;
                    padding: 10px 15px;
                }

                .form-control:focus,
                .form-select:focus {
                    box-shadow: 0 0 0 0.25rem rgba(13, 110, 253, 0.15);
                }

                .form-control:disabled {
                    background-color: #f1f5f9;
                    color: #64748b;
                    font-weight: 600;
                }

                .btn-action {
                    padding: 12px;
                    font-weight: 700;
                    letter-spacing: 0.5px;
                    border-radius: 50px;
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

            <!-- Main Content -->
            <div class="container my-5 flex-grow-1 d-flex align-items-center justify-content-center">
                <div class="col-md-8 col-lg-7 text-start">

                    <a href="${pageContext.request.contextPath}/users/manage"
                        class="btn btn-sm btn-outline-secondary rounded-pill mb-4 px-3">
                        <i class="bi bi-arrow-left me-1"></i> Back to User List
                    </a>

                    <div class="card admin-card">
                        <div class="admin-header border-bottom pb-3">
                            <h2><i class="bi bi-person-gear text-primary me-3"></i> Edit User Profile</h2>
                            <p class="text-muted mb-0 mt-2">Modify details for <strong
                                    class="text-dark">@${user.username}</strong></p>
                        </div>

                        <div class="admin-body">
                            <form action="${pageContext.request.contextPath}/users/update" method="post">

                                <input type="hidden" name="id" value="${user.id}" />
                                <input type="hidden" name="password" value="${user.password}" />

                                <div class="row g-4">
                                    <!-- Left Column -->
                                    <div class="col-md-6">
                                        <div class="mb-3">
                                            <label class="form-label fw-bold text-secondary text-uppercase"
                                                style="font-size: 0.8rem;">Username <span
                                                    class="text-danger">*</span></label>
                                            <input type="text" class="form-control" value="${user.username}" disabled />
                                            <input type="hidden" name="username" value="${user.username}" />
                                            <div class="form-text small">Username cannot be changed.</div>
                                        </div>

                                        <div class="mb-3">
                                            <label class="form-label fw-bold text-secondary text-uppercase"
                                                style="font-size: 0.8rem;">Full Name</label>
                                            <input type="text" class="form-control" name="name" value="${user.name}"
                                                placeholder="John Doe" />
                                        </div>

                                        <div class="mb-3">
                                            <label class="form-label fw-bold text-secondary text-uppercase"
                                                style="font-size: 0.8rem;">Contact Phone</label>
                                            <input type="text" class="form-control" name="phone" value="${user.phone}"
                                                placeholder="Phone number" />
                                        </div>
                                    </div>

                                    <!-- Right Column -->
                                    <div class="col-md-6">
                                        <div class="mb-3">
                                            <label class="form-label fw-bold text-secondary text-uppercase"
                                                style="font-size: 0.8rem;">Address</label>
                                            <textarea class="form-control" name="address" rows="3"
                                                placeholder="Home or delivery address">${user.address}</textarea>
                                        </div>

                                        <div class="mb-3">
                                            <label class="form-label fw-bold text-secondary text-uppercase"
                                                style="font-size: 0.8rem;">Gender</label>
                                            <select class="form-select" name="gender">
                                                <option value="MALE" ${user.gender=='MALE' ? 'selected' : '' }>Male
                                                </option>
                                                <option value="FEMALE" ${user.gender=='FEMALE' ? 'selected' : '' }>
                                                    Female</option>
                                                <option value="OTHER" ${user.gender=='OTHER' ? 'selected' : '' }>Other
                                                </option>
                                            </select>
                                        </div>

                                        <div class="mb-3">
                                            <label class="form-label fw-bold text-secondary text-uppercase"
                                                style="font-size: 0.8rem;">System Role</label>
                                            <select class="form-select" name="role">
                                                <option value="ROLE_USER" ${user.role=='ROLE_USER' ? 'selected' : '' }>
                                                    User</option>
                                                <option value="ROLE_ADMIN" ${user.role=='ROLE_ADMIN' ? 'selected' : ''
                                                    }>Admin</option>
                                            </select>
                                            <div class="form-text text-danger small"><i
                                                    class="bi bi-exclamation-triangle"></i> Warning: Changing role
                                                grants broad access.</div>
                                        </div>
                                    </div>
                                </div>

                                <hr class="my-4 border-light">

                                <div class="d-flex gap-3 justify-content-end mt-4">
                                    <a href="${pageContext.request.contextPath}/users/manage"
                                        class="btn btn-light btn-action text-secondary border px-4">Cancel</a>
                                    <button type="submit" class="btn btn-primary btn-action px-5 shadow"><i
                                            class="bi bi-floppy-fill me-2"></i> Save Changes</button>
                                </div>
                            </form>
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

            <!-- Floating Admin Button -->
            <c:if test="${sessionScope.user.role == 'ROLE_ADMIN'}">
                <div class="position-fixed bottom-0 end-0 m-4 z-3 d-flex flex-column align-items-end gap-3">
                    <a href="${pageContext.request.contextPath}/users/manage"
                        class="btn btn-primary rounded-pill fw-bold shadow-lg px-4">
                        <i class="bi bi-people-fill me-2"></i> Manage Users
                    </a>
                    <a href="${pageContext.request.contextPath}/laptops/manage"
                        class="btn btn-success rounded-pill fw-bold shadow-lg px-4">
                        <i class="bi bi-laptop me-2"></i> Manage Laptops
                    </a>
                </div>
            </c:if>

            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
        </body>

        </html>