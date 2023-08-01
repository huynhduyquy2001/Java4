<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Quản lí người dùng</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap-theme.min.css"
	integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp"
	crossorigin="anonymous">

<script src="http://code.jquery.com/jquery-1.11.1.js"></script>

<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js"
	integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700,900">
<script src="https://kit.fontawesome.com/f737751420.js"></script>

<link rel="stylesheet" href="/ASM_Java4/style.css">
<style>
.ip[type=text], .ip[type=password], .ip[type=email] {
	width: 100%;
	padding: 8px 20px;
	border: 1px solid #ccc;
	box-sizing: border-box;
	background: transparent;
}

.lgin {
	background-color: #04AA6D;
	color: white;
	padding: 8px;
	border: none;
	cursor: pointer;
	width: 15%;
	transition: .3s;
	border-radius: 10px;
}

.lgin:hover {
	background: burlywood;
}

.lgin2 {
	background-color: #007ACC;
	color: white;
	padding: 8px;
	margin: 8px 0;
	border: none;
	cursor: pointer;
	width: 15%;
	transition: .3s;
	border-radius: 10px;
}

.lgin2:hover {
	background: #F5A425;
}

.cancelbtn {
	padding: 8px;
	background-color: #f44336;
	border: none;
	color: white;
	border-radius: 10px;
	width: 15%;
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
}
</style>
</head>

<body style="margin: 0; padding: 0; color: white;">
<c:url var="url" value="/qlNDung" />
<!--menu trên-->
	<%@include file="/headerMini.jsp"%>

	<center>
		<!--Menu dưới-->
		<%@include file="/menuDuoiAdmin.jsp"%>
	</center>
	<div class=" main-banner animationTop delay-02" id="top"
		data-section="section1">
		<video autoplay muted loop id="bg-video" class="video-container">
			<source src="/ASM_Java4/images/hayTraoChoAnh.mp4" type="video/mp4" />
		</video>
		<div class="video-overlay header-text">
			
			<div class="caption" style="text-align: left; width: 90%;">
				<div class="row">
					<div class="col-md-8">
						<form action="${url}/find" method="post" class="navbar-form ">
							<div class="form-group">
								<input type="text"
									style="width: 400px; border-radius: 30px; border: none; border: 1px solid gray; background: transparent;"
									name="thongTin" class="form-control" placeholder="Họ tên?"
									id="textSearch">
							</div>
							<button id="btnSearch"
								style="border-radius: 30px; border: 1px solid gray; padding: 5px; width: 35px; background: transparent;">
								<i class="fa-solid fa-magnifying-glass"></i>
							</button>
						</form>
						${KqTim} <br>

						<table class="table " style="width: 100%">
							<thead>
								<tr>
									<th>Số điện thoại</th>
									<th>Họ tên</th>
									<th>Email</th>
									<th>Giới tính</th>
									<th>Vai trò</th>
									<th>Edit</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="user" items="${users}">
									<tr>
										<td>${user.sdt}</td>
										<td>${user.tenND}</td>
										<td>${user.email}</td>
										<td>${user.gioiTinh?'Nam':'Nữ'}</td>
										<td>${user.admin?'Quản trị viên':'Người dùng'}</td>
										<td><a href="/ASM_Java4/qlNDung/edit/${user.sdt}"><i
												class="fa-solid fa-pen" style="color: white"></i></a></td>
									</tr>
								</c:forEach>




							</tbody>
						</table>
					</div>
					<form action="" method="post">

						<div class="col-md-4" style="border-left: 1px dotted;">
							<center>
								<h3>THÔNG TIN NGƯỜI DÙNG</h3>
							</center>
							<hr>
							<label for="uname"><b>Số điện thọai</b></label> <input class="ip"
								type="text" placeholder="Số điện thoại?" name="sdt"
								value="${form.sdt}" required> <label for="uname"><b>Họ
									tên</b></label> <br> <input class="ip" type="text"
								placeholder="Họ tên?" name="tenND" value="${form.tenND}"
								required> <label for="uname"><b>Email</b></label> <input
								class="ip" type="email" placeholder="Email?" name="email"
								value="${form.email}" required> <label for="uname"><b>Giới
									tính</b></label> <br> <label> 
									<input ${form.gioiTinh?'checked':' '} type="radio" name="gioiTinh"
								id="input" value="true" checked="checked"> Nam
							</label> &nbsp &nbsp &nbsp &nbsp <label>  
							<input ${form.gioiTinh?' ': 'checked'} type="radio" name="gioiTinh"
								id="input" value="false"> Nữ
							</label> <br> <label for="uname"><b>Vai trò</b></label> <br> <label>
								<input ${form.admin?' ': 'checked'} type="radio" name="admin"
								id="input" value="true" checked="checked"> Quản trị viên
							</label> &nbsp &nbsp &nbsp &nbsp <label> <input
								${form.admin?' ': 'checked'} type="radio" name="admin"
								id="input" value="false"> Người dùng
							</label>
							<input type="hidden" name="matKhau" value="${form.matKhau}">
							 <br> ${message}
							<center>
								<button class="lgin2" formaction="${url}/update" type="submit">Sửa</button>
								<button class="cancelbtn" formaction="${url}/delete"
									type="submit">Xóa</button>
								<a href="${url}/index" class=""
									style="border: 1px solid; background: transparent; padding: 8px; border-radius: 10px; color: white;">
									Làm mới </a>
						</div>
					</form>


					</center>
				</div>
			</div>
		</div>
	</div>

</body>

</html>