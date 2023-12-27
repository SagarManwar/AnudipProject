<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" isELIgnored="false" %>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
     <link rel="stylesheet" href="/global.css">
    <title>manager LeaveTracker</title>

    <link rel="stylesheet" href="/global.css">
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
            <li><a class="dropdown-item"href="EmployeeResetPassword?id=<c:out value="${employee.id }"/>">Reset Password</a></li>
            <li>
              <hr class="dropdown-divider">
            </li>
            <li><a class="dropdown-item" href="#">Sign out</a></li>
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
                            <a href="ManagerDashboard?id=<c:out value="${employee.id }"/>" class="nav-link align-middle px-0">
                                <i class="fa-solid fa-house"></i> <span
                                    class="ms-2 d-none d-sm-inline text-dark">Home</span>
                            </a>
                        </li>

                        <li>
                            <a href="ManagerApplyLeave?id=<c:out value="${employee.id }"/>" class="nav-link px-0 mt-2 align-middle">
                                <i class="fa-regular fa-calendar-check"></i> 
                                <span class="ms-2 d-none d-sm-inline text-dark">Apply Leave</span></a>
                        </li>

                        <li>
                            <a href="ManagerViewEmployee?id=<c:out value="${employee.id }"/>" class="nav-link px-0 mt-2 align-middle">
                                <i class="fa-solid fa-binoculars"></i> <span
                                    class="ms-2 d-none d-sm-inline text-dark">View Employee</span></a>
                        </li>
                        <li>
                            <a href="ManagerViewProject?id=<c:out value="${employee.id }"/>" class="nav-link px-0 mt-2 align-middle">
                                <i class="fa-solid fa-binoculars"></i> <span
                                    class="ms-2 d-none d-sm-inline text-dark">Manage Leave</span></a>
                        </li>
                        <li>
                            <a href="ManagerViewProject?id=<c:out value="${employee.id }"/>"  class="nav-link px-0 mt-2 align-middle">
                                <i class="fa-solid fa-binoculars"></i> <span
                                    class="ms-2 d-none d-sm-inline text-dark">View Project</span></a>
                        </li>

                        <li>
                            <a href="" class="nav-link px-0 mt-2 align-middle">
                                <i class="fa-solid fa-chart-gantt"></i>
                                <span class="ms-2 d-none d-sm-inline text-primary">Leave Tracker</span></a>
                        </li>
                         <li>
                                    <a href="ManagerViewHoliday?id=<c:out value=" ${employee.id }" />" class="nav-link
                                    px-0 mt-2 align-middle">
                                    <i class="fa-solid fa-mug-hot"></i>
                                    <span class="ms-2 d-none d-sm-inline text-dark">Holidays</span></a>
                                </li>
                        
                    </ul>    
                </div>
            </div>

           <div class="col-md-7 col-xl-9 col-8 mt-5 ">
                <div class="row justify-content-center ">
                <div class="leavecard shadow col-sm-12 p-0 ms-5 mt-3" style="width: 10rem; height: 13rem;">
                    <div class="text-center mt-2">
                        <h6 >Sick Leave</h6>
                    </div>
                    <div class="text-center " >                   
                    <img src="/imges/sickleave.png" class="card-img-top w-50 " alt="...">
                </div>
                    <div class="card-body">
                       <p class="mb-2"><b>Available: </b><span>${employee.sickLeave}</span></p>
                        <b>Total: </b> 15 days
                    </div>
                </div>

            <!-----Card 2---->
                    
                  <div class="leavecard shadow p-0 ms-5 mt-3" style="width: 10rem; height: 13rem;">  
                    <div class="text-center mt-2">
                        <h6 >Casual Leave</h6>
                    </div>
                    <div class="text-center " > 
                    <img src="/imges/Casual.png" class="card-img-top w-50" alt="...">
                    </div>
                    <div class="card-body">
                        <p class="mb-2"><b>Available: </b><span>${employee.casualLeave}</span></p>
                        <b>Total: </b>15 days
                    </div>
                  </div>

            <!-----Card 3---->
                  <div class="leavecard shadow p-0 ms-5 mt-3" style="width: 10rem; height: 13rem;">
                    <div class="text-center mt-2">
                        <h6  >Personal Leave</h6>
                    </div>
                    <div class="text-center" > 
                    <img src="/imges/personal leave.png" class="card-img-top w-50" alt="...">
                    </div>
                    <div class="card-body">
                        <p class="mb-2"><b>Available: </b><span>${employee.personalLeave}</span></p>
                        <b>Total: </b>15 days
                    </div>
                    </div>

             <!------Card 4--> 
             <div class="leavecard shadow p-0 ms-5 mt-3" style="width: 10rem; height: 13rem;">
                <div class="text-center mt-2">
                    <h6 >Maternity Leave</h6>
                </div>
                <div class="text-center" > 
                <img src="/imges/maternitynew.png" class="card-img-top w-50 " alt="...">
                </div>
                <div class="card-body mt-2">
                    <p class="mb-2"><b>Available: </b><span>${employee.maternityLeave}</span></p>
                    <b>Total: </b> 180 days
                </div>
            </div>
        </div>
             <!------Card 5---->
        <div class="row justify-content-center ">
             <div class="leavecard shadow p-0 ms-5 mt-3" style="width: 10rem; height: 13rem;">
               
                <div class="text-center mt-2">
                    <h6>Paternity Leave</h6>
                </div>
                <div class="text-center mt-2" > 
                <img src="/imges/Paternity.png" class="card-img-top w-50" alt="...">
                </div>
                <div class="card-body">
                    <p class="mb-2"><b>Available: </b><span>${employee.paternityLeave}</span></p>
                    <b>Total: </b>30 days
                </div>
                </div>
            <!---- Card 6---->
            <div class="leavecard shadow p-0 ms-5 mt-3" style="width: 10rem; height: 13rem;">
                
                <div class="text-center mt-2">
                    <h6>Marriage Leave</h6>
                </div>
                <div class="text-center" > 
                <img src="/imges/MarriageLogo.png" class="card-img-top w-50" alt="...">
                </div>
                <div class="card-body">
                    <p class="mb-2"><b>Available: </b><span>${employee.marriageLeave}</span></p>
                    <b>Total: </b>15 days
                </div>
                </div>
            <!------Card 7---->
            <div class="leavecard shadow p-0 ms-5 mt-3" style="width: 10rem; height: 13rem;">
                
                <div class="text-center mt-2">
                    <h6 >Adoption Leave</h6>
                </div>
                <div class="text-center" > 
                <img src="/imges/adoption.png" class="card-img-top w-50" alt="..." >
                </div>
                <div class="card-body">
                    <p class="mb-2"><b>Available: </b><span>${employee.adoptionLeave}</span></p>
                    <b>Total: </b>30 days
                </div>
            </div>
        </div>
        
    
        <!-------------->
            <div class="col-12 table-responsive ms-5 mt-5 md-3 ">
                <table class="table table-hover">
                    
                    <thead >
                         <tr>
                            <th ><h4>Leave History</h4></th>
                        </tr>
                        
                    <tr>
                        <th scope="col">Leave ID</th>
                        <th scope="col">From</th>
                        <th scope="col">To</th>
                        <th scope="col">Days</th>
                        <th scope="col">Leave Type</th>
                        <th scope="col">Reason</th>
                        <th scope="col">Approval Status</th>
                    </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${leaves}" var="leave" >
                    <tr>
                        <td>${leave.lid}</td>
                        <td>${leave.startDate}</td>
                        <td>${leave.endDate}</td>
                        <td>${leave.days}</td>
                        <td>${leave.leaveType}</td>
                        <td>${leave.reason}</td>
                        <td>${leave.status}</td>
                    </tr>
                    
                </c:forEach>
                    </tbody>
                </table>
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