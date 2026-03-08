<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Edit ${laptop.name} - Octatech LaptopShop</title>
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
                        <!-- Statistics link -->
                        <li class="nav-item">
                            <a class="nav-link d-flex align-items-center gap-1" href="${pageContext.request.contextPath}/statistics">
                                <i class="bi bi-bar-chart-fill"></i> Statistics
                            </a>
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
                            <c:when test="${not empty sessionScope.loggedInUser}">
                                <li class="nav-item dropdown">
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

        <div class="container my-5 max-w-4xl" style="max-width: 900px;">
            <div class="d-flex align-items-center mb-4">
                <a href="${pageContext.request.contextPath}/laptops/manage"
                   class="btn btn-outline-secondary rounded-pill fw-bold border-2 me-3">
                    <i class="bi bi-arrow-left me-2"></i>Back to Inventory
                </a>
                <h2 class="section-title mb-0"><i class="bi bi-pencil-square text-primary"></i> Edit Laptop</h2>
            </div>

            <div class="card shadow-lg border-0 rounded-4">
                <div class="card-header bg-white border-bottom-0 pt-4 pb-2 px-4">
                    <h4 class="fw-bold mb-0 text-dark">Updating: <span
                            class="text-primary">${laptop.name}</span> (#${laptop.id})</h4>
                </div>
                <div class="card-body p-4">
                    <form action="${pageContext.request.contextPath}/laptops/update" method="post"
                          enctype="multipart/form-data">
                        <input type="hidden" name="id" value="${laptop.id}">

                        <div class="row g-4">
                            <div class="col-md-6">
                                <label class="form-label fw-bold">Name</label>
                                <input type="text" class="form-control bg-light" name="name"
                                       value="${laptop.name}" required>
                            </div>
                            <div class="col-md-6">
                                <label class="form-label fw-bold">Brand</label>
                                <input type="text" class="form-control bg-light" name="brand"
                                       value="${laptop.brand}" required>
                            </div>
                            <div class="col-md-4">
                                <label class="form-label fw-bold">Price ($)</label>
                                <div class="input-group">
                                    <span class="input-group-text">$</span>
                                    <input type="number" step="0.01"
                                           class="form-control bg-light fw-bold text-info" name="price"
                                           value="<fmt:formatNumber value='${laptop.price}' pattern='#'/>"
                                           required>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <label class="form-label fw-bold">CPU</label>
                                <input type="text" class="form-control bg-light" name="cpu"
                                       value="${laptop.cpu}" required>
                            </div>
                            <div class="col-md-4">
                                <label class="form-label fw-bold">RAM</label>
                                <input type="text" class="form-control bg-light" name="ram"
                                       value="${laptop.ram}" required>
                            </div>
                            <div class="col-md-6">
                                <label class="form-label fw-bold">Storage</label>
                                <input type="text" class="form-control bg-light" name="storage"
                                       value="${laptop.storage}" required>
                            </div>
                            <div class="col-md-6">
                                <label class="form-label fw-bold">Color</label>
                                <input type="text" class="form-control bg-light" name="color"
                                       value="${laptop.color}" required>
                            </div>

                            <div class="col-12">
                                <label class="form-label fw-bold">Product Image</label>
                                <div
                                    class="d-flex flex-column align-items-start gap-3 p-3 bg-light rounded border">
                                    <div>
                                        <span class="text-muted small d-block mb-2">Current Image:</span>
                                        <img src="data:image/jpeg;base64,${laptop.image}"
                                             class="rounded shadow-sm"
                                             style="max-height: 120px; object-fit: contain; background: white;" />
                                    </div>
                                    <div class="w-100 mt-2">
                                        <span class="text-muted small d-block mb-2">Upload New Image
                                            (Optional):</span>
                                        <input type="file" class="form-control" name="imageFile"
                                               accept="image/*">
                                    </div>
                                </div>
                            </div>

                            <div class="col-12">
                                <label class="form-label fw-bold">Description</label>
                                <textarea class="form-control bg-light" name="description" rows="5"
                                          required>${laptop.description}</textarea>
                            </div>

                            <div class="col-md-6">
                                <div class="p-3 border rounded bg-light h-100">
                                    <label class="form-label fw-bold mb-3 d-block border-bottom pb-2">Visibility
                                        Settings</label>

                                    <div class="mb-3">
                                        <label class="fw-bold d-block mb-2 text-warning"><i
                                                class="bi bi-star-fill me-2"></i>Featured Product</label>
                                        <div class="d-flex gap-4">
                                            <div class="form-check">
                                                <input class="form-check-input" type="radio" name="isFeatured"
                                                       value="true" ${laptop.isFeatured ? 'checked' : '' }>
                                                <label class="form-check-label fw-bold">Yes</label>
                                            </div>
                                            <div class="form-check">
                                                <input class="form-check-input" type="radio" name="isFeatured"
                                                       value="false" ${laptop.isFeatured ? '' : 'checked' }>
                                                <label class="form-check-label">No</label>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="mb-0">
                                        <label class="fw-bold d-block mb-2 text-success"><i
                                                class="bi bi-patch-check-fill me-2"></i>New Arrival</label>
                                        <div class="d-flex gap-4">
                                            <div class="form-check">
                                                <input class="form-check-input" type="radio" name="isNewArrival"
                                                       value="true" ${laptop.isNewArrival ? 'checked' : '' }>
                                                <label class="form-check-label fw-bold">Yes</label>
                                            </div>
                                            <div class="form-check">
                                                <input class="form-check-input" type="radio" name="isNewArrival"
                                                       value="false" ${laptop.isNewArrival ? '' : 'checked' }>
                                                <label class="form-check-label">No</label>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-6 d-flex flex-column justify-content-end">
                                <button type="submit"
                                        class="btn btn-primary w-100 py-3 fw-bold text-white rounded-4 shadow-sm fs-5 mt-auto">
                                    <i class="bi bi-cloud-arrow-up-fill me-2"></i>Save Changes
                                </button>
                            </div>
                        </div>
                    </form>
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