<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Statistics - Octatech LaptopShop</title>
        <!-- Fonts and Icons matching index.jsp -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <link
            href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600;800&family=Righteous&family=Poppins:wght@300;400;500;600;700&display=swap"
            rel="stylesheet">
        <link rel="stylesheet"
              href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">

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

            .stat-card {
                border: none;
                border-radius: 15px;
                box-shadow: 0 4px 10px rgba(0, 0, 0, 0.05);
                transition: transform 0.2s, box-shadow 0.2s;
                background-color: #fff;
                padding: 24px;
                text-align: center;
                height: 100%;
            }

            .stat-card:hover {
                transform: translateY(-5px);
                box-shadow: 0 10px 20px rgba(0, 0, 0, 0.1);
            }

            .stat-icon {
                font-size: 2.5rem;
                margin-bottom: 10px;
            }

            .stat-label {
                font-size: 0.8rem;
                color: #6c757d;
                text-transform: uppercase;
                letter-spacing: 1px;
                font-weight: 700;
                margin-bottom: 5px;
            }

            .stat-value {
                font-size: 1.8rem;
                font-weight: 800;
            }

            /* Border top matching the old colors */
            .card-blue {
                border-top: 4px solid #0d6efd;
            }

            .card-blue .stat-value {
                color: #0d6efd;
            }

            .card-green {
                border-top: 4px solid #198754;
            }

            .card-green .stat-value {
                color: #198754;
            }

            .card-red {
                border-top: 4px solid #dc3545;
            }

            .card-red .stat-value {
                color: #dc3545;
            }

            .card-orange {
                border-top: 4px solid #fd7e14;
            }

            .card-orange .stat-value {
                color: #fd7e14;
            }

            .card-purple {
                border-top: 4px solid #6f42c1;
            }

            .card-purple .stat-value {
                color: #6f42c1;
            }

            .dashboard-header {
                background: linear-gradient(45deg, #0d6efd, #0dcaf0);
                color: white;
                padding: 40px 0;
                margin-bottom: 40px;
                border-bottom-left-radius: 50px;
                border-bottom-right-radius: 50px;
            }

            .filter-section {
                background: white;
                padding: 20px;
                border-radius: 15px;
                box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
                margin-bottom: 30px;
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

            .product-img {
                width: 80px;
                height: 55px;
                object-fit: contain;
                background-color: #f8f9fa;
                border-radius: 6px;
                padding: 5px;
            }

            .price-text {
                color: #198754;
                font-weight: 700;
            }

            .badge-brand {
                background-color: rgba(13, 110, 253, 0.1);
                color: #0d6efd;
                font-weight: 700;
                padding: 8px 12px;
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
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                        data-bs-target="#navbarNav">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav ms-auto align-items-center">
                        <li class="nav-item">
                            <a class="nav-link" href="${pageContext.request.contextPath}/">Home</a>
                        </li>
                        <li class="nav-item">
                            <c:if test="${sessionScope.user.role == 'ROLE_ADMIN'}">
                                <a class="nav-link active" href="${pageContext.request.contextPath}/statistics"
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
                                               href="${pageContext.request.contextPath}/profile">Profile</a>
                                        </li>
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
                <h1 class="display-5 fw-bold"><i class="bi bi-pie-chart-fill me-2"></i> Dashboard Statistics
                </h1>
                <p class="lead mb-0 opacity-75">Analytics and performance at a glance</p>
            </div>
        </div>

        <!-- Main Content -->
        <div class="container flex-grow-1">

            <!-- Info Cards -->
            <div
                class="row row-cols-1 row-cols-sm-2 row-cols-md-3 row-cols-xl-5 g-4 mb-5 justify-content-center">
                <div class="col">
                    <div class="stat-card card-blue">
                        <div class="stat-icon text-primary"><i class="bi bi-box-seam"></i></div>
                        <div class="stat-label">Total Products</div>
                        <div class="stat-value">${count}</div>
                    </div>
                </div>
                <div class="col">
                    <div class="stat-card card-green">
                        <div class="stat-icon text-success"><i class="bi bi-graph-up-arrow"></i></div>
                        <div class="stat-label">Highest Price</div>
                        <div class="stat-value">$
                            <fmt:formatNumber value="${maxPrice}" pattern="#,###" />
                        </div>
                    </div>
                </div>
                <div class="col">
                    <div class="stat-card card-red">
                        <div class="stat-icon text-danger"><i class="bi bi-graph-down-arrow"></i></div>
                        <div class="stat-label">Lowest Price</div>
                        <div class="stat-value">$
                            <fmt:formatNumber value="${minPrice}" pattern="#,###" />
                        </div>
                    </div>
                </div>
                <div class="col">
                    <div class="stat-card card-orange">
                        <div class="stat-icon" style="color: #fd7e14;"><i class="bi bi-bar-chart-steps"></i>
                        </div>
                        <div class="stat-label">Average Price</div>
                        <div class="stat-value">$
                            <fmt:formatNumber value="${avgPrice}" pattern="#,###" />
                        </div>
                    </div>
                </div>
                <div class="col">
                    <div class="stat-card card-purple">
                        <div class="stat-icon" style="color: #6f42c1;"><i class="bi bi-cash-stack"></i></div>
                        <div class="stat-label">Total App Value</div>
                        <div class="stat-value">$
                            <fmt:formatNumber value="${sumPrice}" pattern="#,###" />
                        </div>
                    </div>
                </div>
            </div>

            <!-- Filters -->
            <div class="filter-section">
                <h5 class="fw-bold mb-3"><i class="bi bi-funnel text-primary me-2"></i> Filter Products by Brand
                </h5>
                <form action="${pageContext.request.contextPath}/statistics" method="get"
                      class="row g-3 align-items-end">
                    <div class="col-md-5">
                        <label class="form-label text-muted fw-bold small text-uppercase">Select Brand</label>
                        <select name="brand" class="form-select">
                            <option value="">-- All Brands --</option>
                            <c:forEach items="${brands}" var="b">
                                <option value="${b}" ${b==selectedBrand ? 'selected' : '' }>${b}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="col-md-5">
                        <label class="form-label text-muted fw-bold small text-uppercase">Sort Price</label>
                        <select name="sort" class="form-select">
                            <option value="desc" ${sort=='desc' ? 'selected' : '' }>Highest Price First</option>
                            <option value="asc" ${sort=='asc' ? 'selected' : '' }>Lowest Price First</option>
                        </select>
                    </div>
                    <div class="col-md-2">
                        <button type="submit" class="btn btn-primary w-100 py-2"><i class="bi bi-search"></i>
                            View</button>
                    </div>
                </form>
            </div>

            <!-- Products Table -->
            <c:if test="${not empty laptops}">
                <div class="table-card">
                    <div class="card-header d-flex justify-content-between align-items-center">
                        <span><i class="bi bi-laptop text-primary me-2"></i> Products by:
                            ${selectedBrand}</span>
                    </div>
                    <div class="table-responsive">
                        <table class="table table-hover mb-0 align-middle">
                            <thead class="table-light text-uppercase text-secondary"
                                   style="font-size: 0.85rem; letter-spacing: 0.5px;">
                                <tr>
                                    <th class="ps-4">ID</th>
                                    <th>Image</th>
                                    <th>Product Name</th>
                                    <th>Price</th>
                                    <th>CPU</th>
                                    <th>RAM</th>
                                    <th>Storage</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${laptops}" var="l">
                                    <tr>
                                        <td class="ps-4 text-muted fw-bold">#${l.id}</td>
                                        <td>
                                            <c:choose>
                                                <c:when test="${not empty l.image}">
                                                    <img src="data:image/jpeg;base64,${l.image}"
                                                         class="product-img" alt="Laptop" />
                                                </c:when>
                                                <c:otherwise>
                                                    <div
                                                        class="product-img d-flex align-items-center justify-content-center text-muted">
                                                        <i class="bi bi-image"></i></div>
                                                    </c:otherwise>
                                                </c:choose>
                                        </td>
                                        <td class="fw-bold">${l.name}</td>
                                        <td class="price-text">$
                                            <fmt:formatNumber value="${l.price}" pattern="#,###" />
                                        </td>
                                        <td class="text-muted"><i class="bi bi-cpu small me-1"></i> ${l.cpu}
                                        </td>
                                        <td class="text-muted"><i class="bi bi-memory small me-1"></i> ${l.ram}
                                        </td>
                                        <td class="text-muted"><i class="bi bi-device-hdd small me-1"></i>
                                            ${l.storage}</td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </c:if>

            <!-- Brand Summary Table -->
            <div class="table-card mt-4">
                <div class="card-header d-flex justify-content-between align-items-center">
                    <span><i class="bi bi-tags text-primary me-2"></i> Inventory Summary by Brand</span>
                </div>
                <div class="table-responsive">
                    <table class="table table-hover mb-0 align-middle">
                        <thead class="table-light text-uppercase text-secondary"
                               style="font-size: 0.85rem; letter-spacing: 0.5px;">
                            <tr>
                                <th class="ps-4">Brand</th>
                                <th>Total Models</th>
                                <th>Highest Price</th>
                                <th>Lowest Price</th>
                                <th>Average Price</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${brandStats}" var="row">
                                <tr>
                                    <td class="ps-4"><span class="badge-brand">${row[0]}</span></td>
                                    <td class="fw-bold">${row[1]}</td>
                                    <td>$
                                        <fmt:formatNumber value="${row[2]}" pattern="#,###" />
                                    </td>
                                    <td>$
                                        <fmt:formatNumber value="${row[3]}" pattern="#,###" />
                                    </td>
                                    <td>$
                                        <fmt:formatNumber value="${row[4]}" pattern="#,###" />
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>

        </div>

        <!-- Footer -->
        <footer>
            <div class="container">
                <div class="row">
                    <div class="col-md-6 mb-4">
                        <h5 class="footer-brand mb-3"><i
                                class="bi bi-pc-display-horizontal text-primary me-2"></i>Octatech Laptop Shop
                        </h5>
                        <p class="text-muted">Providing premium technology solutions and the best laptops for
                            every need.</p>
                    </div>
                    <div class="col-md-6 mb-4">
                        <h5 class="fw-bold text-dark">Contact Us</h5>
                        <ul class="list-unstyled text-muted">
                            <li class="mb-2"><i class="bi bi-geo-alt-fill text-primary me-2"></i> Address: FPT
                                University, Hanoi, Vietnam</li>
                            <li class="mb-2"><i class="bi bi-person-fill text-primary me-2"></i> Leader: Pham
                                Quoc Anh</li>
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

        <!-- Floating Admin Button Configuration from Index -->
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