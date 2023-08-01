<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<fmt:setLocale value="${sessionScope.lang}" scope="request" />
<fmt:setBundle basename="global" scope="request" />
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<div class="main-menu " id="main-menu">
	<div>
		<i class="fa-solid fa-bars "
			style="font-size: 20px; margin-top: 10px; padding-left: 13px;"></i>&nbsp
		&nbsp &nbsp &nbsp <i class="fa-duotone fa-film"></i>
	</div>
	<hr>
	<ul class="nav nav-stacked" role="tablist">
	
		<c:if test="${empty sessionScope.user.sdt}">
			<li class="active"><a href="/ASM_Java4/index"> <i
					class="fa-solid fa-house"></i>&nbsp &nbsp &nbsp &nbsp <fmt:message
						key="menu.home" /></a></li>
			<c:if test="${sessionScope.lang=='vi_VN'||sessionScope.lang==null }">
				<li><a href="?lang=en"> <i class="fa-solid fa-language"></i>&nbsp
						&nbsp &nbsp &nbsp <span style="cursor: pointer;">Tiếng Việt</span>
				</a></li>
			</c:if>
			<c:if test="${sessionScope.lang=='en'}">
				<li><a href="?lang=vi_VN"><i class="fa-solid fa-language"></i>&nbsp
						&nbsp &nbsp &nbsp <span style="cursor: pointer;">English</a></span> </a></li>
			</c:if>
			<li><a> <i class="fa-solid fa-circle-half-stroke"></i>&nbsp
					&nbsp &nbsp &nbsp <span id="darkMode3" onclick="myFunction()"
					style="cursor: pointer;"><fmt:message
						key="menu.darkMode" /></span>
			</a></li>
		</c:if>
		
		<c:if
			test="${sessionScope.user.admin ==true && !empty sessionScope.user.sdt}">
			<li class="active"><a href="/ASM_Java4/index"> <i
					class="fa-solid fa-house"></i>&nbsp &nbsp &nbsp &nbsp <fmt:message
						key="menu.home" />
			</a></li>
			<li><a href="/ASM_Java4/videoDaXem/index"> <i
					class="fa-solid fa-clock-rotate-left"></i>&nbsp &nbsp &nbsp
					&nbsp <fmt:message
						key="menu.history" />
			</a></li>
			<li><a href="/ASM_Java4/yeuThich/index"> <i
					class="fa-regular fa-thumbs-up"></i>&nbsp &nbsp &nbsp &nbsp <fmt:message
						key="menu.like" />
			</a></li>
			<c:if test="${sessionScope.lang=='vi_VN'||sessionScope.lang==null }">
				<li><a href="?lang=en"> <i class="fa-solid fa-language"></i>&nbsp
						&nbsp &nbsp &nbsp <span style="cursor: pointer;">Tiếng Việt</span>
				</a></li>
			</c:if>
			<c:if test="${sessionScope.lang=='en'}">
				<li><a href="?lang=vi_VN"><i class="fa-solid fa-language"></i>&nbsp
						&nbsp &nbsp &nbsp <span style="cursor: pointer;">English</a></span> </a></li>
			</c:if>
			<li><a> <i class="fa-solid fa-circle-half-stroke"></i>&nbsp
					&nbsp &nbsp &nbsp <span id="darkMode3" onclick="myFunction()"
					style="cursor: pointer;"><fmt:message
						key="menu.darkMode" /></span>
			</a></li>
			<hr>
			<li><a href="/ASM_Java4/qlVideo/index"> <i
					class="fa-regular fa-video"></i></i>&nbsp &nbsp &nbsp &nbsp<fmt:message
						key="menu.video" />
			</a></li>
			<li><a href="/ASM_Java4/qlNDung/index"> <i
					class="fa-regular fa-user"></i></i></i>&nbsp &nbsp &nbsp &nbsp <fmt:message
						key="menu.users" />
			</a></li>
			<li class="thefirst" id="thefirst"><a
				href="/ASM_Java4/ThongKe/index"> <i 
					class="fa-solid fa-chart-simple"></i> &nbsp &nbsp &nbsp &nbsp<fmt:message
						key="menu.statistical" />
			</a></li>
		</c:if>

		<c:if
			test="${sessionScope.user.admin ==false && !empty sessionScope.user.sdt }">
			<li class="active"><a href="/ASM_Java4/index"> <i
					class="fa-solid fa-house"></i>&nbsp &nbsp &nbsp &nbsp<fmt:message
						key="menu.home" />
			</a></li>
			<li><a href="/ASM_Java4/videoDaXem/index"> <i
					class="fa-solid fa-clock-rotate-left"></i>&nbsp &nbsp &nbsp
					&nbsp<fmt:message
						key="menu.history" />
			</a></li>
			<li><a href="/ASM_Java4/yeuThich/index"> <i
					class="fa-regular fa-thumbs-up"></i>&nbsp &nbsp &nbsp &nbsp<fmt:message
						key="menu.like" />
			</a></li>
			<c:if test="${sessionScope.lang=='vi_VN' ||sessionScope.lang==null}">
				<li><a href="?lang=en"> <i class="fa-solid fa-language"></i>&nbsp
						&nbsp &nbsp &nbsp <span style="cursor: pointer;">Tiếng Việt</span>
				</a></li>
			</c:if>
			<c:if test="${sessionScope.lang=='en'}">
				<li><a href="?lang=vi_VN"><i class="fa-solid fa-language"></i>&nbsp
						&nbsp &nbsp &nbsp <span style="cursor: pointer;">English</a></span> </a></li>
			</c:if>
			<li><a> <i class="fa-solid fa-circle-half-stroke"></i>&nbsp
					&nbsp &nbsp &nbsp <span id="darkMode3" onclick="myFunction()"
					style="cursor: pointer;"><fmt:message
						key="menu.darkMode" /></span>
			</a></li>
		</c:if>

	</ul>
</div>