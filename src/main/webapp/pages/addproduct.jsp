<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add Product</title>
    <!-- Link to external CSS file -->
    <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/CSS/addproduct.css">
</head>
<body>

<header>
  <div class="header-top">
    <div class="brand-logo">kasam</div>
  </div>

  <nav class="nav-bar">
    <a href="dashboard.jsp">Dashboard</a>
    <a href="#">Category</a>
    <a href="#">Product</a>
    <a href="${pageContext.request.contextPath}/logoutController" style="display:inline;">Logout</a>
  </nav>
</header>

<h2>CREATE NEW PRODUCTS</h2>

<form action="ProductController" method="post" enctype="multipart/form-data">
  <div class="container">

    <div class="form-left">
      <label>Product Name</label>
      <input type="text" name="name" required>

      <label>Select Category</label>
      <input type="text" name="category" required>

      <label>Description</label>
      <div class="desc-row">
        <div>
          <label>Description Title</label>
          <input type="text" name="title1" placeholder="Title 1">
          <input type="text" name="title2" placeholder="Title 2">
          <input type="text" name="title3" placeholder="Title 3">
        </div>
        <div>
          <label>Description Text</label>
          <input type="text" name="text1" placeholder="Text 1">
          <input type="text" name="text2" placeholder="Text 2">
          <input type="text" name="text3" placeholder="Text 3">
        </div>
      </div>

      <div class="form-actions">
        <button type="reset">Clear</button>
        <button type="submit">Publish</button>
      </div>
    </div>

    <div class="form-right">
      <label>Product Image</label>
      <div class="image-preview">[ Image Preview ]</div>
      <input type="file" name="imagePath" accept="image/*">

      <label>Price</label>
      <input type="number" name="price" step="0.01" required>

      <label>Quantity</label>
      <input type="number" name="quantity" required>
    </div>

  </div>
</form>

</body>
</html>
