<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" isELIgnored="false" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
     <link rel="stylesheet" href="/global.css">
    <title>Employee Dashboard</title>

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
          Welcome ${employee.username}
        </span>
        <div class="dropdown dropstart ">
          <a href="#" class="d-flex   align-items-center text-dark text-decoration-none dropdown-toggle"
            id="dropdownUser1" data-bs-toggle="dropdown" aria-expanded="false">
            <img src="/imges/profilelogo.png" alt="hugenerd" width="30" height="30" class="rounded-circle">
            <span class="d-none d-sm-inline mx-1">Profile</span>
          </a>
          <ul class="dropdown-menu dropdown-menu-dark text-small mt-5 ms-2 shadow">
            <li><a class="dropdown-item" href="EmployeeResetPassword?id=<c:out value="${employee.id }"/>">Reset Password</a></li>
            <li>
              <hr class="dropdown-divider">
            </li>
            <li><a class="dropdown-item" href="logout?id=<c:out value=" ${employee.id }" />">Sign out</a></li>
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
                            <a href="EmployeeDashboard?id=<c:out value="${employee.id }"/>" class="nav-link align-middle px-0">
                                <i class="fa-solid fa-house"></i> <span
                                    class="ms-2 d-none d-sm-inline text-primary">Home</span>
                            </a>
                        </li>

                        <li>
                            <a href="EmployeeApplyLeave?id=<c:out value="${employee.id }"/>" class="nav-link px-0 mt-2 align-middle">
                                <i class="fa-regular fa-calendar-check"></i> <span class="ms-2 d-none d-sm-inline text-dark">Apply Leave</span></a>
                        </li>


                        
                        <li>
                            <a href="EmployeeViewProject?id=<c:out value="${employee.id }"/>" class="nav-link px-0 mt-2 align-middle">
                                <i class="fa-solid fa-binoculars"></i> <span
                                    class="ms-2 d-none d-sm-inline text-dark">View Project</span></a>
                        </li>

                        <li>
                            <a href="EmployeeLeaveTracker?id=<c:out value="${employee.id }"/>" class="nav-link px-0 mt-2 align-middle">
                                <i class="fa-solid fa-chart-gantt"></i>
                                <span class="ms-2 d-none d-sm-inline text-dark">Leave Tracker</span></a>
                        </li>
                        <li>
                                    <a href="EmployeeViewHoliday?id=<c:out value=" ${employee.id }" />" class="nav-link
                                    px-0 mt-2 align-middle">
                                    <i class="fa-solid fa-mug-hot"></i>
                                    <span class="ms-2 d-none d-sm-inline text-dark">Holidays</span></a>
                                </li>
                    </ul>
                    <hr>
                    
                </div>
            </div>
           <div class=" col-9 col-md-9 col-xl-9 mt-2 ms-3  ">
                <div class="row ">
                    <div class="col-lg-3 col-md-3 col-10">
                        <img class="rounded-circle w-75 ms-4 mt-3"  src="/imges/userprofile.jpeg">
                    </div>
                    <div class="col-lg-6 col-md-6 col-3 mt-5 ms-4">
                        <span class="fw-bold"><h4>${employee.name}</h4></span>                     
                        <span><h6>${employee.designation}</h6></span>
                        <span class="">${employee.address}</span>
                     </div>  
                </div>
                <hr>
                <div class="row mt-4">
                    <div class="col-lg-6 col-md-6 col-12 table-responsive">
                        <table class="table ">
                            <thead>
                                <th colspan="2" class="p-2"  style=" background-color: #807c7c3d;">Personal Information</th>
                            </thead>
                            <tbody>
                                <tr >
                                    <td class="">
                                        <label class="p-1">Email :</label> 
                                    </td>
                                    <td class="text-end">
                                        <span class="ms-2">${employee.email}</span>
                                    </td>
                                </tr>
                                <tr>
                                    <td >
                                        <label class="p-1">Mobile Number :</label>
                                    </td>
                                    <td class="text-end">
                                        <span class="ms-2" >${employee.mobileNumber}</span>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <label class="p-1" >DOB :</label>
                                    </td>
                                    <td class="text-end">
                                        <span class="ms-2">${employee.dob}</span>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <label class="p-1">Gender :</label>
                                    </td>
                                    <td class="text-end">
                                        <span class="ms-2-1">${employee.gender}</span>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <label class="p-1">State :</label>
                                    </td>
                                    <td class="text-end">
                                        <span class="ms-2-1">${employee.state}</span>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="col-lg-6 col-md-6 col-12 table-responsive">
                        <table class="table ">
                            <thead>
                                <th colspan="2" class="p-2"  style=" background-color: #807c7c3d;">Employment Information</th>
                            </thead>
                            <tbody>
                                <tr >
                                    <td>
                                        <label class="p-1">Employee ID :</label> 
                                    </td>
                                    <td class="text-end">
                                        <span class="ms-2">${employee.id}</span>
                                    </td>
                                </tr>
                                <tr>
                                    <td >
                                        <label class="p-1">UserName :</label>
                                    </td>
                                    <td class="text-end">
                                        <span class="ms-2" >${employee.username}</span>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <label class="p-1">Department :</label>
                                    </td>
                                    <td class="text-end">
                                        <span class="ms-2-1">${employee.department}</span>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <label class="p-1" >Date Hired :</label>
                                    </td>
                                    <td class="text-end">
                                        <span class="ms-2">${employee.joiningDate}</span>
                                    </td>
                                </tr>
                                 <tr>
                                    <td>
                                        <label class="p-1" >Manager Name :</label>
                                    </td>
                                    <td class="text-end">
                                        <span class="ms-2">${employee.managerName}</span>
                                    </td>
                                </tr>
                              
                                
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>            

                </div>
        </div>

    <footer class="bg-light text-center text-lg-start ">
        <div class="p-3" style="background-color: rgba(0, 0, 0, 0.2);">
            � 2023 Copyright: Leave Management System 
        </div>
    </footer>

</body>

</html>