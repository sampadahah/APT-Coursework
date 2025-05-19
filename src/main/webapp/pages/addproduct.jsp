<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Product</title>
    <!-- Link to external CSS file -->
    <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/CSS/addproduct.css">
</head>
<body>

<div class="back-link">
    <a href="<%= request.getContextPath() %>/pages/adminDashboard.jsp">← Back to Admin Dashboard</a>
</div>

<main>
    <h2>Create New Product</h2>

    <!-- Add proper action and method attributes -->
    <form id="productForm" action="<%= request.getContextPath() %>/ProductController" method="post" enctype="multipart/form-data">
        <div class="form-container">
            <!-- Left Side: Product Name, Description -->
            <div class="form-left">
                <label for="product_name">Product Name</label>
                <input type="text" id="product_name" name="product_name" required>

                <label for="product_description">Product Description</label>
                <textarea id="product_description" name="product_description" rows="5" required></textarea>

                <label for="price">Price (in RS)</label>
                <input type="number" id="price" name="price" step="0.01" required>

                <label for="quantity">Quantity</label>
                <input type="number" id="quantity" name="quantity" required>
            </div>

            <!-- Right Side: Image Upload -->
            <div class="form-right">
                <label for="imagePath">Product Image</label>
                <div class="image-preview" id="imagePreview">[ Image Preview ]</div>
                <input type="file" id="imagePath" name="imagePath" accept="image/*" onchange="previewImage(event)">

                <div class="form-actions">
                    <button type="button" onclick="document.getElementById('productForm').reset();">Clear</button>
                    <button type="submit">Publish</button>
                </div>
            </div>
        </div>
    </form>
</main>

<!-- JavaScript for image preview -->
<script>
function previewImage(event) {
    const preview = document.getElementById("imagePreview");
    preview.innerHTML = ""; // Clear placeholder text
    const file = event.target.files[0];

    if (file) {
        const img = document.createElement("img");
        img.src = URL.createObjectURL(file);
        img.style.maxWidth = "100%";
        img.style.maxHeight = "150px";
        img.onload = () => URL.revokeObjectURL(img.src);
        preview.appendChild(img);
    } else {
        preview.innerHTML = "[ Image Preview ]";
    }
}
</script>
</body>
</html>
