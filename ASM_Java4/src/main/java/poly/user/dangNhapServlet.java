package poly.user;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import poly.DAO.usersDAO;
import poly.cookie.CookieUtils;
import poly.entities.users;

/**
 * Servlet implementation class indexServlet
 */
@WebServlet("/dangNhap")
public class dangNhapServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public dangNhapServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// đọc giá trị của cookie
		String sdt = CookieUtils.get("sdt", request);
		String matKhau = CookieUtils.get("matKhau", request);
		// chuyển sang login.jsp để hiển thị lên form
		request.setAttribute("sdt", sdt);
		request.setAttribute("matKhau", matKhau);
		request.getRequestDispatcher("views/dangNhap.jsp").forward(request, response);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		// TODO: ĐĂNG NHẬP
		String sdt = req.getParameter("sdt");
		String matKhau = req.getParameter("matKhau");
		String ghiNho = req.getParameter("ghiNho");
		try {
			usersDAO dao = new usersDAO();
			users user = dao.findBySdt(sdt);
			req.setAttribute("sdt", sdt);
			req.setAttribute("matKhau", matKhau);
			if (!user.getMatKhau().equals(matKhau)) {
				req.setAttribute("message", "Sai mật khẩu!");
				req.getRequestDispatcher("views/dangNhap.jsp").forward(req, resp);
			} else {
				if (ghiNho == null) {
					int hours = 0; // 0 = xóa
					CookieUtils.add("sdt", sdt, hours, resp);
					CookieUtils.add("matKhau", matKhau, hours, resp);
					HttpSession session = req.getSession();
					session.setAttribute("user", user);
//					req.getSession().setAttribute("user", user);
					String  url = (String) req.getSession().getAttribute("trangTruoc");
					if(url==null) {
						resp.sendRedirect("/ASM_Java4/index");
						return;
					}else if(!url.equals("/ASM_Java4/dangNhap")) {
						resp.sendRedirect(url);
						return;
					}
					resp.sendRedirect("/ASM_Java4/index");
					return;
				}
				else {
					// ghi nhớ hoặc xóa tài khoản đã ghi nhớ bằng cookie
					int hours = 30 * 24; // 0 = xóa
					CookieUtils.add("sdt", sdt, hours, resp);
					CookieUtils.add("matKhau", matKhau, hours, resp);
					HttpSession session = req.getSession();
					session.setAttribute("user", user);
					
					String  url = (String) req.getSession().getAttribute("trangTruoc");
					if(url==null) {
						resp.sendRedirect("/ASM_Java4/index");
						return;
					}else if(url!="?"&&!url.equals("/ASM_Java4/dangNhap")) {
						resp.sendRedirect(url);
						return;
					}
					resp.sendRedirect("/ASM_Java4/index");
					return;
				}
			}
		} catch (Exception e) {
			req.setAttribute("message", "Sai số điện thoại!");
			req.getSession().getAttribute("user");
			req.getRequestDispatcher("views/dangNhap.jsp").forward(req, resp);
		}
		

	}

}
