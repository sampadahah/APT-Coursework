<%@ page import="java.util.ArrayList" %>
<%@ page import="com.aptcoursework.model.User" %>
<%
    ArrayList<User> userList = (ArrayList<User>) request.getAttribute("userList");
%>
<!DOCTYPE html>
<html>
<head>
    <title>All Users</title>
    <%@include file="header.jsp" %>
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

        .custom-container {
            display: flex;
            justify-content: center;
            flex-wrap: wrap;
            max-width: 1000px;
            margin: 0 auto 40px;
            margin-top: 40px;
            gap: 50px;
        }

        .top-margin {
            margin-top: 40px;
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

        .action-button {
            padding: 10px 20px;
            background-color: #d63384;
            color: white;
            font-weight: bold;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            transition: all 0.3s ease;
        }

        .action-button:hover {
            background-color: #c12374;
            box-shadow: 0 6px 10px rgba(0, 0, 0, 0.15);
        }

        .action-button.delete {
            background-color: #dc3545; /* Bootstrap-like danger red */
        }

        .action-button.delete:hover {
            background-color: #c82333;
        }
    </style>
</head>
<body>
<table>
    <tr>
        <th>ID</th>
        <th>Username</th>
        <th>Email</th>
        <th>Phone</th>
        <th>Address</th>
        <th>Role</th>
        <th>Registered Date</th>
        <th>Actions</th>
    </tr>
    <%
        if (userList != null && !userList.isEmpty()) {
            for (User u : userList) {
    %>
    <tr>
        <td><%= u.getUserId() %></td>
        <td><%= u.getName() %></td>
        <td><%= u.getEmail() %></td>
        <td><%= u.getPhone() %></td>
        <td><%= u.getAddress() %></td>
        <td><%= u.getRole() %></td>
        <td><%= u.getRegisteredDate() %></td>
        <td>
            <div style="display: flex; gap: 10px; justify-content: center;">
                <form action="${pageContext.request.contextPath}/pages/editUser.jsp" method="get" style="display:inline;">
                    <input type="hidden" name="id" value="<%= u.getUserId() %>">
                    <button type="submit" class="action-button">Edit</button>
                </form>

                <form action="${pageContext.request.contextPath}/DeleteUserController" method="get" style="display:inline;" 
                      onsubmit="return confirm('Are you sure you want to delete this user?');">
                    <input type="hidden" name="id" value="<%= u.getUserId() %>">
                    <button type="submit" class="action-button delete">Delete</button>
                </form>
            </div>
        </td>
    </tr>
    <%
            }
        } else {
    %>
    <tr>
        <td colspan="8">No users found.</td>
    </tr>
    <% } %>
</table>

<div class="back-button-container">
    <a href="${pageContext.request.contextPath}/pages/adminDashboard.jsp" class="back-button">Back to Dashboard</a>
</div>

</body>
</html>
