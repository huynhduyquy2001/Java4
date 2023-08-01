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
<title>Video đã thích</title>

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
</head>

<body>
<c:url var="url" value="/yeuThich" />

<!--menu trên-->
	<%@include file="/header.jsp"%>
	<center>
		<!--Menu dưới-->
		<%@include file="/menuDuoiAdmin.jsp"%>
	</center>
	<!--Menu bên trái-->
	<%@include file="/menuTraiAdmin.jsp"%>
	<div class=" main-banner animationTop delay-02" id="top"
		data-section="section1">
		<div style="height: 100px;" class="video-container"></div>
	</div>

	<div class="container">
		<h4>Video đã thích: ${message} video</h4>
		<div class="row animationTop"
			style="margin: 0; margin-top: 10px; padding: 0; margin-bottom: 30px;">

			<c:forEach var="video" items="${videos}">
				<div class="col-md-3" style="margin-bottom: 20px;">
					<div>
						<center>
							<a href="/ASM_Java4/chiTiet/${video.maVideo}"> <img
								src="${video.poster}"
								style="height: auto; width: 95%; border-radius: 10px;" alt="">
								<div class="tieuDe">
									<h5
										style="font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;"
										data-toggle="tooltip" data-placement="top"
										title="Marvel Studios' Phù Thủy Tối Thượng Trong Đa Vũ Trụ Hỗn Loạn | Trailer"
										style="text-align: left;">${video.chuDe}</h5>
								</div>
							</a>
							<div class="likeShare">
								<small style="cursor: pointer;">
								<a href="/ASM_Java4/yeuThich/boThich/${video.maVideo}">
								<i class="fa-solid fa-heart" style="color: red;"></i> Bỏ thích
								</a>
								 
								 
								</small> &nbsp &nbsp <small class="pull-right" style="cursor: pointer;">
									<i class="fa-light fa-share" style="cursor: pointer;"></i>
									Chia sẻ
								</small> <small class="pull-right"><i class="fa-thin fa-eye"></i>
									 <fmt:formatNumber value="${video.luotXem}"
                                                                    pattern="#,###" /> |</small>&nbsp
							</div>
						</center>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>

	<hr>



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
			let mode = element.classList.toggle("dark-mode");
			element2.classList.toggle("dark-mode");
			element3.classList.toggle("dark-mode");
			element4.classList.toggle("dark-mode");
			element5.classList.toggle("dark-mode");
			var element6 = document.getElementById("sub-menu");
			if (element6 != null) {
				element6.classList.toggle("dark-mode");
			}
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