<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<nav class="navbar "
	style="margin-bottom: 0; height: 60px; position: absolute; left: 70px; z-index: 1; width: 90%;">

	<div class="collapse navbar-collapse navbar-ex1-collapse">

		<ul class="nav navbar-nav " >
			<li>
				<a href="/ASM_Java4/index" style="cursor: pointer;background: transparent;">
			<h3 style="color: #A81D1D">
					<em style="color: #EFA024;">ONLINE</em> ENTERTAINMENT
				</h3>
			</a>
			</li>
			
			<li style="position: absolute; right: 100px;"><a
				style="cursor: pointer; background-color: transparent; ">
					Dark-mode
					<div class="nut" style="margin-left: 20px;">
						<input type="checkbox" class="checkbox" id="checkbox"
							onclick="myFunction()"> <label class="switch"
							for="checkbox" style="width: 50%; height: 50%;"> <span
							class="slider" style="width: 12px; height: 12px;"></span>
						</label>
					</div>
			</a></li>
			
			<li class="dropdown" style="position: absolute; right: 0;">
			
			<a
				href="#" class="dropdown-toggle"
				style="background-color: transparent;"
				data-toggle="dropdown">Tài khoản <b class="caret"></b></a>
				
				<ul class="dropdown-menu " id="dropdown-menu"
					>

					<c:if test="${empty sessionScope.user.sdt }">
						<li><a href="/ASM_Java4/dangNhap">Đăng nhập</a></li>
						<li><a href="/ASM_Java4/dangKy">Đăng kí</a></li>
						<li><a href="/ASM_Java4/dangKy">Quên mật khẩu</a></li>
					</c:if>

					<c:if test="${!empty sessionScope.user.sdt }">
						<li><a href="/ASM_Java4/capNhatTk">Cập nhật tài khoản</a></li>
						<li><a href="#">Đổi mật khẩu</a></li>
						<li><a href="/ASM_Java4/dangXuat">Đăng xuất</a></li>
					</c:if>

				</ul></li>
				
				
				
				
				
		</ul>
	</div>
</nav>