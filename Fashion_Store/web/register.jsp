<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register Page</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
        <link href="css/login.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <div class="container" style="display: flex; flex-direction: column; align-items: center; justify-content: center; height: 100vh !important;">
            <form action="auth?action=register" method="post" class="form-signup" style="width: 60%">
                <h1 class="h3 mb-3 font-weight-normal" style="text-align: center">Fashion Store - Register</h1>
                <p class="text-danger">${error}</p>
                <input name="username" type="text" id="user-name" class="form-control mb-3" placeholder="Tên đăng nhập" required="" autofocus="">
                <input name="password" type="password" id="user-pass" class="form-control mb-3" placeholder="Mật khẩu" required autofocus="">
                <input name="repassword" type="password" id="user-repeatpass" class="form-control mb-3" placeholder="Nhập lại mật khẩu" required autofocus="">
                <input name="fullName" type="text" id="user-repeatpass" class="form-control mb-3" placeholder="Tên" required autofocus="">
                <input name="phoneNumber" type="text" id="user-repeatpass" class="form-control mb-3" placeholder="Số điện thoại" required autofocus="">
                <input name="email" type="text" id="user-repeatpass" class="form-control mb-3" placeholder="Email" required autofocus="">
                <input name="address" type="text" id="user-repeatpass" class="form-control mb-3" placeholder="Địa chỉ" required autofocus="">
                <input class="btn btn-primary btn-block" type="submit" value="Đăng ký">
                <a href="login.jsp" id="cancel_signup"><i class="fas fa-angle-left"></i> Quay về</a>
            </form>

        </div>
    </body>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</html>
