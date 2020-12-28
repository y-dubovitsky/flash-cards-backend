<#import "parts/index.ftl" as index>

<@index.page "Login" "/static/css/login.css" "/static/js/login.js">
    <div class="container">
        <section id="formHolder">

            <div class="row">

                <!-- Brand Box -->
                <div class="col-sm-6 brand">

                    <div class="heading">
                        <p style="font-size: 50px !important;">FlashCards</p>
                        <p>Your Right Choice</p>
                        <p style="font-style: italic">Learn english everywhere</p>
                    </div>

                    <div class="success-msg">
                        <p>Great! You are one of our members now</p>
                        <a href="#" class="profile">Your Profile</a>
                    </div>
                </div>


                <!-- Form Box -->
                <div class="col-sm-6 form">
                    <!-- Login Form -->
                    <div class="login form-peice switched">
                        <form class="login-form" action="/login" method="post">
                            <div class="form-group">
                                <label for="usernameLogin">Username</label>
                                <input type="text" name="username" id="usernameLogin" required>
                            </div>

                            <div class="form-group">
                                <label for="passwordLogin">Password</label>
                                <input type="password" name="password" id="passwordLogin" required>
                                <#--                                CSRF TOKEN-->
                                <input type="hidden" name="_csrf" value="${_csrf.token}">
                            </div>

                            <div class="CTA">
                                <input type="submit" value="Sign In">
                                <a href="#" class="switch">I'm New</a>
                            </div>
                        </form>
                    </div><!-- End Login Form -->


                    <!-- Signup Form -->
                    <div class="signup form-peice">
                        <form class="signup-form" action="#" method="post">

                            <div class="form-group">
                                <label for="name">Full Name</label>
                                <input type="text" name="username" id="name" class="name">
                                <span class="error"></span>
                            </div>

                            <div class="form-group">
                                <label for="email">Email Adderss</label>
                                <input type="email" name="emailAdress" id="email" class="email">
                                <span class="error"></span>
                            </div>

                            <div class="form-group">
                                <label for="phone">Phone Number - <small>Optional</small></label>
                                <input type="text" name="phone" id="phone">
                            </div>

                            <div class="form-group">
                                <label for="password">Password</label>
                                <input type="password" name="password" id="password" class="pass">
                                <span class="error"></span>
                            </div>

                            <div class="form-group">
                                <label for="passwordCon">Confirm Password</label>
                                <input type="password" name="passwordCon" id="passwordCon" class="passConfirm">
                                <span class="error"></span>
                            </div>

                            <div class="CTA">
                                <input type="submit" value="Signup Now" id="submit">
                                <a href="#" class="switch">I have an account</a>
                            </div>
                        </form>
                    </div><!-- End Signup Form -->
                </div>
            </div>
        </section>


        <footer>
            <p>
                made by: <a href="#" target="_blank">Dubovitsky with <i class="icon-heart"></i></a>
            </p>
        </footer>

    </div>
</@index.page>