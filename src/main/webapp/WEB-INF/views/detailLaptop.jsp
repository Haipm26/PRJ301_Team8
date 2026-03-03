<%-- 
    Document   : detail
    Created on : Mar 3, 2026, 10:52:07 AM
    Author     : Pham Minh Hai
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div class="container">
        <div class="image-section">
            <c:choose>
                <c:when test="${not empty laptop.image}">
                    <img src="data:image/jpeg;base64,${laptop.image}" width="400" alt="${laptop.name}"/>
                </c:when>
                <c:otherwise>
                    <div style="width:400px; height:300px; background:#f0f0f0; display:flex; align-items:center; justify-content:center;">
                        No Image Available
                    </div>
                </c:otherwise>
            </c:choose>
        </div>

        <div class="info-section">
            <h1>${laptop.name}</h1>
            <p class="price">$${laptop.price}</p>
            <p><span class="label">Brand:</span> ${laptop.brand}</p>
            
            <hr>
            
            <p><span class="label">Specifications:</span></p>
            <ul>
                <li><strong>CPU:</strong> ${laptop.cpu}</li>
                <li><strong>RAM:</strong> ${laptop.ram}</li>
                <li><strong>Storage:</strong> ${laptop.storage}</li>
                <li><strong>Color:</strong> ${laptop.color}</li>
            </ul>

            <div style="margin: 20px 0;">
                <c:if test="${laptop.isFeatured}">
                    <span class="badge" style="background: gold;">⭐ Featured Product</span>
                </c:if>
                <c:if test="${laptop.isNewArrival}">
                    <span class="badge" style="background: #ccffcc;">New Arrival</span>
                </c:if>
            </div>

            <p><span class="label">Description:</span></p>
            <div style="background: #f9f9f9; padding: 15px; border-radius: 5px;">
                ${laptop.description}
            </div>

            <a href="${pageContext.request.contextPath}/" class="back-btn">← Back to Catalog</a>
        </div>
    </div>
    </body>
</html>
