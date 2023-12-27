<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" isELIgnored="false" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
        <html lang="en">

        <head>
            <!-- Required meta tags -->
            <meta charset="utf-8">
            <meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="/global.css">
            <!-- Bootstrap CSS -->
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
                integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
                crossorigin="anonymous">
            <script src="https://kit.fontawesome.com/a43228976e.js" crossorigin="anonymous"></script>
            <title>Leave Application</title>
        </head>
        <style>
            .disable{
                display: none;
            }
        </style>

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
            <!--Side Bar-->
            <div class="container-fluid">
            
            <div class="row">
                <div class="col-auto col-md-2 col-xl-2 px-sm-2 px-0 " style="background-color: rgba(0, 0, 0, 0.2);">
                    <div
                        class="d-flex flex-column align-items-center align-items-sm-start px-3 pt-2 text-white min-vh-100">
                        <a href="/"
                            class="d-flex align-items-center pb-3 mb-md-0 me-md-auto text-dark text-decoration-none">
                            <span class="fs-4 d-none d-sm-inline">Menu</span>
                        </a>
                        <ul class="nav nav-pills flex-column mb-sm-auto mb-0 align-items-center align-items-sm-start"
                            id="menu">
                            <li>
                                <a href="AdminDashboard?id=<c:out value="${admin.id }"/>" class="nav-link align-middle px-0 pe-3  ">
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
                                        class="ms-1 d-none d-sm-inline text-dark">Add
                                        Employee</span> </a>
                            </li>

                            <li>
                                <a href="AdminManageLeave?id=<c:out value="${admin.id }"/>" class="nav-link px-0 mt-2 align-middle">
                                    <i class="fa-solid fa-calendar-days"></i> <span
                                        class="ms-2 d-none d-sm-inline text-dark">Manage Leave</span> </a>
                            </li>

                            <li>
                                <a href="AdminAddHoliday?id=<c:out value="${admin.id }"/>" class="nav-link px-0 mt-2 align-middle">
                                    <i class="fa-solid fa-mug-hot"></i> <span
                                        class="ms-2 d-none d-sm-inline text-dark">Add
                                        Holiday</span></a>
                            </li>

                            <li>
                                <a href="" class="nav-link px-0 mt-2 align-middle">
                                    <i class="fa-solid fa-folder-plus"></i> <span
                                        class="ms-2 d-none d-sm-inline text-primary">Add
                                        Project</span></a>
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


                <!--Side Bar End-->

                <!-- Start Card -->
         <div class=" col-9 col-md-9 col-xl-9 mt-4 ms-3 ">
                <div class="card shadow ">
                <span class="text-success ms-3"><h3>${success}</h3></span>
                 <span class="text-danger ms-3"><h3>${duplicate}</h3></span>
                    <h2 class="ms-3 mt-3">Add Project</h2>
                    <form class="row card-body" action="addProject"  onsubmit="return validate()">

                        <div class="col-xl-6 col-md-6 col-12 mt-2">
                            <label class="form-label fw-bold">Project Name</label>
                            <input type="text" class="form-control border-top-0 border-start-0 border-end-0" id="pname"
                                name="projectName" />
                                <span id="pnameerror"> </span>
                        </div>
                       

                        <div class="col-xl-6 col-md-6 col-12 mt-2">
                            <label class="form-label fw-bold">DeadLine</label>
                            <input type="date" class="form-control border-top-0 border-start-0 border-end-0" id="d1"
                                name="deadline"  />
                        </div>
                                   
                        <!-- Department -->
                       
                            <div class="col-xl-6 col-md-6 col-12 mt-3">
                                <label class="form-label fw-bold">Department</label>
                                <div class="d-flex flex-row justify-content-between align-items-center">
                            <select id="language" class="form-select border-top-0 border-start-0 border-end-0"
                                name="department" onChange="departmentChange()">
                                <option value="" disabled selected>Choose Department</option>
                                <option value="IT">IT</option>
                                <option value="Finance">Finance</option>
                                <option value="HR">HR</option>

                            </select>
 						 <span id="departmenterror"></span>

                        </div>
                            </div>

                                <div class="col-xl-6 col-md-6 col-12 mt-3">
                        <label class="form-label fw-bold">Manager Name</label>
                        <div class="d-flex flex-row justify-content-between align-items-center">
                            <select class="form-select border-top-0 border-start-0 border-end-0 " id="default">
                                <option value="" disabled selected>Select Manager</option>
                            </select>

                            <select class="form-select border-top-0 border-start-0 border-end-0 disable"
                                name="managerName" id="HR">
                                <option value="" disabled selected>Select Manager</option>
                                <c:forEach items="${HR}" var="emp">

                                    <option value="${emp.name }">${emp.name }</option>
                                </c:forEach>
                            </select>

                            <select class="form-select border-top-0 border-start-0 border-end-0  disable"
                                name="managerName" id="Finance">
                                <option value="" disabled selected>Select Manager</option>
                                <c:forEach items="${Finance}" var="emp">
                                    <option value="${emp.name }">${emp.name }</option>
                                </c:forEach>
                            </select>


                            <select class="form-select border-top-0 border-start-0 border-end-0  disable"
                                name="managerName" id="IT">
                                <option value="" disabled selected>Select Manager</option>
                                <c:forEach items="${IT}" var="emp">
                                    <option value="${emp.name }">${emp.name }</option>
                                </c:forEach>

                            </select>

                        </div>
                        <span id="mnameerror">
                        </span>
                    </div>

                            <div class="form-group mt-3">
                                <label class="form-label fw-bold">Project Description</label>
                                <textarea class="form-control border-top-0 border-start-0 border-end-0" id="inputName"
                                    name="description" id="description" cols="30" rows="3" required></textarea>
                            </div>
                            <span id="descerror">
    
                            </span>
                        <input type="hidden" name="id" value="${admin.id }">
                   
                        <div class="">
                            <button class="btn btn-primary btn-block  mt-5 mb-3  text-center"
                                type="submit">Submit</button>
                        </div>


                    </form>
                    <!-- End Form -->

                </div>
            </div>
                </div>
                
                <!-- End Card -->
                </div>
                <footer class="bg-light text-lg-start ">
                    <div class=" p-3" style="background-color: rgba(0, 0, 0, 0.2);">
                        � 2023 Copyright: Leave Management System 
                    </div>
                </footer>

                <!-- Optional JavaScript -->
                <!-- jQuery first, then Popper.js, then Bootstrap JS -->
                <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
                    integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
                    crossorigin="anonymous"></script>
                <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
                    integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
                    crossorigin="anonymous"></script>
                <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
                    integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
                    crossorigin="anonymous"></script>

                <!-- Start Scritp for Form -->

                <script>
                    

                </script>
                
                  
                
                <script>
                  

                                function departmentChange(){
                                    var select = document.getElementById('language');
                                    var option = select.options[select.selectedIndex];
                                   document.getElementById('default').classList.add('disable');
                                      document.getElementById('IT').classList.add('disable');
                                    document.getElementById('Finance').classList.add('disable');
                                    document.getElementById('HR').classList.add('disable');
                                    
                                    document.getElementById(option.value).classList.remove('disable');
                                       document.getElementById(option.value).classList.remove('disable');
                                    document.getElementById(option.value).classList.remove('disable'); 

                                    
                                    console.log(option.value)
                                    console.log(select)


                                }
                                // departmentChange()
                                
				
                                
                                var name;                                              
                                var desc;

           
                    function validate() {
                        this.name = document.getElementById('pname').value
                        this.desc = document.getElementById('pdesc').value

                        if (name == "") {
                            document.getElementById('pnameerror').innerHTML = "*Enter Project name"
                            document.getElementById('pnameerror').style.color = "red"
                            document.getElementById('pname').focus()
                            return false;
                        }
                        else {
                            this.regex = /^[A-Za-z. ]{3,30}$/
                            if (!this.regex.test(name)) {
                                document.getElementById('pnameerror').innerHTML = "*Enter valid Project name"
                                document.getElementById('pnameerror').style.color = "red"
                                document.getElementById('pname').focus()
                                return false;
                            }
                            else {
                                document.getElementById('pnameerror').innerHTML = ""
                            }

                        }
                        if (this.desc == "") {
                            document.getElementById('descerror').innerHTML = "*Enter Project name"
                            document.getElementById('descerror').style.color = "red"
                            document.getElementById('pdesc').focus()
                            return false;
                        }
                        else {
                            this.regex = /^[A-Za-z. ]{3,30}$/
                            if (!this.regex.test(this.desc)) {
                                document.getElementById('descerror').innerHTML = "*Enter valid Project name"
                                document.getElementById('descerror').style.color = "red"
                                document.getElementById('pdesc').focus()
                                return false;
                            }
                            else {
                                document.getElementById('pnameerror').innerHTML = ""
                            }

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
                    });

                </script>
                <!-- End Scritp for Form -->
                <!--Footer-->


        </body>

        </html>