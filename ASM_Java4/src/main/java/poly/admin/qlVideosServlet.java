package poly.admin;

import java.io.File;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import org.apache.commons.beanutils.BeanUtils;

import poly.DAO.videosDAO;
import poly.entities.users;
import poly.entities.videos;

@MultipartConfig
@WebServlet({ "/qlVideo/index","/qlVideo/upload", "/qlVideo/edit/*", "/qlVideo/create", "/qlVideo/update", "/qlVideo/delete","/qlVideo/timKiem" })
public class qlVideosServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public qlVideosServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		users user = (users) req.getSession().getAttribute("user");
		req.setAttribute("date", new Date());
		if(user==null) {
			resp.sendRedirect("/ASM_Java4/dangNhap");
			return;
		}
		Date date = new Date();
	        SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
	        String strDate = formatter.format(date);
	        Date date2 = null;
			try {
				date2 = formatter.parse(strDate);
			} catch (ParseException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
	        req.setAttribute("ngayTao", strDate);
		videosDAO dao = new videosDAO();
		videos entity = new videos();
		req.setAttribute("message", "");
		req.setAttribute("form", entity);
		String uri = req.getRequestURI();
		if (uri.contains("create")) {
			try {
				BeanUtils.populate(entity, req.getParameterMap());
				entity.setNgayTao(new Date());
				dao.create(entity);
				req.setAttribute("message", "Thêm thành công!");
				req.setAttribute("form", new videos());
				req.setAttribute("videos", dao.findAll());
			} catch (IllegalAccessException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (InvocationTargetException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else if (uri.contains("update")) {
			try {
				BeanUtils.populate(entity, req.getParameterMap());	
				dao.update(entity);
				req.setAttribute("message", "Cập nhật thành công");
			} catch (Exception e) {
				System.out.println(e);

			}
			req.setAttribute("videos", dao.findAll());

		}else if (uri.contains("timKiem")) {
			try {
				req.setAttribute("thongTinn", req.getParameter("thongTin"));
				req.setAttribute("theLoai", req.getParameter("theLoai"));
				req.setAttribute("videos", dao.findByNameandTheLoai(req.getParameter("thongTin"), req.getParameter("theLoai")));
			} catch (Exception e) {
				
			}
		}  
		else if (uri.contains("delete")) {
			try {
				String id = req.getParameter("maVideo");
				dao.remove(id);
				req.setAttribute("message", "Xóa thành công");
			} catch (Exception c) {
				req.setAttribute("message", "Xóa thất bại");

			}
			req.setAttribute("videos", dao.findAll());

		} else if (uri.contains("edit")) {
			String id = uri.substring(uri.lastIndexOf("/") + 1);
			entity = dao.findById(id);
			req.setAttribute("form", entity);
			req.setAttribute("date", entity.getNgayTao());
			req.setAttribute("poster", entity.getPoster());
			req.setAttribute("videos", dao.findAll());
		}
		if(req.getParameter("thongTin")==null) {
			req.setAttribute("videos", dao.findAll());
		}
		
		req.getRequestDispatcher("/views/admin/qlVideo.jsp").forward(req, resp);
	}

}
