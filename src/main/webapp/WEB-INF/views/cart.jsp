<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="jakarta.tags.core" %>
        <%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>Your Cart - Octatech LaptopShop</title>
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

                    .cart-container {
                        background: #ffffff;
                        border-radius: 20px;
                        box-shadow: 0 10px 30px rgba(0, 0, 0, 0.05);
                        padding: 40px;
                        margin-top: 40px;
                        border: 1px solid #e9ecef;
                    }

                    .cart-item {
                        border-bottom: 1px solid #f1f5f9;
                        padding: 20px 0;
                        display: flex;
                        align-items: center;
                        transition: background-color 0.2s ease;
                    }

                    .cart-item:hover {
                        background-color: #f8f9fa;
                        border-radius: 10px;
                    }

                    .cart-item:last-child {
                        border-bottom: none;
                    }

                    .cart-item-img {
                        width: 100px;
                        height: 100px;
                        object-fit: contain;
                        background: #fff;
                        padding: 10px;
                        border-radius: 10px;
                        border: 1px solid #f1f1f1;
                    }

                    .cart-item-title {
                        font-weight: 700;
                        color: #212529;
                        font-size: 1.1rem;
                        margin-bottom: 5px;
                        text-decoration: none;
                    }

                    .cart-item-title:hover {
                        color: #0dcaf0;
                    }

                    .cart-item-price {
                        font-weight: 800;
                        color: #0dcaf0;
                    }

                    .summary-card {
                        background: #f1f5f9;
                        border-radius: 15px;
                        padding: 30px;
                        border: 1px solid #e2e8f0;
                        box-shadow: 0 5px 15px rgba(0, 0, 0, 0.03);
                    }

                    .summary-card h4 {
                        font-weight: 800;
                        margin-bottom: 20px;
                        padding-bottom: 15px;
                        border-bottom: 1px solid #cbd5e1;
                        color: #334155;
                    }

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
                                    <a class="nav-link active position-relative"
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

                <div class="container pb-5">

                    <h2 class="fw-bold mt-5 mb-4"><i class="bi bi-cart-check"></i> Shopping Cart</h2>

                    <c:if test="${not empty message}">
                        <div class="alert alert-success alert-dismissible fade show" role="alert">
                            <i class="bi bi-check-circle-fill me-2"></i> ${message}
                            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                        </div>
                    </c:if>

                    <div class="row g-4">
                        <!-- Cart Items -->
                        <div class="col-lg-8">
                            <div class="cart-container">
                                <c:choose>
                                    <c:when test="${empty cartItems}">
                                        <div class="text-center py-5">
                                            <i class="bi bi-cart-x text-muted" style="font-size: 5rem;"></i>
                                            <h4 class="mt-3">Your cart is empty.</h4>
                                            <p class="text-muted">Looks like you haven't added any products to your cart
                                                yet.</p>
                                            <a href="${pageContext.request.contextPath}/"
                                                class="btn btn-dark mt-3 rounded-pill px-4">Continue Shopping</a>
                                        </div>
                                    </c:when>
                                    <c:otherwise>
                                        <c:forEach items="${cartItems}" var="item">
                                            <div class="cart-item">
                                                <div class="me-4">
                                                    <c:choose>
                                                        <c:when test="${not empty item.laptop.image}">
                                                            <img src="data:image/jpeg;base64,${item.laptop.image}"
                                                                class="cart-item-img" alt="${item.laptop.name}">
                                                        </c:when>
                                                        <c:otherwise>
                                                            <div
                                                                class="cart-item-img d-flex align-items-center justify-content-center text-muted">
                                                                <i class="bi bi-laptop fs-1"></i>
                                                            </div>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </div>

                                                <div class="flex-grow-1">
                                                    <a href="${pageContext.request.contextPath}/laptops/${item.laptop.id}"
                                                        class="cart-item-title d-block">${item.laptop.name}</a>
                                                    <div class="text-muted small">${item.laptop.brand}</div>
                                                    <div class="cart-item-price mt-2">$
                                                        <fmt:formatNumber value="${item.laptop.price}"
                                                            pattern="#,###" />
                                                    </div>
                                                </div>

                                                <div class="mx-4">
                                                    <form action="${pageContext.request.contextPath}/cart/update"
                                                        method="post" class="d-flex align-items-center">
                                                        <input type="hidden" name="orderDetailId" value="${item.id}">
                                                        <div class="input-group input-group-sm" style="width: 100px;">
                                                            <input type="number" name="quantity"
                                                                class="form-control text-center text-dark"
                                                                value="${item.quantity}" min="1"
                                                                onchange="this.form.submit()">
                                                        </div>
                                                    </form>
                                                </div>

                                                <div class="fw-bold mx-4 text-end" style="width: 80px;">
                                                    $
                                                    <fmt:formatNumber value="${item.price}" pattern="#,###" />
                                                </div>

                                                <div>
                                                    <a href="${pageContext.request.contextPath}/cart/remove?orderDetailId=${item.id}"
                                                        class="btn btn-outline-danger btn-sm" title="Remove Item">
                                                        <i class="bi bi-trash"></i>
                                                    </a>
                                                </div>
                                            </div>
                                        </c:forEach>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </div>

                        <!-- Order Summary -->
                        <div class="col-lg-4">
                            <div class="summary-card sticky-top" style="top: 100px;">
                                <h4>Order Summary</h4>

                                <div class="d-flex justify-content-between mb-3">
                                    <span class="text-muted">Subtotal</span>
                                    <span class="fw-bold">$
                                        <fmt:formatNumber value="${totalAmount}" pattern="#,###" />
                                    </span>
                                </div>
                                <div class="d-flex justify-content-between mb-3">
                                    <span class="text-muted">Tax (0%)</span>
                                    <span class="fw-bold">$0.00</span>
                                </div>
                                <div class="d-flex justify-content-between mb-3">
                                    <span class="text-muted">Shipping</span>
                                    <span class="text-success fw-bold">Free</span>
                                </div>

                                <hr>

                                <div class="d-flex justify-content-between mb-4 mt-3">
                                    <span class="fw-bold fs-5">Total</span>
                                    <span class="fw-bold fs-4 text-info">$
                                        <fmt:formatNumber value="${totalAmount}" pattern="#,###" />
                                    </span>
                                </div>

                                <c:if test="${not empty cartItems}">
                                    <form action="${pageContext.request.contextPath}/cart/checkout" method="post">
                                        <button type="submit"
                                            class="btn btn-dark w-100 rounded-pill py-2 fw-bold fs-5">Proceed to
                                            Checkout</button>
                                    </form>
                                </c:if>
                                <a href="${pageContext.request.contextPath}/"
                                    class="btn btn-outline-secondary w-100 rounded-pill py-2 mt-3">Continue Shopping</a>
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
                                        class="bi bi-pc-display-horizontal text-primary me-2"></i>Octatech Laptop Shop
                                </h5>
                                <p class="text-muted">Providing premium technology solutions and the best laptops
                                    for every need.</p>
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

                <!-- Floating Admin Button -->
                <c:if test="${sessionScope.user.role == 'ROLE_ADMIN'}">
                    <a href="${pageContext.request.contextPath}/laptops/manage"
                        class="btn btn-success rounded-pill fw-bold shadow-lg position-fixed bottom-0 end-0 m-4 z-3"
                        style="font-family: 'Poppins', sans-serif;">
                        <i class="bi bi-gear-fill me-2"></i> Manage Laptops
                    </a>
                </c:if>

                <!-- Bootstrap 5 JS Bundle -->
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
            </body>

            </html>