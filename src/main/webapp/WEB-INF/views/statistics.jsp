<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Statistics - Octatech Laptop Shop</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Righteous&family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
        <style>
            * {
                box-sizing: border-box;
                margin: 0;
                padding: 0;
            }

            body {
                font-family: 'Poppins', sans-serif;
                background: #f0f4ff;
                min-height: 100vh;
                display: flex;
                flex-direction: column;
            }

            /* Navbar */
            .navbar-custom {
                background: #fff;
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
            .nav-link:hover, .nav-link.active {
                color: #0d6efd !important;
            }

            /* Page Header */
            .page-header {
                background: linear-gradient(135deg, #0d6efd 0%, #0dcaf0 100%);
                padding: 36px 0 30px;
                position: relative;
                overflow: hidden;
            }
            .page-header::before {
                content: '';
                position: absolute;
                width: 350px;
                height: 350px;
                background: rgba(255,255,255,0.07);
                border-radius: 50%;
                top: -120px;
                right: -60px;
            }
            .page-header::after {
                content: '';
                position: absolute;
                width: 200px;
                height: 200px;
                background: rgba(255,255,255,0.05);
                border-radius: 50%;
                bottom: -60px;
                left: 5%;
            }
            .page-header h2 {
                font-family: 'Righteous', cursive;
                color: white;
                font-size: 2rem;
                margin-bottom: 6px;
                position: relative;
                z-index: 1;
            }
            .page-header p {
                color: rgba(255,255,255,0.8);
                font-size: 0.9rem;
                margin: 0;
                position: relative;
                z-index: 1;
            }

            .main-content {
                flex: 1;
                padding: 36px 0 50px;
            }

            /* Stat Cards */
            .stat-card {
                background: white;
                border-radius: 20px;
                padding: 24px;
                box-shadow: 0 4px 20px rgba(13,110,253,0.08);
                text-align: center;
                transition: all 0.25s;
                height: 100%;
                border-top: 4px solid transparent;
            }
            .stat-card:hover {
                transform: translateY(-5px);
                box-shadow: 0 12px 30px rgba(13,110,253,0.15);
            }
            .stat-card.blue   {
                border-top-color: #0d6efd;
            }
            .stat-card.green  {
                border-top-color: #22c55e;
            }
            .stat-card.red    {
                border-top-color: #ef4444;
            }
            .stat-card.orange {
                border-top-color: #f97316;
            }
            .stat-card.purple {
                border-top-color: #a855f7;
            }

            .stat-icon {
                width: 52px;
                height: 52px;
                border-radius: 14px;
                margin: 0 auto 12px;
                display: flex;
                align-items: center;
                justify-content: center;
                font-size: 1.4rem;
            }
            .blue   .stat-icon {
                background: rgba(13,110,253,0.1);
            }
            .green  .stat-icon {
                background: rgba(34,197,94,0.1);
            }
            .red    .stat-icon {
                background: rgba(239,68,68,0.1);
            }
            .orange .stat-icon {
                background: rgba(249,115,22,0.1);
            }
            .purple .stat-icon {
                background: rgba(168,85,247,0.1);
            }

            .stat-label {
                font-size: 0.72rem;
                color: #94a3b8;
                font-weight: 700;
                text-transform: uppercase;
                letter-spacing: 0.8px;
                margin-bottom: 6px;
            }
            .stat-value {
                font-size: 1.4rem;
                font-weight: 800;
            }
            .blue   .stat-value {
                color: #0d6efd;
            }
            .green  .stat-value {
                color: #22c55e;
            }
            .red    .stat-value {
                color: #ef4444;
            }
            .orange .stat-value {
                color: #f97316;
            }
            .purple .stat-value {
                color: #a855f7;
            }

            /* Filter Card */
            .filter-card {
                background: white;
                border-radius: 20px;
                padding: 24px 28px;
                box-shadow: 0 4px 20px rgba(13,110,253,0.08);
                margin-bottom: 32px;
            }
            .filter-card h5 {
                font-weight: 700;
                color: #1e293b;
                margin-bottom: 16px;
                font-size: 1rem;
            }
            .form-select, .form-control {
                border: 2px solid #e2e8f0;
                border-radius: 12px;
                padding: 10px 14px;
                font-size: 0.9rem;
                font-family: 'Poppins', sans-serif;
                color: #1e293b;
                background: #f8fafc;
                transition: all 0.2s;
            }
            .form-select:focus, .form-control:focus {
                border-color: #0d6efd;
                box-shadow: 0 0 0 4px rgba(13,110,253,0.1);
                background: white;
            }
            .btn-filter {
                background: linear-gradient(135deg, #0d6efd, #0dcaf0);
                border: none;
                border-radius: 12px;
                padding: 10px 24px;
                font-weight: 700;
                color: white;
                font-family: 'Poppins', sans-serif;
                transition: all 0.3s;
                box-shadow: 0 4px 12px rgba(13,110,253,0.3);
            }
            .btn-filter:hover {
                transform: translateY(-2px);
                box-shadow: 0 8px 20px rgba(13,110,253,0.4);
                color: white;
            }

            /* Table Card */
            .table-card {
                background: white;
                border-radius: 20px;
                box-shadow: 0 4px 20px rgba(13,110,253,0.08);
                overflow: hidden;
                margin-bottom: 32px;
            }
            .table-card-header {
                padding: 18px 24px;
                border-bottom: 1px solid #f1f5f9;
                display: flex;
                align-items: center;
                gap: 10px;
            }
            .table-card-header h5 {
                font-weight: 700;
                color: #1e293b;
                margin: 0;
                font-size: 1rem;
            }

            .table {
                margin: 0;
            }
            .table thead th {
                background: #f8fafc;
                color: #64748b;
                font-size: 0.72rem;
                font-weight: 700;
                text-transform: uppercase;
                letter-spacing: 0.6px;
                border: none;
                padding: 13px 20px;
            }
            .table tbody td {
                padding: 13px 20px;
                vertical-align: middle;
                border-bottom: 1px solid #f8fafc;
                font-size: 0.875rem;
                color: #334155;
            }
            .table tbody tr:last-child td {
                border-bottom: none;
            }
            .table tbody tr:hover td {
                background: #f8fafc;
            }

            .price-high {
                color: #22c55e;
                font-weight: 700;
            }
            .price-low  {
                color: #ef4444;
                font-weight: 700;
            }
            .price-avg  {
                color: #f97316;
                font-weight: 700;
            }

            .brand-badge {
                background: rgba(13,110,253,0.1);
                color: #0d6efd;
                padding: 4px 12px;
                border-radius: 20px;
                font-size: 0.75rem;
                font-weight: 700;
                display: inline-block;
            }

            td img {
                width: 80px;
                height: 55px;
                object-fit: cover;
                border-radius: 8px;
                border: 1px solid #e2e8f0;
            }

            /* Section Title */
            .section-title {
                font-weight: 700;
                font-size: 1rem;
                color: #1e293b;
                display: flex;
                align-items: center;
                gap: 8px;
            }
            .section-title::before {
                content: '';
                width: 4px;
                height: 18px;
                background: linear-gradient(135deg, #0d6efd, #0dcaf0);
                border-radius: 2px;
                display: inline-block;
            }

            .btn-back {
                display: inline-flex;
                align-items: center;
                gap: 6px;
                padding: 10px 20px;
                border: 2px solid rgba(255,255,255,0.4);
                border-radius: 12px;
                color: white;
                font-weight: 600;
                font-size: 0.875rem;
                text-decoration: none;
                transition: all 0.2s;
                font-family: 'Poppins', sans-serif;
                position: relative;
                z-index: 1;
            }
            .btn-back:hover {
                background: rgba(255,255,255,0.15);
                color: white;
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
        <nav class="navbar navbar-expand-lg navbar-custom sticky-top">
            <div class="container">
                <a class="navbar-brand" href="${pageContext.request.contextPath}/">
                    <i class="bi bi-pc-display-horizontal" style="-webkit-text-fill-color:#0d6efd;"></i>
                    Octatech Laptop Shop
                </a>
                <ul class="navbar-nav ms-auto align-items-center">
                    <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/"><i class="bi bi-house me-1"></i>Home</a></li>
                    <li class="nav-item"><a class="nav-link active" href="${pageContext.request.contextPath}/statistics"><i class="bi bi-bar-chart-fill me-1"></i>Statistics</a></li>
                    <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/cart"><i class="bi bi-cart3 me-1"></i>Cart</a></li>
                </ul>
            </div>
        </nav>

        <!-- Page Header -->
        <div class="page-header">
            <div class="container">
                <div class="d-flex align-items-center justify-content-between">
                    <div>
                        <h2><i class="bi bi-bar-chart-fill me-2"></i>Laptop Statistics</h2>
                        <p>Price analysis and product overview by brand</p>
                    </div>
                    <a href="${pageContext.request.contextPath}/" class="btn-back">
                        <i class="bi bi-arrow-left"></i> Back to Home
                    </a>
                </div>
            </div>
        </div>

        <div class="main-content">
            <div class="container">

                <!-- Stat Cards -->
                <div class="row g-3 mb-4">
                    <div class="col-6 col-md">
                        <div class="stat-card blue">
                            <div class="stat-icon"><i class="bi bi-box-seam-fill text-primary"></i></div>
                            <div class="stat-label">Total Products</div>
                            <div class="stat-value">${count}</div>
                        </div>
                    </div>
                    <div class="col-6 col-md">
                        <div class="stat-card green">
                            <div class="stat-icon"><i class="bi bi-graph-up-arrow" style="color:#22c55e;"></i></div>
                            <div class="stat-label">Highest Price</div>
                            <div class="stat-value">$<fmt:formatNumber value="${maxPrice}" pattern="#,###"/></div>
                        </div>
                    </div>
                    <div class="col-6 col-md">
                        <div class="stat-card red">
                            <div class="stat-icon"><i class="bi bi-graph-down-arrow" style="color:#ef4444;"></i></div>
                            <div class="stat-label">Lowest Price</div>
                            <div class="stat-value">$<fmt:formatNumber value="${minPrice}" pattern="#,###"/></div>
                        </div>
                    </div>
                    <div class="col-6 col-md">
                        <div class="stat-card orange">
                            <div class="stat-icon"><i class="bi bi-calculator-fill" style="color:#f97316;"></i></div>
                            <div class="stat-label">Average Price</div>
                            <div class="stat-value">$<fmt:formatNumber value="${avgPrice}" pattern="#,###"/></div>
                        </div>
                    </div>
                    <div class="col-6 col-md">
                        <div class="stat-card purple">
                            <div class="stat-icon"><i class="bi bi-cash-coin" style="color:#a855f7;"></i></div>
                            <div class="stat-label">Total Value</div>
                            <div class="stat-value">$<fmt:formatNumber value="${sumPrice}" pattern="#,###"/></div>
                        </div>
                    </div>
                </div>

                <!-- Filter -->
                <div class="filter-card">
                    <h5><i class="bi bi-funnel-fill text-primary me-2"></i>Filter by Brand</h5>
                    <form action="${pageContext.request.contextPath}/statistics" method="get">
                        <div class="row g-3 align-items-end">
                            <div class="col-md-4">
                                <label class="form-label fw-bold" style="font-size:0.82rem; color:#475569;">Brand</label>
                                <select class="form-select" name="brand">
                                    <option value="">— All Brands —</option>
                                    <c:forEach items="${brands}" var="b">
                                        <option value="${b}" ${b == selectedBrand ? 'selected' : ''}>${b}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="col-md-4">
                                <label class="form-label fw-bold" style="font-size:0.82rem; color:#475569;">Sort by Price</label>
                                <select class="form-select" name="sort">
                                    <option value="desc" ${sort == 'desc' ? 'selected' : ''}>High → Low</option>
                                    <option value="asc"  ${sort == 'asc'  ? 'selected' : ''}>Low → High</option>
                                </select>
                            </div>
                            <div class="col-md-4">
                                <button type="submit" class="btn-filter w-100">
                                    <i class="bi bi-search me-1"></i> Apply Filter
                                </button>
                            </div>
                        </div>
                    </form>
                </div>

                <!-- Products by Brand (if filtered) -->
                <c:if test="${not empty laptops}">
                    <div class="table-card mb-4">
                        <div class="table-card-header">
                            <div class="section-title">
                                <i class="bi bi-laptop text-primary"></i>
                                Products — ${selectedBrand}
                            </div>
                        </div>
                        <div class="table-responsive">
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th>ID</th><th>Product Name</th><th>Price</th>
                                        <th>CPU</th><th>RAM</th><th>Storage</th><th>Image</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${laptops}" var="l">
                                        <tr>
                                            <td>#${l.id}</td>
                                            <td class="fw-600">${l.name}</td>
                                            <td class="price-high">$<fmt:formatNumber value="${l.price}" pattern="#,###"/></td>
                                            <td>${l.cpu}</td>
                                            <td>${l.ram}</td>
                                            <td>${l.storage}</td>
                                            <td><img src="data:image/jpeg;base64,${l.image}" alt="${l.name}"/></td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </c:if>

                <!-- Summary by Brand -->
                <div class="table-card">
                    <div class="table-card-header">
                        <div class="section-title">
                            <i class="bi bi-pie-chart-fill text-primary"></i>
                            Summary by Brand
                        </div>
                    </div>
                    <div class="table-responsive">
                        <table class="table">
                            <thead>
                                <tr>
                                    <th>Brand</th><th>Count</th>
                                    <th>Highest Price</th><th>Lowest Price</th><th>Average Price</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${brandStats}" var="row">
                                    <tr>
                                        <td><span class="brand-badge">${row[0]}</span></td>
                                        <td><span class="fw-bold">${row[1]}</span></td>
                                        <td class="price-high">$<fmt:formatNumber value="${row[2]}" pattern="#,###"/></td>
                                        <td class="price-low">$<fmt:formatNumber value="${row[3]}" pattern="#,###"/></td>
                                        <td class="price-avg">$<fmt:formatNumber value="${row[4]}" pattern="#,###"/></td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>

            </div>
        </div>

        <footer>&copy; 2026 Octatech Laptop Shop - Group 8. All Rights Reserved.</footer>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
