<%-- 
    Document   : testlogin
    Created on : Jan 12, 2024, 5:01:10 PM
    Author     : Admin
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>

        <style>

            @import url('https://fonts.googleapis.com/css?family=Montserrat:400,800');

            * {
                box-sizing: border-box;
            }

            body {
                background: #f6f5f7;
                display: flex;
                justify-content: center;
                align-items: center;
                flex-direction: column;
                font-family: 'Montserrat', sans-serif;
                height: 100vh;
                margin: -20px 0 50px;
            }

            h1 {
                font-weight: bold;
                margin: 0;
            }

            h2 {
                text-align: center;
            }

            p {
                font-size: 14px;
                font-weight: 100;
                line-height: 20px;
                letter-spacing: 0.5px;
                margin: 20px 0 30px;
            }

            span {
                font-size: 12px;
            }

            a {
                color: #333;
                font-size: 14px;
                text-decoration: none;
                margin: 15px 0;
            }

            button {
                border-radius: 20px;
                border: 1px solid #03A9F4;
                background-color: #03A9F4;
                color: #FFFFFF;
                font-size: 12px;
                font-weight: bold;
                padding: 12px 45px;
                letter-spacing: 1px;
                text-transform: uppercase;
                transition: transform 80ms ease-in;
            }

            button:active {
                transform: scale(0.95);
            }

            button:focus {
                outline: none;
            }

            button.ghost {
                background-color: transparent;
                border-color: #FFFFFF;
            }

            form {
                background-color: #FFFFFF;
                display: flex;
                align-items: center;
                justify-content: center;
                flex-direction: column;
                padding: 0 50px;
                height: 100%;
                text-align: center;
            }

            input {
                background-color: #eee;
                border: none;
                padding: 12px 15px;
                margin: 8px 0;
                width: 100%;
            }

            .container {
                background-color: #fff;
                border-radius: 10px;
                box-shadow: 0 14px 28px rgba(0,0,0,0.25),
                    0 10px 10px rgba(0,0,0,0.22);
                position: relative;
                overflow: hidden;
                width: 768px;
                max-width: 100%;
                min-height: 480px;
            }

            .form-container {
                position: absolute;
                top: 0;
                height: 100%;
                transition: all 0.6s ease-in-out;
            }

            .sign-in-container {
                left: 0;
                width: 50%;
                z-index: 2;
            }

            .container.right-panel-active .sign-in-container {
                transform: translateX(100%);
            }

            .sign-up-container {
                left: 0;
                width: 50%;
                opacity: 0;
                z-index: 1;
            }

            .container.right-panel-active .sign-up-container {
                transform: translateX(100%);
                opacity: 1;
                z-index: 5;
                animation: show 0.6s;
            }

            @keyframes show {
                0%, 49.99% {
                    opacity: 0;
                    z-index: 1;
                }

                50%, 100% {
                    opacity: 1;
                    z-index: 5;
                }
            }

            .overlay-container {
                position: absolute;
                top: 0;
                left: 50%;
                width: 50%;
                height: 100%;
                overflow: hidden;
                transition: transform 0.6s ease-in-out;
                z-index: 100;
            }

            .container.right-panel-active .overlay-container{
                transform: translateX(-100%);
            }

            .overlay {
                background: #03A9F4;
                background: -webkit-linear-gradient(to right, #FF4B2B, #FF416C);
                background: linear-gradient(to right, #03A9F4, #03A9F4);
                background-repeat: no-repeat;
                background-size: cover;
                background-position: 0 0;
                color: #FFFFFF;
                position: relative;
                left: -100%;
                height: 100%;
                width: 200%;
                transform: translateX(0);
                transition: transform 0.6s ease-in-out;
            }

            .container.right-panel-active .overlay {
                transform: translateX(50%);
            }

            .overlay-panel {
                position: absolute;
                display: flex;
                align-items: center;
                justify-content: center;
                flex-direction: column;
                padding: 0 40px;
                text-align: center;
                top: 0;
                height: 100%;
                width: 50%;
                transform: translateX(0);
                transition: transform 0.6s ease-in-out;
            }

            .overlay-left {
                transform: translateX(-20%);
            }

            .container.right-panel-active .overlay-left {
                transform: translateX(0);
            }

            .overlay-right {
                right: 0;
                transform: translateX(0);
            }

            .container.right-panel-active .overlay-right {
                transform: translateX(20%);
            }

            .social-container {
                margin: 20px 0;
            }

            .social-container a {
                border: 1px solid #DDDDDD;
                border-radius: 50%;
                display: inline-flex;
                justify-content: center;
                align-items: center;
                margin: 0 5px;
                height: 40px;
                width: 40px;
            }

            footer {
                background-color: #222;
                color: #fff;
                font-size: 14px;
                bottom: 0;
                position: fixed;
                left: 0;
                right: 0;
                text-align: center;
                z-index: 999;
            }

            footer p {
                margin: 10px 0;
            }

            footer i {
                color: red;
            }

            footer a {
                color: #3c97bf;
                text-decoration: none;
            }
        </style>

        <script defer src="https://use.fontawesome.com/releases/v5.15.4/js/all.js" integrity="sha384-rOA1PnstxnOBLzCLMcre8ybwbTmemjzdNlILg8O7z1lUkLXozs4DHonlDtnE7fpc" crossorigin="anonymous"></script>

    </head>
    <body>
        <h2><a href="home"><img style="width: 100px; height: 100px" src="img/logo_1.png" alt=""></a></h2>
        <div class="container" id="container">
            <div class="form-container sign-up-container">
                <form action="register" method="post">
                    <h1>Register</h1>
                    <span>Or use to register</span>
                    <input type="text" required name="username1" placeholder="Username (*)" />
                    <input type="email" name="email1" placeholder="Email" value=""/>
                    <input type="phone" required name="phone" required placeholder="Phone (*)" value=""/>
                    <input type="password" required name="password1" placeholder="Password (*)" />
                    <input type="password" required name="confirm-password1" placeholder="Confirm password (*)" />
                    <input type="hidden" name="signUp" value="1"/>
                    <button type="submit">Register</button>
                    <c:if test="${errorPass != null && signup == 1}">
                        <script style="color: red">
                            alert("${requestScope.errorPass}");
                        </script>
                    </c:if>
                    <c:if test="${usernameRes != null && signup == 1}">
                        <script style="color: red">
                            alert("Tài khoản đã tồn tại, vui lòng đăng kí tài khoản khác!!!");
                        </script>
                    </c:if>
                </form>
            </div>
            <div class="form-container sign-in-container">
                <form action="login" method="post">
                    <h1>Login</h1>
                    <div class="social-container">
                        
                        <a href="https://accounts.google.com/o/oauth2/auth?scope=email%20profile
                           &redirect_uri=http://localhost:9999/WebApplication3/LoginGoogleHandler&response_type=code
                           &client_id=794097817165-ak2p0ik9hasiq6fdgeju3ahp519a79vk.apps.googleusercontent.com&approval_prompt=force" class="social"><i class="fab fa-google-plus-g"></i></a>
                        
                    </div>
                    <span>Or use account</span>
                    <input type="text" name="username" placeholder="Tài khoản" value="${cookie.cuser.value}" />
                    <input type="password" name="password" placeholder="Mật khẩu" value="${cookie.cpass.value}"/>
                    <a>     
                        <label style="cursor: pointer" for="remember">Remember</label>  
                        <input style="margin: 0px; cursor: pointer" type="checkbox" ${(cookie.crem.value != null?'checked':'')} class="remember-checkbox" name="rem" id="remember" value="ON">
                    </a>
                    <a href="forgotPassword.jsp">Forgot password</a>
                    <input type="hidden" name="signIn" value="1"/>
                    <button type="submit">Login</button>

                    <%-- Kiểm tra cooldown time và hiển thị thông báo --%>
                    <% Long cooldownEndTime = (Long) session.getAttribute("cooldownEndTime"); %>
                    <% long currentTime = System.currentTimeMillis(); %>
                    <% if (cooldownEndTime != null && cooldownEndTime.longValue() > currentTime) { %>
                    <div id="cooldown-message">
                        You must wait 20 seconds to log in again.
                        <%-- Thêm đồng hồ đếm ngược --%>
                        <div id="countdown"></div>
                    </div>
                    <%-- Script để thực hiện đồng hồ đếm ngược --%>
                    <script>
                        var cooldownEndTime = <%= cooldownEndTime %>;
                        var countdownElement = document.getElementById('countdown');
                        var interval = setInterval(function () {
                            var remainingTime = cooldownEndTime - Date.now();
                            if (remainingTime <= 0) {
                                clearInterval(interval);
                                cooldownEndTime = null; // Reset cooldownEndTime
                                document.getElementById('cooldown-message').style.display = 'none';
                            } else {
                                var seconds = Math.floor((remainingTime / 1000) % 60);
                                countdownElement.innerHTML = 'Remaining time: ' + seconds + ' second';
                            }
                        }, 1000);
                    </script>
                    <% } %>

                    <c:if test="${username != null && signin == 1}">
                        <script style="color: red">
                            alert("Your Account ${requestScope.username} was exist or out of expired. Please login again.");
                        </script>
                    </c:if>
                    <c:if test="${errorPass != null }">
                        <script style="color: red">
                            alert("${requestScope.errorPass}");
                        </script>
                    </c:if>

                </form>
            </div>
            <div class="overlay-container">
                <div class="overlay">
                    <div class="overlay-panel overlay-left">
                        <h1>Welcome Back!</h1>
                        <p>To stay connected with us please log in with your personal information</p>
                        <button class="ghost" id="signIn">Login</button>
                    </div>
                    <div class="overlay-panel overlay-right">
                        <h1>Hello, Friend!</h1>
                        <p>Enter your personal details and start your journey with us</p>
                        <button class="ghost" id="signUp">Register</button>
                    </div>
                </div>
            </div>
        </div>

        <footer>
            <p>
                Hope you have a great day
            </p>
        </footer>
    </body>

    <script type="text/javascript">
        const signUpButton = document.getElementById('signUp');
        const signInButton = document.getElementById('signIn');
        const container = document.getElementById('container');

        signUpButton.addEventListener('click', () => {
            container.classList.add("right-panel-active");
        });

        signInButton.addEventListener('click', () => {
            container.classList.remove("right-panel-active");
        });
    </script>
</html>
