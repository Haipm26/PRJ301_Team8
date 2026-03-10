<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="jakarta.tags.core" %>
        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Register - Octatech LaptopShop</title>
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

                .auth-card {
                    border: none;
                    border-radius: 20px;
                    box-shadow: 0 10px 30px rgba(0, 0, 0, 0.08);
                    background: white;
                    overflow: hidden;
                }

                .auth-header {
                    background: linear-gradient(45deg, #0dcaf0, #0d6efd);
                    color: white;
                    padding: 30px;
                    text-align: center;
                }

                .auth-header h2 {
                    font-weight: 800;
                    margin-bottom: 5px;
                }

                .auth-body {
                    padding: 40px;
                }

                .form-control,
                .form-select {
                    border-radius: 10px;
                    padding: 10px 15px;
                }

                .form-control:focus,
                .form-select:focus {
                    box-shadow: 0 0 0 0.25rem rgba(13, 202, 240, 0.15);
                }

                .btn-auth {
                    padding: 12px;
                    font-weight: 700;
                    letter-spacing: 0.5px;
                    border-radius: 50px;
                    background-color: #0dcaf0;
                    border-color: #0dcaf0;
                    color: white;
                }

                .btn-auth:hover {
                    background-color: #0baccc;
                    border-color: #0baccc;
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
                            <li class="nav-item d-flex align-items-center">
                                <a class="btn btn-outline-primary ms-2 px-4 rounded-pill fw-bold"
                                    style="border-width:2px;" href="${pageContext.request.contextPath}/login">Login</a>
                            </li>
                            <li class="nav-item d-flex align-items-center">
                                <a class="btn btn-primary ms-2 px-4 rounded-pill text-white fw-bold shadow-sm"
                                    href="${pageContext.request.contextPath}/register">Register</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </nav>

            <!-- Main Content -->
            <div class="container my-5 flex-grow-1 d-flex align-items-center justify-content-center">
                <div class="col-md-8 col-lg-6">
                    <div class="card auth-card">
                        <div class="auth-header">
                            <h2>Join LaptopStore</h2>
                            <p class="mb-0 text-white-50">Create your new account today</p>
                        </div>
                        <div class="auth-body">
                            <form action="${pageContext.request.contextPath}/register" method="post">

                                <div class="row g-3">
                                    <div class="col-md-6 mb-3">
                                        <label class="form-label fw-bold text-secondary text-uppercase"
                                            style="font-size: 0.8rem;">Username</label>
                                        <input type="text" class="form-control" name="username"
                                            placeholder="Choose a username" required>
                                    </div>
                                    <div class="col-md-6 mb-3">
                                        <label class="form-label fw-bold text-secondary text-uppercase"
                                            style="font-size: 0.8rem;">Password</label>
                                        <input type="password" class="form-control" name="password"
                                            placeholder="Create a password" required>
                                    </div>
                                </div>

                                <div class="mb-3">
                                    <label class="form-label fw-bold text-secondary text-uppercase"
                                        style="font-size: 0.8rem;">Full Name</label>
                                    <input type="text" class="form-control" name="name" placeholder="John Doe">
                                </div>

                                <div class="row g-3">
                                    <div class="col-md-6 mb-3">
                                        <label class="form-label fw-bold text-secondary text-uppercase"
                                            style="font-size: 0.8rem;">Phone</label>
                                        <input type="text" class="form-control" name="phone"
                                            placeholder="Contact number">
                                    </div>
                                    <div class="col-md-6 mb-3">
                                        <label class="form-label fw-bold text-secondary text-uppercase"
                                            style="font-size: 0.8rem;">Gender</label>
                                        <select class="form-select" name="gender">
                                            <option value="MALE">Male</option>
                                            <option value="FEMALE">Female</option>
                                            <option value="OTHER">Other</option>
                                        </select>
                                    </div>
                                </div>

                                <div class="mb-4">
                                    <label class="form-label fw-bold text-secondary text-uppercase"
                                        style="font-size: 0.8rem;">Address</label>
                                    <textarea class="form-control" name="address" rows="2"
                                        placeholder="Your shipping address"></textarea>
                                </div>

                                <button type="submit" class="btn btn-auth w-100 mb-4 shadow"><i
                                        class="bi bi-person-plus-fill me-2"></i> Create Account</button>

                                <div class="text-center text-muted">
                                    Already have an account? <a href="${pageContext.request.contextPath}/login"
                                        class="fw-bold text-decoration-none">Login here</a>
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

            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
        </body>

        </html>