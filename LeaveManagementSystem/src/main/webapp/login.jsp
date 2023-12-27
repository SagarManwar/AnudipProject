<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" isELIgnored="false" %>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>

<head>
    <style>
        body {
            background-image: url('/imges/Data.png');
            background-repeat: no-repeat;
            background-attachment: fixed;
            background-size: 45% 80%;
            background-position: right;
        }

        body::before {
            content: "";
            position: absolute;
            top: 0;
            left: 0;
            width: 37.8%;
            height: 100%;
            background-image: linear-gradient(rgb(222, 250, 252), rgb(222, 246, 249), rgb(223, 239, 244));
            opacity: 0.8;
        }

        .form {
            position: absolute;
            top: 50%;
            left: 38%;
            transform: translate(-50%, -50%);
            width: 400px;
            min-height: 450px;
            background-color: #fff;
            border-radius: 2%;

            box-shadow: 0 15px 50px rgba(0, 0, 0, 0.5);
            padding: 50px;
            box-sizing: border-box;
        }

        .form h2 {
            color: rgb(0, 0, 0);
            margin: 0 0 40px;
            padding: 0;
        }

        .form .input-box {
            position: relative;
            margin: 20px 0;
        }

        .form .input-box input {
            width: 100%;
            font-size: 16px;
            border: none;
            border-bottom: 2px solid #777;
            outline: none;
            padding: 10px;
            padding-left: 30px;
            margin-bottom: 25px;
            box-sizing: border-box;
            font-weight: bold;
            color: #777;
        }

        .form .input-box input:focus,
        .form .input-box input:valid {
            border-bottom-color: #03a9f4;
        }

        .form .input-box .fa {
            position: absolute;
            top: 8px;
            left: 5px;
            font-size: 18px;
            color: #777;
        }

        .form .input-box input[type="submit"] {
            border: none;
            margin-top: -20px;
            cursor: pointer;
            background-color: #03a9f4;
            color: #fff;
            font-weight: bold;

        }

        .form .input-box input[type="submit"]:hover {
            background-color: #39c544;
        }

        .form a {
            text-decoration: none;
            color: #777;
            margin-top: 20px;
            font-weight: bold;
            display: inline-block;
            transition: 0.5s;
        }
    </style>
    <meta charset="ISO-8859-1">
    <title>Login Page</title>



</head>

<script src="https://kit.fontawesome.com/a43228976e.js" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
    crossorigin="anonymous"></script>

<body>
    <div>
        <form class="form" action="login" name="myForm" onsubmit="return required()" method="post">
            <h2>Login</h2>
            <div class="input-box">

                <i class="fa fa-user" aria-hidden="true"></i>
                <input type="text" id="username" name="username" placeholder="username">
                <span id="derror" class="text-danger font-weight-bold">

                </span>
            </div>
            <div class="input-box">
                <i class="fa fa-unlock-alt" aria-hidden="true"></i>
                <input type="password" id="password" name="password" placeholder="Password">
                <span id="perror" class="text-danger font-weight-bold">

                </span>
                <span class="error text-danger" id="error">${error}</span>
            </div>
            <div class="input-box">
                <input type="submit" name="sign-in" value="Login">
            </div>
        </form>
    </div>

    <script>


        function required() {
            var empt = document.getElementById('username').value;
            var passempt = document.getElementById('password').value;

            if (empt == "") {
                document.getElementById('derror').innerHTML = "*Please Enter username";

                return false;
            }
            else {
                document.getElementById('derror').innerHTML = "";

            }

            if (passempt == "") {
                document.getElementById('perror').innerHTML = "*Please Enter password";

                return false;
            }
            else {
                document.getElementById('perror').innerHTML = "";

            }

        }

    </script>

</body>

</html>