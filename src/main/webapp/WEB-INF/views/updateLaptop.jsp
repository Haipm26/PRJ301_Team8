<%-- Document : updateLaptop Created on : Mar 3, 2026, 10:51:46 AM Author : Pham Minh Hai --%>

    <%@page contentType="text/html" pageEncoding="UTF-8" %>
        <%@ taglib prefix="c" uri="jakarta.tags.core" %>
            <%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
                <!DOCTYPE html>
                <html>

                <head>
                    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
                    <title>JSP Page</title>
                </head>

                <body>
                    <form action="${pageContext.request.contextPath}/laptops/update" method="post"
                        enctype="multipart/form-data">

                        <input type="hidden" name="id" value="${laptop.id}">

                        Name : <input type="text" name="name" value="${laptop.name}"><br />
                        Brand : <input type="text" name="brand" value="${laptop.brand}"><br />
                        Price : <input type="text" name="price"
                            value="<fmt:formatNumber value='${laptop.price}' pattern='#'/>"><br />
                        CPU : <input type="text" name="cpu" value="${laptop.cpu}"><br />
                        Ram : <input type="text" name="ram" value="${laptop.ram}"><br />
                        Storage : <input type="text" name="storage" value="${laptop.storage}"><br />
                        Color : <input type="text" name="color" value="${laptop.color}"><br />

                        <p>Current Image:</p>
                        <img src="data:image/jpeg;base64,${laptop.image}" width="100" /><br />
                        New Image : <input type="file" name="imageFile" accept="image/*"><br />

                        Description : <textarea name="description" rows="10"
                            cols="10">${laptop.description}</textarea><br />

                        Featured :
                        <input type="radio" name="isFeatured" value="true" ${laptop.isFeatured ? 'checked' : '' }> TRUE
                        <input type="radio" name="isFeatured" value="false" ${laptop.isFeatured ? '' : 'checked' }>
                        FALSE<br />

                        New Arrival :
                        <input type="radio" name="isNewArrival" value="true" ${laptop.isNewArrival ? 'checked' : '' }>
                        TRUE
                        <input type="radio" name="isNewArrival" value="false" ${laptop.isNewArrival ? '' : 'checked' }>
                        FALSE<br />

                        <input type="submit" name="submit" value="Update Laptop">
                    </form>
                </body>

                </html>