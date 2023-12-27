<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" isELIgnored="false" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
     <link rel="stylesheet" href="/global.css">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ViewEmployee</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
    <script src="https://kit.fontawesome.com/a43228976e.js" crossorigin="anonymous"></script>
</head>

<body>
<% if (session.getAttribute("username")==null){
	response.sendRedirect("login.jsp");
} %>
   <nav class="navbar navbar-expand-lg" style="background-color: rgba(0, 0, 0, 0.2);">
    <div class="container-fluid">

      <div class="col-8">

        <img src="/imges/LMS_Logo-removebg-preview.png" alt="" srcset="" class="ms-1" width="90" height="50">
      </div>
      

        <span class="d-flex d-none d-sm-block ">
          Welcome ${admin.username}
        </span>
        <div class="dropdown dropstart ">
          <a href="#" class="d-flex   align-items-center text-dark text-decoration-none dropdown-toggle"
            id="dropdownUser1" data-bs-toggle="dropdown" aria-expanded="false">
            <img src="/imges/profilelogo.png" alt="hugenerd" width="30" height="30" class="rounded-circle">
            <span class="d-none d-sm-inline mx-1">Profile</span>
          </a>
          <ul class="dropdown-menu dropdown-menu-dark text-small mt-5 ms-2 shadow">
            <li><a class="dropdown-item"  href="AdminResetPassword?id=<c:out value="${admin.id }"/>">Reset Password</a></li>
            <li>
              <hr class="dropdown-divider">
            </li>
            <li><a class="dropdown-item" href="logout?id=<c:out value=" ${admin.id }" />">Sign out</a></li>
          </ul>
        </div>
      
    </div>
  </nav>
    <div class="container-fluid">
        <div class="row">
            <div class="col-auto col-md-3 col-xl-2 px-sm-2 px-0 " style="background-color: rgba(0, 0, 0, 0.2);">
                <div class="d-flex flex-column align-items-center align-items-sm-start px-3 pt-2 text-white min-vh-100">
                    <a href="/"
                        class="d-flex align-items-center pb-3 mb-md-0 me-md-auto text-dark text-decoration-none">
                        <span class="fs-4 d-none d-sm-inline">Menu</span>
                    </a>
                    <ul class="nav nav-pills flex-column mb-sm-auto mb-0 align-items-center align-items-sm-start"
                        id="menu">
                        <li>
                            <a href="AdminDashboard?id=<c:out value="${admin.id }"/>" class="nav-link align-middle px-0">
                                <i class="fa-solid fa-house"></i> <span
                                    class="ms-2 d-none d-sm-inline text-dark">Home</span>
                            </a>
                        </li>

                        <li>
                            <a href="" class="nav-link px-0 mt-2 align-middle">
                                <i class="fa-solid fa-users"></i> <span
                                    class="ms-1 d-none d-sm-inline text-primary">View
                                    Employees</span></a>
                        </li>
                        <li>
                            <a href="AdminAddEmployee?id=<c:out value="${admin.id }"/>"class="nav-link px-0 mt-2 align-middle">
                                <i class="fa-solid fa-user-plus"></i> <span
                                    class="ms-1 d-none d-sm-inline text-dark">Add Employee</span> </a>
                        </li>

                        <li>
                            <a href="AdminManageLeave?id=<c:out value="${admin.id }"/>" class="nav-link px-0 mt-2 align-middle">
                                <i class="fa-solid fa-calendar-days"></i> <span
                                    class="ms-2 d-none d-sm-inline text-dark">Manage Leave</span> </a>
                        </li>

                        <li>
                            <a href="AdminAddHoliday?id=<c:out value="${admin.id }"/>" class="nav-link px-0 mt-2 align-middle">
                                <i class="fa-solid fa-mug-hot"></i> <span class="ms-2 d-none d-sm-inline text-dark">Add
                                    Holiday</span></a>
                        </li>

                        <li>
                            <a href="AdminAddProject?id=<c:out value="${admin.id }"/>" class="nav-link px-0 mt-2 align-middle">
                                <i class="fa-solid fa-folder-plus"></i> <span
                                    class="ms-2 d-none d-sm-inline text-dark">Add Project</span></a>
                        </li>
                         <li>
                            <a href="AdminViewHoliday?id=<c:out value=" ${admin.id }" />" class="nav-link
                            px-0 mt-2 align-middle">
                            <i class="fa-solid fa-mug-hot"></i>
                            <span class="ms-2 d-none d-sm-inline text-dark">Holidays</span></a>
                        </li>
                    </ul>
                    <hr>

                </div>
            </div>

            <div class="col-md-7 col-xl-9 col-8 mt-4 ms-5 table-responsive">
                <table id="table" class="table table-border table-hover mt-4">
                    <tr>
                        <th> ID</th>
                        <th> Name</th>
                        <th> Username</th>
                        <th>Designation</th>
                        <th>Department</th>
                        <th>Email ID</th>
                        <th>Phone Number</th>
                        <th>Action</th>

                    </tr>

                    <c:forEach items="${employees }" var="emp">
                        <tr>
                            <td>${emp.id}</td>
                            <td>${emp.name}</td>
                            <td>${emp.username}</td>
                            <td>${emp.designation}</td>
                            <td>${emp.department}</td>
                            <td>${emp.email}</td>
                            <td>${emp.mobileNumber }</td>



                            <td><a class="action-edit" href="AdminUpdateEmployee?id=<c:out value="${emp.id }"/>"><i
                                        class="fa-solid fa-user-pen"></i></a>&nbsp;&nbsp; <a class="action-edit"
                                        href="AdminDeleteEmployee?id=<c:out value='${emp.id }'/>" onclick="return check()"><i
                                            class="fa-solid fa-trash"></i></a>&nbsp;&nbsp;<a></td>

                        </tr>
                    </c:forEach>
                </table>
            </div>


        </div>
    </div>

    </div>
    </div>


    <footer class="bg-light text-lg-start ">
        <div class=" p-3" style="background-color: rgba(0, 0, 0, 0.2);">
            � 2023 Copyright: Leave Management System 
        </div>
    </footer>

</body>

</html>