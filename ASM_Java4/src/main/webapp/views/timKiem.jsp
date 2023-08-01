<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Tìm kiếm</title>

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

<script src="https://kit.fontawesome.com/f737751420.js"></script>

<link rel="stylesheet" href="/ASM_Java4/style.css">
<style>
.main-menu {
	width: 200px;
	z-index: 0;
	padding-left: 20px;
	padding-top: 20px;
}
</style>
</head>
<body>
	<!--menu trên-->
	<%@include file="/header.jsp"%>

	<center>
		<!--Menu dưới-->
		<%@include file="/menuDuoiAdmin.jsp"%>
	</center>
	<!--Menu trái-->
	<%@include file="/menuTraiAdmin.jsp"%>

	<div class=" main-banner animationTop delay-02" id="top"
		data-section="section1">
		<div style="height: 100px;" class="video-container"></div>
	</div>
	<div class="container" style="width: 70%">
	Đã tìm thấy: ${message} video.
	<br> <br>
		<c:forEach var="video" items="${videoTimKiem}">
			<a href="/ASM_Java4/chiTiet/${video.maVideo}">
				<div class="row" style="margin-bottom: 20px;">
					<div class="col-md-4 col-sm-4">
						<img src="${video.poster }"
							style="width: 100%; border-radius: 10px;" alt="">
					</div>
					<div class="col-md-8 col-sm-8">
						<ul style="padding-left: 0; line-height: 25px;">
							<li style="padding-left: 0;"><h4>${video.chuDe }</h4></li>
							<li><small>${video.luotXem} lượt xem | Thể loại:
									${video.theLoai} </small></li>
							<li><small> </small></li>
							<li><small>Ngày ra mắt: ${video.ngayTao}</small></li>
							<div class="tieuDe">
								<h5
									style="font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;"
									data-toggle="tooltip" data-placement="top"
									title="Ấn vào link để biết thêm thông tin chi tiết" style="text-align: left;">
									${video.moTa}</h5>
							</div>
							<li></li>
							<li></li>
							<li></li>
						</ul>
					</div>
				</div>
			</a>
		</c:forEach>
	</div>
	</div>
	<script>
		let mode = localStorage.getItem("darkMode");
		if (mode == 'true') {
			myFunction();
			document.getElementById("checkbox").checked = true;
			document.getElementById("darkMode2").innerHTML = "Dark-mode: Bật";
			document.getElementById("darkMode3").innerHTML = "Dark-mode: Bật";
		} else {
			document.getElementById("darkMode2").innerHTML = "Dark-mode: Tắt";
			document.getElementById("darkMode3").innerHTML = "Dark-mode: Tắt";
			document.getElementById("checkbox").checked = false;
		}
		function myFunction() {
			var element = document.body;
			var element2 = document.getElementById("main-menu");
			var element3 = document.getElementById("dropdown-menu");
			var element4 = document.getElementById("textSearch");
			var element5 = document.getElementById("btnSearch");

			var element6 = document.getElementById("sub-menu");
			let mode = element.classList.toggle("dark-mode");
			element2.classList.toggle("dark-mode");
			element3.classList.toggle("dark-mode");
			element4.classList.toggle("dark-mode");
			element5.classList.toggle("dark-mode");

			const link = document.getElementsByTagName("a");
			for (let i = 0; i < link.length; i++) {
				link[i].classList.toggle("dark-mode");
			}

			if (document.getElementById("darkMode2").innerHTML == "Dark-mode: Tắt") {
				document.getElementById("darkMode2").innerHTML = "Dark-mode: Bật";
				document.getElementById("darkMode3").innerHTML = "Dark-mode: Bật";
			} else {
				document.getElementById("darkMode2").innerHTML = "Dark-mode: Tắt";
				document.getElementById("darkMode3").innerHTML = "Dark-mode: Tắt";
			}

			localStorage.setItem("darkMode", mode);

		}
	</script>
</body>

</html>