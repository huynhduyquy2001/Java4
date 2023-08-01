<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Đăng nhập</title>
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

        <link rel="stylesheet" href="/ASM_Java4/style.css">
        <style>
            .ip[type=text],
            .ip[type=password],
            .ip[type=date] {
                width: 100%;
                padding: 8px 20px;
                margin: 8px 0;
                border: 1px solid #ccc;
                box-sizing: border-box;
                background: transparent;
                border-radius: 10px 0 10px 0;
            }

            .lgin {
                background-color: #04AA6D;
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
                padding: 7px 18px;
                background-color: #f44336;
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
    <body style="margin: 0; padding: 0; color: white;">
        <div class=" main-banner animationTop delay-02" id="top" data-section="section1">
            <video autoplay muted loop id="bg-video" class="video-container">
                <source src="/ASM_Java4/images/hayTraoChoAnh.mp4" type="video/mp4" />
            </video>
            <div class="video-overlay header-text">
                <div class="caption" style="text-align: left; width: 40%;">
                    <form action="dangNhap" method="post">
                        <div class="row">
                            <center>
                                <h3>ĐĂNG NHẬP</h3>
                            </center>
                            <hr>
                            <label for="uname"><b>Số điện thoại</b></label>
                            <input class="ip" autofocus type="text" placeholder="Số điện thoại?" name="sdt" value="${sdt}" required>
                            <label for="psw"><b>Mật khẩu</b></label>
                            <input class="ip" type="password" placeholder="Mật khẩu?" name="matKhau" value="${matKhau}"
                                required> 
                             <label><input type="checkbox" name="ghiNho">Ghi nhớ tài khoản?</label>
                        </div>
                        <center>
                            <small>${message}</small>
                            <button class="lgin" type="submit">Đăng nhập</button>
                        </center>
                        <br> <a href="/ASM_Java4/index">
                            <button type="button" class="cancelbtn">Trang chủ</button>
                        </a> <span class="psw">Chưa có <a href="/ASM_Java4/dangKy" style="color: #F5A425;">tài
                                khoản?</a></span>

                    </form>
                </div>
            </div>
        </div>
    </body>

    </html>