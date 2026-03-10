<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="jakarta.tags.core" %>
        <%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>Manage Laptops - Octatech LaptopShop</title>
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
                        background-color: #f8fafc;
                        color: #334155;
                    }

                    /* Navbar */
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

                    /* Section Titles */
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
                        <a class="navbar-brand" href="${pageContext.request.contextPath}/"><i
                                class="bi bi-pc-display-horizontal text-primary me-2"></i>
                            Octatech Laptop Shop</a>
                        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-toggle="collapse"
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

                                <li class="nav-item">
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
                <div class="container my-5">
                    <h2 class="section-title"><i class="bi bi-gear-fill text-primary"></i> Manage Laptops</h2>

                    <c:if test="${not empty message}">
                        <div class="alert alert-info border-0 shadow-sm rounded-4"><i
                                class="bi bi-info-circle-fill me-2"></i> ${message}</div>
                    </c:if>

                    <div class="card shadow-lg mb-5 border-0 rounded-4">
                        <div class="card-header bg-white border-bottom-0 pt-4 pb-0 px-4">
                            <h4 class="fw-bold mb-0 text-success"><i class="bi bi-plus-square-fill me-2"></i>Add New
                                Laptop</h4>
                        </div>
                        <div class="card-body p-4">
                            <form action="${pageContext.request.contextPath}/laptops" method="post"
                                enctype="multipart/form-data">
                                <div class="row g-3">
                                    <div class="col-md-6">
                                        <label class="form-label fw-bold">Name</label>
                                        <input type="text" class="form-control" name="name" required
                                            placeholder="e.g. Dell XPS 15">
                                    </div>
                                    <div class="col-md-6">
                                        <label class="form-label fw-bold">Brand</label>
                                        <input type="text" class="form-control" name="brand" required
                                            placeholder="e.g. Dell">
                                    </div>
                                    <div class="col-md-4">
                                        <label class="form-label fw-bold">Price ($)</label>
                                        <input type="number" step="0.01" class="form-control" name="price" required
                                            placeholder="e.g. 1500.00">
                                    </div>
                                    <div class="col-md-4">
                                        <label class="form-label fw-bold">CPU</label>
                                        <input type="text" class="form-control" name="cpu" required
                                            placeholder="e.g. Intel Core i7 13700H">
                                    </div>
                                    <div class="col-md-4">
                                        <label class="form-label fw-bold">RAM</label>
                                        <input type="text" class="form-control" name="ram" required
                                            placeholder="e.g. 16GB LPDDR5">
                                    </div>
                                    <div class="col-md-4">
                                        <label class="form-label fw-bold">Storage</label>
                                        <input type="text" class="form-control" name="storage" required
                                            placeholder="e.g. 1TB NVMe SSD">
                                    </div>
                                    <div class="col-md-4">
                                        <label class="form-label fw-bold">Color</label>
                                        <input type="text" class="form-control" name="color" required
                                            placeholder="e.g. Silver">
                                    </div>
                                    <div class="col-md-4">
                                        <label class="form-label fw-bold">Image</label>
                                        <input type="file" class="form-control" name="imageFile" accept="image/*"
                                            required>
                                    </div>

                                    <div class="col-md-6">
                                        <label class="form-label fw-bold">Featured Product?</label>
                                        <div class="d-flex gap-3">
                                            <div class="form-check">
                                                <input class="form-check-input" type="radio" name="featured"
                                                    value="true">
                                                <label class="form-check-label text-warning fw-bold"><i
                                                        class="bi bi-star-fill me-1"></i>Yes</label>
                                            </div>
                                            <div class="form-check">
                                                <input class="form-check-input" type="radio" name="featured"
                                                    value="false" checked>
                                                <label class="form-check-label text-muted">No</label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <label class="form-label fw-bold">New Arrival?</label>
                                        <div class="d-flex gap-3">
                                            <div class="form-check">
                                                <input class="form-check-input" type="radio" name="newArrival"
                                                    value="true">
                                                <label class="form-check-label text-success fw-bold"><i
                                                        class="bi bi-patch-check-fill me-1"></i>Yes</label>
                                            </div>
                                            <div class="form-check">
                                                <input class="form-check-input" type="radio" name="newArrival"
                                                    value="false" checked>
                                                <label class="form-check-label text-muted">No</label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-12">
                                        <label class="form-label fw-bold">Description</label>
                                        <textarea class="form-control" name="description" rows="4" required
                                            placeholder="Detailed product description..."></textarea>
                                    </div>
                                    <div class="col-12 mt-4 text-end">
                                        <button type="submit"
                                            class="btn btn-success px-4 py-2 fw-bold text-white rounded-pill shadow-sm">
                                            <i class="bi bi-plus-circle-fill me-2"></i>Submit Laptop
                                        </button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>

                    <div class="card shadow-lg border-0 rounded-4">
                        <div class="card-header bg-white border-bottom-0 pt-4 pb-0 px-4">
                            <h4 class="fw-bold mb-0 text-primary"><i class="bi bi-box-seam-fill me-2"></i>Inventory List
                            </h4>
                        </div>
                        <div class="card-body p-4">
                            <div class="table-responsive border rounded-4">
                                <table class="table table-hover align-middle mb-0">
                                    <thead class="table-light">
                                        <tr>
                                            <th>Image</th>
                                            <th>ID</th>
                                            <th>Model Name</th>
                                            <th>Brand</th>
                                            <th>Price</th>
                                            <th>Core Specs</th>
                                            <th>Tags</th>
                                            <th class="text-center">Actions</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${laptops}" var="l">
                                            <tr>
                                                <td>
                                                    <div class="bg-white p-1 rounded border shadow-sm d-inline-block">
                                                        <img src="data:image/jpeg;base64,${l.image}" width="60"
                                                            style="object-fit: contain; aspect-ratio: 16/9;" />
                                                    </div>
                                                </td>
                                                <td class="text-muted fw-bold">#${l.id}</td>
                                                <td class="fw-bold text-dark">${l.name}</td>
                                                <td><span class="badge bg-secondary rounded-pill">${l.brand}</span></td>
                                                <td class="fw-bold text-info fs-5">$
                                                    <fmt:formatNumber value="${l.price}" pattern="#,###" />
                                                </td>
                                                <td>
                                                    <small class="text-muted d-block"><i class="bi bi-cpu me-1"></i>
                                                        ${l.cpu}</small>
                                                    <small class="text-muted d-block"><i class="bi bi-memory me-1"></i>
                                                        ${l.ram} | <i class="bi bi-device-hdd me-1"></i>
                                                        ${l.storage}</small>
                                                </td>
                                                <td>
                                                    <c:if test="${l.isFeatured}"><span
                                                            class="badge bg-warning text-dark me-1 border border-warning shadow-sm"><i
                                                                class="bi bi-star-fill me-1"></i>Featured</span></c:if>
                                                    <c:if test="${l.isNewArrival}"><span
                                                            class="badge bg-success shadow-sm"><i
                                                                class="bi bi-patch-check-fill me-1"></i>New</span>
                                                    </c:if>
                                                </td>
                                                <td class="text-center">
                                                    <div class="btn-group shadow-sm" role="group">
                                                        <a href="${pageContext.request.contextPath}/laptops/${l.id}"
                                                            class="btn btn-sm btn-outline-dark" title="View Detail"><i
                                                                class="bi bi-eye-fill"></i></a>
                                                        <a href="${pageContext.request.contextPath}/laptops/update/${l.id}"
                                                            class="btn btn-sm btn-outline-primary"
                                                            title="Edit Laptop"><i class="bi bi-pencil-square"></i></a>
                                                        <a href="${pageContext.request.contextPath}/laptops/delete/${l.id}"
                                                            onclick="return confirm('WARNING: Are you sure you want to completely remove ${l.name} (#${l.id}) from the database? This cannot be undone.')"
                                                            class="btn btn-sm btn-outline-danger"
                                                            title="Delete Laptop"><i class="bi bi-trash3-fill"></i></a>
                                                    </div>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                        <c:if test="${empty laptops}">
                                            <tr>
                                                <td colspan="8" class="text-center text-muted py-5">
                                                    <i class="bi bi-box-seam display-1 d-block mb-3 opacity-25"></i>
                                                    <h4>No laptops found in inventory.</h4>
                                                    <p>Use the form above to add your first product.</p>
                                                </td>
                                            </tr>
                                        </c:if>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Floating Admin Button -->
                <a href="${pageContext.request.contextPath}/laptops/manage"
                    class="btn btn-success rounded-pill fw-bold shadow-lg position-fixed bottom-0 end-0 m-4 z-3"
                    style="font-family: 'Poppins', sans-serif;">
                    <i class="bi bi-gear-fill me-2"></i> Manage Laptops
                </a>

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

                <!-- Bootstrap 5 JS Bundle -->
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
            </body>

            </html>