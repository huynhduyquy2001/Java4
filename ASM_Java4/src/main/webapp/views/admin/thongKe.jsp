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
<title>Trang chủ</title>

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

    <!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-select@1.13.14/dist/css/bootstrap-select.min.css">

<!-- Latest compiled and minified JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap-select@1.13.14/dist/js/bootstrap-select.min.js"></script>

<!-- (Optional) Latest compiled and minified JavaScript translation files -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap-select@1.13.14/dist/js/i18n/defaults-*.min.js"></script>
<link rel="stylesheet" href="/ASM_Java4/style.css">

<style>
  li.selected.active{
    width: 100%;
  }
  .active{
  width: 100%;
  background: transparent;
  }
  .tabs ul li {
   width: 100%;
}
.filter-option-inner{
color: transparent;}
.btn-default{
background: transparent;
color: black;
}
.btn-default{
background: transparent;

}
.dropdown-toggle.btn-default:hover, 
.dropdown-toggle.btn-default{
background: transparent;
}
.dropdown-toggle.btn-default{
    background-color: transparent;
}
 .open>.dropdown-toggle.btn-default:hover{
    background: transparent;
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
	<video autoplay muted loop id="bg-video" class="video-container"
		style="position: fixed;">
		<source src="/ASM_Java4/images/hayTraoChoAnh.mp4" type="video/mp4" />
	</video>
	<div class="video-overlay header-text"
		style="z-index: -1; position: fixed;">
	</div>
	<div style="height: 70px;" class="video-container"></div>
	<div class="tabs" style="color: white">
		<input type="radio" id="tab1" name="tab-control" ${checkedtab1}> 
		<input type="radio" id="tab2" name="tab-control" ${checkedtab2}> 
		<input type="radio" id="tab3" name="tab-control" ${checkedtab3}> 
		<ul>
			<li title="Features"><label for="tab1" role="button"><svg
						viewBox="0 0 24 24">

                                        </svg><br>
					<center>
						<span style="font-size: 15px">Thống kê lượt thích</span>
					</center> </label></li>
			<li title="Delivery Contents"><label for="tab2" role="button"><svg
						viewBox="0 0 24 24">
                                        </svg><br>
					<center>
						<span style="font-size: 15px">Thống kê người yêu thích</span>
					</center> </label></li>
			<li title="Shipping"><label for="tab3" role="button"><svg
						viewBox="0 0 24 24">
					</svg><br>
					<center>
						<span style="font-size: 15px">Thống kê video được chia sẻ</span>
					</center> </label></li>
		</ul>
		<div class="content">
			<section>

				<form action="/ASM_Java4/ThongKe/timVideo/" method="post"
					class="navbar-form navbar-left ">
					<div class="form-group">
						<input type="text"
							style="width: 400px; border-radius: 30px; border: none; border: 1px solid gray; background: transparent;"
							name="TTLuotLike" value="${TTLuotLike}" class="form-control"
							placeholder="Tìm kiếm" id="textSearch">
					</div>
					<button id="btnSearch"
						style="border-radius: 30px; border: 1px solid gray; padding: 5px; width: 35px; background: transparent;">
						<i class="fa-solid fa-magnifying-glass"></i>
					</button>
				</form>
				<table class="table" style="cursor: pointer;">
					<thead>
						<tr>
							<th>Tiêu đề</th>
							<th>Lượt like</th>
							<th>Ngày thích mới nhất</th>
							<th>Ngày thích cũ nhất</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="item" items="${items}">
							<tr>
								<td>${item.group}</td>
								<td>${item.likes}</td>
								<td>${item.newest}</td>
								<td>${item.oldest}</td>
							</tr>
						</c:forEach>

					</tbody>
				</table>
			</section>


			<section>
			
			<form action="/ASM_Java4/ThongKe/timND/" method="post"
					class="navbar-form navbar-left ">

						<select class="selectpicker" name="ChonVideoLike" style="width: 50%; background: transparent;"
							data-live-search="true">
							<option value=" ">Tất cả</option>
							<c:forEach var="item" items="${listVideo}">
						<option value="${item.chuDe}">${item.chuDe}</option>
					</c:forEach>
						</select>
						
				<button
						style="border-radius: 30px; border: 1px solid gray; padding: 5px; width: 35px; background: transparent;">
						<i class="fa-solid fa-magnifying-glass"></i>
					</button>
				
					
				</form>
				
				<table class="table" style="cursor: pointer;">
						<thead>
							<tr>
								<th>số điện thoại</th>
								<th>Họ tên</th>
								<th>Email</th>
								<th>Ngày thích video</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="item" items="${listUserLike}">
								<tr>
									<td>${item.user.sdt}</td>
									<td>${item.user.tenND}</td>
									<td>${item.user.email}</td>
									<td>${item.ngayLike}</td>
								</tr>
							</c:forEach>

						</tbody>
					</table>
			</section>
			<section>
			<form action="/ASM_Java4/ThongKe/timNDShare/" method="post"
					class="navbar-form navbar-left ">
						<select class="selectpicker" name="ChonVideoShare" style="width: 50%; background: transparent;"
							data-live-search="true">
							<option value=" ">Tất cả</option>
							<c:forEach var="item" items="${listVideo}">
						<option value="${item.chuDe}">${item.chuDe}</option>
					</c:forEach>
						</select>
						
				<button
						style="border-radius: 30px; border: 1px solid gray; padding: 5px; width: 35px; background: transparent;">
						<i class="fa-solid fa-magnifying-glass"></i>
					</button>
				
					
				</form>
				
				<table class="table" style="cursor: pointer;">
						<thead>
							<tr>
								<th>số điện thoại</th>
								<th>Họ tên</th>
								<th>Email</th>
								<th>Ngày chia sẻ video</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="item" items="${listUserShare}">
								<tr>
									<td>${item.user.sdt}</td>
									<td>${item.user.tenND}</td>
									<td>${item.user.email}</td>
									<td>${item.ngayShare}</td>
								</tr>
							</c:forEach>

						</tbody>
					</table>
			</section>
			<section>
				<div class="row animationTop"
					style="margin: 0; margin-top: 10px; padding: 0; margin-bottom: 30px;">
					<div class="row animationTop"
						style="margin: 0; margin-top: 10px; padding: 0; margin-bottom: 30px;">
						<c:forEach var="video" items="${videosCartoon}">
							<div class="col-md-4" style="margin-bottom: 40px;">
								<div>
									<center>
										<a href="/ASM_Java4/chiTiet/index/${video.maVideo}"> <img
											data-src="${video.poster}"
											style="height: auto; width: 95%; border-radius: 10px;" alt="">
											<div class="tieuDe">
												<h5
													style="font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;"
													data-toggle="tooltip" data-placement="top"
													title="${video.chuDe}" style="text-align: left;">${video.chuDe}</h5>
											</div>
										</a>
										<div class="likeShare">
											<small style="cursor: pointer;"> Thể loại:
												${video.theLoai} </small> &nbsp &nbsp <small class="pull-right"
												style="cursor: pointer;"> <i
												class="fa-light fa-share" style="cursor: pointer;"></i>
												Share
											</small> <small class="pull-right"><i class="fa-thin fa-eye"></i>
												<fmt:formatNumber value="${video.luotXem}" pattern="#,###" />
												| </small>&nbsp
										</div>
									</center>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>
			</section>
		</div>
	</div>
	<hr>
	<%@include file="/footer.jsp"%>

	<script src="/ASM_Java4/lazy.js"></script>
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
			localStorage.setItem("darkMode", mode);
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

			var element6 = document.getElementById("sub-menu");
			if (element6 != null) {
				element6.classList.toggle("dark-mode");
			}

		}
	</script>
</body>

</html>