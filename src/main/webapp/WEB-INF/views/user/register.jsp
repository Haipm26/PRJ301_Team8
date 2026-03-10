<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Register - Octatech Laptop Shop</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Righteous&family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
        <style>
            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
            }

            body {
                font-family: 'Poppins', sans-serif;
                min-height: 100vh;
                background: #f0f4ff;
                display: flex;
                flex-direction: column;
            }

            /* Navbar */
            .navbar-custom {
                background: #ffffff;
                box-shadow: 0 4px 15px rgba(0,0,0,0.05);
                padding: 12px 0;
            }
            .navbar-brand {
                font-family: 'Righteous', cursive;
                font-size: 1.6rem;
                letter-spacing: 1.5px;
                background: linear-gradient(45deg, #0d6efd, #0dcaf0);
                -webkit-background-clip: text;
                background-clip: text;
                -webkit-text-fill-color: transparent;
                text-decoration: none;
            }

            /* Main Layout */
            .register-wrapper {
                flex: 1;
                display: flex;
                align-items: center;
                justify-content: center;
                padding: 40px 16px;
                position: relative;
                overflow: hidden;
            }
            .register-wrapper::before {
                content: '';
                position: absolute;
                width: 500px;
                height: 500px;
                background: radial-gradient(circle, rgba(13,110,253,0.1), transparent 70%);
                top: -100px;
                right: -100px;
                border-radius: 50%;
                pointer-events: none;
            }
            .register-wrapper::after {
                content: '';
                position: absolute;
                width: 400px;
                height: 400px;
                background: radial-gradient(circle, rgba(13,202,240,0.1), transparent 70%);
                bottom: -80px;
                left: -80px;
                border-radius: 50%;
                pointer-events: none;
            }

            .register-container {
                width: 100%;
                max-width: 620px;
                background: white;
                border-radius: 24px;
                box-shadow: 0 20px 60px rgba(13,110,253,0.12);
                overflow: hidden;
                position: relative;
                z-index: 1;
                animation: fadeUp 0.5s ease both;
            }

            @keyframes fadeUp {
                from {
                    opacity: 0;
                    transform: translateY(30px);
                }
                to   {
                    opacity: 1;
                    transform: translateY(0);
                }
            }

            /* Top Banner */
            .register-banner {
                background: linear-gradient(135deg, #0d6efd 0%, #0dcaf0 100%);
                padding: 28px 40px;
                display: flex;
                align-items: center;
                justify-content: space-between;
                position: relative;
                overflow: hidden;
            }
            .register-banner::before {
                content: '';
                position: absolute;
                width: 200px;
                height: 200px;
                background: rgba(255,255,255,0.08);
                border-radius: 50%;
                top: -80px;
                right: -40px;
            }
            .register-banner .banner-text h3 {
                font-family: 'Righteous', cursive;
                color: white;
                font-size: 1.5rem;
                margin-bottom: 4px;
            }
            .register-banner .banner-text p {
                color: rgba(255,255,255,0.8);
                font-size: 0.875rem;
                margin: 0;
            }
            .register-banner .banner-icon {
                font-size: 3rem;
                color: rgba(255,255,255,0.25);
                position: relative;
                z-index: 1;
            }

            /* Form Area */
            .register-body {
                padding: 36px 40px 40px;
            }

            .form-label {
                font-weight: 600;
                font-size: 0.85rem;
                color: #475569;
                margin-bottom: 6px;
            }
            .form-control, .form-select {
                border: 2px solid #e2e8f0;
                border-radius: 12px;
                padding: 11px 16px;
                font-size: 0.9rem;
                color: #1e293b;
                transition: all 0.2s;
                background: #f8fafc;
                font-family: 'Poppins', sans-serif;
            }
            .form-control:focus, .form-select:focus {
                border-color: #0d6efd;
                box-shadow: 0 0 0 4px rgba(13,110,253,0.1);
                background: white;
            }
            .input-group .form-control {
                border-right: none;
                border-radius: 12px 0 0 12px;
            }
            .input-group-text {
                background: #f8fafc;
                border: 2px solid #e2e8f0;
                border-left: none;
                border-radius: 0 12px 12px 0;
                color: #94a3b8;
                cursor: pointer;
                transition: all 0.2s;
            }
            .input-group:focus-within .form-control,
            .input-group:focus-within .input-group-text {
                border-color: #0d6efd;
            }
            .input-group:focus-within .input-group-text {
                background: white;
            }

            /* Gender Radio */
            .gender-group {
                display: flex;
                gap: 12px;
                flex-wrap: wrap;
            }
            .gender-option {
                flex: 1;
                min-width: 100px;
            }
            .gender-option input[type="radio"] {
                display: none;
            }
            .gender-option label {
                display: flex;
                align-items: center;
                justify-content: center;
                gap: 6px;
                padding: 10px 16px;
                border: 2px solid #e2e8f0;
                border-radius: 12px;
                cursor: pointer;
                font-size: 0.875rem;
                font-weight: 500;
                color: #64748b;
                transition: all 0.2s;
                background: #f8fafc;
                width: 100%;
            }
            .gender-option input[type="radio"]:checked + label {
                border-color: #0d6efd;
                background: rgba(13,110,253,0.06);
                color: #0d6efd;
            }

            .btn-register {
                background: linear-gradient(135deg, #0d6efd, #0dcaf0);
                border: none;
                border-radius: 12px;
                padding: 13px;
                font-weight: 700;
                font-size: 1rem;
                color: white;
                width: 100%;
                margin-top: 8px;
                transition: all 0.3s;
                box-shadow: 0 4px 15px rgba(13,110,253,0.3);
                font-family: 'Poppins', sans-serif;
            }
            .btn-register:hover {
                transform: translateY(-2px);
                box-shadow: 0 8px 25px rgba(13,110,253,0.4);
                color: white;
            }
            .btn-register:active {
                transform: translateY(0);
            }

            .login-link {
                text-align: center;
                font-size: 0.875rem;
                color: #64748b;
                margin-top: 20px;
            }
            .login-link a {
                color: #0d6efd;
                font-weight: 600;
                text-decoration: none;
            }
            .login-link a:hover {
                text-decoration: underline;
            }

            .alert-error {
                background: #fef2f2;
                border: 1px solid #fecaca;
                border-radius: 12px;
                color: #dc2626;
                padding: 12px 16px;
                font-size: 0.875rem;
                margin-bottom: 20px;
                display: flex;
                align-items: center;
                gap: 8px;
            }

            .section-divider {
                font-size: 0.75rem;
                font-weight: 700;
                color: #94a3b8;
                text-transform: uppercase;
                letter-spacing: 1px;
                margin: 20px 0 16px;
                display: flex;
                align-items: center;
                gap: 10px;
            }
            .section-divider::before, .section-divider::after {
                content: '';
                flex: 1;
                height: 1px;
                background: #e2e8f0;
            }

            footer {
                background: #f1f5f9;
                text-align: center;
                padding: 16px;
                font-size: 0.8rem;
                color: #94a3b8;
                border-top: 1px solid #e2e8f0;
            }

            @media (max-width: 576px) {
                .register-body {
                    padding: 28px 24px;
                }
                .register-banner {
                    padding: 24px;
                }
            }
        </style>
    </head>
    <body>

        <!-- Navbar -->
        <nav class="navbar-custom">
            <div class="container">
                <a class="navbar-brand" href="${pageContext.request.contextPath}/">
                    <i class="bi bi-pc-display-horizontal" style="-webkit-text-fill-color: #0d6efd;"></i>
                    Octatech Laptop Shop
                </a>
            </div>
        </nav>

        <!-- Register Section -->
        <div class="register-wrapper">
            <div class="register-container">

                <!-- Banner -->
                <div class="register-banner">
                    <div class="banner-text">
                        <h3>Join Octatech 🚀</h3>
                        <p>Create your account and start exploring premium laptops</p>
                    </div>
                    <i class="bi bi-person-plus-fill banner-icon"></i>
                </div>

                <!-- Form -->
                <div class="register-body">

                    <!-- Error -->
                    <c:if test="${not empty error}">
                        <div class="alert-error">
                            <i class="bi bi-exclamation-circle-fill"></i> ${error}
                        </div>
                    </c:if>

                    <form action="${pageContext.request.contextPath}/register" method="post">

                        <div class="section-divider">Account Info</div>

                        <div class="row g-3 mb-3">
                            <div class="col-md-6">
                                <label class="form-label">Username</label>
                                <input type="text" class="form-control" name="username"
                                       placeholder="Choose a username" required>
                            </div>
                            <div class="col-md-6">
                                <label class="form-label">Password</label>
                                <div class="input-group">
                                    <input type="password" class="form-control" name="password"
                                           id="passwordInput" placeholder="Create a password" required>
                                    <span class="input-group-text" onclick="togglePassword()">
                                        <i class="bi bi-eye" id="toggleIcon"></i>
                                    </span>
                                </div>
                            </div>
                        </div>

                        <div class="section-divider">Personal Info</div>

                        <div class="mb-3">
                            <label class="form-label">Full Name</label>
                            <input type="text" class="form-control" name="name"
                                   placeholder="Enter your full name" required>
                        </div>

                        <div class="row g-3 mb-3">
                            <div class="col-md-6">
                                <label class="form-label">Phone Number</label>
                                <input type="tel" class="form-control" name="phone"
                                       placeholder="e.g. 0981234567">
                            </div>
                            <div class="col-md-6">
                                <label class="form-label">Address</label>
                                <input type="text" class="form-control" name="address"
                                       placeholder="Your address">
                            </div>
                        </div>

                        <div class="mb-4">
                            <label class="form-label d-block">Gender</label>
                            <div class="gender-group">
                                <div class="gender-option">
                                    <input type="radio" name="gender" id="male" value="MALE" checked>
                                    <label for="male"><i class="bi bi-gender-male"></i> Male</label>
                                </div>
                                <div class="gender-option">
                                    <input type="radio" name="gender" id="female" value="FEMALE">
                                    <label for="female"><i class="bi bi-gender-female"></i> Female</label>
                                </div>
                                <div class="gender-option">
                                    <input type="radio" name="gender" id="other" value="OTHER">
                                    <label for="other"><i class="bi bi-gender-ambiguous"></i> Other</label>
                                </div>
                            </div>
                        </div>

                        <button type="submit" class="btn-register">
                            <i class="bi bi-person-check-fill me-2"></i>Create Account
                        </button>
                    </form>

                    <div class="login-link">
                        Already have an account?
                        <a href="${pageContext.request.contextPath}/login">Sign in here</a>
                    </div>
                </div>
            </div>
        </div>

        <footer>
            &copy; 2026 Octatech Laptop Shop - Group 8. All Rights Reserved.
        </footer>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
        <script>
                                        function togglePassword() {
                                            const input = document.getElementById('passwordInput');
                                            const icon = document.getElementById('toggleIcon');
                                            if (input.type === 'password') {
                                                input.type = 'text';
                                                icon.className = 'bi bi-eye-slash';
                                            } else {
                                                input.type = 'password';
                                                icon.className = 'bi bi-eye';
                                            }
                                        }
        </script>
    </body>
</html>
