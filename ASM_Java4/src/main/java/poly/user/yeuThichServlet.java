package poly.user;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import poly.DAO.likeDAO;
import poly.entities.like;
import poly.entities.users;

/**
 * Servlet implementation class yeuThichServlet
 */
@WebServlet({"/yeuThich/index", "/yeuThich/boThich/*"})
public class yeuThichServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public yeuThichServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		users user = (users) request.getSession().getAttribute("user");
		if(user==null) {
			response.sendRedirect("/ASM_Java4/dangNhap");
			return;
		}
		String uri = request.getRequestURI();
		
		likeDAO dao = new likeDAO();
		if (uri.contains("boThich")) {
			String maVideo = uri.substring(uri.lastIndexOf("/") + 1);
			dao.remove(user.getSdt(),maVideo);
			
		}
		request.setAttribute("videos",dao.findByUser(user.getSdt()));
		request.setAttribute("message", dao.findByUser(user.getSdt()).size() );
		request.getRequestDispatcher("/views/yeuThich.jsp").forward(request, response);
	}

}
