package poly.user;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import poly.DAO.usersDAO;
import poly.DAO.videosDAO;
import poly.entities.users;
import poly.entities.videos;

/**
 * Servlet implementation class dangKyServlet
 */
@WebServlet("/dangKy")
public class dangKyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	public dangKyServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.getRequestDispatcher("views/dangKy.jsp").forward(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			users entity = new users();
			usersDAO dao = new usersDAO();
			int check = 0;
			entity = dao.findBySdt(req.getParameter("sdt"));

			String pattern = "^0{1}[0-9]{9}$";
			String emailPattern = "^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@"
					+ "[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$";

			if (!req.getParameter("sdt").matches(pattern)) {
				req.setAttribute("message1", "Định dạng số điện thoại không chính xác!");
				check = 1;
			}
			if (entity != null) {
				req.setAttribute("message1", "Số điện thoại đã được sử dụng!");
				check = 1;
			}
			if (req.getParameter("matKhau").length() < 3) {
				req.setAttribute("message2", "Mật khẩu có độ dài từ 3 kí tự trở lên!");
				check = 1;
			}
			if (!req.getParameter("matKhau").equals(req.getParameter("matKhau2"))) {
				req.setAttribute("message3", "Mật khẩu xác nhận không chính xác!");
				check = 1;
			}
			if (!req.getParameter("email").matches(emailPattern)) {
				req.setAttribute("message4", "Định dạng email không chính xác!");
				check = 1;
			}
			if (check == 0) {
				entity = new users();
				BeanUtils.populate(entity, req.getParameterMap());
				dao.create(entity);
				req.setAttribute("message", "Đăng ký thành công, bạn cần phải đăng nhập!");
				check=0;
				req.getRequestDispatcher("views/dangNhap.jsp").forward(req, resp);
			} else {
				req.setAttribute("form", entity);
			}
		} catch (Exception e) {
			req.setAttribute("message", "Có lỗi xảy ra, vui lòng thử lại!");
			System.out.println(e);
		}
		req.getRequestDispatcher("views/dangKy.jsp").forward(req, resp);
	}

}
