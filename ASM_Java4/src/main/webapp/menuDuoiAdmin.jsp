<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<ul class="navbarBot">
	<li><a href="/indexAdmin" aria-controls="home" role="tab" data-toggle="tab">
			<i class="fa-solid fa-house"></i>&nbsp &nbsp &nbsp &nbsp <span
			class="moTaMenu">Trang chủ</span>
	</a></li>
	<li><a href="/videoDaXemServlet" aria-controls="tab" role="tab" data-toggle="tab">
			<i class="fa-solid fa-clock-rotate-left"></i>&nbsp &nbsp &nbsp &nbsp<span
			class="moTaMenu">Video đã xem</span>
	</a></li>
	<li><a href="" aria-controls="tab" role="tab" data-toggle="tab">
			<i class="fa-regular fa-thumbs-up"></i>&nbsp &nbsp &nbsp &nbsp<span
			class="moTaMenu">Video đã thích</span>
	</a></li>
	<li><a aria-controls="tab" role="tab" data-toggle="tab"> <i
			class="fa-solid fa-circle-half-stroke" style="cursor: pointer;"
			onclick="myFunction()"></i>&nbsp &nbsp &nbsp &nbsp <span
			id="darkMode2" onclick="myFunction()" style="cursor: pointer;"
			class="moTaMenu">Darkmode:Tắt</span>
	</a></li>
	<li class="thongKe"><a aria-controls="tab" role="tab"
		data-toggle="tab"> <i class="fa-solid fa-circle-half-stroke"
			style="cursor: pointer;"></i>&nbsp &nbsp &nbsp &nbsp <span
			id="darkMode2" style="cursor: pointer;" class="moTaMenu">Thống
				kê</span>
	</a>
		<div class="thongKe-content">
			<a href="#" style="text-align: left;">Số người yêu thích từng
				tiểu phẩm</a> <a href="#" style="text-align: left;">Lọc người yêu
				thích từng tiểu phẩm</a> <a href="#" data-toggle="tooltip"
				data-placement="top"
				title="Lọc người gửi và người nhận từng tiểu phầm được chia sẻ"
				style="text-align: left;">Lọc người gửi và người nhận từng...</a>
		</div></li>
</ul>