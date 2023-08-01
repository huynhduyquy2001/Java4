<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<!DOCTYPE html>
	<html lang="en">

	<head>
		<meta charset="UTF-8">
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

		<link rel="stylesheet" href="/ASM_Java4/style.css">
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
					<form action="" method="post" style="overflow-y: hidden;overflow-y: scroll;height: 88vh; padding-right: 10px">
						<div class="row">
							<center>
								<h3>ĐĂNG KÝ </h3>

							</center>
							<hr>
							<div class="col-md-6">
								<label for="uname"><b>Số điện thọai</b></label>
								<input class="ip" type="text" placeholder="Số điện thoại?" value="${form.sdt}"
									name="sdt" required>
								<small style="color: yellow">${message1}</small> <br>
								<label for="psw"><b>Mật khẩu</b></label>
								<input class="ip" type="password" placeholder="Mật khẩu?" name="matKhau"
									value="${form.matKhau}" required>
								<small style="color: yellow">${message2}</small><br>
								<label for="psw2"><b>Mật khẩu xác nhận</b></label>
								<input class="ip" type="password" placeholder="Mật khẩu xác nhận?" name="matKhau2"
									required>
								<small style="color: yellow">${message3}</small><br>
							</div>
							<div class="col-md-6">
								<label for="uname"><b>Họ tên</b></label> <br>
								<input class="ip" type="text" value="${form.tenND}" placeholder="Enter Fullname"
									name="tenND" required>
								<label for="uname"><b>Email</b></label>
								<input class="ip" type="email" placeholder="Email?" value="${form.email}" name="email"
									required>
								<small style="color: yellow">${message4}</small><br>
								<label for="uname"><b>Giới tính</b></label> <br> <br>
								<label> <input ${form.gioiTinh?'checked':' '}  type="radio" name="gioiTinh" id="input" value="true" checked="checked"> Nam
                            </label> &nbsp &nbsp &nbsp &nbsp
                            <label> <input ${form.gioiTinh?' ':' checked'} type="radio" name="gioiTinh" id="input"
										value="false"> Nữ
								</label>
								<input class="ip" type="hidden" name="admin" value="false">
							</div>
						</div>
						<center>
							${message}
							<button class="lgin" type="submit">Đăng ký</button>
						</center>
						<br> <a href="index.html">
							<button type="button" class="cancelbtn">Trở về</button>
						</a> <span class="psw">Đã có <a href="/ASM_Java4/dangNhap" style="color: #F5A425;">tài
								khoản?</a></span>
					</form>
					<!-- <div class="main-button">
                    <div class="scroll-to-section"><a href="#section2">Discover more</a></div>
                </div> -->
				</div>
			</div>
		</div>

	</body>

	</html>