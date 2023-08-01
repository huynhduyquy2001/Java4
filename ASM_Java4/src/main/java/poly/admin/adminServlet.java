package poly.admin;

import java.io.IOException;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.TypedQuery;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import poly.DAO.videosDAO;
import poly.entities.users;
import poly.entities.videos;

@WebServlet({ "/index"})
public class adminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public adminServlet() {
		super();
		// TODO Auto-generated constructor stub
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		videosDAO videoDao = new videosDAO();
		request.setAttribute("videos", videoDao.findAll());
		request.setAttribute("videosMusic", videoDao.findMusic());
		request.setAttribute("videosTrailer", videoDao.findTrailer());
		request.setAttribute("videosCartoon", videoDao.findCartoon());
		request.getRequestDispatcher("views/admin/adminIndex.jsp").forward(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String uri = request.getRequestURI();
		if (uri.contains("timKiem")) {
			request.setAttribute("thongTin", request.getParameter("thongTin"));
			videosDAO videoDAO = new videosDAO();
			List<videos> list = videoDAO.findByName(request.getParameter("thongTin"));
			request.setAttribute("message", list.size());
			request.setAttribute("videoTimKiem", videoDAO.findByName(request.getParameter("thongTin")));
		}
		request.getRequestDispatcher("/views/timKiem.jsp").forward(request, response);
	}

}
