<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<fmt:setLocale value="${sessionScope.lang}" scope="request" />
<fmt:setBundle basename="global" scope="request" />
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

<link rel="stylesheet" href="/ASM_Java4/style.css">

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
		<video autoplay muted loop class="video-container">
			<source src="images/hayTraoChoAnh.mp4" type="video/mp4" />
		</video>
		<div class="video-overlay header-text">
			<div class="caption">
				<h6>Giải trí,thư giãn, tận hưởng cuộc sống</h6>
				<h2>
					<em>ONLINE</em> ENTERTAINMENT
				</h2>
				<div class="music">
					<div class="bar"></div>
					<div class="bar"></div>
					<div class="bar"></div>
					<div class="bar"></div>
					<div class="bar"></div>
					<div class="bar"></div>
					<div class="bar"></div>
					<div class="bar"></div>
					<div class="bar"></div>
					<div class="bar"></div>
				</div>
				
			</div>
		</div>
	</div>
	 <div class="tabs">
          
            <input type="radio" id="tab1" name="tab-control" checked> <input type="radio" id="tab2" name="tab-control">
            <input type="radio" id="tab3" name="tab-control"> <input type="radio" id="tab4" name="tab-control">
            <ul>
                <li title="Features"><label for="tab1" role="button"><svg viewBox="0 0 24 24">
                        </svg><br> <span style="font-size: 15px">Thịnh hành</span></label></li>
                <li title="Delivery Contents"><label for="tab2" role="button"><svg viewBox="0 0 24 24">
                        </svg><br> <span style="font-size: 15px">Âm nhạc</span></label></li>
                <li title="Shipping"><label for="tab3" role="button"><svg viewBox="0 0 24 24">
                        </svg><br> <span style="font-size: 15px">Trailer</span></label></li>
                <li title="Returns"><label for="tab4" role="button"><svg viewBox="0 0 24 24">
                        </svg><br> <span style="font-size: 15px">Hoạt hình</span></label></li>
            </ul>
           
            
            <div class="content">
                <section>
                    <div class="row animationTop" style="margin: 0; margin-top: 10px; padding: 0; margin-bottom: 30px;">
                        <c:forEach var="video" items="${videos}">
                            <div class="col-md-4 col-sm-4" style="margin-bottom: 40px;">
                                <div>
                                    <center>
                                        <a href="/ASM_Java4/chiTiet/index/${video.maVideo}">
                                            <img data-src="${video.poster}"
                                                style="height: auto; width: 95%; border-radius: 10px;" alt="">
                                            <div class="tieuDe">
                                                <h5 style="font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;"
                                                    data-toggle="tooltip" data-placement="top" title="${video.chuDe}"
                                                    style="text-align: left;">
                                                    ${video.chuDe}</h5>
                                            </div>
                                        </a>
                                        <div class="likeShare">
                                            <small style="cursor: pointer;"> Thể loại:
                                                ${video.theLoai} </small> &nbsp &nbsp <small class="pull-right"
                                                style="cursor: pointer;"> <i class="fa-light fa-share"
                                                    style="cursor: pointer;"></i> Share
                                            </small> <small class="pull-right"><i class="fa-thin fa-eye"></i>
                                                <fmt:formatNumber value="${video.luotXem}" pattern="#,###" />
                                                |
                                            </small>&nbsp
                                        </div>
                                    </center>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </section>


                <section>
                    <div class="row animationTop" style="margin: 0; margin-top: 10px; padding: 0; margin-bottom: 30px;">
                        <div class="row animationTop"
                            style="margin: 0; margin-top: 10px; padding: 0; margin-bottom: 30px;">
                            <c:forEach var="video" items="${videosMusic}">
                                <div class="col-md-4" style="margin-bottom: 40px;">
                                    <div>
                                        <center>
                                            <a href="/ASM_Java4/chiTiet/index/${video.maVideo}"> <img
                                                    data-src="${video.poster}"
                                                    style="height: auto; width: 95%; border-radius: 10px;" alt="">
                                                <div class="tieuDe">
                                                    <h5 style="font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;"
                                                        data-toggle="tooltip" data-placement="top"
                                                        title="${video.chuDe}" style="text-align: left;">${video.chuDe}
                                                    </h5>
                                                </div>
                                            </a>
                                            <div class="likeShare">
                                                <small style="cursor: pointer;"> Thể loại:
                                                    ${video.theLoai} </small> &nbsp &nbsp <small class="pull-right"
                                                    style="cursor: pointer;"> <i class="fa-light fa-share"
                                                        style="cursor: pointer;"></i> Share
                                                </small> <small class="pull-right"><i class="fa-thin fa-eye"></i>
                                                    <fmt:formatNumber value="${video.luotXem}" pattern="#,###" />
                                                    |
                                                </small>&nbsp
                                            </div>
                                        </center>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                </section>
                <section>
                    <div class="row animationTop" style="margin: 0; margin-top: 10px; padding: 0; margin-bottom: 30px;">
                        <div class="row animationTop"
                            style="margin: 0; margin-top: 10px; padding: 0; margin-bottom: 30px;">
                            <c:forEach var="video" items="${videosTrailer}">
                                <div class="col-md-4" style="margin-bottom: 40px;">
                                    <div>
                                        <center>
                                            <a href="/ASM_Java4/chiTiet/index/${video.maVideo}"> <img
                                                    data-src="${video.poster}"
                                                    style="height: auto; width: 95%; border-radius: 10px;" alt="">
                                                <div class="tieuDe">
                                                    <h5 style="font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;"
                                                        data-toggle="tooltip" data-placement="top"
                                                        title="${video.chuDe}" style="text-align: left;">${video.chuDe}
                                                    </h5>
                                                </div>
                                            </a>
                                            <div class="likeShare">
                                                <small style="cursor: pointer;"> Thể loại:
                                                    ${video.theLoai} </small> &nbsp &nbsp <small class="pull-right"
                                                    style="cursor: pointer;"> <i class="fa-light fa-share"
                                                        style="cursor: pointer;"></i> Share
                                                </small> <small class="pull-right"><i class="fa-thin fa-eye"></i>
                                                    <fmt:formatNumber value="${video.luotXem}" pattern="#,###" />
                                                    |
                                                </small>&nbsp
                                            </div>
                                        </center>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                </section>
                <section>
                    <div class="row animationTop" style="margin: 0; margin-top: 10px; padding: 0; margin-bottom: 30px;">
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
                                                    <h5 style="font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;"
                                                        data-toggle="tooltip" data-placement="top"
                                                        title="${video.chuDe}" style="text-align: left;">${video.chuDe}
                                                    </h5>
                                                </div>
                                            </a>
                                            <div class="likeShare">
                                                <small style="cursor: pointer;"> Thể loại:
                                                    ${video.theLoai} </small> &nbsp &nbsp <small class="pull-right"
                                                    style="cursor: pointer;"> <i class="fa-light fa-share"
                                                        style="cursor: pointer;"></i> Share
                                                </small> <small class="pull-right"><i class="fa-thin fa-eye"></i>
                                                    <fmt:formatNumber value="${video.luotXem}" pattern="#,###" />
                                                    |
                                                </small>&nbsp
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
	</div>
	<hr>
	<%@include file="/footer.jsp"%>

	<script src="/ASM_Java4/lazy.js"></script>
	<script>
		let mode = localStorage.getItem("darkMode");
		if (mode == 'true') {
			myFunction();
			document.getElementById("checkbox").checked = true;
			
		} else {

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

			document.getElementById("checkbox").checked = mode;
			var element6 = document.getElementById("sub-menu");
			if (element6 != null) {
				element6.classList.toggle("dark-mode");
			}

		}
	</script>
</body>

</html>