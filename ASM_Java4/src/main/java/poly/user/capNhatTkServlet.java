package poly.user;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import poly.DAO.usersDAO;
import poly.entities.users;

/**
 * Servlet implementation class capNhatTk
 */
@WebServlet("/capNhatTk")
public class capNhatTkServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public capNhatTkServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		users user = (users) req.getSession().getAttribute("user");
		if (user == null) {
			resp.sendRedirect("/ASM_Java4/index");
			return;
		}
		req.setAttribute("form", user);
		req.getRequestDispatcher("/views/capNhatTk.jsp").forward(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		users user = (users) req.getSession().getAttribute("user");
		String name = req.getParameter("tenND");
		try {
			BeanUtils.populate(user, req.getParameterMap());

			usersDAO dao = new usersDAO();
			boolean check = dao.findEmail(user.getEmail());
			if(check==true && !user.getEmail().equals(req.getParameter("email"))) {
				req.setAttribute("message", "Email đã có người khác sử dụng!");
				
			}else {
				dao.update(user);
				req.setAttribute("form", user);
				req.setAttribute("message", "Cập nhật thành công");
			}
			
		} catch (IllegalAccessException | InvocationTargetException e) {
			req.setAttribute("message", "Cập nhật thất bại");
			System.out.println(e);
		}
		
		req.getRequestDispatcher("/views/capNhatTk.jsp").forward(req, resp);
	}
	

	

}
