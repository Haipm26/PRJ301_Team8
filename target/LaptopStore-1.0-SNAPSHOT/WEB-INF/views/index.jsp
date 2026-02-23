<%-- 
    Document   : index
    Created on : Feb 23, 2026, 11:32:54 PM
    Author     : Pham Minh Hai
--%>

<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<body>
    <h1>${message}</h1>
    <hr>
    <h2>Our Laptops</h2>
    <form action="${pageContext.request.contextPath}/laptops" method="post">
        Name : <input type="text" name="name"><br/>
        Brand : <input type="text" name="brand"><br/>
        Price : <input type="text" name="price"><br/>
        Storage : <input type="text" name="storage"><br/>
        Featured : <input type="radio" name="featured" value="true"> TRUE <br/><input type="radio" name="featured" value="false"> FALSE<br/>
        <input type="submit" name="submit" value="submit">
    </form>
    
    <table border="1">
        <tr>
            <th>Name</th>
            <th>Brand</th>
            <th>Price</th>
            <th>Storage</th>
        </tr>
        <c:forEach items="${laptops}" var="l">
            <tr>
                <td>${l.name}</td>
                <td>${l.brand}</td>
                <td>$${l.price}</td>
                <td>${l.storage}</td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>