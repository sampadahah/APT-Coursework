<%@ page import="java.util.ArrayList" %>
<%@ page import="com.aptcoursework.controller.dao.UserDAO" %>
<%@ page import="com.aptcoursework.model.user" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="header.jsp" %>
<%
    ArrayList<user> userList = null;
    try {
        UserDAO dao = new UserDAO();
        userList = dao.getAllUsers();
    } catch (Exception e) {
        e.printStackTrace();
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>All Users</title>
    <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/CSS/adminDashboard.css">
  	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    <style>
        table {
            width: 90%;
            margin: 20px auto;
            border-collapse: collapse;
            font-family: Arial, sans-serif;
        }
        th, td {
            border: 1px solid #bbb;
            padding: 10px;
            text-align: center;
        }
        th {
            background-color: #ffe4ec;
            color: #d63384;
        }
        h2 {
            text-align: center;
            color: #d63384;
        }
        .back-button-container {
  			text-align: center;
  			margin: 30px 0;
		}

		.back-button {
 			 display: inline-block;
 			 padding: 12px 25px;
 		 	background-color: #d63384;
 			 color: white;
 			 font-weight: bold;
 		 	border-radius: 8px;
 			 text-decoration: none;
 			 box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
 			 transition: all 0.3s ease;
		}

		.back-button:hover {
			background-color: #c12374;
  			text-decoration: none;
  			box-shadow: 0 6px 10px rgba(0, 0, 0, 0.15);
		}
		  	.search-bar {
 	 display: flex;
 	 align-items: center;
 	 background-color: #eee;
	 padding: 5px 10px;
	 border-radius: 8px;
 	 width: 400px;
 	 background-color: #ffe4ec;
  	 margin-left: 110px;
}
	  	.custom-container {
  	display: flex;
 	 justify-content: center; /* Change from center to space-between */
 	 flex-wrap: wrap;
 	 max-width: 1000px; /* Limit width to center it and avoid excess spacing */
  	margin: 0 auto 40px;
 	 margin-top: 40px;
 	 gap: 50px; /* Optional: controls spacing between cards */
}
  	.top-margin {
  	margin-top: 40px;
	}
		.nav-bar a {
  	font-size: 24px;
  	color: #d63384;
  	font-weight: bold;
  	text-decoration: none;
	}
		.nav-bar {
	 background-color: ##fff; /* Optional: dark background for contrast */
  	 padding: 10px 20px;
}
	
    .card:hover {
      box-shadow: 0 6px 12px rgba(0, 0, 0, 0.2);
      transform: translateY(-5px);
      transition: all 0.3s ease-in-out;
      cursor: pointer;
    }

    .card:hover .custom-muted-uppercase a {
      color: #d63384;
      text-decoration: none;
      transition: color 0.3s ease;
    }

    .custom-muted-uppercase a {
      font-size: 30px;
      text-decoration: none;
      color: #6c757d;
    }

    .custom-muted-uppercase a:hover {
      color: #d63384;
    }
.logout-form {
  display: inline;
}

.logout-button {
  background-color: #d63384;
  color: white;
  border: none;
  padding: 8px 15px;
  border-radius: 6px;
  font-weight: bold;
  display: flex;
  align-items: center;
  gap: 8px;
  cursor: pointer;
  font-family: Arial, sans-serif;
  box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
  transition: background-color 0.3s ease, box-shadow 0.3s ease;
}

.logout-button:hover {
  background-color: #c12374;
  box-shadow: 0 6px 10px rgba(0, 0, 0, 0.15);
}

.user-icon i {
  color: #d63384; /* Pink color matching your theme */
  font-size: 20px; /* Optional: adjust size */
  transition: color 0.3s ease;
}

.user-icon i:hover {
  color: #c12374; /* Slightly darker pink on hover */
}


    </style>
</head>
<body>
<!--   <header>
    <div class="header-top">
      <div class="brand-logo">KASAM</div>
      <div class="search-bar">
        <input type="text" placeholder="Search for products">
        <button><i class="fas fa-search"></i></button>
      </div>
      <div class="header-icons">
 			<a href="profile.jsp" class="user-icon"><i class="fas fa-user"></i></a>
			<form action="login.jsp" method="get" class="logout-form">
  			<button type="submit" class="logout-button">
    		<i class="fas fa-sign-out-alt"></i> Logout
  </button>
</form>

  </button>
</form>

      </div>
    </div> -->
<!--     <nav class="nav-bar">
      <a href="#">REGISTERED USERS</a>
    </nav> -->
  </header>
    <table>
        <tr>
            <th>ID</th>
            <th>Username</th>
            <th>Email</th>
            <th>Phone</th>
            <th>Address</th>
            <th>Role</th>
            <th>Registered Date</th>
        </tr>
        <%
            if (userList != null && !userList.isEmpty()) {
                for (user u : userList) {
        %>
        <tr>
            <td><%= u.getUserId() %></td>
            <td><%= u.getName() %></td>
            <td><%= u.getEmail() %></td>
            <td><%= u.getPhone() %></td>
            <td><%= u.getAddress() %></td>
            <td><%= u.getRole() %></td>
            <td><%= u.getRegisteredDate() %></td>
        </tr>
        <%
                }
            } else {
        %>
        <tr>
            <td colspan="7">No users found.</td>
        </tr>
        <% } %>
    </table>
    <div class="back-button-container">
  <a href="adminDashboard.jsp" class="back-button">Back to Dashboard</a>
</div>
</body>
</html>
