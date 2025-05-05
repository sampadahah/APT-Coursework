<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Kasam Blog</title>
  <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/CSS/blog.css">
</head>
<body>
<%@ include file="header.jsp" %>
<!--   <!-- Header -->
<!--   <div class="header">
    <img src="../img/logo.png"" alt="Kasam Logo" class="logo">
    <input type="text" placeholder="Search for products">
    <div class="header-links">
      <a href="#">Login / Sign Up</a>
      <span>🛒</span>
    </div>
  </div> -->

  <!-- Navigation -->
<!--   <div class="nav">
    <a href="home.jsp">Home</a>
    <a href="#">Products</a>
    <a href="blog.jsp">Blog</a>
    <a href="aboutUs.jsp">About Us</a>
  </div> -->

  <!-- Blog Hero Section -->
  <div class="blog-hero">
    <h1>Our Blog</h1>
    <p>Explore. Learn. Glow with us</p>
    <div class="kasam-label">Kasam</div>
  </div>

  <!-- Blog Posts Grid -->
  <div class="blog-grid">
    <div class="post">
      <img src="../img/blog1.png" alt="Blog Post 1" />
      <p>A daily skincare routine helps prevent aging, reduce acne, and improve hydration. Consistent care keeps your skin glowing, healthy, and protected from environmental damage.</p>
    </div>
    <div class="post">
      <img src="../img/blog2.png" alt="Blog Post 2" />
      <p>In 2024, skincare is all about simplicity and sustainability. People are embracing skinimalism with fewer, multi-purpose products. There's a focus on protecting skin from blue light and using products that calm both skin and mind. Eco-friendly packaging is also becoming a must, and maintaining a healthy skin microbiome is gaining importance.</p>
    </div>
    <div class="post">
      <img src="../img/blog3.png" alt="Blog Post 3" />
      <p>Pilling occurs when skincare products form small flakes on your skin. It’s usually caused by layering too many products, applying them too quickly, or using incompatible ingredients. To prevent pilling, use fewer products, apply them in the right order, and let each layer absorb before applying the next.</p>
    </div>
    <div class="post">
      <img src="../img/blog4.png" alt="Blog Post 4" />
      <p>A proper skincare routine can help maintain healthy skin. Start with a gentle cleanser to remove dirt and oil. Follow with a toner to balance the skin's pH. Apply a serum for targeted treatment, then moisturize to lock in hydration. Finish with sunscreen to protect from UV damage.</p>
    </div>
    <div class="post">
      <img src="../img/blog5.png" alt="Blog Post 5" />
      <p>A simple skincare routine for men starts with a cleanser to remove impurities, followed by a moisturizer to keep skin hydrated. Add sunscreen daily for protection against UV damage. For specific concerns, like acne or dark spots, consider a targeted treatment or serum.</p>
    </div>
    <div class="post">
      <img src="../img/blog6.png" alt="Blog Post 6" />
      <p>If your skincare isn't working, it could be due to factors like using the wrong products for your skin type, not applying products in the correct order, or inconsistent use. Other reasons include over-exfoliating, not giving products enough time to work, or using expired products. Make sure to be patient and follow the right routine.</p>
    </div>
    <div class="post">
      <img src="../img/blog7.png" alt="Blog Post 7" />
      <p>To ensure your skincare products remain effective, store them in a cool, dry place away from direct sunlight and heat. Keep them tightly sealed and upright to prevent contamination. For products with active ingredients, such as serums or retinoids, refrigeration may help maintain their potency.</p>
    </div>
    <div class="post">
      <img src="../img/blog8.png" alt="Blog Post 8" />
      <p>Luxury skincare brands offer high-end, high-performance products. Some of the top brands include La Mer, Sisley Paris, and Estée Lauder. These brands often use rare ingredients and advanced formulas to deliver visible results and cater to the most discerning skincare enthusiasts.</p>
    </div>
    <div class="post">
      <img src="../img/blog9.png" alt="Blog Post 9" />
      <p>Stay hydrated by drinking more water to keep your skin plump. Aloe vera can soothe irritated skin, while a honey face mask provides natural moisture. Massaging your face improves circulation, and sleeping on your back helps reduce wrinkles. Simple and effective hacks that cost you nothing!</p>
    </div>
  </div>

  <!-- Slogan -->
  <div class="slogan">
    <p>Kasam: Your Glow, Your Story</p>
  </div>
  

<!--   <!-- Footer -->
 <!--  <div class="footer">
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
