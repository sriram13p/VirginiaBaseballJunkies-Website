<%@page language="java" %>
<%@ page import="java.util.Arrays" %>
<%@ page language="java" %>
<%

String user="";
Cookie[] cookies = request.getCookies();
if (cookies != null) {
    for (Cookie cookie : cookies) {
        if (cookie.getName().equals("user")) {
            String userCookie = cookie.getValue();
            user=userCookie;
            break;
        }
    }
}

if(user!=""){
  response.sendRedirect("/");
}
%>
<!DOCTYPE html>
<html>
<head>
    <title>Registration Page</title>
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <style>
        body, html {
            height: 100%;
            font-family: "Arial", sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            background-color: #f5f5f5;
        }
        .login-modal {
            width: 400px;
            background: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }
        .login-modal h2 {
            font-weight: normal;
            margin-bottom: 10px;
        }
        .login-modal .error-message {
            color: red;
            text-align: center;
            margin-bottom: 15px;
        }
        .login-modal .separator {
            text-align: center;
            margin: 20px 0;
            position: relative;
        }
        .login-modal .separator::before, .login-modal .separator::after {
            content: '';
            position: absolute;
            width: 40%;
            height: 1px;
            background: #ccc;
            top: 50%;
        }
        .login-modal .separator::before {
            left: 0;
        }
        .login-modal .separator::after {
            right: 0;
        }
        .login-modal .or {
            background: white;
            padding: 0 10px;
        }
        .login-modal .w3-input {
            margin-bottom: 15px;
        }
        .login-modal .w3-btn {
            width: 100%;
        }
        .login-modal .login-btn {
            background-color: #28a745;
            color: white;
        }
        .login-modal .w3-button {
            text-align: center;
        }
        .login-modal .links {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-top: 20px;
        }
        .login-modal .links a {
            color: #4CAF50;
        }
    </style>
</head>
<body>

<div class="login-modal w3-card-4 w3-animate-opacity">
    <div class="w3-container">
        <h2>Sign Up</h2>

        <!-- Error message placeholder -->
        <div class="error-message" id="error-message">
            <c:if test="${not empty errormessage}">
                ${errormessage}
            </c:if>
        </div>

        <form id="registrationForm" action="/" method="post">
            <input class="w3-input w3-border w3-round-large" type="text" name="firstName" placeholder="First Name" required>
            <input class="w3-input w3-border w3-round-large" type="text" name="lastName" placeholder="Last Name" required>
            <input class="w3-input w3-border w3-round-large" type="email" name="emailID" placeholder="Email" required>
            <input class="w3-input w3-border w3-round-large" type="password" name="password" placeholder="Password" required>
            <input class="w3-input w3-border w3-round-large" type="password" name="confirm_password" placeholder="Confirm Password" required>
            <input class="w3-input w3-border w3-round-large" type="date" name="dob" required>
            <span id="dob-error-message" class="error-message"></span>
            <select class="w3-input w3-border w3-round-large" name="Gender" required>
                <option value="" disabled selected>Select Gender</option>
                <option value="male">Male</option>
                <option value="female">Female</option>
                <option value="other">Other</option>
            </select>
            <button class="w3-button w3-input w3-round-large login-btn" type="submit">Sign Up</button>
        </form>
        <div class="separator">
            <span class="or">OR</span>
        </div>
        <p>Already have an account? <a href="/signin">Log In</a></p>
    </div>
</div>

<script>
    $(document).ready(function() {
        $('input[name="dob"]').change(function() {
            var dob = $(this).val();
            var today = new Date().toISOString().split("T")[0];
            var errorMessage = "";

            if (dob >= today) {
                errorMessage = "Date of birth must be in the past.";
            }

            $('#dob-error-message').text(errorMessage);
        });

        $('#registrationForm').submit(function(event) {
            event.preventDefault();

            var password = $('input[name="password"]').val();
            var confirmPassword = $('input[name="confirm_password"]').val();
            var dob = $('input[name="dob"]').val();
            var dobErrorMessage = $('#dob-error-message').text();
            var errorMessage = "";

            // Validate password match
            if (password !== confirmPassword) {
                errorMessage += "Passwords do not match.\n";
            }

            // Validate date of birth
            var today = new Date().toISOString().split("T")[0];
            if (dob >= today) {
                errorMessage += "Date of birth must be in the past.\n";
            }

            if (errorMessage || dobErrorMessage) {
                $('#error-message').text(errorMessage);
                return;
            }

            var formData = {
                firstname: $('input[name="firstName"]').val(),
                lastname: $('input[name="lastName"]').val(),
                email: $('input[name="emailID"]').val(),
                username: $('input[name="emailID"]').val(),
                password: password,
                dob: dob,
                role : ['user'],
                Gender: $('select[name="Gender"]').val()
            };
             $('.login-btn').prop('disabled', true);
            $.ajax({
                type: 'POST',
                url: '/api/auth/signup', // Replace with your actual API endpoint
                contentType: 'application/json',
                data: JSON.stringify(formData),
                success: function(response) {
                    if (response.message=="User registered successfully!") {

                        $('#error-message').text(response.message);

                        setTimeout(function() {
                                        window.location.href = "/";
                                    }, 2000);
                    } else {

                        $('#error-message').text(response.message);
                    }
                },
                error: function(error) {

                    $('#error-message').text(error.responseJSON.message);
                    $('.login-btn').prop('disabled', false);
                }
            });
        });
    });
</script>

</body>
</html>
