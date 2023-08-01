package poly.user;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import poly.DAO.likeDAO;
import poly.DAO.xemDAO;
import poly.entities.users;

/**
 * Servlet implementation class videoDaXemServlet
 */
@WebServlet({"/videoDaXem/index", "/videoDaXem/boXem/*"})
public class videoDaXemServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public videoDaXemServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    @Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		users user = (users) request.getSession().getAttribute("user");
		if(user==null) {
			response.sendRedirect("/ASM_Java4/dangNhap");
			return;
		}
		String uri = request.getRequestURI();
		xemDAO dao = new xemDAO();
		request.setAttribute("videos",dao.findByUser(user.getSdt()));
		request.setAttribute("count",dao.findByUser(user.getSdt()).size());
		if (uri.contains("boXem")) {
			String maVideo = uri.substring(uri.lastIndexOf("/") + 1);
			dao.remove(user.getSdt(),maVideo);
			response.sendRedirect("/ASM_Java4/videoDaXem/index");
			return;
		}
		
		request.getRequestDispatcher("/views/videoDaXem.jsp").forward(request, response);
	}

}
