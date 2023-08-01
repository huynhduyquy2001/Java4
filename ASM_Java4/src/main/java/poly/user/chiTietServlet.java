package poly.user;

import java.awt.AWTException;
import java.awt.Robot;
import java.awt.event.KeyEvent;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.openqa.selenium.By;
import org.openqa.selenium.Keys;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;

import poly.DAO.likeDAO;
import poly.DAO.usersDAO;
import poly.DAO.videosDAO;
import poly.DAO.xemDAO;
import poly.entities.like;
import poly.entities.users;
import poly.entities.videos;
import poly.entities.xem;

@WebServlet({ "/chiTiet/index/*", "/chiTiet/yeuThich/*"})
public class chiTietServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public chiTietServlet() {
		super();
	}

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String uri = request.getRequestURI();
		users user = (users) request.getSession().getAttribute("user");
		String id = uri.substring(uri.lastIndexOf("/") + 1);
		likeDAO likeDao = new likeDAO();
		videosDAO videoDao = new videosDAO();
		videos entity = new videos();
		request.setAttribute("video", videoDao.findById(id));
		request.setAttribute("videos", videoDao.findAll());
		HttpSession session = request.getSession();
		session.setAttribute("trangTruoc", null);
		boolean check;
		if (uri.contains("index")) {
			if (user != null) {
				//tăng views
				entity = videoDao.findById(id);
				int luotXem = entity.getLuotXem()+1;
				entity.setLuotXem(luotXem);
				videoDao.update(entity);
				check = likeDao.findOnlyEntity(user.getSdt(), id);
				//hiện like hay không like
				if (check == true) {
					request.setAttribute("heart", "red");
				} else {
					request.setAttribute("heart", "");
				}
				//thêm vào video đã xem
				Date d = new Date();
				xemDAO xemDao = new xemDAO();
				xem xemEntity = new xem();
				//check nếu đã có trong danh sách đã xem thì update ngày xem
				check = xemDao.findOnlyEntity(user.getSdt(), id);
				xemEntity.setNgayXem(d);
				xemEntity.setUser(user);
				xemEntity.setVideo(videoDao.findById(id));
				if(check) {
					xemDao.update(user.getSdt(), id);
				}else {	
					xemDao.create(xemEntity);
				}
				
			}
		} else if (uri.contains("yeuThich")) {
			if (user == null) {
				session.setAttribute("trangTruoc", request.getRequestURI());
				response.sendRedirect("/ASM_Java4/dangNhap");
				return;
			} else {
				check = likeDao.findOnlyEntity(user.getSdt(), id);
				if (check == true) {
					likeDao.remove(user.getSdt(), id);
					request.setAttribute("heart", "");
					
				} else {
					Date d = new Date();
					like likeEntity = new like();
					likeEntity.setNgayLike(d);
					likeEntity.setUser(user);
					likeEntity.setVideo(videoDao.findById(id));
					likeDao.create(likeEntity);
					request.setAttribute("heart", "red");
				}

			}

		}
		request.getRequestDispatcher("/views/chiTiet.jsp").forward(request, response);
	}
}
