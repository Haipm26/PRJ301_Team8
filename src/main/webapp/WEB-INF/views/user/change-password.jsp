<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Change Password - Octatech Laptop Shop</title>
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
            .nav-link {
                font-family: 'Poppins', sans-serif;
                color: #495057 !important;
                font-weight: 600;
            }
            .nav-link:hover {
                color: #0d6efd !important;
            }

            /* Main Layout */
            .page-wrapper {
                flex: 1;
                display: flex;
                align-items: center;
                justify-content: center;
                padding: 40px 16px;
                position: relative;
                overflow: hidden;
            }
            .page-wrapper::before {
                content: '';
                position: absolute;
                width: 500px;
                height: 500px;
                background: radial-gradient(circle, rgba(13,110,253,0.1), transparent 70%);
                top: -100px;
                left: -100px;
                border-radius: 50%;
                pointer-events: none;
            }
            .page-wrapper::after {
                content: '';
                position: absolute;
                width: 400px;
                height: 400px;
                background: radial-gradient(circle, rgba(13,202,240,0.1), transparent 70%);
                bottom: -80px;
                right: -80px;
                border-radius: 50%;
                pointer-events: none;
            }

            .card-container {
                width: 100%;
                max-width: 480px;
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
            .card-banner {
                background: linear-gradient(135deg, #0d6efd 0%, #0dcaf0 100%);
                padding: 28px 36px;
                display: flex;
                align-items: center;
                justify-content: space-between;
                position: relative;
                overflow: hidden;
            }
            .card-banner::before {
                content: '';
                position: absolute;
                width: 200px;
                height: 200px;
                background: rgba(255,255,255,0.08);
                border-radius: 50%;
                top: -80px;
                right: -40px;
            }
            .card-banner .banner-text h3 {
                font-family: 'Righteous', cursive;
                color: white;
                font-size: 1.4rem;
                margin-bottom: 4px;
            }
            .card-banner .banner-text p {
                color: rgba(255,255,255,0.8);
                font-size: 0.85rem;
                margin: 0;
            }
            .card-banner .banner-icon {
                font-size: 2.8rem;
                color: rgba(255,255,255,0.25);
                position: relative;
                z-index: 1;
            }

            /* Form Area */
            .card-body-custom {
                padding: 36px;
            }

            .form-label {
                font-weight: 600;
                font-size: 0.85rem;
                color: #475569;
                margin-bottom: 6px;
            }
            .input-group .form-control {
                border: 2px solid #e2e8f0;
                border-right: none;
                border-radius: 12px 0 0 12px;
                padding: 12px 16px;
                font-size: 0.9rem;
                color: #1e293b;
                background: #f8fafc;
                transition: all 0.2s;
                font-family: 'Poppins', sans-serif;
            }
            .input-group .form-control:focus {
                border-color: #0d6efd;
                box-shadow: none;
                background: white;
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
                color: #0d6efd;
            }

            /* Password strength bar */
            
            .strength-fill {
                height: 100%;
                width: 0%;
                border-radius: 2px;
                transition: all 0.3s;
            }
            .strength-text {
                font-size: 0.75rem;
                margin-top: 4px;
                color: #94a3b8;
            }

            .btn-submit {
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
            .btn-submit:hover {
                transform: translateY(-2px);
                box-shadow: 0 8px 25px rgba(13,110,253,0.4);
                color: white;
            }

            .btn-back {
                display: flex;
                align-items: center;
                justify-content: center;
                gap: 6px;
                width: 100%;
                margin-top: 12px;
                padding: 11px;
                border: 2px solid #e2e8f0;
                border-radius: 12px;
                background: white;
                color: #64748b;
                font-weight: 600;
                font-size: 0.9rem;
                text-decoration: none;
                transition: all 0.2s;
                font-family: 'Poppins', sans-serif;
            }
            .btn-back:hover {
                border-color: #0d6efd;
                color: #0d6efd;
                background: rgba(13,110,253,0.04);
            }

            .alert-success-custom {
                background: #f0fdf4;
                border: 1px solid #86efac;
                border-radius: 12px;
                color: #16a34a;
                padding: 12px 16px;
                font-size: 0.875rem;
                margin-bottom: 20px;
                display: flex;
                align-items: center;
                gap: 8px;
            }
            .alert-error-custom {
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

            .divider-line {
                border: none;
                border-top: 1px solid #f1f5f9;
                margin: 20px 0;
            }

            footer {
                background: #f1f5f9;
                text-align: center;
                padding: 16px;
                font-size: 0.8rem;
                color: #94a3b8;
                border-top: 1px solid #e2e8f0;
            }
        </style>
    </head>
    <body>

        <!-- Navbar -->
        <nav class="navbar navbar-expand-lg navbar-custom sticky-top" style="background:white; box-shadow: 0 4px 15px rgba(0,0,0,0.05);">
            <div class="container">
                <a class="navbar-brand" href="${pageContext.request.contextPath}/">
                    <i class="bi bi-pc-display-horizontal" style="-webkit-text-fill-color: #0d6efd;"></i>
                    Octatech Laptop Shop
                </a>
                <ul class="navbar-nav ms-auto align-items-center">
                    <li class="nav-item">
                        <a class="nav-link" href="${pageContext.request.contextPath}/">
                            <i class="bi bi-house me-1"></i>Home
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="${pageContext.request.contextPath}/profile">
                            <i class="bi bi-person-circle me-1"></i>Profile
                        </a>
                    </li>
                </ul>
            </div>
        </nav>

        <!-- Main -->
        <div class="page-wrapper">
            <div class="card-container">

                <!-- Banner -->
                <div class="card-banner">
                    <div class="banner-text">
                        <h3>Change Password 🔐</h3>
                        <p>Keep your account secure with a strong password</p>
                    </div>
                    <i class="bi bi-shield-lock-fill banner-icon"></i>
                </div>

                <!-- Form -->
                <div class="card-body-custom">

                    <!-- Success Message -->
                    <c:if test="${not empty message}">
                        <div class="alert-success-custom">
                            <i class="bi bi-check-circle-fill"></i> ${message}
                        </div>
                    </c:if>

                    <!-- Error Message -->
                    <c:if test="${not empty error}">
                        <div class="alert-error-custom">
                            <i class="bi bi-exclamation-circle-fill"></i> ${error}
                        </div>
                    </c:if>

                    <form action="${pageContext.request.contextPath}/change-password" method="post">

                        <div class="mb-3">
                            <label class="form-label">Current Password</label>
                            <div class="input-group">
                                <input type="password" class="form-control" name="oldPassword"
                                       id="oldPassword" placeholder="Enter current password" required>
                                <span class="input-group-text" onclick="togglePass('oldPassword', 'icon0')">
                                    <i class="bi bi-eye" id="icon0"></i>
                                </span>
                            </div>
                        </div>

                        <div class="mb-3">
                            <label class="form-label">New Password</label>
                            <div class="input-group">
                                <input type="password" class="form-control" name="newPassword"
                                       id="newPassword" placeholder="Enter new password"
                                       oninput="checkStrength(this.value)" required>
                                <span class="input-group-text" onclick="togglePass('newPassword', 'icon1')">
                                    <i class="bi bi-eye" id="icon1"></i>
                                </span>
                            </div>
                            <div class="strength-bar"><div class="strength-fill" id="strengthFill"></div></div>
                            <div class="strength-text" id="strengthText"></div>
                        </div>

                        <div class="mb-4">
                            <label class="form-label">Confirm New Password</label>
                            <div class="input-group">
                                <input type="password" class="form-control" name="confirmPassword"
                                       id="confirmPassword" placeholder="Re-enter new password"
                                       oninput="checkMatch()" required>
                                <span class="input-group-text" onclick="togglePass('confirmPassword', 'icon2')">
                                    <i class="bi bi-eye" id="icon2"></i>
                                </span>
                            </div>
                            <div class="strength-text" id="matchText"></div>
                        </div>

                        <button type="submit" class="btn-submit">
                            <i class="bi bi-shield-check me-2"></i>Update Password
                        </button>
                    </form>

                    <a href="${pageContext.request.contextPath}/" class="btn-back">
                        <i class="bi bi-arrow-left"></i> Back to Home
                    </a>
                </div>
            </div>
        </div>

        <footer>
            &copy; 2026 Octatech Laptop Shop - Group 8. All Rights Reserved.
        </footer>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
        <script>
                                    function togglePass(inputId, iconId) {
                                        const input = document.getElementById(inputId);
                                        const icon = document.getElementById(iconId);
                                        if (input.type === 'password') {
                                            input.type = 'text';
                                            icon.className = 'bi bi-eye-slash';
                                        } else {
                                            input.type = 'password';
                                            icon.className = 'bi bi-eye';
                                        }
                                    }

                                    function checkStrength(val) {
                                        const fill = document.getElementById('strengthFill');
                                        const text = document.getElementById('strengthText');
                                        let strength = 0;
                                        if (val.length >= 6)
                                            strength++;
                                        if (val.length >= 10)
                                            strength++;
                                        if (/[A-Z]/.test(val))
                                            strength++;
                                        if (/[0-9]/.test(val))
                                            strength++;
                                        if (/[^A-Za-z0-9]/.test(val))
                                            strength++;

                                        const levels = [
                                            {w: '20%', color: '#ef4444', label: 'Very weak'},
                                            {w: '40%', color: '#f97316', label: 'Weak'},
                                            {w: '60%', color: '#eab308', label: 'Fair'},
                                            {w: '80%', color: '#22c55e', label: 'Strong'},
                                            {w: '100%', color: '#0d6efd', label: 'Very strong'},
                                        ];
                                        const lv = levels[Math.max(0, strength - 1)];
                                        fill.style.width = val ? lv.w : '0%';
                                        fill.style.background = lv.color;
                                        text.textContent = val ? lv.label : '';
                                        text.style.color = lv.color;
                                        checkMatch();
                                    }

                                    function checkMatch() {
                                        const np = document.getElementById('newPassword').value;
                                        const cp = document.getElementById('confirmPassword').value;
                                        const text = document.getElementById('matchText');
                                        if (!cp) {
                                            text.textContent = '';
                                            return;
                                        }
                                        if (np === cp) {
                                            text.textContent = '✓ Passwords match';
                                            text.style.color = '#22c55e';
                                        } else {
                                            text.textContent = '✗ Passwords do not match';
                                            text.style.color = '#ef4444';
                                        }
                                    }
        </script>
    </body>
</html>
