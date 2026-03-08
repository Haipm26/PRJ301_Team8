<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="jakarta.tags.core" %>
        <%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>${laptop.name} - Octatech LaptopShop</title>
                <!-- Bootstrap 5 CSS -->
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
                <!-- Google Fonts -->
                <link
                    href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600;800&family=Righteous&family=Poppins:wght@300;400;500;600;700&display=swap"
                    rel="stylesheet">
                <!-- Bootstrap Icons -->
                <link rel="stylesheet"
                    href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
                <style>
                    body {
                        font-family: 'Inter', sans-serif;
                        background-color: #f8f9fa;
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

                    .product-detail-card {
                        background: white;
                        border-radius: 20px;
                        box-shadow: 0 10px 30px rgba(0, 0, 0, 0.08);
                        padding: 40px;
                        margin-top: 40px;
                    }

                    .product-image-container {
                        display: flex;
                        justify-content: center;
                        align-items: center;
                        height: 400px;
                        background: #fff;
                        border-radius: 15px;
                        padding: 20px;
                        border: 1px solid #eee;
                    }

                    .product-image-container img {
                        max-height: 100%;
                        max-width: 100%;
                        object-fit: contain;
                    }

                    .product-title {
                        font-weight: 800;
                        font-size: 2.5rem;
                        color: #212529;
                        margin-bottom: 10px;
                    }

                    .product-brand {
                        font-size: 1.1rem;
                        color: #6c757d;
                        text-transform: uppercase;
                        letter-spacing: 2px;
                        font-weight: 600;
                    }

                    .product-price {
                        font-size: 2.5rem;
                        font-weight: 800;
                        color: #0dcaf0;
                        margin: 20px 0;
                    }

                    .specs-list {
                        list-style: none;
                        padding: 0;
                        margin: 0;
                    }

                    .specs-list li {
                        padding: 15px 0;
                        border-bottom: 1px solid #eee;
                        display: flex;
                        align-items: center;
                    }

                    .specs-list li i {
                        margin-right: 15px;
                        font-size: 1.2rem;
                        color: #0d6efd;
                        width: 30px;
                        text-align: justify;
                    }

                    .specs-list li strong {
                        width: 120px;
                        display: inline-block;
                    }

                    .action-buttons .btn {
                        font-weight: 700;
                        letter-spacing: 1px;
                        padding: 12px 30px;
                    }

                    /* Similar section */
                    .similar-section {
                        margin-top: 60px;
                    }

                    /* Footer */
                    footer {
                        background-color: #f1f5f9;
                        color: #64748b;
                        padding: 40px 0 20px;
                        margin-top: 60px;
                        border-top: 1px solid #e2e8f0;
                    }

                    footer h5 {
                        color: #334155;
                        font-weight: 700;
                        margin-bottom: 20px;
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
                            <!-- Global Search Bar -->
                            <form class="d-flex mx-auto my-2 my-lg-0" action="${pageContext.request.contextPath}/"
                                method="get" style="max-width: 400px; width: 100%;">
                                <div class="input-group">
                                    <input class="form-control border-primary" type="search" name="keyword"
                                        placeholder="Search laptops..." value="${keyword}">
                                    <button class="btn btn-primary" type="submit">
                                        <i class="bi bi-search"></i>
                                    </button>
                                </div>
                            </form>

                            <ul class="navbar-nav ms-auto align-items-center">
                                <li class="nav-item">
                                    <a class="nav-link" href="${pageContext.request.contextPath}/">Home</a>
                                </li>

                                <li class="nav-item me-2">
                                    <a class="nav-link position-relative"
                                        href="${pageContext.request.contextPath}/cart">
                                        <i class="bi bi-cart3 fs-5"></i> Cart
                                        <c:if test="${not empty sessionScope.cartCount and sessionScope.cartCount > 0}">
                                            <span
                                                class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger"
                                                style="margin-left: -15px; margin-top: 10px;">
                                                ${sessionScope.cartCount}
                                                <span class="visually-hidden">items in cart</span>
                                            </span>
                                        </c:if>
                                    </a>
                                </li>
                                <c:choose>
                                    <c:when test="${not empty sessionScope.loggedInUser}">
                                        <li class="nav-item dropdown ms-2">
                                            <a class="nav-link dropdown-toggle" href="#" role="button"
                                                data-bs-toggle="dropdown">
                                                <i class="bi bi-person-circle"></i> ${sessionScope.loggedInUser.name}
                                            </a>
                                            <ul class="dropdown-menu dropdown-menu-end">
                                                <li><a class="dropdown-item"
                                                        href="${pageContext.request.contextPath}/profile">Profile</a>
                                                </li>
                                                <li>
                                                    <hr class="dropdown-divider">
                                                </li>
                                                <li><a class="dropdown-item text-danger"
                                                        href="${pageContext.request.contextPath}/auth/logout">Logout</a>
                                                </li>
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

                <div class="container">

                    <!-- Breadcrumb -->
                    <nav aria-label="breadcrumb" class="mt-4">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/"
                                    class="text-decoration-none text-info">Home</a></li>
                            <li class="breadcrumb-item"><a href="#"
                                    class="text-decoration-none text-info">${laptop.brand}</a></li>
                            <li class="breadcrumb-item active" aria-current="page">${laptop.name}</li>
                        </ol>
                    </nav>

                    <div class="product-detail-card">
                        <div class="row align-items-center g-5">

                            <!-- Image Side -->
                            <div class="col-lg-6">
                                <div class="product-image-container position-relative">
                                    <c:if test="${laptop.isFeatured}">
                                        <span
                                            class="position-absolute top-0 start-0 m-3 badge rounded-pill bg-warning text-dark fs-6">Featured</span>
                                    </c:if>
                                    <c:choose>
                                        <c:when test="${not empty laptop.image}">
                                            <img src="data:image/jpeg;base64,${laptop.image}" alt="${laptop.name}" />
                                        </c:when>
                                        <c:otherwise>
                                            <div class="text-muted text-center">
                                                <i class="bi bi-laptop" style="font-size: 8rem;"></i>
                                                <p>No Image Available</p>
                                            </div>
                                        </c:otherwise>
                                    </c:choose>
                                </div>
                            </div>

                            <!-- Info Side -->
                            <div class="col-lg-6">
                                <div class="product-brand">${laptop.brand}</div>
                                <h1 class="product-title">${laptop.name}</h1>
                                <div class="product-price">$
                                    <fmt:formatNumber value="${laptop.price}" pattern="#,###" />
                                </div>

                                <p class="text-secondary lh-lg mb-4">
                                    ${laptop.description}
                                </p>

                                <h5 class="fw-bold mb-3">Key Specifications</h5>
                                <ul class="specs-list mb-5">
                                    <li><i class="bi bi-cpu"></i> <strong>Processor</strong> <span>${laptop.cpu}</span>
                                    </li>
                                    <li><i class="bi bi-memory"></i> <strong>RAM</strong> <span>${laptop.ram}</span>
                                    </li>
                                    <li><i class="bi bi-device-hdd"></i> <strong>Storage</strong>
                                        <span>${laptop.storage}</span>
                                    </li>
                                    <li><i class="bi bi-palette"></i> <strong>Color</strong>
                                        <span>${laptop.color}</span>
                                    </li>
                                </ul>

                                <form action="${pageContext.request.contextPath}/cart/add" method="post"
                                    class="action-buttons d-flex gap-3 align-items-center">
                                    <input type="hidden" name="laptopId" value="${laptop.id}">
                                    <div class="input-group" style="width: 140px;">
                                        <button class="btn btn-outline-secondary" type="button"
                                            onclick="document.getElementById('quantity').value > 1 ? document.getElementById('quantity').value-- : null">-</button>
                                        <input type="number" name="quantity" id="quantity"
                                            class="form-control text-center text-dark" value="1" min="1" required>
                                        <button class="btn btn-outline-secondary" type="button"
                                            onclick="document.getElementById('quantity').value++">+</button>
                                    </div>
                                    <button type="submit" class="btn btn-dark rounded-pill flex-grow-1"><i
                                            class="bi bi-cart-plus"></i> Add to Cart</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Similar Products Section -->
                <c:if test="${not empty similarLaptops}">
                    <div class="similar-section mb-5 mt-5">
                        <h3 class="fw-bold mb-4">Similar Products you might like</h3>
                        <div class="row row-cols-1 row-cols-md-2 row-cols-lg-4 g-4">
                            <c:forEach items="${similarLaptops}" var="sl">
                                <div class="col">
                                    <div class="card h-100 shadow-sm border-0"
                                        style="border-radius:15px; overflow:hidden;">
                                        <div
                                            style="height:150px; background:#fff; padding:10px; display:flex; justify-content:center; align-items:center;">
                                            <c:choose>
                                                <c:when test="${not empty sl.image}">
                                                    <img src="data:image/jpeg;base64,${sl.image}"
                                                        style="max-height:100%; max-width:100%; object-fit:contain;"
                                                        alt="${sl.name}">
                                                </c:when>
                                                <c:otherwise>
                                                    <i class="bi bi-laptop text-muted" style="font-size:3rem;"></i>
                                                </c:otherwise>
                                            </c:choose>
                                        </div>
                                        <div class="card-body d-flex flex-column">
                                            <div class="text-muted small">${sl.brand}</div>
                                            <h6 class="fw-bold text-truncate" title="${sl.name}">${sl.name}</h6>
                                            <div class="text-info fw-bold mb-3">$
                                                <fmt:formatNumber value="${sl.price}" pattern="#,###" />
                                            </div>
                                            <a href="${pageContext.request.contextPath}/laptops/${sl.id}"
                                                class="btn btn-outline-dark btn-sm rounded-pill mt-auto">View</a>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                </c:if>

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
                                        Quoc
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
                <a href="${pageContext.request.contextPath}/laptops/manage"
                    class="btn btn-success rounded-pill fw-bold shadow-lg position-fixed bottom-0 end-0 m-4 z-3"
                    style="font-family: 'Poppins', sans-serif;">
                    <i class="bi bi-gear-fill me-2"></i> Manage Laptops
                </a>

                <!-- Bootstrap 5 JS Bundle -->
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
            </body>

            </html>