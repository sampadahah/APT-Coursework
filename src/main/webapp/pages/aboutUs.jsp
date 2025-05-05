<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>About Us - Kasam</title>
  <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/CSS/aboutUs.css">
</head>
<body>
<%@ include file="header.jsp" %>
 <!-- <!--  Header
  <div class="header">
    <img src="../img/logo.png" alt="Logo" class="logo">
    <input type="text" placeholder="Search for products" class="search">
    <div class="header-right">
      <a href="#">Login / Sign Up</a>
      <span>🛒</span>
    </div>
  </div>

  Navigation
  <div class="nav">
    <a href="home.jsp">Home</a>
    <a href="#">Products</a>
    <a href="blog.jsp">Blog</a>
    <a href="aboutUs.jsp">About Us</a>
  </div> --> 

  <!-- About Section -->
  <div class="about">
    <div class="about-text">
      <h2>About us</h2>
      <p>"We’re here to create, inspire, and make a difference — by delivering skincare that not only transforms your skin, but empowers your confidence and honors the planet. At Kasam, we believe beauty begins with care — care for your skin, your well-being, and the world we live in. Every product is crafted with love, science, and sustainability in mind, because you deserve skincare that feels as good as it does good."</p>
      <p>We carefully select ingredients that are gentle, effective, and safe for all skin types. Our formulas are free from harsh chemicals, always cruelty-free, and packaged with the planet in mind. At Kasam, we’re dedicated to creating skincare that fits into your lifestyle—simple, trustworthy, and made to support your natural beauty every day.</p>
      <div class="kasam-label">Kasam</div>
    </div>
    <div class="about-image">
      <img src="../img/homepage2.jpg" alt="Kasam product">
    </div>
  </div>

  <!-- Tagline -->
  <div class="tagline">
    <p>Today, Kasam is more than skincare. It’s about feeling good inside and out.</p>
  </div>

  <!-- Description -->
  <div class="description-box">
    <p>
        Our gentle skincare formula deeply cleans your skin, leaving it fresh and glowing. Made with natural ingredients, it helps calm redness and irritation. Perfect for all skin types and safe to use every day. Plus, our packaging is eco-friendly and never tested on animals — because caring for your skin should also care for the planet.
    </p>
  </div>

  <!-- Image and Text Section -->
  <div class="image-text">
    <div class="text">
      <h3>Why Choose Kasam?</h3>
      <p>We combine science and nature to bring you products that not only nourish your skin but also respect the planet. Our formulas are thoughtfully crafted with clean, effective ingredients that deliver real results—without compromise.</p>

      <p>At Kasam, we believe skincare should be simple, honest, and sustainable. That’s why we avoid harsh chemicals, prioritize cruelty-free testing, and use eco-friendly packaging. Every product reflects our commitment to healthy skin and a healthier earth.</p>

      <p>We’re more than just a skincare brand—we’re a community that values wellness, transparency, and care. Whether you’re starting fresh or refining your routine, Kasam is here to support you with gentle, reliable products made for everyday confidence and long-term skin health.
        </p>
    </div>
    <div class="image">
      <img src="../img/homepage3.png" alt="Kasam skincare">
    </div>
  </div>

  <!-- Slogan -->
  <div class="slogan">
    <h2>Kasam: Glow with purpose</h2>
  </div>

  <!-- Footer -->
  <!-- <div class="footer">
    <div class="column">
      <h4>Shop</h4>
      <p>Cleanser<br>Serum<br>Moisturizer<br>Sunscreen</p>
    </div>
    <div class="column">
      <h4>Learn</h4>
      <p>Blogs<br>Features<br>Rewards<br>Newsletters</p>
    </div>
    <div class="column">
      <h4>Help</h4>
      <p>Contact Us<br>Policies<br>FAQs</p>
    </div>
    <div class="column">
      <h4>KASAM, the promise to your skin.</h4>
      <p>Sign up for skincare tips:</p>
      <input type="email" placeholder="your email">
      <button>subscribe</button>
      <p>📷 📘 🐦 ✉️ 📞 061-891045</p>
    </div>
    <p class="footer-note">© 2025 KASAM Skincare</p>
  </div> -->
	<%@ include file="footer.jsp" %>
</body>
</html>
    