<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<html>
<head>
    <title>Thống kê Laptop</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f6f9;
            margin: 0;
            padding: 20px;
            color: #333;
        }
        h1 {
            text-align: center;
            color: #2c3e50;
            margin-bottom: 30px;
        }
        .cards {
            display: flex;
            justify-content: center;
            gap: 20px;
            flex-wrap: wrap;
            margin-bottom: 40px;
        }
        .card {
            background: white;
            border-radius: 10px;
            padding: 20px 30px;
            text-align: center;
            box-shadow: 0 2px 8px rgba(0,0,0,0.1);
            min-width: 150px;
        }
        .card .label {
            font-size: 14px;
            color: #888;
            margin-bottom: 8px;
        }
        .card .value {
            font-size: 24px;
            font-weight: bold;
        }
        .card.blue .value  { color: #3498db; }
        .card.green .value { color: #2ecc71; }
        .card.red .value   { color: #e74c3c; }
        .card.orange .value{ color: #e67e22; }
        .card.purple .value{ color: #9b59b6; }

        h2 {
            text-align: center;
            color: #2c3e50;
            margin-bottom: 15px;
        }
        table {
            width: 80%;
            margin: 0 auto;
            border-collapse: collapse;
            background: white;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 2px 8px rgba(0,0,0,0.1);
        }
        th {
            background-color: #2c3e50;
            color: white;
            padding: 12px 16px;
            text-align: left;
        }
        td {
            padding: 12px 16px;
            border-bottom: 1px solid #eee;
        }
        tr:last-child td { border-bottom: none; }
        tr:hover td { background-color: #f0f4f8; }

        .back-btn {
            display: block;
            width: fit-content;
            margin: 30px auto 0;
            padding: 10px 24px;
            background-color: #2c3e50;
            color: white;
            text-decoration: none;
            border-radius: 6px;
        }
        .back-btn:hover { background-color: #3d5166; }
    </style>
</head>
<body>
    <h1> Thống kê giá Laptop</h1>

    <!-- CARDS -->
    <div class="cards">
        <div class="card blue">
            <div class="label">Số lượng</div>
            <div class="value">${count}</div>
        </div>
        <div class="card green">
            <div class="label">Giá cao nhất</div>
            <div class="value"><fmt:formatNumber value="${maxPrice}" pattern="#,###"/> đ</div>
        </div>
        <div class="card red">
            <div class="label">Giá thấp nhất</div>
            <div class="value"><fmt:formatNumber value="${minPrice}" pattern="#,###"/> đ</div>
        </div>
        <div class="card orange">
            <div class="label">Giá trung bình</div>
            <div class="value"><fmt:formatNumber value="${avgPrice}" pattern="#,###"/> đ</div>
        </div>
        <div class="card purple">
            <div class="label">Tổng giá trị</div>
            <div class="value"><fmt:formatNumber value="${sumPrice}" pattern="#,###"/> đ</div>
        </div>
    </div>

    <!-- BẢNG THEO BRAND -->
    <h2>Thống kê theo thương hiệu (cao → thấp)</h2>
    <table>
        <tr>
            <th>Thương hiệu</th>
            <th>Số lượng</th>
            <th>Giá cao nhất</th>
            <th>Giá thấp nhất</th>
            <th>Giá trung bình</th>
        </tr>
        <c:forEach items="${brandStats}" var="row">
        <tr>
            <td><strong>${row[0]}</strong></td>
            <td>${row[1]}</td>
            <td><fmt:formatNumber value="${row[2]}" pattern="#,###"/> đ</td>
            <td><fmt:formatNumber value="${row[3]}" pattern="#,###"/> đ</td>
            <td><fmt:formatNumber value="${row[4]}" pattern="#,###"/> đ</td>
        </tr>
        </c:forEach>
    </table>

    <a class="back-btn" href="${pageContext.request.contextPath}/">← Quay lại trang chủ</a>
</body>
</html>