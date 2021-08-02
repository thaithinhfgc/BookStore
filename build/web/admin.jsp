<%--
    Document   : admin
    Created on : Jun 29, 2021, 8:23:02 PM
    Author     : ACER
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Page</title>
        <link rel="stylesheet" href="bootstrap/css/bootstrap.css" />
    </head>
    <body class="d-flex h-100 text-center ">
        <c:if test="${sessionScope.LOGIN_USER.roleID != 'AD'}">
            <c:redirect url="login.jsp"></c:redirect>
        </c:if>
        <main class="px-3" style="padding-top: 15px">
            <p class="lead">
            <h1>User Management</h1>
            <p class="lead"style="color: red">
                ${requestScope.ERROR_MESSAGE}
                ${requestScope.USER_ERROR.fullNameError}<br/>
                ${requestScope.USER_ERROR.roleIDError}<br/>
                ${requestScope.USER_ERROR.addressError}
            </p>
        </p>
        <div class="container py-3">
            <form method="GET" action="MainController">
                <div class="input-group">
                    <div class="form-outline">
                        <input id="search-focus" type="search" id="form1" class="form-control" name="search" value="${param.search}" />
                    </div>
                    <button type="submit" class="btn btn-primary" name="action" value="Search" >
                        Search
                    </button>
                    <button style="left: 5px" type="submit" class="btn btn-secondary" name="action" value="Logout" >
                        Logout
                    </button>
                </div>
            </form>
            <c:if test="${requestScope.LIST_USER != null}">
                <c:if test="${not empty requestScope.LIST_USER}">
                    <table class="table">
                        <thead>
                            <tr>
                                <th scope="col">No</th>
                                <th scope="col">user ID</th>
                                <th scope="col">Email</th>
                                <th scope="col">Full Name</th>
                                <th scope="col">Role ID</th>
                                <th scope="col">Password</th>
                                <th scope="col">Address</th>
                                <th scope="col">Status</th>
                                <th scope="col">Update</th>
                                <th scope="col">Delete</th>

                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="dto" varStatus="counter" items="${requestScope.LIST_USER}">
                            <form action="MainController">
                                <tr>
                                    <th scope="row">${counter.count}</th>
                                    <td>${dto.userID}</td>
                                    <td>${dto.email}</td>
                                    <td>
                                        <input class="form-control" type="text" name="fullName" required="" value="${dto.fullName}"/>
                                    </td>
                                    <td><input class="form-control" type="text" name="roleID" required="" value="${dto.roleID}"/></td>
                                    <td>${dto.password}</td>

                                    <td><input class="form-control" type="text" name="address" required="" value="${dto.address}"/></td>
                                    <td>
                                        <input type="hidden" name="userID" value="${dto.userID}"/>
                                        <input type="hidden" name="statusID" value="${dto.statusID}"/>
                                        <input type="hidden" name="search" value="${param.search}"/>
                                        <button class="btn btn-primary" type="submit" name="action" value="UpdateStatus"/>${dto.statusID}</button>
                                    </td>
                                    <td>
                                        <input type="hidden" name="userID" value="${dto.userID}"/>
                                        <input type="hidden" name="email" value="${dto.email}"/>
                                        <input type="hidden" name="search" value="${param.search}"/>
                                        <button type="submit" class="btn btn-primary" name="action" value="Update">Update</button>
                                    </td>
                                    <td>
                                        <input type="hidden" name="userID" value="${dto.userID}"/>
                                        <input type="hidden" name="search" value="${param.search}"/>
                                        <button type="submit" class="btn btn-danger" name="action" value="Delete">Delete</button>
                                    </td>


                                </tr>
                            </form>
                        </c:forEach>


                        </tbody>
                    </table>
                </c:if>
                <c:if test="${empty requestScope.LIST_USER}">
                    <p>No record found!</p>
                </c:if>
            </c:if>
        </div>
    </main>
    <script src="bootstrap/js/bootstrap.js"></script>
</body>
</html>
