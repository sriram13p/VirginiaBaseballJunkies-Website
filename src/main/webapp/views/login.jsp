<%@page language="java" %>
<%@ page import="java.util.Arrays" %>
<%@ page language="java" %>
<%

String jwt="";
Cookie[] cookies = request.getCookies();
if (cookies != null) {
    for (Cookie cookie : cookies) {
        if (cookie.getName().equals("jwt")) {
            String userCookie = cookie.getValue();
            jwt=userCookie;
            break;
        }
    }
}

if(jwt!=""){
  response.sendRedirect("/");
}
%>
<!DOCTYPE html>
<html>
<head>
    <title>Login Page</title>
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
            width: 48%;
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
        <h2>Log In</h2>

        <!-- Error message placeholder -->
        <div class="error-message" id="error-message">
            <c:if test="${not empty errormessage}">
                ${errormessage}
            </c:if>
        </div>

        <form id="login-form">
            <input class="w3-input w3-border w3-round-large" type="email" name="username" placeholder="username" required>
            <input class="w3-input w3-border w3-round-large" type="password" name="password" placeholder="password" required>
            <div class="links">
                <a href="/forgot_password">Forgot Password?</a>
                <button class="w3-button w3-round-large login-btn" type="submit">Login</button>
            </div>
        </form>
        <div class="separator">
            <span class="or">OR</span>
        </div>
        <p>Don't have an account? <a href="/signup">Sign up</a></p>
    </div>
</div>

<script>
    $(document).ready(function() {
        $('#login-form').on('submit', function(event) {
            event.preventDefault();

            var formData = {
                username: $('input[name="username"]').val(),
                password: $('input[name="password"]').val()
            };
			//window.alert(formData);
            $.ajax({
                type: 'POST',
                url: '/api/auth/signin', // Replace with your actual API endpoint
                contentType: 'application/json',
                data: JSON.stringify(formData),
                success: function(response) {
                //window.alert(response);
                    if (response.accessToken) {
                        // Handle successful login (e.g., redirect to another page)
                        window.location.href = "/";
                    } else {
                        // Display error message
                        $('#error-message').text('Invalid Credentials');
                    }
                },
                error: function(error) {
                    console.error('Error:', error);
                    $('#error-message').text('Invalid Credentials');
                }
            });
        });
    });
</script>

</body>
</html>
