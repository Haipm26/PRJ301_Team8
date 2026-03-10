<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Login - Octatech Laptop Shop</title>
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
            .login-wrapper {
                flex: 1;
                display: flex;
                align-items: center;
                justify-content: center;
                padding: 40px 16px;
                position: relative;
                overflow: hidden;
            }

            /* Background blobs */
            .login-wrapper::before {
                content: '';
                position: absolute;
                width: 500px;
                height: 500px;
                background: radial-gradient(circle, rgba(13,110,253,0.12), transparent 70%);
                top: -100px;
                left: -100px;
                border-radius: 50%;
                pointer-events: none;
            }
            .login-wrapper::after {
                content: '';
                position: absolute;
                width: 400px;
                height: 400px;
                background: radial-gradient(circle, rgba(13,202,240,0.12), transparent 70%);
                bottom: -80px;
                right: -80px;
                border-radius: 50%;
                pointer-events: none;
            }

            .login-container {
                display: flex;
                width: 100%;
                max-width: 900px;
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

            /* Left Panel */
            .login-left {
                flex: 1;
                background: linear-gradient(135deg, #0d6efd 0%, #0dcaf0 100%);
                padding: 50px 40px;
                display: flex;
                flex-direction: column;
                justify-content: center;
                align-items: flex-start;
                position: relative;
                overflow: hidden;
            }
            .login-left::before {
                content: '';
                position: absolute;
                width: 300px;
                height: 300px;
                background: rgba(255,255,255,0.08);
                border-radius: 50%;
                top: -80px;
                right: -80px;
            }
            .login-left::after {
                content: '';
                position: absolute;
                width: 200px;
                height: 200px;
                background: rgba(255,255,255,0.06);
                border-radius: 50%;
                bottom: -50px;
                left: -50px;
            }
            .login-left .brand {
                font-family: 'Righteous', cursive;
                font-size: 1.8rem;
                color: white;
                letter-spacing: 1px;
                margin-bottom: 12px;
                position: relative;
                z-index: 1;
            }
            .login-left .tagline {
                color: rgba(255,255,255,0.85);
                font-size: 0.95rem;
                line-height: 1.6;
                margin-bottom: 32px;
                position: relative;
                z-index: 1;
            }
            .login-left .feature-item {
                display: flex;
                align-items: center;
                gap: 10px;
                color: white;
                font-size: 0.9rem;
                font-weight: 500;
                margin-bottom: 14px;
                position: relative;
                z-index: 1;
            }
            .login-left .feature-item i {
                background: rgba(255,255,255,0.2);
                width: 32px;
                height: 32px;
                border-radius: 8px;
                display: flex;
                align-items: center;
                justify-content: center;
                font-size: 1rem;
                flex-shrink: 0;
            }
            .laptop-icon {
                font-size: 5rem;
                color: rgba(255,255,255,0.15);
                position: absolute;
                bottom: 30px;
                right: 30px;
                z-index: 0;
            }

            /* Right Panel */
            .login-right {
                flex: 1;
                padding: 50px 45px;
                display: flex;
                flex-direction: column;
                justify-content: center;
            }
            .login-right h2 {
                font-weight: 700;
                font-size: 1.8rem;
                color: #1e293b;
                margin-bottom: 6px;
            }
            .login-right .subtitle {
                color: #94a3b8;
                font-size: 0.9rem;
                margin-bottom: 32px;
            }

            /* Form Styles */
            .form-label {
                font-weight: 600;
                font-size: 0.85rem;
                color: #475569;
                margin-bottom: 6px;
            }
            .form-control {
                border: 2px solid #e2e8f0;
                border-radius: 12px;
                padding: 12px 16px;
                font-size: 0.95rem;
                color: #1e293b;
                transition: all 0.2s;
                background: #f8fafc;
            }
            .form-control:focus {
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

            .btn-login {
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
            }
            .btn-login:hover {
                transform: translateY(-2px);
                box-shadow: 0 8px 25px rgba(13,110,253,0.4);
                color: white;
            }
            .btn-login:active {
                transform: translateY(0);
            }

            .divider {
                display: flex;
                align-items: center;
                gap: 12px;
                margin: 20px 0;
                color: #cbd5e1;
                font-size: 0.85rem;
            }
            .divider::before, .divider::after {
                content: '';
                flex: 1;
                height: 1px;
                background: #e2e8f0;
            }

            .signup-link {
                text-align: center;
                font-size: 0.9rem;
                color: #64748b;
                margin-top: 20px;
            }
            .signup-link a {
                color: #0d6efd;
                font-weight: 600;
                text-decoration: none;
            }
            .signup-link a:hover {
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

            .remember-row {
                display: flex;
                justify-content: space-between;
                align-items: center;
                margin-bottom: 20px;
            }
            .form-check-input:checked {
                background-color: #0d6efd;
                border-color: #0d6efd;
            }
            .forgot-link {
                font-size: 0.85rem;
                color: #0d6efd;
                font-weight: 500;
                text-decoration: none;
            }
            .forgot-link:hover {
                text-decoration: underline;
            }

            /* Footer */
            footer {
                background: #f1f5f9;
                text-align: center;
                padding: 16px;
                font-size: 0.8rem;
                color: #94a3b8;
                border-top: 1px solid #e2e8f0;
            }

            @media (max-width: 768px) {
                .login-left {
                    display: none;
                }
                .login-right {
                    padding: 40px 30px;
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

        <!-- Login Section -->
        <div class="login-wrapper">
            <div class="login-container">

                <!-- Left Panel -->
                <div class="login-left">
                    <div class="brand"><i class="bi bi-pc-display-horizontal me-2"></i>Octatech</div>
                    <p class="tagline">Your trusted destination for premium laptops and cutting-edge technology.</p>

                    <div class="feature-item">
                        <div><i class="bi bi-shield-check-fill"></i></div>
                        Secure & Safe Shopping
                    </div>
                    <div class="feature-item">
                        <div><i class="bi bi-truck"></i></div>
                        Fast Delivery Nationwide
                    </div>
                    <div class="feature-item">
                        <div><i class="bi bi-headset"></i></div>
                        24/7 Customer Support
                    </div>
                    <div class="feature-item">
                        <div><i class="bi bi-patch-check-fill"></i></div>
                        Genuine Products Only
                    </div>

                    <i class="bi bi-laptop laptop-icon"></i>
                </div>

                <!-- Right Panel -->
                <div class="login-right">
                    <h2>Welcome back 👋</h2>
                    <p class="subtitle">Sign in to your account to continue</p>

                    <!-- Error Message -->
                    <c:if test="${not empty error}">
                        <div class="alert-error">
                            <i class="bi bi-exclamation-circle-fill"></i> ${error}
                        </div>
                    </c:if>

                    <form action="${pageContext.request.contextPath}/login" method="post">
                        <div class="mb-3">
                            <label class="form-label">Username</label>
                            <input type="text" class="form-control" name="username"
                                   placeholder="Enter your username" required>
                        </div>

                        <div class="mb-3">
                            <label class="form-label">Password</label>
                            <div class="input-group">
                                <input type="password" class="form-control" name="password"
                                       id="passwordInput" placeholder="Enter your password" required>
                                <span class="input-group-text" onclick="togglePassword()">
                                    <i class="bi bi-eye" id="toggleIcon"></i>
                                </span>
                            </div>
                        </div>

                        <div class="remember-row">
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" name="rememberMe" id="rememberMe">
                                <label class="form-check-label" for="rememberMe" style="font-size:0.875rem; color:#64748b;">
                                    Remember me
                                </label>
                            </div>
                        </div>

                        <button type="submit" class="btn-login">
                            <i class="bi bi-box-arrow-in-right me-2"></i>Sign In
                        </button>
                    </form>

                    <div class="divider">or</div>

                    <div class="signup-link">
                        Don't have an account?
                        <a href="${pageContext.request.contextPath}/register">Create one here</a>
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
