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
<title>Quản lí Video</title>
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

a {
	color: white;
}

a:hover {
	color: #F5A425;
}
</style>
</head>

<body style="margin: 0; padding: 0; color: white;">
	<c:url var="url" value="/qlVideo" />
	<!--menu trên-->
	<%@include file="/headerMini.jsp"%>

	<center>
		<!--Menu dưới-->
		<%@include file="/menuDuoiAdmin.jsp"%>
	</center>

	<video autoplay muted loop id="bg-video" class="video-container"
		style="position: fixed;">
		<source src="/ASM_Java4/images/hayTraoChoAnh.mp4" type="video/mp4" />
	</video>
	<div class="video-overlay header-text"
		style="z-index: -1; position: fixed;"></div>
	<div style="height: 70px;" class="video-container"></div>
	<div class="container">
		<form method="post" enctype="multipart/form-data">
			<div class="row">
				<center>

					<hr>
				</center>
				<div class="col-md-6 col-sm-6 col-xs-6">
					<div class="caption" style="text-align: left; width: 100%;">
		<c:set var="now" value="<%=new java.util.Date()%>" />
						<div class="row">
							<label for="uname"><b>Mã video</b></label> <input class="ip"
								value="${ form.maVideo}" type="text" placeholder="Mã video?"
								name="maVideo" required> <label for="psw"><b>Tiêuđề</b></label>
							<input class="ip" type="text" placeholder="Tiêu đề?" name="chuDe"
								value="${ form.chuDe}" required> <label for="psw2"><b>Thể
									loại</b></label> <input class="ip" type="text" placeholder="Thể loại?"
								name="theLoai" value="${ form.theLoai}" required> <label
								for="psw2"><b>Link</b></label> <input class="ip" type="text"
								placeholder="Link?" name="link" value="${ form.link}" required>
							<label for="psw2"><b>Lượt xem</b></label> <input class="ip"
								type="text" placeholder="Lượt xem?" value="${ form.luotXem}"
								required> <label for="psw2"><b>Ngày ra mắt</b></label> <input
								class="ip" type="text" 
								value='<fmt:formatDate pattern = "yyyy-MM-dd"  value = "${now}" />'
								required> <label for="psw2"><b>Đường dẫn ảnh
									Online</b></label> <input class="ip" type="text" name="poster"
								placeholder="https://img.youtube.com..." value="${form.poster}"
								required>
						</div>
						${message}
						<center>
							<button class="lgin" formaction="${url}/create" type="submit">Thêm</button>
							<button class="lgin2" formaction="${url}/update" type="submit">Sửa</button>
							<button class="cancelbtn" formaction="${url}/delete"
								type="submit">Xóa</button>
							<a href="${url}/index" class=""
								style="border: 1px solid; background: transparent; padding: 8px; color: white; border-radius: 10px">
								Làm mới </a>
						</center>
					</div>
				</div>
				<div class="col-md-6 col-sm-6 col-xs-6" style="padding-top: 15px;">
					<div class="row">
						<a href="/ASM_Java4/chiTiet/index/${form.maVideo}"> <img
							alt="" src="${poster}" width="50%">
						</a>
					</div>
					<br> <label for="uname"><b>Trạng thái</b></label> <br> <label>
						<input ${form.hoatDong?'checked':' '} type="radio" name="hoatDong"
						id="input" value="true" checked="checked"> Đang hoạt động
					</label> <label> <input ${form.hoatDong?' ': 'checked'}
						type="radio" name="hoatDong" id="input" value="false">
						Ngừng hoạt động
					</label> <br> <label for="psw2"><b>Mô tả</b></label><br> </label>
					<textarea style="background: transparent;" name="moTa" id=""
						cols="75" rows="10">${ form.moTa}</textarea>
				</div>
			</div>
		</form>
	</div>
	<hr>
	<form action="${url}/timKiem" method="post"
		class="navbar-form navbar-left ">
		<div class="form-group">
			<input type="text"
				style="width: 400px; border: none; border: 1px solid gray; background: transparent; color: white"
				name="thongTin" class="form-control" placeholder="Tìm kiếm"
				value="${thongTinn}" id="textSearch">
		</div>
		Thể loại: <select id="dropdown" name="theLoai" style="color: black">
			<option value="">Tất cả</option>
			<option value="âm nhạc">Âm nhạc</option>
			<option value="trailer">Trailer</option>
			<option value="hoạt hình">Hoạt hình</option>

		</select>
		<button id="btnSearch"
			style="border: 1px solid gray; padding: 5px; width: 35px; background: transparent; border-radius: 2px">
			<i class="fa-solid fa-magnifying-glass"></i>
		</button>
		&nbsp &nbsp &nbsp
	</form>
	<table class="table" style="width: 100%">
		<thead>
			<tr>
				<th>Tiêu đề</th>
				<th>Link</th>
				<th>Ảnh</th>
				<th>Thể loại</th>
				<th>Lượt xem</th>
				<th>Ngày tạo</th>
				<th>Trạng thái</th>
				<th>Edit</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="video" items="${videos}">
				<tr>
					<td style="vertical-align: middle;">${video.chuDe}</td>
					<td style="vertical-align: middle;">${video.link}</td>
					<td style="width: 10%"><img alt="" src="${video.poster}"
						width="70%"></td>
					<td style="vertical-align: middle; width: 8%">${video.theLoai}</td>
					<td style="vertical-align: middle;"><fmt:formatNumber
							value="${video.luotXem}" pattern="#,###" /></td>
					<td style="vertical-align: middle; width: 7%"><fmt:formatDate
							value="${video.ngayTao}" pattern="dd-MM-yyyy" /></td>
					<td style="vertical-align: middle; width: 8%">${video.hoatDong?'Đang hoạt động':'Ngừng hoạt động'}</td>
					<td style="vertical-align: middle;"><a
						href="${url}/edit/${video.maVideo}"><i class="fa-solid fa-pen"></i></a></td>
				</tr>
			</c:forEach>




		</tbody>
	</table>

</body>

</html>