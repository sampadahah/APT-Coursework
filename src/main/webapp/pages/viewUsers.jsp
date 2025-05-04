<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>All Users</title>
    <style>
        table {
            width: 80%;
            margin: 40px auto;
            border-collapse: collapse;
        }
        th, td {
            padding: 12px;
            border: 1px solid #ccc;
            text-align: left;
        }
        th {
            background-color: #f48fb1;
            color: white;
        }
    </style>
</head>
<body>
    <h2 style="text-align: center;">List of All Users</h2>
    <table>
        <tr>
            <th>ID</th>
            <th>Username</th>
            <th>Email</th>
            <th>Phone</th>
            <th>Address</th>
            <th>Role</th>
            <th>Registered</th>
        </tr>
        <c:forEach var="user" items="${usersList}">
            <tr>
                <td>${user.userId}</td>
                <td>${user.name}</td>
                <td>${user.email}</td>
                <td>${user.phone}</td>
                <td>${user.address}</td>
                <td>${user.role}</td>
                <td>${user.registeredDate}</td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>
