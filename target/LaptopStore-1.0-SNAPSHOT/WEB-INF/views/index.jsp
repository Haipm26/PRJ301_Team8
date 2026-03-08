<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Octatech LaptopShop - Home</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600;800&family=Righteous&family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
        <style>
            body {
                font-family: 'Inter', sans-serif;
                background-color: #f8f9fa;
            }
            .navbar-custom {
                background-color: #ffffff;
                box-shadow: 0 4px 15px rgba(0,0,0,0.05);
            }
            .navbar-custom .navbar-brand, .footer-brand {
                font-family: 'Righteous', cursive;
                font-size: 1.8rem;
                letter-spacing: 1.5px;
                background: linear-gradient(45deg, #0d6efd, #0dcaf0);
                -webkit-background-clip: text;
                background-clip: text;
                -webkit-text-fill-color: transparent;
                text-transform: uppercase;
            }
            .navbar-custom .nav-link, footer {
                font-family: 'Poppins', sans-serif;
            }
            .navbar-custom .nav-link {
                color: #495057;
                font-weight: 600;
            }
            .navbar-custom .nav-link:hover, .navbar-custom .nav-link.active {
                color: #0d6efd;
            }
            .hero {
                background: linear-gradient(45deg, #0d6efd, #0dcaf0);
                color: white;
                padding: 80px 0;
                border-bottom-left-radius: 50px;
                border-bottom-right-radius: 50px;
                margin-bottom: 40px;
                position: relative;
                overflow: hidden;
            }
            .floating-laptop {
                animation: float 4s ease-in-out infinite;
                max-width: 100%;
                height: auto;
                filter: drop-shadow(0 20px 30px rgba(0,0,0,0.3));
            }
            @keyframes float {
                0% {
                    transform: translateY(0px) rotate(0deg);
                }
                50% {
                    transform: translateY(-15px) rotate(-2deg);
                }
                100% {
                    transform: translateY(0px) rotate(0deg);
                }
            }
            .hero h1 {
                font-weight: 800;
                font-size: 3.5rem;
                margin-bottom: 20px;
                text-shadow: 0 4px 6px rgba(0,0,0,0.1);
            }
            .hero p {
                font-size: 1.25rem;
                opacity: 0.9;
            }
            .filter-section {
                background: white;
                padding: 20px;
                border-radius: 15px;
                box-shadow: 0 5px 15px rgba(0,0,0,0.05);
                margin-bottom: 30px;
            }
            .product-card {
                border: none;
                border-radius: 15px;
                transition: transform 0.3s ease, box-shadow 0.3s ease;
                overflow: hidden;
                background: white;
                box-shadow: 0 4px 10px rgba(0,0,0,0.05);
                height: 100%;
            }
            .product-card:hover {
                transform: translateY(-10px);
                box-shadow: 0 15px 30px rgba(0,0,0,0.15);
            }
            .product-img-wrapper {
                height: 200px;
                display: flex;
                align-items: center;
                justify-content: center;
                background-color: #fff;
                padding: 15px;
            }
            .product-img-wrapper img {
                max-height: 100%;
                max-width: 100%;
                object-fit: contain;
            }
            .product-title {
                font-weight: 800;
                font-size: 1.1rem;
                color: #333;
                margin-bottom: 10px;
                display: -webkit-box;
                -webkit-line-clamp: 2;
                -webkit-box-orient: vertical;
                overflow: hidden;
            }
            .product-price {
                font-weight: 800;
                color: #0dcaf0;
                font-size: 1.3rem;
            }
            .badge-featured {
                background-color: #ffc107;
                color: #000;
            }
            .badge-new {
                background-color: #198754;
            }
            .section-title {
                font-weight: 800;
                font-size: 2rem;
                color: #212529;
                margin-bottom: 30px;
                display: flex;
                align-items: center;
                gap: 15px;
            }
            .section-title::before {
                content: "";
                width: 5px;
                height: 30px;
                background-color: #0dcaf0;
                display: inline-block;
                border-radius: 3px;
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
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNav">
                    <form class="d-flex my-2 my-lg-0 ms-3" action="${pageContext.request.contextPath}/" method="get" style="max-width: 250px; width: 100%;">
                        <div class="input-group">
                            <input class="form-control border-primary" type="search" name="keyword" placeholder="Search laptops..." value="${keyword}">
                            <button class="btn btn-primary" type="submit"><i class="bi bi-search"></i></button>
                        </div>
                    </form>
                    <ul class="navbar-nav ms-auto align-items-center">
                        <li class="nav-item">
                            <a class="nav-link" href="${pageContext.request.contextPath}/">Home</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="${pageContext.request.contextPath}/statistics" style="white-space: nowrap;">
                                <i class="bi bi-bar-chart-fill"></i> Statistics
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link position-relative" href="${pageContext.request.contextPath}/cart" style="white-space: nowrap;">
                                <i class="bi bi-cart3 fs-5"></i> Cart
                                <c:if test="${not empty sessionScope.cartCount and sessionScope.cartCount > 0}">
                                    <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger" style="margin-left: -15px; margin-top: 10px;">
                                        ${sessionScope.cartCount}
                                    </span>
                                </c:if>
                            </a>
                        </li>
                        <c:choose>
                            <c:when test="${not empty sessionScope.loggedInUser}">
                                <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown">
                                        <i class="bi bi-person-circle"></i> ${sessionScope.loggedInUser.name}
                                    </a>
                                    <ul class="dropdown-menu dropdown-menu-end">
                                        <li><a class="dropdown-item" href="${pageContext.request.contextPath}/profile">Profile</a></li>
                                        <li><hr class="dropdown-divider"></li>
                                        <li><a class="dropdown-item text-danger" href="${pageContext.request.contextPath}/auth/logout">Logout</a></li>
                                    </ul>
                                </li>
                            </c:when>
                            <c:otherwise>
                                <li class="nav-item d-flex align-items-center">
                                    <a class="btn btn-outline-primary ms-2 px-4 rounded-pill fw-bold" style="border-width:2px;" href="${pageContext.request.contextPath}/login">Login</a>
                                </li>
                                <li class="nav-item d-flex align-items-center">
                                    <a class="btn btn-primary ms-2 px-4 rounded-pill text-white fw-bold shadow-sm" href="${pageContext.request.contextPath}/register">Register</a>
                                </li>
                            </c:otherwise>
                        </c:choose>
                    </ul>
                </div>
            </div>
        </nav>

        <!-- Hero Section -->
        <div class="hero">
            <div class="container">
                <div class="row align-items-center">
                    <div class="col-md-6 text-md-start text-center mb-5 mb-md-0">
                        <h1>Discover Your Perfect Machine</h1>
                        <p class="lead mb-4">High-performance laptops for gaming, professionals, and students. Unbeatable prices and quality.</p>
                        <a href="#products-section" class="btn btn-light btn-lg rounded-pill fw-bold text-primary shadow px-5">Explore Now</a>
                    </div>
                    <div class="col-md-6 text-center">
                        <img src="${pageContext.request.contextPath}/resources/img/hero-laptop.png" alt="Premium Laptop" class="img-fluid floating-laptop">
                    </div>
                </div>
            </div>
        </div>

        <div class="container" id="products-section">
            <!-- Filter Section -->
            <div class="filter-section">
                <form action="${pageContext.request.contextPath}/" method="get" class="row g-3 align-items-end">
                    <div class="col-md-5">
                        <label class="form-label fw-bold">Search (Name, Brand, Color)</label>
                        <div class="input-group">
                            <span class="input-group-text bg-white"><i class="bi bi-search"></i></span>
                            <input type="text" class="form-control border-start-0" name="keyword" value="${keyword}" placeholder="e.g. Dell, Gaming, Black...">
                        </div>
                    </div>
                    <div class="col-md-3">
                        <label class="form-label fw-bold">Sort By</label>
                        <select class="form-select" name="sort">
                            <option value="id" ${sortField=='id' ? 'selected' : ''}>Default</option>
                            <option value="price" ${sortField=='price' ? 'selected' : ''}>Price</option>
                            <option value="name" ${sortField=='name' ? 'selected' : ''}>Name A-Z</option>
                        </select>
                    </div>
                    <div class="col-md-2">
                        <label class="form-label fw-bold">Order</label>
                        <select class="form-select" name="dir">
                            <option value="asc" ${sortDir=='asc' ? 'selected' : ''}>Ascending</option>
                            <option value="desc" ${sortDir=='desc' ? 'selected' : ''}>Descending</option>
                        </select>
                    </div>
                    <div class="col-md-2">
                        <button type="submit" class="btn btn-dark w-100 py-2"><i class="bi bi-funnel"></i> Apply Filter</button>
                    </div>
                </form>
            </div>

            <!-- Featured Section -->
            <c:if test="${empty keyword and currentPage == 1}">
                <h2 class="section-title">Featured Products</h2>
                <div class="row row-cols-1 row-cols-md-2 row-cols-lg-4 g-4 mb-5">
                    <c:forEach items="${featuredLaptops}" var="l">
                        <div class="col">
                            <div class="card product-card h-100">
                                <span class="position-absolute top-0 start-0 m-3 badge rounded-pill badge-featured">Featured</span>
                                <div class="product-img-wrapper">
                                    <c:choose>
                                        <c:when test="${not empty l.image}">
                                            <img src="data:image/jpeg;base64,${l.image}" alt="${l.name}">
                                        </c:when>
                                        <c:otherwise>
                                            <div class="text-muted"><i class="bi bi-laptop" style="font-size: 4rem;"></i></div>
                                            </c:otherwise>
                                        </c:choose>
                                </div>
                                <div class="card-body d-flex flex-column">
                                    <div class="text-muted small mb-1">${l.brand}</div>
                                    <h5 class="product-title">${l.name}</h5>
                                    <div class="product-price mt-auto">$<fmt:formatNumber value="${l.price}" pattern="#,###" /></div>
                                    <a href="${pageContext.request.contextPath}/laptops/${l.id}" class="btn btn-outline-dark mt-3 rounded-pill btn-sm">View Details</a>
                                    <div class="d-flex gap-2 mt-2">
                                        <a href="${pageContext.request.contextPath}/laptops/update/${l.id}" class="btn btn-warning btn-sm rounded-pill w-50">
                                            <i class="bi bi-pencil-fill"></i> Edit
                                        </a>
                                        <a href="${pageContext.request.contextPath}/laptops/delete/${l.id}" class="btn btn-danger btn-sm rounded-pill w-50" onclick="return confirm('Are you sure?')">
                                            <i class="bi bi-trash-fill"></i> Delete
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                    <c:if test="${empty featuredLaptops}">
                        <p class="text-muted col-12 ms-3">No featured products right now.</p>
                    </c:if>
                </div>

                <h2 class="section-title">New Arrivals</h2>
                <div class="row row-cols-1 row-cols-md-2 row-cols-lg-4 g-4 mb-5">
                    <c:forEach items="${newArrivals}" var="l">
                        <div class="col">
                            <div class="card product-card h-100">
                                <span class="position-absolute top-0 start-0 m-3 badge rounded-pill badge-new">New</span>
                                <div class="product-img-wrapper">
                                    <c:choose>
                                        <c:when test="${not empty l.image}">
                                            <img src="data:image/jpeg;base64,${l.image}" alt="${l.name}">
                                        </c:when>
                                        <c:otherwise>
                                            <div class="text-muted"><i class="bi bi-laptop" style="font-size: 4rem;"></i></div>
                                            </c:otherwise>
                                        </c:choose>
                                </div>
                                <div class="card-body d-flex flex-column">
                                    <div class="text-muted small mb-1">${l.brand}</div>
                                    <h5 class="product-title">${l.name}</h5>
                                    <div class="product-price mt-auto">$<fmt:formatNumber value="${l.price}" pattern="#,###" /></div>
                                    <a href="${pageContext.request.contextPath}/laptops/${l.id}" class="btn btn-outline-dark mt-3 rounded-pill btn-sm">View Details</a>
                                    <div class="d-flex gap-2 mt-2">
                                        <a href="${pageContext.request.contextPath}/laptops/update/${l.id}" class="btn btn-warning btn-sm rounded-pill w-50">
                                            <i class="bi bi-pencil-fill"></i> Edit
                                        </a>
                                        <a href="${pageContext.request.contextPath}/laptops/delete/${l.id}" class="btn btn-danger btn-sm rounded-pill w-50" onclick="return confirm('Are you sure?')">
                                            <i class="bi bi-trash-fill"></i> Delete
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                    <c:if test="${empty newArrivals}">
                        <p class="text-muted col-12 ms-3">No new arrivals right now.</p>
                    </c:if>
                </div>
            </c:if>

            <!-- All Products -->
            <h2 class="section-title">
                <c:choose>
                    <c:when test="${not empty keyword}">Search Results for "${keyword}"</c:when>
                    <c:otherwise>All Configurations</c:otherwise>
                </c:choose>
            </h2>
            <div class="row row-cols-1 row-cols-md-2 row-cols-lg-4 g-4">
                <c:forEach items="${laptops}" var="l">
                    <div class="col">
                        <div class="card product-card h-100">
                            <c:if test="${l.isFeatured}">
                                <span class="position-absolute top-0 start-0 m-3 badge rounded-pill badge-featured">Featured</span>
                            </c:if>
                            <c:if test="${l.isNewArrival and not l.isFeatured}">
                                <span class="position-absolute top-0 start-0 m-3 badge rounded-pill badge-new">New</span>
                            </c:if>
                            <div class="product-img-wrapper">
                                <c:choose>
                                    <c:when test="${not empty l.image}">
                                        <img src="data:image/jpeg;base64,${l.image}" alt="${l.name}">
                                    </c:when>
                                    <c:otherwise>
                                        <div class="text-muted"><i class="bi bi-laptop" style="font-size: 4rem;"></i></div>
                                        </c:otherwise>
                                    </c:choose>
                            </div>
                            <div class="card-body d-flex flex-column">
                                <div class="text-muted small mb-1">${l.brand}</div>
                                <h5 class="product-title">${l.name}</h5>
                                <div class="row g-1 mb-2 small text-muted">
                                    <div class="col-6"><i class="bi bi-cpu"></i> ${l.cpu}</div>
                                    <div class="col-6"><i class="bi bi-memory"></i> ${l.ram}</div>
                                </div>
                                <div class="product-price mt-auto">$<fmt:formatNumber value="${l.price}" pattern="#,###" /></div>
                                <a href="${pageContext.request.contextPath}/laptops/${l.id}" class="btn btn-outline-dark mt-3 rounded-pill btn-sm">View Details</a>
                                <div class="d-flex gap-2 mt-2">
                                    <a href="${pageContext.request.contextPath}/laptops/update/${l.id}" class="btn btn-warning btn-sm rounded-pill w-50">
                                        <i class="bi bi-pencil-fill"></i> Edit
                                    </a>
                                    <a href="${pageContext.request.contextPath}/laptops/delete/${l.id}" class="btn btn-danger btn-sm rounded-pill w-50" onclick="return confirm('Are you sure?')">
                                        <i class="bi bi-trash-fill"></i> Delete
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
                <c:if test="${empty laptops}">
                    <div class="col-12 text-center py-5">
                        <i class="bi bi-search" style="font-size: 3rem; color: #ccc;"></i>
                        <h4 class="mt-3 text-muted">No products found</h4>
                        <p>Try adjusting your search criteria.</p>
                    </div>
                </c:if>
            </div>

            <!-- Pagination -->
            <c:if test="${totalPages > 1}">
                <nav class="mt-5">
                    <ul class="pagination justify-content-center">
                        <c:forEach begin="1" end="${totalPages}" var="i">
                            <li class="page-item ${currentPage == i ? 'active' : ''}">
                                <a class="page-link" href="?keyword=${keyword}&page=${i}&size=8&sort=${sortField}&dir=${sortDir}">${i}</a>
                            </li>
                        </c:forEach>
                    </ul>
                </nav>
            </c:if>
        </div>

        <!-- Footer -->
        <footer>
            <div class="container">
                <div class="row">
                    <div class="col-md-6 mb-4">
                        <h5 class="footer-brand mb-3"><i class="bi bi-pc-display-horizontal text-primary me-2"></i>Octatech Laptop Shop</h5>
                        <p class="text-muted">Providing premium technology solutions and the best laptops for every need.</p>
                    </div>
                    <div class="col-md-6 mb-4">
                        <h5 class="fw-bold text-dark">Contact Us</h5>
                        <ul class="list-unstyled text-muted">
                            <li class="mb-2"><i class="bi bi-geo-alt-fill text-primary me-2"></i> Address: FPT University, Hanoi, Vietnam</li>
                            <li class="mb-2"><i class="bi bi-person-fill text-primary me-2"></i> Leader: Pham Quoc Anh</li>
                            <li class="mb-2"><i class="bi bi-telephone-fill text-primary me-2"></i> Phone: 0981583316</li>
                            <li class="mb-2"><i class="bi bi-envelope-fill text-primary me-2"></i> Email: team8prj301@gmail.com</li>
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

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>