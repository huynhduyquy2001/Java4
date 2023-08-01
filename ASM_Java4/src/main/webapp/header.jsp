<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<fmt:setLocale value="${sessionScope.lang}" scope="request" />
<fmt:setBundle basename="global" scope="request" />
<nav class="navbar "
	style="margin-bottom: 0; height: 60px; position: absolute; z-index: 1; width: 90%;">

	<div class="collapse navbar-collapse navbar-ex1-collapse">

		<ul class="nav navbar-nav ">
			<li><a href="/ASM_Java4/index"
				style="cursor: pointer; background: transparent; padding-top: 0">
					<h3 style="color: #A81D1D;">
						<em style="color: #EFA024;">ONLINE</em> ENTERTAINMENT
					</h3>
			</a></li>
			<form action="/ASM_Java4/timKiem" method="get"
				class="navbar-form formTimKiem"
				style="padding-top: 8px; position: absolute; right: 190px;">
				<div class="form-group">
					<input type="text" value="${thongTin }"
						style="width: 400px; border-radius: 30px; border: none; border: 1px solid gray;"
						name="thongTin" class="form-control" placeholder="Tìm kiếm"
						id="textSearch">
				</div>
				<button id="btnSearch"
					style="border-radius: 30px; border: 1px solid gray; padding: 5px; width: 35px">
					<i class="fa-solid fa-magnifying-glass"></i>
				</button>

			</form>
			<li style="position: absolute; right: 100px;"><a
				style="cursor: pointer; background-color: transparent;">
					<fmt:message key="menu.darkMode" />
					<div class="nut" style="margin-left: 20px;">
						<input type="checkbox" class="checkbox" id="checkbox"
							onclick="myFunction()"> <label class="switch"
							for="checkbox" style="width: 50%; height: 50%;"> <span
							class="slider" style="width: 12px; height: 12px;"></span>
						</label>
					</div>
			</a></li>

			<li class="dropdown" style="position: absolute; right: 0;"><a
				href="#" class="dropdown-toggle"
				style="background-color: transparent;" data-toggle="dropdown"><fmt:message
						key="menu.account" /> <b class="caret"></b>
			</a>

				<ul class="dropdown-menu " id="dropdown-menu">
					<c:if test="${empty sessionScope.user.sdt }">
						<li><a href="/ASM_Java4/dangNhap">Đăng nhập</a></li>
						<li><a href="/ASM_Java4/dangKy">Đăng kí</a></li>
						<li><a href="/ASM_Java4/QuenMk/index">Quên mật khẩu</a></li>
					</c:if>
					<c:if test="${!empty sessionScope.user.sdt }">
						<li><a href="/ASM_Java4/capNhatTk">Cập nhật tài khoản</a></li>
						<li><a href="/ASM_Java4/dangXuat/doiTk">Đổi tài khoản</a></li>
						<li><a href="/ASM_Java4/DoiMk">Đổi mật khẩu</a></li>
						<li><a href="/ASM_Java4/dangXuat/index">Đăng xuất</a></li>
					</c:if>

				</ul></li>





		</ul>
	</div>
</nav>