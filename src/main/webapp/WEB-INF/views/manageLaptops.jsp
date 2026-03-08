<%-- Document : index Created on : Feb 23, 2026, 11:32:54 PM Author : Pham Minh Hai --%>

    <%@ taglib prefix="c" uri="jakarta.tags.core" %>
        <html>

        <body>
            <h1>${message}</h1>
            <hr>
            <h2>Our Laptops</h2>
            <form action="${pageContext.request.contextPath}/laptops" method="post" enctype="multipart/form-data">
                Name : <input type="text" name="name"><br />
                Brand : <input type="text" name="brand"><br />
                Price : <input type="text" name="price"><br />
                CPU : <input type="text" name="cpu"><br />
                Ram : <input type="text" name="ram"><br />
                Storage : <input type="text" name="storage"><br />
                Color : <input type="text" name="color"><br />
                Image : <input type="file" name="imageFile" accept="image/*"><br />
                Description : <textarea name="description" rows="10" cols="10"></textarea><br />
                Featured : <input type="radio" name="featured" value="true"> TRUE <br /><input type="radio"
                    name="featured" value="false"> FALSE<br />
                New Arrival : <input type="radio" name="newArrival" value="true"> TRUE <br /><input type="radio"
                    name="newArrival" value="false"> FALSE<br />


                <input type="submit" name="submit" value="submit">
            </form>

            <table border="1">
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Brand</th>
                    <th>Price</th>
                    <th>CPU</th>
                    <th>RAM</th>
                    <th>Storage</th>
                    <th>Color</th>
                    <th>Featured</th>
                    <th>New Arrival</th>
                    <th>Description</th>
                    <th>Image</th>
                    <th>Actions</th>
                </tr>

                <c:forEach items="${laptops}" var="l">
                    <tr>
                        <td>${l.id}</td>
                        <td>${l.name}</td>
                        <td>${l.brand}</td>
                        <td>${l.price}</td>
                        <td>${l.cpu}</td>
                        <td>${l.ram}</td>
                        <td>${l.storage}</td>
                        <td>${l.color}</td>

                        <!-- Featured -->
                        <td>
                            <c:choose>
                                <c:when test="${l.isFeatured}">
                                    Yes
                                </c:when>
                                <c:otherwise>
                                    No
                                </c:otherwise>
                            </c:choose>
                        </td>

                        <!-- New Arrival -->
                        <td>
                            <c:choose>
                                <c:when test="${l.isNewArrival}">
                                    Yes
                                </c:when>
                                <c:otherwise>
                                    No
                                </c:otherwise>
                            </c:choose>
                        </td>

                        <!-- Description -->
                        <td>${l.description}</td>

                        <!-- Image -->
                        <td>
                            <img src="data:image/jpeg;base64,${l.image}" width="120" />
                        </td>
                        <td>
                            <a href="${pageContext.request.contextPath}/laptops/delete/${l.id}"
                                onclick="return confirm('Are you sure?')">Delete</a>
                            |
                            <a href="${pageContext.request.contextPath}/laptops/update/${l.id}">Edit</a>
                            |
                            <a href="${pageContext.request.contextPath}/laptops/${l.id}">Detail</a>
                        </td>
                    </tr>
                </c:forEach>
            </table>
        </body>

        </html>