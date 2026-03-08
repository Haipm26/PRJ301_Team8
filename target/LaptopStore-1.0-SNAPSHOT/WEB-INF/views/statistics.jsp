<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<html>
    <head>
        <title>Laptop Statistics</title>
        <style>
            * {
                box-sizing: border-box;
                margin: 0;
                padding: 0;
            }
            body {
                font-family: 'Segoe UI', Arial, sans-serif;
                background: linear-gradient(135deg, #1a1a2e 0%, #16213e 50%, #0f3460 100%);
                min-height: 100vh;
                padding: 30px 20px;
                color: #fff;
            }
            h1 {
                text-align: center;
                font-size: 32px;
                font-weight: 700;
                margin-bottom: 10px;
                background: linear-gradient(90deg, #e94560, #0f3460);
                -webkit-background-clip: text;
                -webkit-text-fill-color: transparent;
                letter-spacing: 2px;
            }
            .subtitle {
                text-align: center;
                color: #aaa;
                margin-bottom: 40px;
                font-size: 14px;
            }
            .cards {
                display: flex;
                justify-content: center;
                gap: 16px;
                flex-wrap: wrap;
                margin-bottom: 50px;
            }
            .card {
                background: rgba(255,255,255,0.05);
                backdrop-filter: blur(10px);
                border: 1px solid rgba(255,255,255,0.1);
                border-radius: 16px;
                padding: 24px 28px;
                text-align: center;
                min-width: 160px;
                transition: transform 0.2s, box-shadow 0.2s;
            }
            .card:hover {
                transform: translateY(-5px);
                box-shadow: 0 10px 30px rgba(0,0,0,0.3);
            }
            .card .icon {
                font-size: 28px;
                margin-bottom: 10px;
            }
            .card .label {
                font-size: 12px;
                color: #aaa;
                margin-bottom: 8px;
                text-transform: uppercase;
                letter-spacing: 1px;
            }
            .card .value {
                font-size: 20px;
                font-weight: 700;
            }
            .card.blue   {
                border-top: 3px solid #3498db;
            }
            .card.blue .value   {
                color: #3498db;
            }
            .card.green  {
                border-top: 3px solid #2ecc71;
            }
            .card.green .value  {
                color: #2ecc71;
            }
            .card.red    {
                border-top: 3px solid #e74c3c;
            }
            .card.red .value    {
                color: #e74c3c;
            }
            .card.orange {
                border-top: 3px solid #e67e22;
            }
            .card.orange .value {
                color: #e67e22;
            }
            .card.purple {
                border-top: 3px solid #9b59b6;
            }
            .card.purple .value {
                color: #9b59b6;
            }
            .filter-section {
                background: rgba(255,255,255,0.05);
                backdrop-filter: blur(10px);
                border: 1px solid rgba(255,255,255,0.1);
                border-radius: 16px;
                padding: 24px;
                max-width: 700px;
                margin: 0 auto 40px;
            }
            .filter-section h3 {
                color: #fff;
                margin-bottom: 16px;
                font-size: 16px;
                text-transform: uppercase;
                letter-spacing: 1px;
            }
            .filter-row {
                display: flex;
                gap: 12px;
                align-items: center;
                flex-wrap: wrap;
            }
            .filter-row label {
                color: #aaa;
                font-size: 13px;
            }
            .filter-row select {
                background: rgba(255,255,255,0.1);
                color: #fff;
                border: 1px solid rgba(255,255,255,0.2);
                border-radius: 8px;
                padding: 10px 16px;
                font-size: 14px;
                cursor: pointer;
                flex: 1;
            }
            .filter-row select option {
                background: #1a1a2e;
                color: #fff;
            }
            .btn {
                padding: 10px 24px;
                border-radius: 8px;
                border: none;
                font-size: 14px;
                font-weight: 600;
                cursor: pointer;
                transition: all 0.2s;
            }
            .btn-primary {
                background: linear-gradient(135deg, #e94560, #c0392b);
                color: white;
            }
            .btn-primary:hover {
                opacity: 0.85;
                transform: translateY(-1px);
            }
            .section-title {
                text-align: center;
                font-size: 20px;
                font-weight: 600;
                color: #fff;
                margin-bottom: 20px;
                padding-bottom: 10px;
                border-bottom: 2px solid rgba(233,69,96,0.5);
                max-width: 900px;
                margin-left: auto;
                margin-right: auto;
            }
            .table-wrapper {
                max-width: 1000px;
                margin: 0 auto 50px;
                border-radius: 16px;
                overflow: hidden;
                box-shadow: 0 8px 32px rgba(0,0,0,0.3);
            }
            table {
                width: 100%;
                border-collapse: collapse;
                background: rgba(255,255,255,0.05);
                backdrop-filter: blur(10px);
            }
            thead tr {
                background: linear-gradient(135deg, #e94560, #c0392b);
            }
            th {
                padding: 14px 16px;
                text-align: left;
                font-size: 13px;
                text-transform: uppercase;
                letter-spacing: 1px;
                color: #fff;
            }
            td {
                padding: 14px 16px;
                border-bottom: 1px solid rgba(255,255,255,0.05);
                color: #ddd;
                font-size: 14px;
            }
            tbody tr:hover td {
                background: rgba(255,255,255,0.08);
            }
            tbody tr:last-child td {
                border-bottom: none;
            }
            td img {
                width: 80px;
                height: 55px;
                object-fit: cover;
                border-radius: 6px;
                border: 1px solid rgba(255,255,255,0.1);
            }
            .price-tag {
                color: #2ecc71;
                font-weight: 700;
            }
            .brand-badge {
                background: rgba(233,69,96,0.2);
                color: #e94560;
                border: 1px solid rgba(233,69,96,0.3);
                padding: 3px 10px;
                border-radius: 20px;
                font-size: 12px;
                font-weight: 600;
            }
            .back-btn {
                display: block;
                width: fit-content;
                margin: 0 auto 40px;
                padding: 12px 30px;
                background: rgba(255,255,255,0.1);
                color: #fff;
                text-decoration: none;
                border-radius: 8px;
                border: 1px solid rgba(255,255,255,0.2);
                font-weight: 600;
                transition: all 0.2s;
            }
            .back-btn:hover {
                background: rgba(255,255,255,0.2);
                transform: translateY(-2px);
            }
        </style>
    </head>
    <body>

        <h1>📊 LAPTOP STATISTICS</h1>
        <p class="subtitle">Price analysis and products by brand</p>

        <!-- CARDS -->
        <div class="cards">
            <div class="card blue">
                <div class="icon">📦</div>
                <div class="label">Total Products</div>
                <div class="value">${count}</div>
            </div>
            <div class="card green">
                <div class="icon">📈</div>
                <div class="label">Highest Price</div>
                <div class="value">$<fmt:formatNumber value="${maxPrice}" pattern="#,###"/></div>
            </div>
            <div class="card red">
                <div class="icon">📉</div>
                <div class="label">Lowest Price</div>
                <div class="value">$<fmt:formatNumber value="${minPrice}" pattern="#,###"/></div>
            </div>
            <div class="card orange">
                <div class="icon">⚖️</div>
                <div class="label">Average Price</div>
                <div class="value">$<fmt:formatNumber value="${avgPrice}" pattern="#,###"/></div>
            </div>
            <div class="card purple">
                <div class="icon">💰</div>
                <div class="label">Total Value</div>
                <div class="value">$<fmt:formatNumber value="${sumPrice}" pattern="#,###"/></div>
            </div>
        </div>

        <!-- FILTER -->
        <div class="filter-section">
            <h3>🔍 Filter by Brand</h3>
            <form action="${pageContext.request.contextPath}/statistics" method="get">
                <div class="filter-row">
                    <label>Brand:</label>
                    <select name="brand">
                        <option value="">-- All --</option>
                        <c:forEach items="${brands}" var="b">
                            <option value="${b}" ${b == selectedBrand ? 'selected' : ''}>${b}</option>
                        </c:forEach>
                    </select>
                    <label>Sort:</label>
                    <select name="sort">
                        <option value="desc" ${sort == 'desc' ? 'selected' : ''}>High → Low</option>
                        <option value="asc"  ${sort == 'asc'  ? 'selected' : ''}>Low → High</option>
                    </select>
                    <button type="submit" class="btn btn-primary">View</button>
                </div>
            </form>
        </div>

        <!-- PRODUCTS BY BRAND -->
        <c:if test="${not empty laptops}">
            <div class="section-title">🖥️ Products by: ${selectedBrand}</div>
            <div class="table-wrapper">
                <table>
                    <thead>
                        <tr>
                            <th>ID</th><th>Product Name</th><th>Price</th>
                            <th>CPU</th><th>RAM</th><th>Storage</th><th>Image</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${laptops}" var="l">
                            <tr>
                                <td>${l.id}</td>
                                <td>${l.name}</td>
                                <td class="price-tag">$<fmt:formatNumber value="${l.price}" pattern="#,###"/></td>
                                <td>${l.cpu}</td>
                                <td>${l.ram}</td>
                                <td>${l.storage}</td>
                                <td><img src="data:image/jpeg;base64,${l.image}"/></td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </c:if>

        <!-- SUMMARY BY BRAND -->
        <div class="section-title">📊 Summary by Brand</div>
        <div class="table-wrapper">
            <table>
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
                            <td>${row[1]}</td>
                            <td class="price-tag">$<fmt:formatNumber value="${row[2]}" pattern="#,###"/></td>
                            <td>$<fmt:formatNumber value="${row[3]}" pattern="#,###"/></td>
                            <td>$<fmt:formatNumber value="${row[4]}" pattern="#,###"/></td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>

        <a class="back-btn" href="${pageContext.request.contextPath}/">← Back to Home</a>

    </body>
</html>