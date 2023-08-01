<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Trang xem Video</title>

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
<body>
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
	<div class="row"
		style="line-height: 35px; padding-right: 30px; padding-bottom: 10px;">
		<div class="col-md-8 animationTop delay-04">
			<div class="tab-pane active animationTop2 delay-01" id="home">
				<div>
					<center>
						<div class="video-container">
							<iframe width="560" height="315"
								src="${video.link}?rel=0&autoplay=1"
								title="YouTube video player" frameborder="0"
								allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
								allowfullscreen></iframe>
						</div>
						<div style="text-align: left;">
							<h3
								style="font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;">
								${ video.chuDe}</h3>
						</div>
						<div style="text-align: left;">
							<a href="/ASM_Java4/chiTiet/yeuThich/${video.maVideo}"> <i
								class="fa-duotone fa-heart"
								style="font-size: 20px; cursor: pointer;color: ${heart}"></i>
								Like &nbsp &nbsp
							</a> <a target="_blank" href="/ASM_Java4/chiaSeMail/${video.maVideo}">
								<label style="cursor: pointer;"> <i
									class="fa-light fa-share"
									style="font-size: 20px; cursor: pointer;"></i> Share
							</label>
							</a> <span class="pull-right"><fmt:formatNumber
									value="${video.luotXem}" pattern="#,###" /> Lượt xem</span>
						</div>
						<div style="text-align: left; line-height: 30px">
							Thể loại: ${ video.theLoai} <br> Ngày công chiếu: ${ video.ngayTao}
							<br> Lượt xem:
							<fmt:formatNumber value="${video.luotXem}" pattern="#,###" />
							<br>
							<textarea disabled="disabled"
								style="text-align: justify; width: 100%; border: none;background: transparent;" id="" va
								cols="75" rows="10">${ video.moTa}</textarea>
							<div></div>


						</div>
					</center>
				</div>
			</div>
		</div>
		<div class="col-md-4 menuPhai animationTop delay-03"
			style="line-height: 20px; padding: 0;">
			<c:forEach var="video" items="${videos}">
				<div class="row">
					<a href="/ASM_Java4/chiTiet/index/${video.maVideo}"
						style="padding: 0; display: flex; overflow: hidden;">
						<div class="col-md-5" style="padding: 5px; width: 140px;">
							<img src="${video.poster}"
								style="max-width: 135px; height: auto; border-radius: 5px;"
								alt="">
						</div>
						<div class="col-md-7"
							style="padding-top: 3px; padding-left: 5px; width: 260px; overflow: hidden;">
							<p style="font-weight: 600; height: 40px; overflow: hidden;">${video.chuDe}</p>
							<small> <c:set var="string1" value="${video.luotXem}" />
								<c:set var="string2" value="${fn:substring(string1, 0, 3)}" />
								<fmt:formatNumber value="${string2}" pattern="#,###" /> tr lượt
								xem
							</small> | <small>${video.theLoai}</small>
						</div>
					</a>
				</div>
			</c:forEach>
		</div>

	</div>
	<hr width="30%">
	<footer>
		<center>
			Cao đẳng FPT Polytechnic <br> Địa chỉ: đường Nguyễn Văn Linh,
			Quận Ninh Kiều Thành Phố Cần Thơ <br> Hotline: 0767161102 <br>
			Chuyên ngành: Ứng dụng phần mềm <br> Khóa: IT17.03

		</center>
	</footer>

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