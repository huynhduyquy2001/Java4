package poly.admin;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import org.apache.commons.beanutils.BeanUtils;

import poly.DAO.usersDAO;
import poly.entities.users;
import poly.entities.videos;

/**
 * Servlet implementation class qlNguoiDungServlet
 */
@WebServlet({ "/qlNDung/index", "/qlNDung/upload", "/qlNDung/create", "/qlNDung/update", "/qlNDung/delete",
		"/qlNDung/find", "/qlNDung/edit/*" })
public class qlNDungServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public qlNDungServlet() {
		super();

		// TODO Auto-generated constructor stub
	}
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
//
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		users user = (users) request.getSession().getAttribute("user");
		if(user==null) {
			response.sendRedirect("/ASM_Java4/dangNhap");
			return;
		}
		
		String uri = request.getRequestURI();
		users entity = new users();
		usersDAO dao = new usersDAO();
			request.setAttribute("message", "");
			//hiện danh sách users
			request.setAttribute("users", dao.findAll());
		
		if (uri.contains("create")) {
			this.create(request, response);
		} else if (uri.contains("update")) {
			this.update(request, response);
		} else if (uri.contains("delete")) {
			this.delete(request, response);
		} else if (uri.contains("edit")) {
			this.edit(request, response);	
		}
		 else if (uri.contains("find")) {
				this.find(request, response);
				
			}
		request.getRequestDispatcher("/views/admin/qlNguoiDung.jsp").forward(request, response);
	}
	//hiện ttin user lên form
	private void edit(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		usersDAO dao = new usersDAO();
		users entity = new users();
		String uri = req.getRequestURI();		
		// uri = .../user/edit/id
					String id = uri.substring(uri.lastIndexOf("/") + 1);
					entity = dao.findBySdt(id);
					req.setAttribute("form", entity);

	}
//tìm user
	private void find(HttpServletRequest request, HttpServletResponse response) {
		try {
			usersDAO dao = new usersDAO();
			users u = new users();
			u = dao.findBySdt(request.getParameter("thongTin"));
			if(u!=null) {
				request.setAttribute("form", dao.findBySdt(request.getParameter("thongTin")));
				request.setAttribute("KqTim", "");
			}else {
				request.setAttribute("KqTim", "Không tìm thấy thông tin người dùng!!");
			}
			
		} catch (Exception e) {
			
		}

	}

	private void update(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			users entity = new users();
			usersDAO dao = new usersDAO();
			BeanUtils.populate(entity, request.getParameterMap());
//			System.out.println(entity.getEmail());
//			System.out.println(entity.isAdmin());
//			System.out.println(entity.getSdt());
//			System.out.println(entity.getTenND());
//			System.out.println(entity.isGioiTinh());
//			System.out.println(entity.getMatKhau());
			
 			dao.update(entity);
			request.setAttribute("message", "Đã cập nhật tài khoản người dùng!");
			request.setAttribute("users", dao.findAll());
		} catch (IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
		// xóa người dùng
	private void delete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		usersDAO dao = new usersDAO();
		dao.remove(request.getParameter("sdt"));
		request.setAttribute("message", "Đã xóa tài khoản người dùng!");
		request.setAttribute("users", dao.findAll());
	}
	//tạo người dùng
	public void create(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			users entity = new users();
			usersDAO dao = new usersDAO();
			BeanUtils.populate(entity, request.getParameterMap());
			dao.create(entity);
			request.setAttribute("message", "Thêm thành công!");
		} catch (IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
