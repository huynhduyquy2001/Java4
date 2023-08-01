package poly.user;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import poly.DAO.videosDAO;
import poly.entities.videos;

/**
 * Servlet implementation class timKiem
 */
@WebServlet("/timKiem")
public class timKiemServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public timKiemServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setAttribute("thongTin", request.getParameter("thongTin"));
		videosDAO videoDAO = new videosDAO();
		List<videos> list = videoDAO.findByName(request.getParameter("thongTin"));
		request.setAttribute("message", list.size());
		request.setAttribute("videoTimKiem", videoDAO.findByName(request.getParameter("thongTin")));
		request.getRequestDispatcher("/views/timKiem.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
