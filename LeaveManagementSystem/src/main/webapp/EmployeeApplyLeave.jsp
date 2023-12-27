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
                integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
                crossorigin="anonymous">
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
                crossorigin="anonymous"></script>
                 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
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
                        <div
                            class="d-flex flex-column align-items-center align-items-sm-start px-3 pt-2 text-white min-vh-100">
                            <a href="/"
                                class="d-flex align-items-center pb-3 mb-md-0 me-md-auto text-dark text-decoration-none">
                                <span class="fs-4 d-none d-sm-inline">Menu</span>
                            </a>
                            <ul class="nav nav-pills flex-column mb-sm-auto mb-0 align-items-center align-items-sm-start"
                                id="menu">
                                <li>
                                    <a href="EmployeeDashboard?id=<c:out value="${employee.id }"/>" class="nav-link align-middle px-0">
                                        <i class="fa-solid fa-house"></i> <span
                                            class="ms-2 d-none d-sm-inline text-dark">Home</span>
                                    </a>
                                </li>

                                <li>
                                    <a href="" class="nav-link px-0 mt-2 align-middle">
                                        <i class="fa-regular fa-calendar-check"></i> <span
                                            class="ms-2 d-none d-sm-inline text-primary">Apply Leave</span></a>
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
                           <div class="col-md-7 col-xl-9 col-8 mt-3 ">
                        <div class="card-body ">

                            <form action="empApplyLeave"  class="row ms-5" onsubmit=" return calculateday()">
                                <!--Form Heading-->
                                <div class=" pt-3 mb-3">
                                <span class="text-success"><h3>${success}</h3></span>
                                 <span class="text-danger"><h3>${duplicate}</h3></span>
                                    <h3>Leave Application</h3>
                                </div>
                                <!--Employee ID-->
                                <div class="col-xl-6  col-md-6 col-12 mt-3">
                                    <label class="form-label fw-bold ">ID</label>
                                    <input type="text" name="empId" value="${employee.id}"
                                        class="form-control border-top-0 border-start-0 border-end-0" readonly />
                                </div>

                                <!-- Employee name -->
                                <div class="col-xl-6  col-md-6 col-12 mt-3">
                                    <label class="form-label fw-bold ">Name</label>
                                    <input type="text" name="empName" value="${employee.name}"
                                        class="form-control border-top-0 border-start-0 border-end-0" readonly />
                                </div>
                                <input type="hidden" name="empDesignation" value="${employee.designation }">

                                <!-- Start  Date -->
                                <div class="row">

                                    <div class="col-xl-6  col-md-6 col-12 mt-3">
                                        <label class="form-label fw-bold">Start Date</label>
                                        <input type="date" class="form-control border-top-0 border-start-0 border-end-0"
                                            id="d1" name="startDate"  />

                                        <Span id="d1error" class="text-danger"></Span>
                                    </div>

                                    <!-- End Input Date -->
                                    <div class="col-xl-6  col-md-6 col-12 mt-3">
                                        <label class="form-label fw-bold">End Date</label>
                                        <input type="date" class="form-control border-top-0 border-start-0 border-end-0"
                                            id="d2" name="endDate" onchange=" return calculateday()"  />
                                        <Span id="d2error" class="text-danger"></Span>
                                    </div>

                                </div>
                                <div class="col-xl-6  col-md-6 col-12 mt-4">
                                    <label class="form-label fw-bold">Days</label>
                                    <input id="output" name="days"
                                        class="form-control border-top-0 border-start-0 border-end-0">

                                </div>
                                <!-- Leave Type -->
                                <div class=" col-xl-6  col-md-6 col-12 mt-3">
                                    <label class="form-label fw-bold">Leave Type</label>
                                    <div class="d-flex flex-row mt-2  border-top-0 border-start-0 border-end-0">
                                        <select class="form-select" id="leave" name="leaveType" required>
                                            <option value="" disabled hidden selected>Choose LeaveType</option>
                                            <option id="sl" value="Sick Leave" data-bs-toggle="tooltip" data-bs-placement="top" title="Available ${employee.sickLeave }">Sick Leave</option>
                                            <option id="pl" value="Personal Leave" data-bs-toggle="tooltip" data-bs-placement="top" title="Available ${employee.personalLeave }">Personal Leave</option>
                                            <option id="cl" value="Casual Leave"  data-bs-toggle="tooltip" data-bs-placement="top" title="Available ${employee.casualLeave }">Casual Leave</option>
                                            <option id="ml" value="Maternity Leave" data-bs-toggle="tooltip" data-bs-placement="top" title="Available ${employee.maternityLeave }">Maternity Leave</option>
                                            <option id="ptl" value="Paternity Leave"  data-bs-toggle="tooltip" data-bs-placement="top" title="Available ${employee.paternityLeave }">Paternity Leave</option>
                                            <option id="mrl" value="Marriage Leave"  data-bs-toggle="tooltip" data-bs-placement="top" title="Available ${employee.marriageLeave }">Marriage Leave</option>
                                            <option id="al" value="Adoption Leave"  data-bs-toggle="tooltip" data-bs-placement="top" title="Available ${employee.adoptionLeave }">Adoption Leave</option>

                                        </select>

                                    </div>
                                </div>
                                <div class="form-group mt-3">
                                    <label class="form-label fw-bold">Leave Reason</label>
                                    <!-- <input type="text" class="form-control" id="inputName" name="name" value="${employee.name}"
                            readonly /> -->
                                    <textarea class="form-control border-top-0 border-start-0 border-end-0"
                                        id="inputName" name="reason" id="pdesc" cols="30" rows="5" required></textarea>
                                </div>
                                
                                <input type="hidden" name="managerName" value="${employee.managerName }">
                                <div class="text-center">
                                    <button class="btn btn-primary btn-block col-3 mt-5 text-center"
                                        type="submit">Submit</button>

                                </div>
                               
                            </form>

                        </div>
                    </div>

                    </div>
                    
                </div>

                <footer class="bg-light text-center text-lg-start ">
                    <div class="p-3" style="background-color: rgba(0, 0, 0, 0.2);">
                        � 2023 Copyright: Leave Management System 
                    </div>
                </footer>

               
               <script>
            const picker = document.getElementById('d1');
            picker.addEventListener('input', function(e){
              var day = new Date(this.value).getUTCDay();
              if([6,0].includes(day)){
                e.preventDefault();
                this.value = '';
            	document.getElementById('d1error').innerHTML="*Weekends not allowed";
                
              }else{
            		document.getElementById('d1error').innerHTML="";
            	  
              }            });

            const picker2 = document.getElementById('d2');
            picker2.addEventListener('input', function(e2){
              var day2 = new Date(this.value).getUTCDay();
              if([6,0].includes(day2)){
                e2.preventDefault();
                this.value = '';
            	document.getElementById('d2error').innerHTML="*Weekends not allowed";
                
              }else{
            		document.getElementById('d2error').innerHTML="";
            	  
              }
            });

                function calculateday() {

                    var d1 = document.getElementById('d1').value;
                    var d2 = document.getElementById('d2').value;

                    var leave = document.getElementById('leave');
                    var value1 = leave.value;
                    var dateone = new Date(d1);
                    var datetwo = new Date(d2);
                    // datetwo.setDate(datetwo.getDate() + 1);
                    var time = Math.abs(datetwo - dateone);
                    var days = Math.ceil(time / (1000 * 60 * 60 * 24));
                    var weeks = Math.floor(days / 7);
                    days = days - (weeks * 2);
                    var startDay = dateone.getDay();
                    var endDay = datetwo.getDay();
                    if (startDay - endDay > 1) {
                        days = days - 2;
                    }
                    if (startDay == 0 && endDay != 6) {
                        days = days - 1;
                    }
                    if (endDay == 6 && startDay != 0) {
                        days = days - 1;
                    }

                    document.getElementById('output').value = days + 1;

                    if (days > 7 && (value1 == "Sick Leave" || value1 == "Personal Leave" || value1 == "Casual Leave")) {
                        document.getElementById('d2error').innerHTML = "*" + value1 + " Can't Be More Than 7 Days"
                        document.getElementById('d2error').style.color = "red"
                        document.getElementById('d2').focus()
                        return false;

                    }

                    else if (days > 30 && (value1 == "Paternity Leave" || value1 == "Adoption Leave")) {
                        document.getElementById('d2error').innerHTML = "*" + value1 + " " + "Can't Be More Than 30 Days"
                        document.getElementById('d2error').style.color = "red"
                        document.getElementById('d2').focus()
                        return false;
                    }

                    else if (days > 180 && value1 == "Maternity Leave") {
                        document.getElementById('d2error').innerHTML = "*" + value1 + " " + "Can't Be More Than 180 Days"
                        document.getElementById('d2error').style.color = "red"
                        document.getElementById('d2').focus()
                        return false;
                    }

                    else if (days > 15 && value1 == "Marriage Leave") {
                        document.getElementById('d2error').innerHTML = "*" + value1 + " " + "Can't Be More Than 15 Days"
                        document.getElementById('d2error').style.color = "red"
                        document.getElementById('d2').focus()
                        return false;
                    }




                    else {
                        document.getElementById('d2error').innerHTML = ""
                    }
                }
                
                $(function () {
                    var dtToday = new Date();

                    var month = dtToday.getMonth() + 1;
                    var day = dtToday.getDate();
                    var year = dtToday.getFullYear();
                    if (month < 10)
                        month = '0' + month.toString();
                    if (day < 10)
                        day = '0' + day.toString();

                    var minDate = year + '-' + month + '-' + day;

                    $('#d1').attr('min', minDate);
                    $('#d2').attr('min', minDate);
                });

            </script>
        </body>

        </html>