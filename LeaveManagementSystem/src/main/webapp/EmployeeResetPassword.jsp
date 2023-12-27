<!DOCTYPE html>
<head>
    <meta charset="UTF-8" >
    <meta name="viewport" content="width-device-width, initial-scale=1.0">
    <title>Employee Reset</title>
</head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel='stylesheet' href='https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css'>
<link rel='stylesheet' href='https://static.fontawesome.com/css/fontawesome-app.css'>
<link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css'>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
 <style>
    .body{
    		background-color: rgb(0, 0, 0, 0.2);
    		 background-size: 100% 120%;
    		}
    		</style>

<body>
<% if (session.getAttribute("username")==null){
	response.sendRedirect("login.jsp");
} %>
    <div class="container py-4" style="margin-top: 4%;">
        <div class="row justify-content-center">
            
            <div class="col-lg-6">
                <div class="shadow p-5 mb-5 bg-body rounded">
                    <div class="card-body">
                        <h4 class="card-title" style="text-align: center;">RESET PASSWORD</h4>
                    </div>
                    <form action='employeereset' onsubmit= "return validation()" method="post">
                        <div class = "form-group">
                            <div class = "form-group" >
                                <label for ="oldPassword"> Old Password<span style="color: red;">&#42;</span> </label>
                                <input type="password" style="width: 90%; border: 0; outline: 0; border-bottom: 2px solid #474747;" name="oldPassword" autocomplete="current-password" required="" id="Old_Password">
                                <i class="far fa-eye" id="OldPassword" style="margin-left: -30px; cursor: pointer;"></i>                                                                
                    
                            </div>
                             <span class="text-danger">${wrongPassword }</span>
                            <div class="form-group mt-3">
                                <label class="form-label fw-bold">New Password<span style="color: red;">&#42;</span></label>
                                <input type="password" style="width: 90%; border: 0; outline: 0; border-bottom: 2px solid #474747;" name="newPassword" autocomplete="current-password" required="" id="new_password">
                                <i class="far fa-eye" id="newpassword" style="margin-left: -30px; cursor: pointer;"></i>
                                    <span id="newpass" class="text-danger font-weight-bold"></span>
                                    
                                                                        
                            </div>
                            <div class="form-group mt-3">
                                <label for="confirmpassword">Confirm Password<span style="color: red;">&#42;</span></label> 
                               <div>
                                <input type="password" style="width: 90%; border: 0; outline: 0; border-bottom: 2px solid #474747;" name="password" autocomplete="current-password" required="" id="id_password">
                                <i class="far fa-eye" id="confirmpassword" style="margin-left: -30px; cursor: pointer;"></i>
                               </div>
                                    <span id="cnfrmpass" class="text-danger font-weight-bold"></span>
                                    
                            </div>
                             <input type="hidden" name="id" value="${employee.id }">
                        <div class="form-group mt-5">
                            <div class="row">
                                <div class="col-sm-7 col-sm-offset-0">
                                    <input type="submit" name="reset-submit" id="reset-submit"
                                        class="form-control btn btn-primary" style="width: 50%;" value="Reset"/>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    
    
    <script>


        const togglePassword = document.querySelector('#confirmpassword');
        const password = document.querySelector('#id_password');
      
        togglePassword.addEventListener('click', function (e) {
          const type = password.getAttribute('type') === 'password' ? 'text' : 'password';
          password.setAttribute('type', type);
          
          this.classList.toggle('fa-eye-slash');
      });

      const togglePassword2 = document.querySelector('#newpassword');
        const password2 = document.querySelector('#new_password');
      
        togglePassword2.addEventListener('click', function (e) {
          
          const type = password2.getAttribute('type') === 'password' ? 'text' : 'password';
          password2.setAttribute('type', type);
          
          this.classList.toggle('fa-eye-slash');
      });

      const togglePassword3 = document.querySelector('#OldPassword');
        const password3 = document.querySelector('#Old_Password');
      
        togglePassword3.addEventListener('click', function (e) {
          
          const type = password3.getAttribute('type') === 'password' ? 'text' : 'password';
          password3.setAttribute('type', type);
          
          this.classList.toggle('fa-eye-slash');
      });

        

        function validation(){
            var oldPassword = document.getElementById('Old_Password').value;
            var newPassword = document.getElementById('new_password').value;
            var confirmPassword = document.getElementById('id_password').value;
            
            if(newPassword.length < 8){
                document.getElementById('newpass').innerHTML="**Password must be of 8 digits";
                return false;

            }
            if(newPassword.search(/[0-9]/)== -1){
                document.getElementById('newpass').innerHTML="**Atleast one Number";
                return false;

            }
            if(newPassword.search(/[A-Z]/)== -1){
                document.getElementById('newpass').innerHTML="**Atleast One uppercase character";
                return false;

            }
            if(newPassword.search(/[!\@\#\$\%\^\&\*\(\)\_\-\+\=\<\,\>\.\?\/\:]/)== -1){
                document.getElementById('newpass').innerHTML="**Atleast One Special character";
                return false;

            }
            if(newPassword.search(/[a-z]/)== -1){
                document.getElementById('newpass').innerHTML="**Atleast One lowercase character";
                return false;

            }
            
            if(confirmPassword != newPassword){
                document.getElementById('cnfrmpass').innerHTML="**Must match to the new password";
                return false;
            }
        }
    </script>
</body>
</html>