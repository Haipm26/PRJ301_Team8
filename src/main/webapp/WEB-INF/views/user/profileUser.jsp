<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Profile - Octatech Laptop Shop</title>
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

            .profile-card {
                width: 100%;
                max-width: 500px;
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
                to {
                    opacity: 1;
                    transform: translateY(0);
                }
            }

            .profile-banner {
                background: linear-gradient(135deg, #0d6efd 0%, #0dcaf0 100%);
                padding: 32px 36px 28px;
                position: relative;
                overflow: hidden;
                text-align: center;
            }
            .profile-banner::before {
                content: '';
                position: absolute;
                width: 220px;
                height: 220px;
                background: rgba(255,255,255,0.08);
                border-radius: 50%;
                top: -80px;
                right: -60px;
            }
            .profile-banner::after {
                content: '';
                position: absolute;
                width: 150px;
                height: 150px;
                background: rgba(255,255,255,0.06);
                border-radius: 50%;
                bottom: -40px;
                left: -40px;
            }

            .avatar-wrap {
                position: relative;
                display: inline-block;
                margin-bottom: 8px;
                z-index: 1;
                cursor: pointer;
            }
            .avatar-circle {
                width: 90px;
                height: 90px;
                border-radius: 50%;
                background: rgba(255,255,255,0.25);
                border: 3px solid rgba(255,255,255,0.6);
                display: flex;
                align-items: center;
                justify-content: center;
                font-size: 2.5rem;
                color: white;
                margin: 0 auto;
                overflow: hidden;
                transition: all 0.2s;
            }
            .avatar-circle img {
                width: 100%;
                height: 100%;
                object-fit: cover;
            }
            .avatar-overlay {
                position: absolute;
                bottom: 0;
                right: 0;
                width: 28px;
                height: 28px;
                background: white;
                border-radius: 50%;
                display: flex;
                align-items: center;
                justify-content: center;
                color: #0d6efd;
                font-size: 0.8rem;
                box-shadow: 0 2px 8px rgba(0,0,0,0.15);
            }
            .avatar-wrap:hover .avatar-circle {
                opacity: 0.85;
            }

            .upload-hint {
                font-size: 0.75rem;
                color: rgba(255,255,255,0.65);
                position: relative;
                z-index: 1;
                margin-bottom: 10px;
            }
            .profile-banner h3 {
                font-family: 'Righteous', cursive;
                color: white;
                font-size: 1.3rem;
                margin-bottom: 4px;
                position: relative;
                z-index: 1;
            }
            .profile-banner p.username {
                color: rgba(255,255,255,0.8);
                font-size: 0.85rem;
                margin: 0 0 10px;
                position: relative;
                z-index: 1;
            }

            .role-badge {
                display: inline-flex;
                align-items: center;
                gap: 5px;
                padding: 4px 14px;
                border-radius: 20px;
                font-size: 0.75rem;
                font-weight: 700;
                position: relative;
                z-index: 1;
            }
            .role-admin {
                background: rgba(255,255,255,0.25);
                color: white;
                border: 1px solid rgba(255,255,255,0.4);
            }
            .role-user  {
                background: rgba(255,255,255,0.2);
                color: white;
                border: 1px solid rgba(255,255,255,0.35);
            }

            .profile-body {
                padding: 28px 36px 20px;
            }
            .info-item {
                display: flex;
                align-items: flex-start;
                gap: 14px;
                padding: 13px 0;
                border-bottom: 1px solid #f1f5f9;
            }
            .info-item:last-of-type {
                border-bottom: none;
            }
            .info-icon {
                width: 38px;
                height: 38px;
                border-radius: 10px;
                background: rgba(13,110,253,0.08);
                display: flex;
                align-items: center;
                justify-content: center;
                color: #0d6efd;
                font-size: 1rem;
                flex-shrink: 0;
                margin-top: 2px;
            }
            .info-label {
                font-size: 0.75rem;
                font-weight: 700;
                color: #94a3b8;
                text-transform: uppercase;
                letter-spacing: 0.5px;
                margin-bottom: 2px;
            }
            .info-value {
                font-size: 0.95rem;
                font-weight: 600;
                color: #1e293b;
            }

            .gender-badge {
                display: inline-flex;
                align-items: center;
                gap: 5px;
                padding: 3px 12px;
                border-radius: 20px;
                font-size: 0.8rem;
                font-weight: 600;
            }
            .gender-male   {
                background: #eff6ff;
                color: #2563eb;
            }
            .gender-female {
                background: #fdf2f8;
                color: #db2777;
            }
            .gender-other  {
                background: #f0fdf4;
                color: #16a34a;
            }

            .action-section {
                padding: 0 36px 32px;
                display: flex;
                gap: 12px;
            }
            .btn-change-pw {
                flex: 1;
                display: flex;
                align-items: center;
                justify-content: center;
                gap: 6px;
                padding: 12px;
                background: linear-gradient(135deg, #0d6efd, #0dcaf0);
                border: none;
                border-radius: 12px;
                color: white;
                font-weight: 600;
                font-size: 0.875rem;
                text-decoration: none;
                transition: all 0.3s;
                box-shadow: 0 4px 15px rgba(13,110,253,0.25);
                font-family: 'Poppins', sans-serif;
            }
            .btn-change-pw:hover {
                transform: translateY(-2px);
                box-shadow: 0 8px 25px rgba(13,110,253,0.35);
                color: white;
            }
            .btn-home {
                flex: 1;
                display: flex;
                align-items: center;
                justify-content: center;
                gap: 6px;
                padding: 12px;
                border: 2px solid #e2e8f0;
                border-radius: 12px;
                background: white;
                color: #64748b;
                font-weight: 600;
                font-size: 0.875rem;
                text-decoration: none;
                transition: all 0.2s;
                font-family: 'Poppins', sans-serif;
            }
            .btn-home:hover {
                border-color: #0d6efd;
                color: #0d6efd;
                background: rgba(13,110,253,0.04);
            }

            /* Modal */
            .modal-content {
                border-radius: 20px;
                border: none;
                overflow: hidden;
            }
            .modal-header {
                background: linear-gradient(135deg, #0d6efd, #0dcaf0);
                padding: 20px 24px;
                border: none;
            }
            .modal-title {
                color: white;
                font-weight: 700;
                font-family: 'Poppins', sans-serif;
            }
            .btn-close {
                filter: brightness(0) invert(1);
            }

            .upload-area {
                border: 2px dashed #cbd5e1;
                border-radius: 16px;
                padding: 30px;
                text-align: center;
                cursor: pointer;
                transition: all 0.2s;
                background: #f8fafc;
            }
            .upload-area:hover {
                border-color: #0d6efd;
                background: rgba(13,110,253,0.03);
            }
            .upload-area i {
                font-size: 2.5rem;
                color: #94a3b8;
                display: block;
                margin-bottom: 10px;
            }
            .upload-area p {
                color: #64748b;
                font-size: 0.875rem;
                margin: 0;
            }

            #previewImg {
                width: 120px;
                height: 120px;
                border-radius: 50%;
                object-fit: cover;
                border: 3px solid #0d6efd;
                display: none;
                margin: 0 auto 16px;
            }

            .btn-upload-confirm {
                background: linear-gradient(135deg, #0d6efd, #0dcaf0);
                border: none;
                border-radius: 12px;
                padding: 12px;
                font-weight: 700;
                color: white;
                font-family: 'Poppins', sans-serif;
                width: 100%;
                transition: all 0.3s;
                margin-top: 12px;
            }
            .btn-upload-confirm:hover {
                opacity: 0.9;
                color: white;
            }
            .btn-upload-confirm:disabled {
                opacity: 0.5;
                cursor: not-allowed;
            }

            .alert-error-custom {
                background: #fef2f2;
                border: 1px solid #fecaca;
                border-radius: 12px;
                color: #dc2626;
                padding: 12px 16px;
                font-size: 0.875rem;
                margin: 16px 36px 0;
                display: flex;
                align-items: center;
                gap: 8px;
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

        <nav class="navbar navbar-expand-lg sticky-top navbar-custom">
            <div class="container">
                <a class="navbar-brand" href="${pageContext.request.contextPath}/">
                    <i class="bi bi-pc-display-horizontal" style="-webkit-text-fill-color:#0d6efd;"></i>
                    Octatech Laptop Shop
                </a>
                <ul class="navbar-nav ms-auto align-items-center">
                    <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/"><i class="bi bi-house me-1"></i>Home</a></li>
                    <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/cart"><i class="bi bi-cart3 me-1"></i>Cart</a></li>
                </ul>
            </div>
        </nav>

        <div class="page-wrapper">
            <div class="profile-card">

                <div class="profile-banner">
                    <!-- Click avatar to upload -->
                    <div class="avatar-wrap" data-bs-toggle="modal" data-bs-target="#avatarModal">
                        <div class="avatar-circle">
                            <c:choose>
                                <c:when test="${not empty userProfile.avatar}">
                                    <img src="${userProfile.avatar}" alt="Avatar">
                                </c:when>
                                <c:otherwise>
                                    <i class="bi bi-person-fill"></i>
                                </c:otherwise>
                            </c:choose>
                        </div>
                        <div class="avatar-overlay"><i class="bi bi-camera-fill"></i></div>
                    </div>

                    <div class="upload-hint"><i class="bi bi-camera me-1"></i>Click avatar to change photo</div>
                    <h3>${userProfile.name}</h3>
                    <p class="username">@${userProfile.username}</p>

                    <c:choose>
                        <c:when test="${userProfile.role == 'ROLE_ADMIN'}">
                            <span class="role-badge role-admin"><i class="bi bi-shield-fill"></i> Admin</span>
                        </c:when>
                        <c:otherwise>
                            <span class="role-badge role-user"><i class="bi bi-person-fill"></i> Member</span>
                        </c:otherwise>
                    </c:choose>
                </div>

                <c:if test="${not empty error}">
                    <div class="alert-error-custom"><i class="bi bi-exclamation-circle-fill"></i> ${error}</div>
                </c:if>

                <div class="profile-body">
                    <div class="info-item">
                        <div class="info-icon"><i class="bi bi-person-badge"></i></div>
                        <div><div class="info-label">Username</div><div class="info-value">${userProfile.username}</div></div>
                    </div>
                    <div class="info-item">
                        <div class="info-icon"><i class="bi bi-person-lines-fill"></i></div>
                        <div><div class="info-label">Full Name</div><div class="info-value">${userProfile.name}</div></div>
                    </div>
                    <div class="info-item">
                        <div class="info-icon"><i class="bi bi-telephone-fill"></i></div>
                        <div>
                            <div class="info-label">Phone</div>
                            <div class="info-value">
                                <c:choose>
                                    <c:when test="${not empty userProfile.phone}">${userProfile.phone}</c:when>
                                    <c:otherwise><span style="color:#cbd5e1;">Not provided</span></c:otherwise>
                                </c:choose>
                            </div>
                        </div>
                    </div>
                    <div class="info-item">
                        <div class="info-icon"><i class="bi bi-geo-alt-fill"></i></div>
                        <div>
                            <div class="info-label">Address</div>
                            <div class="info-value">
                                <c:choose>
                                    <c:when test="${not empty userProfile.address}">${userProfile.address}</c:when>
                                    <c:otherwise><span style="color:#cbd5e1;">Not provided</span></c:otherwise>
                                </c:choose>
                            </div>
                        </div>
                    </div>
                    <div class="info-item">
                        <div class="info-icon"><i class="bi bi-gender-ambiguous"></i></div>
                        <div>
                            <div class="info-label">Gender</div>
                            <div class="info-value">
                                <c:choose>
                                    <c:when test="${userProfile.gender == 'MALE'}">
                                        <span class="gender-badge gender-male"><i class="bi bi-gender-male"></i> Male</span>
                                    </c:when>
                                    <c:when test="${userProfile.gender == 'FEMALE'}">
                                        <span class="gender-badge gender-female"><i class="bi bi-gender-female"></i> Female</span>
                                    </c:when>
                                    <c:otherwise>
                                        <span class="gender-badge gender-other"><i class="bi bi-gender-ambiguous"></i> Other</span>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="action-section">
                    <a href="${pageContext.request.contextPath}/change-password" class="btn-change-pw">
                        <i class="bi bi-shield-lock"></i> Change Password
                    </a>
                    <a href="${pageContext.request.contextPath}/" class="btn-home">
                        <i class="bi bi-house"></i> Back to Home
                    </a>
                </div>
            </div>
        </div>

        <!-- Avatar Upload Modal -->
        <div class="modal fade" id="avatarModal" tabindex="-1">
            <div class="modal-dialog modal-dialog-centered" style="max-width: 420px;">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title"><i class="bi bi-camera-fill me-2"></i>Update Profile Photo</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                    </div>
                    <div class="modal-body p-4">
                        <form action="${pageContext.request.contextPath}/profile/update-avatar"
                              method="post" enctype="multipart/form-data">

                            <img id="previewImg" src="" alt="Preview">

                            <div class="upload-area" onclick="document.getElementById('avatarFile').click()">
                                <i class="bi bi-cloud-arrow-up"></i>
                                <p class="fw-bold mb-1">Click to select a photo</p>
                                <p>JPG, PNG, GIF · Max 5MB</p>
                            </div>

                            <input type="file" id="avatarFile" name="avatarFile"
                                   accept="image/*" style="display:none"
                                   onchange="previewAvatar(event)">

                            <button type="submit" class="btn-upload-confirm" id="uploadBtn" disabled>
                                <i class="bi bi-cloud-arrow-up-fill me-1"></i>Save Photo
                            </button>

                            <button type="button" class="btn w-100 mt-2 rounded-3 fw-bold"
                                    style="border: 2px solid #e2e8f0; color: #64748b;"
                                    data-bs-dismiss="modal">Cancel</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <footer>&copy; 2026 Octatech Laptop Shop - Group 8. All Rights Reserved.</footer>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
        <script>
                                       function previewAvatar(event) {
                                           const file = event.target.files[0];
                                           if (!file)
                                               return;
                                           const preview = document.getElementById('previewImg');
                                           const uploadBtn = document.getElementById('uploadBtn');
                                           const uploadArea = document.querySelector('.upload-area');
                                           const reader = new FileReader();
                                           reader.onload = function (e) {
                                               preview.src = e.target.result;
                                               preview.style.display = 'block';
                                               uploadArea.style.display = 'none';
                                               uploadBtn.disabled = false;
                                           };
                                           reader.readAsDataURL(file);
                                       }
        </script>
    </body>
</html>
