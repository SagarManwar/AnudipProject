<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" isELIgnored="false" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <meta http-equiv="X-UA-Compatible" content="IE=edge">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
             <link rel="stylesheet" href="/global.css">
            <title>Add Holiday</title>

            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
                integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
                crossorigin="anonymous">
            <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
                crossorigin="anonymous"></script>
            <script src="https://kit.fontawesome.com/a43228976e.js" crossorigin="anonymous"></script>

            <style>
                input,
                textarea,
                button {
                    padding: 8px 15px;
                    border-radius: 5px !important;
                    margin: 5px 0px;
                    box-sizing: border-box;
                    border: 1px solid #ccc;
                    font-size: 18px !important;
                    font-weight: 300
                }
            </style>
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
            <li><a class="dropdown-item"  href="logout?id=<c:out value=" ${admin.id }" />">Sign out</a></li>
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
                                    <a href="AdminDashboard?id=<c:out value="${admin.id }"/>" class="nav-link align-middle px-0">
                                        <i class="fa-solid fa-house"></i> <span
                                            class="ms-2 d-none d-sm-inline text-dark">Home</span>
                                    </a>
                                </li>

                                <li>
                                    <a href="AdminViewEmployee?id=<c:out value="${admin.id }"/>" class="nav-link px-0 mt-2 align-middle">
                                        <i class="fa-solid fa-users"></i> <span
                                            class="ms-1 d-none d-sm-inline text-dark">View
                                            Employees</span></a>
                                </li>

                                <li>
                                    <a href="AdminAddEmployee?id=<c:out value="${admin.id }"/>" class="nav-link px-0 mt-2 align-middle">
                                        <i class="fa-solid fa-user-plus"></i> <span
                                            class="ms-1 d-none d-sm-inline text-dark">Add Employee</span> </a>
                                </li>

                                <li>
                                    <a href="AdminManageLeave?id=<c:out value="${admin.id }"/>" class="nav-link px-0 mt-2 align-middle">
                                        <i class="fa-solid fa-calendar-days"></i> <span
                                            class="ms-2 d-none d-sm-inline text-dark">Manage Leave</span> </a>
                                </li>

                                <li>
                                    <a href="" class="nav-link px-0 mt-2 align-middle">
                                        <i class="fa-solid fa-mug-hot"></i> <span
                                            class="ms-2 d-none d-sm-inline text">Add
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
                        </div>
                    </div>

                   <div class="col-md-9 col-xl-9 col-10">
                                <div class="card mt-5 p-5 ms-2 shadow">
                                 <span class="text-success"><h3>${success}</h3></span>
                                 <span class="text-danger"><h3>${duplicate}</h3></span>
                                <h3 class="mb-4 ">Add Holiday</h3>
                                <form class="form-card row " action="addHoliday" onsubmit="return check()">
                                    
                                    <div class="col-xl-6  col-md-6 col-12 mt-2">
                                        <label class="form-label fw-bold ">From Date</label>  
                                        <input type="date" id="from" name="fromDate" placeholder="" class="form-control border-top-0 border-start-0 border-end-0">
                                            <span id="fromerror" class="text-danger"></span>
                                        
                                      </div>
                                      <div class="col-xl-6 col-md-6 col-12 mt-2">
                                        <label class="form-label fw-bold ">To Date</label>
                                        <input type="date" id="to" name="toDate" placeholder="" class="form-control border-top-0 border-start-0 border-end-0">
                                        <span id="toerror" class="text-danger"></span>
                                      </div>

                                        <div class="col-12 mt-3">
                                            <div> <label class="form-label fw-bold ">Occassion</label></div>
                                            <textarea type="text" id="ans" name="occasion"  cols="60" rows="2"
                                              class="form-control border-top-0 border-start-0 border-end-0"></textarea>
                                            <span id="addresserror"></span>
                                          </div>
                                          
                            			
                                <input type="hidden" name="aid" value="${admin.id }">
                                   
                                        <div class="form-group mt-3"> <button type="submit"
                                                class="btn btn-primary " onclick="check()">Add</button>
                                        </div>
                                  
                                </form>
                               <form>
                               <h3 class="mb-4 ">Add Multiple Holiday</h3>
                                <div class="input-group mb-3">
 
  <input type="file" class="form-control" name="bulk" id="inputGroupFile01">
	</div>
	 <div class="form-group mt-3"> <button type="submit"
                                                class="btn btn-primary " onclick="check()">Add</button>
                                        </div>
                                  
                               </form>
                            </div>  
                                                 
                    </div>
                </div>
            </div>

            <footer class="bg-light text-lg-start ">
                <div class=" p-3" style="background-color: rgba(0, 0, 0, 0.2);">
                    � 2023 Copyright: Leave Management System 
                </div>
            </footer>


            <script>
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

                    $('#from').attr('min', minDate);
                });

            </script>
            <script>

                function check() {



                    var date1 = document.getElementById('from').value;
                    var date2 = document.getElementById('to').value;




                    if (date2 < date1 || date2 == "") {

                        document.getElementById('toerror').innerHTML = "*To Date should be greater than from"
                        document.getElementById('toerror').style.color = "red"
                        document.getElementById('to').focus()
                        return false;
                    }





                    else {
                        document.getElementById("fromerror").innerHTML = "";
                    }

                }
                
                const picker = document.getElementById('from');
                picker.addEventListener('input', function(e){
                  var day = new Date(this.value).getUTCDay();
                  if([6,0].includes(day)){
                    e.preventDefault();
                    this.value = '';
                	document.getElementById('fromerror').innerHTML="*Weekends not allowed";
                    
                  }else{
                		document.getElementById('fromerror').innerHTML="";
                	  
                  }
                  }
                );

                const picker2 = document.getElementById('to');
                picker2.addEventListener('input', function(e2){
                  var day2 = new Date(this.value).getUTCDay();
                  if([6,0].includes(day2)){
                    e2.preventDefault();
                    this.value = '';
                   	document.getElementById('toerror').innerHTML="*Weekends not allowed";
                   
                  }else{
                		document.getElementById('toerror').innerHTML="";
                	  
                  }
                });

            </script>
        </body>

        </html>