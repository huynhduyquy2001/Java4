package poly.admin;

import java.io.IOException;
import java.io.Serializable;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.StoredProcedureQuery;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import poly.DAO.ThongKeDAO;
import poly.DAO.videosDAO;
import poly.entities.TkLuotThich;
import poly.entities.like;
import poly.entities.users;
import poly.entities.videos;
import poly.utils.JpaUtils;

/**
 * Servlet implementation class ThongKe
 */
@WebServlet({"/ThongKe/index", "/ThongKe/timVideo/", "/ThongKe/timND/", "/ThongKe/timNDShare/"})
public class ThongKeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	ThongKeDAO TkDAO = new ThongKeDAO();
	videosDAO videoDAO = new videosDAO();
	public ThongKeServlet() {
		super();
		// TODO Auto-generated constructor stub
	}


	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uri = request.getRequestURI();
		List<TkLuotThich> list = this.TkDAO.findAll();
		//tìm tất cả video trong ds like
		request.setAttribute("items", list);
		request.setAttribute("listVideo", videoDAO.findAll());
		request.setAttribute("checkedtab1", "checked");		
		//tìm người like theo tiêu đề video
		if(request.getParameter("ChonVideoShare")==null) {
			request.setAttribute("listUserShare", TkDAO.findUserShareByVideo(" "));
		}
		//tìm người share theo tiêu đề video
		if(request.getParameter("ChonVideoLike")==null) {
			request.setAttribute("listUserLike", TkDAO.findUserByVideo(" "));
		}
		request.setAttribute("listUserLike", TkDAO.findUserByVideo(" "));	
		request.setAttribute("listUser", TkDAO.findUserByVideo(request.getParameter("ChonVideo")));
		if (uri.contains("timVideo")) {
			try {
				 EntityManager em = JpaUtils.getEntityManager();
					StoredProcedureQuery query = em.createNamedStoredProcedureQuery("TkLuotThich.sp_timTheoTen");
					query.setParameter("chuDe","%"+ request.getParameter("TTLuotLike")+"%");
					 list = query.getResultList();
					request.setAttribute("items", list);
					request.setAttribute("TTLuotLike", request.getParameter("TTLuotLike"));
			} catch (Exception e) {
				System.out.println(e);
			}
		}
		else if (uri.contains("timNDShare")) {
			request.setAttribute("listUserShare", TkDAO.findUserShareByVideo(request.getParameter("ChonVideoShare")));
			request.setAttribute("checkedtab3", "checked");
			}
		else if (uri.contains("timND")) {
			request.setAttribute("listUserLike", TkDAO.findUserByVideo(request.getParameter("ChonVideoLike")));
			request.setAttribute("checkedtab2", "checked");
		}
		
		
		request.getRequestDispatcher("/views/admin/thongKe.jsp").forward(request, response);
	}

}
