<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" isELIgnored="false" %>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
      <meta charset="UTF-8">
      <meta http-equiv="X-UA-Compatible" content="IE=edge">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
       <link rel="stylesheet" href="/global.css">
      <title>UpdateEmployee</title>

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
            <li><a class="dropdown-item"  href="logout?id=<c:out value=" ${admin.id }" />">Sign out</a></li>
          </ul>
        </div>
      
    </div>
  </nav>
      <div class="container-fluid ">

        <div class="row">
          <div class="col-auto col-md-3 col-xl-2 px-sm-2 px-0 " style="background-color: rgba(0, 0, 0, 0.2);">
            <div class="d-flex flex-column align-items-center align-items-sm-start px-3 pt-2 text-white min-vh-100">
              <a href="/" class="d-flex align-items-center pb-3 mb-md-0 me-md-auto text-dark text-decoration-none">
                <span class="fs-4 d-none d-sm-inline">Menu</span>
              </a>
              <ul class="nav nav-pills flex-column mb-sm-auto mb-0 align-items-center align-items-sm-start" id="menu">
                <li>
                  <a href="AdminDashboard?id=<c:out value="${employee.admin.id }"/>" class="nav-link align-middle px-0">
                    <i class="fa-solid fa-house"></i> <span class="ms-2 d-none d-sm-inline text-dark">Home</span>
                  </a>
                </li>

                <li>
                  <a href="AdminViewEmployee?id=<c:out value="${employee.admin.id }"/>" class="nav-link px-0 mt-2 align-middle">
                    <i class="fa-solid fa-users"></i> <span class="ms-1 d-none d-sm-inline text-dark">View
                      Employees</span></a>
                </li>

                <li>
                  <a href="AdminAddEmployee?id=<c:out value="${employee.admin.id }"/>" class="nav-link px-0 mt-2 align-middle">
                    <i class="fa-solid fa-user-plus"></i> <span class="ms-1 d-none d-sm-inline text-dark">Add
                      Employee</span> </a>
                </li>

                <li>
                  <a href="AdminManageLeave?id=<c:out value="${employee.admin.id }"/>" class="nav-link px-0 mt-2 align-middle">
                    <i class="fa-solid fa-calendar-days"></i> <span class="ms-2 d-none d-sm-inline text-dark">Manage
                      Leave</span> </a>
                </li>

                <li>
                  <a href="AdminAddHoliday?id=<c:out value="${employee.admin.id }"/>" class="nav-link px-0 mt-2 align-middle">
                    <i class="fa-solid fa-mug-hot"></i> <span class="ms-2 d-none d-sm-inline text-dark">Add
                      Holiday</span></a>
                </li>


                <li>
                  <a href="AdminAddProject?id=<c:out value="${employee.admin.id }"/>" class="nav-link px-0 mt-2 align-middle">
                    <i class="fa-solid fa-folder-plus"></i> <span class="ms-2 d-none d-sm-inline text-dark">Add
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

          <div class="col-md-9 col-xl-9 px-sm-7 col-9 mt-2 ">
            <form action="updateEmployee"  class="row  ms-5" onsubmit="return validation()">
                 <span class="text-success"><h3>${success}</h3></span>
              <h3 class="mb-5 mt-4">Update Employee</h3>
              <div class="col-xl-6 col-md-6 col-12 mt-2">
                <label class="form-label fw-bold ">ID</label>
                <input type="number" value="${employee.id }" id="id" name="id" class="form-control border-top-0 border-start-0 border-end-0"
                  readonly="">
              </div>
              <div class="col-xl-6  col-md-6 col-12 mt-3">
                <label class="form-label fw-bold ">Name</label>
                <input type="text" value="${employee.name }" id="name" name="name"
                  class="form-control border-top-0 border-start-0 border-end-0" />
                <span id="nameerror"></span>
              </div>
              <div class="col-xl-6 col-md-6 col-12 mt-3">
                <label class="form-label fw-bold ">User Name</label>
                <input type="text" id="username" name="username" value="${employee.username }"
                  class="form-control border-top-0 border-start-0 border-end-0" readonly="">
              </div>
              <div class="col-xl-6 col-md-6 col-12 mt-3">
                <label class="form-label fw-bold ">Email</label>
                <input type="email" id="email" name="email" value="${employee.email }"
                  class="form-control border-top-0 border-start-0 border-end-0">
                <span id="emailerror"></span>
              </div>
              <div class="col-xl-6 col-md-6 col-12 mt-3">
                <label class="form-label fw-bold ">Date Of Birth</label>
                <input type="date" id="dob" name="dob" value="${employee.dob }" class="form-control border-top-0 border-start-0 border-end-0">
                <span id="doberror"></span>
              </div>
              <div class="col-xl-6 col-md-6 col-12 mt-3">
                <label class="form-label fw-bold ">Phone Number</label>
                <input type="number" id="number" name="mobileNumber" value="${employee.mobileNumber }"
                  class="form-control border-top-0 border-start-0 border-end-0">
                <span id="numbererror"></span>
              </div>
              <div class="col-xl-6 col-md-6 col-12 mt-3">
                <label class=" fw-bold mb-3">Gender</label> <br>
                <input type="radio" name="gender" id="gender" value="Male"  ${employee.gender=='male'?'checked':''}> <label for="">Male</label>
                <input type="radio" name="gender" id="gender" value="Female"  ${emp.gender=='female'?'checked':''} required> <label for="">Female</label>
                <span id="gendererror"></span>
              </div>

              <div class="col-xl-6 col-md-6 col-12 mt-3">
                <label class="form-label fw-bold ">Designation</label>
                <select name="designation"  id="designation" class="form-select border-top-0 border-start-0 border-end-0"
                  >
                  <option selected  value="${employee.designation }">${employee.designation }</option>
                  <option value="Trainee">Trainee </option>
                  <option value="Associate">Associate</option>
                  <option value="Deputy Manager">Deputy Manager</option>
                  <option value="Team Lead">Team Lead</option>
                </select>
              </div>
              <div class="col-xl-6 col-md-6 col-12 mt-3">
                <label class="form-label fw-bold ">Department</label>
                <input type="text" id="department" name="department" value="${employee.department }"
                  class="form-control border-top-0 border-start-0 border-end-0" readonly="">
                <span id="numbererror"></span>
              </div>

              <div class="col-xl-6  col-md-6 col-12 mt-3">
                <label class="form-label fw-bold ">Manager Name</label>
                <input type="text" id="managername" name="managerName" value="${employee.managerName }"
                  class="form-control border-top-0 border-start-0 border-end-0" readonly />
              </div>

              <div class="col-12 mt-3">
                <label class="form-label fw-bold ">State</label>
                <select id="state" name="state" class="form-select border-top-0 border-start-0 border-end-0" required>
                  <option selected  value="${employee.state }">${employee.state }</option>
                  <option value="Andhra Pradesh">Andhra Pradesh</option>
                  <option value="Andaman and Nicobar Islands">Andaman and Nicobar Islands</option>
                  <option value="Arunachal Pradesh">Arunachal Pradesh</option>
                  <option value="Assam">Assam</option>
                  <option value="Bihar">Bihar</option>
                  <option value="Chandigarh">Chandigarh</option>
                  <option value="Chhattisgarh">Chhattisgarh</option>
                  <option value="Dadar and Nagar Haveli">Dadar and Nagar Haveli</option>
                  <option value="Daman and Diu">Daman and Diu</option>
                  <option value="Delhi">Delhi</option>
                  <option value="Lakshadweep">Lakshadweep</option>
                  <option value="Puducherry">Puducherry</option>
                  <option value="Goa">Goa</option>
                  <option value="Gujarat">Gujarat</option>
                  <option value="Haryana">Haryana</option>
                  <option value="Himachal Pradesh">Himachal Pradesh</option>
                  <option value="Jammu and Kashmir">Jammu and Kashmir</option>
                  <option value="Jharkhand">Jharkhand</option>
                  <option value="Karnataka">Karnataka</option>
                  <option value="Kerala">Kerala</option>
                  <option value="Madhya Pradesh">Madhya Pradesh</option>
                  <option value="Maharashtra">Maharashtra</option>
                  <option value="Manipur">Manipur</option>
                  <option value="Meghalaya">Meghalaya</option>
                  <option value="Mizoram">Mizoram</option>
                  <option value="Nagaland">Nagaland</option>
                  <option value="Odisha">Odisha</option>
                  <option value="Punjab">Punjab</option>
                  <option value="Rajasthan">Rajasthan</option>
                  <option value="Sikkim">Sikkim</option>
                  <option value="Tamil Nadu">Tamil Nadu</option>
                  <option value="Telangana">Telangana</option>
                  <option value="Tripura">Tripura</option>
                  <option value="Uttar Pradesh">Uttar Pradesh</option>
                  <option value="Uttarakhand">Uttarakhand</option>
                  <option value="West Bengal">West Bengal</option>
                </select>
              </div>

              <div class="col-12 mt-3">
                <div> <label class="form-label fw-bold ">Address</label></div>
                <textarea name="address" id="address" cols="60" rows="2" 
                  class="form-control border-top-0 border-start-0 border-end-0">${employee.address }</textarea>
                <span id="addresserror"></span>
              </div>
				 <input type="hidden" name="status" value="${employee.status }">
				<input type="hidden" name="password" value="${employee.password }">
				<input type="hidden" name="sickLeave" value="${employee.sickLeave }">
				<input type="hidden" name="casualLeave" value="${employee.casualLeave }">
				<input type="hidden" name="personalLeave" value="${employee.personalLeave }">
				<input type="hidden" name="maternityLeave" value="${employee.maternityLeave }">
				<input type="hidden" name="paternityLeave" value="${employee.paternityLeave }">
				<input type="hidden" name="marriageLeave" value="${employee.marriageLeave }">
				 <input type="hidden" name="adoptionLeave" value="${employee.adoptionLeave }">
 				<input type="hidden" name="employee.admin.id" value="${employee.admin.id }"> 
 					<input type="hidden" name="joiningDate" value="${employee.joiningDate }">

              <div class="col-12 mt-4 mb-4 text-center">
                <button type="submit"  class="btn btn-primary  fw-bold  w-50">Submit</button>
              </div>
            </form>
          </div>

        </div>

      </div>

      <footer class="bg-light text-center text-lg-start">
        <div class=" p-3" style="background-color: rgba(0, 0, 0, 0.2);">
          � 2023 Copyright: Leave Management System 
        </div>
      </footer>

      <script>

        //AddEmployee Validation

        var name;
        var email;
        var date;
        var number;
        var jdate;
        var address;

        function validation() {

          this.name = document.getElementById('name').value
          this.email = document.getElementById('email').value
          this.date = document.getElementById('dob').value
          this.number = document.getElementById('number').value
          this.jdate = document.getElementById('jdate').value
          this.address = document.getElementById('address').value

          if (this.name == "") {
            document.getElementById('nameerror').innerHTML = "*Enter name"
            document.getElementById('nameerror').style.color = "red"
            document.getElementById('name').focus()
            return false;
          }
          else {
            this.regex = /^[A-Za-z. ]{3,10}$/;
            if (!this.regex.test(this.name)) {
              document.getElementById('nameerror').innerHTML = "*Enter valid name"
              document.getElementById('nameerror').style.color = "red"
              document.getElementById('name').focus()
              return false;
            }
            else {
              document.getElementById('nameerror').innerHTML = ""
            }

          }

          if (this.email == "") {
            document.getElementById('emailerror').innerHTML = "*Enter Email Address"
            document.getElementById('emailerror').style.color = "red"
            document.getElementById('email').focus()
            return false;
          }
          else {
        	  this.regex = /^[a-zA-Z._-]+[0-9]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,6}$/;
        	  if (!this.regex.test(this.email)) {
              document.getElementById('emailerror').innerHTML = "*Invalid Email Address"
              document.getElementById('emailerror').style.color = "red"
              document.getElementById('email').focus()
              return false;
            }
            else {
              document.getElementById('emailerror').innerHTML = ""
            }

          }

          var today = new Date();
          var minAge = 22;
          var maxDOB = new Date(today.getFullYear() - minAge, today.getMonth(), today.getDate());
          var date1 = new Date(date);
          if (date1 > maxDOB || date == "") {
            document.getElementById("doberror").innerHTML = "*Age should not be less than 22"
            document.getElementById('doberror').style.color = "red"
            document.getElementById('dob').focus()
            return false;
          }
          else {
            document.getElementById("doberror").innerHTML = "";
          }

          var today = new Date();
          var date2 = new Date(jdate);
          if (date2 <= today || jdate == "") {
            document.getElementById("jdateerror").innerHTML = "*Enter present or future Joining Date"
            document.getElementById('jdateerror').style.color = "red"
            document.getElementById('jdate').focus()
            return false;
          }
          else {
            document.getElementById("doberror").innerHTML = "";
          }
          if (this.number == "") {
            document.getElementById('numbererror').innerHTML = "*Enter Phone Number"
            document.getElementById('numbererror').style.color = "red"
            document.getElementById('number').focus()
            return false;
          }
          else {
            this.regex = /^([0|\+[0-9]{1,5})?([6-9][0-9]{9})$/;
            if (!this.regex.test(this.number)) {
              document.getElementById('numbererror').innerHTML = "*Phone Number must be 10 Digit"
              document.getElementById('numbererror').style.color = "red"
              document.getElementById('number').focus()
              return false;
            }
            else {
              document.getElementById('numbererror').innerHTML = ""
            }

          }
          if (this.address == "") {
            document.getElementById('addresserror').innerHTML = "*Enter Address"
            document.getElementById('addresserror').style.color = "red"
            document.getElementById('address').focus()
            return false;
          }
          else {
            this.regex = (/^[a-zA-Z0-9\s,'-]*$/);
            if (!this.regex.test(this.address)) {
              document.getElementById('addresserror').innerHTML = "*Invalid Address"
              document.getElementById('addresserror').style.color = "red"
              document.getElementById('address').focus()
              return false;
            }
            else {
              document.getElementById('addresserror').innerHTML = ""
            }
          }
        }
      </script>

    </body>

    </html>