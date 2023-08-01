<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8");
	response.setContentType("text/html;charset=UTF-8");
 %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Đăng ký</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css"
        integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap-theme.min.css"
        integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

    <script src="http://code.jquery.com/jquery-1.11.1.js"></script>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js"
        integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
        crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700,900">
    <script src="https://kit.fontawesome.com/f737751420.js"></script>

    <link rel="stylesheet" href="style.css">
    <style>
        .ip[type=text],
        .ip[type=password],
        .ip[type=email] {
            width: 100%;
            padding: 8px 20px;
            margin: 8px 0;
            border: 1px solid #ccc;
            box-sizing: border-box;
            background: transparent;
            border-radius: 10px 0 10px 0;
        }

        .lgin {
            background-color: #7394AD;
            color: white;
            padding: 8px 20px;
            margin: 8px 0;
            border: none;
            cursor: pointer;
            width: 100%;
            transition: .3s;
            border-radius: 10px 0 10px 0;
        }

        .lgin:hover {
            background: burlywood;
        }

        .lgin2 {
            background-color: #007ACC;
            color: white;
            padding: 14px 20px;
            margin: 8px 0;
            border: none;
            cursor: pointer;
            width: 100%;
            transition: .3s;
        }

        .lgin2:hover {
            background: burlywood;
        }

        .cancelbtn {
            width: auto;
            padding: 5px 18px;
            background-color: #337AB6;
            border: none;
            color: white;
            border-radius: 10px 0 10px 0;
        }

        .imgcontainer {
            text-align: center;
            margin: 24px 0 12px 0;
        }

        img.avatar {
            width: 40%;
            border-radius: 50%;
        }

        span.psw {
            float: right;
            padding-top: 16px;
        }

        /* Change styles for span and cancel button on extra small screens */
        @media screen and (max-width: 300px) {
            span.psw {
                display: block;
                float: none;
            }

            .cancelbtn {
                width: 100%;
            }
        }
    </style>
</head>

<body style="margin: 0;padding: 0; color: white;">
    <div class=" main-banner animationTop delay-02" id="top" data-section="section1">
        <video autoplay muted loop id="bg-video" class="video-container">
            <source src="images/hayTraoChoAnh.mp4" type="video/mp4" />
        </video>
        <div class="video-overlay header-text">
            <div class="caption" style="text-align: left;width: 60%;">
                <form action="capNhatTk" method="post" s>
                    <div class="row">
                        <center>
                        <h3>THÔNG TIN TÀI KHOẢN </h3>
                            
                        </center>
                        <hr>
                        <label ><b>Số điện thọai</b></label>
                            <input readonly="true" class="ip" type="text" placeholder="Số điện thoại?" name="sdt" required value="${user.sdt}">
                        <label ><b>Họ tên</b></label> <br> 
                            <input class="ip" type="text" placeholder="Họ tên" name="tenND" required value="${user.tenND}">
                        <label ><b>Email</b></label>
                            <input class="ip" type="email" placeholder="Email" name="email" required value="${user.email}">
                        <label ><b>Giới tính</b></label> <br> <br>
                        
                            <input  type="hidden" name="matKhau" value="${form.matKhau}" required>
                            <input  type="hidden" name="admin" value="${form.admin}" required>
                            
                        <label> <input ${user.gioiTinh?'checked':' '}  type="radio" name="gioiTinh" id="input" value="true" > Nam
                            </label> &nbsp &nbsp &nbsp &nbsp
                        <label> <input ${user.gioiTinh?' ': 'checked'} type="radio" name="gioiTinh"  id="input" value="false"> Nữ
                            </label>                       
                    </div>
                    <center>
                    ${message}
                        <button class="lgin" type="submit">Cập nhật</button>
                    </center>
                    <br> <a href="/ASM_Java4/index">
                        <button type="button" class="cancelbtn">Trang chủ</button>
                    </a> <span class="psw">Đổi <a href="/ASM_Java4/DoiMk" style="color: #F5A425;">mật khẩu?</a></span>
                </form>
            </div>
        </div>
    </div>
    
</body>

</html>