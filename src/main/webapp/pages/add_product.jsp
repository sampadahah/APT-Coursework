<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Product</title>
<style>

body {
  font-family: Arial, sans-serif;
  background-color: #ffe4ec;
  margin: 0;
  padding: 0;
}

/* Header Styles */
.header-top {
  display: flex;
  align-items: center;
  justify-content: space-between;
  padding: 10px 40px;
  background-color: #fff;
  border-bottom: 1px solid #ddd;
}

.brand-logo {
  font-weight: bold;
  font-size: 24px;
  color: #d63384;
}

.nav-bar {
  background-color: #ffe4ec;
  display: flex;
  justify-content: center;
  padding: 10px 0;
  gap: 40px;
}

.nav-bar a {
  text-decoration: none;
  color: #333;
  font-weight: 500;
}

.nav-bar a:hover {
  color: #d63384;
}

/* Page Title */
h2 {
  text-align: center;
  color: #d63384;
  margin: 30px 0 10px 0;
}

/* Container Layout */
.container {
  display: flex;
  justify-content: center;
  align-items: flex-start;
  gap: 30px;
  padding: 30px;
  max-width: 1200px;
  margin: 0 auto;
}

/* Left & Right Form Panels */
.form-left, .form-right {
  padding: 25px;
  border-radius: 10px;
  box-shadow: 0 0 10px rgba(0,0,0,0.05);
}

/* Left Panel */
.form-left {
  background-color: #d63384;
  color: white;
  flex: 2;
}

.form-left label {
  font-weight: bold;
  margin-top: 15px;
  display: block;
}

.form-left input[type="text"] {
  width: 100%;
  padding: 8px;
  margin-top: 5px;
  border: none;
  border-radius: 5px;
}

/* Description Row */
.desc-row {
  display: flex;
  gap: 20px;
}

.desc-row > div {
  flex: 1;
}

/* Right Panel */
.form-right {
  background-color: #fff;
  flex: 1;
}

.form-right label {
  font-weight: bold;
  display: block;
  margin-top: 15px;
}

.form-right input[type="number"],
.form-right input[type="file"] {
  width: 100%;
  padding: 8px;
  margin-top: 5px;
  border: 1px solid #ddd;
  border-radius: 5px;
}

.image-preview {
  width: 100%;
  height: 150px;
  background-color: #f8f9fa;
  display: flex;
  align-items: center;
  justify-content: center;
  margin-top: 10px;
  border-radius: 8px;
  color: #aaa;
  font-size: 14px;
}

/* Buttons */
.form-actions {
  margin-top: 20px;
  display: flex;
  justify-content: space-between;
}

.form-actions button {
  padding: 10px 20px;
  border: none;
  background-color: white;
  color: #d63384;
  font-weight: bold;
  border-radius: 5px;
  cursor: pointer;
  border: 2px solid #d63384;
  transition: 0.3s ease;
}

.form-actions button:hover {
  background-color: #d63384;
  color: white;
}
</style>
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
