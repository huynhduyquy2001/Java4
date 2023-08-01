package poly.user;

import java.io.IOException;
import java.util.Properties;
import java.util.Random;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import poly.DAO.usersDAO;
import poly.DAO.xemDAO;
import poly.entities.users;

/**
 * Servlet implementation class QuenMkServlet
 */
@WebServlet({"/QuenMk/index", "/QuenMk/nhanMa", "/QuenMk/layMk"})
public class QuenMkServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       private int so;
    public QuenMkServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/views/quenMk.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String uri = request.getRequestURI();
		xemDAO dao = new xemDAO();
		if (uri.contains("nhanMa")) {
			Random generator = new Random();
			float number = generator.nextFloat()*10000;
	         this.so = (int) number;
	        users user = new users();
	        usersDAO userDAO = new usersDAO();
	        HttpSession session1 = request.getSession();
			session1.setAttribute("maBaoMat", so);
			try {
			    user = userDAO.findBySdt(request.getParameter("sdt"));
			    if(user==null) {
			    	request.setAttribute("message", "Tài khoản chưa đăng ký!");
			    	request.getRequestDispatcher("/views/quenMk.jsp").forward(request, response);
			    	return;
			    }
			    if(!user.getEmail().equals(request.getParameter("email"))) {
			    	request.setAttribute("message", "Email đăng ký chưa chính xác!");
			    	request.getRequestDispatcher("/views/quenMk.jsp").forward(request, response);
			    	return;
			    }
			} catch (Exception e) {
				request.setAttribute("message", "Tài khoản chưa đăng ký!");
				request.getRequestDispatcher("/views/quenMk.jsp").forward(request, response);
				return;
			}
			session1.setAttribute("sdt", request.getParameter("sdt"));
	        String fromMail = "quyhdpc04119@fpt.edu.vn";
			String toMail = request.getParameter("email");
			request.setAttribute("maBaoMat", so);
			String subject = "Dịch vụ lấy lại mật khẩu tại website Online Entertainment";
			String content = "<h5 style=\"color: #E53F31;\">Online Entertainment</h5>"+ 
			"<h5 style=\\\"color: #E53F31;\\\">Bạn nhận được mã lấy lại mật khẩu,vui lòng không chia sẻ mã cho bất kì người nào khác </h5>\r\n"
					+ "<h5>Mã lấy lại mật khẩu:"+so+"</h5>";
			String matKhau = "can1thu007.";
			// Thông số kết nối
			Properties props = new Properties();
			props.setProperty("mail.smtp.auth", "true");
			props.setProperty("mail.smtp.starttls.enable", "true");
		    props.setProperty("mail.smtp.ssl.protocols", "TLSv1.2");
			props.setProperty("mail.smtp.host", "smtp.gmail.com");
			props.setProperty("mail.smtp.port", "587");
			Session session = Session.getInstance(props, new Authenticator() {
				protected PasswordAuthentication getPasswordAuthentication() {
					String username = fromMail;
					String password = matKhau;
					return new PasswordAuthentication(username, password);
				}
			});
			//Tạo massage
			MimeMessage message = new MimeMessage(session);
			try {
//				message.setFrom(new InternetAddress(fromMail));
				message.setRecipients(Message.RecipientType.TO, toMail);
				message.setSubject(subject, "utf-8");
				message.setText(content, "utf-8", "html");
				message.setReplyTo(message.getFrom());
			} catch (MessagingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			// Gửi message
			try {
				Transport.send(message);
				request.setAttribute("message", "Gửi mail thành công!");
			} catch (MessagingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				request.setAttribute("message", "Gửi mail thất bại!");
				System.out.println(e);
				request.getRequestDispatcher("/views/quenMk.jsp").forward(request, response);
				return;
			}
			request.getRequestDispatcher("/views/layMa.jsp").forward(request, response);
			return;
		}else if(uri.contains("layMk")) {
			int maBaoMat =  (int) request.getSession().getAttribute("maBaoMat");
			String sdt =  (String) request.getSession().getAttribute("sdt");
			usersDAO userdao = new usersDAO();
			
			users user = userdao.findBySdt(sdt);
			
	        String fromMail = "quyhdpc04119@fpt.edu.vn";
			String toMail = user.getEmail();
			int maNhap = Integer.parseInt(request.getParameter("maBaoMat"));
			if(maNhap!=maBaoMat) {
				request.setAttribute("message", "Mã bảo mật chưa chính xác!");
		    	request.getRequestDispatcher("/views/layMa.jsp").forward(request, response);
		    	return;
			}
			String subject = "Dịch vụ lấy lại mật khẩu tại website Online Entertainment";
			
			String content = "<h5 style=\"color: #E53F31;\">Online Entertainment</h5>"+ 
			"<h5 style=\\\"color: #E53F31;\\\">Bạn nhận được mã lấy lại mật khẩu,vui lòng không chia sẻ mã cho bất kì người nào khác </h5>\r\n"
					+ "<h5>Mât khẩu của bạn là lấy lại mật khẩu:"+user.getMatKhau()+"</h5>";
			String matKhau = "can1thu007.";
			// Thông số kết nối
			Properties props = new Properties();
			props.setProperty("mail.smtp.auth", "true");
			props.setProperty("mail.smtp.starttls.enable", "true");
		    props.setProperty("mail.smtp.ssl.protocols", "TLSv1.2");
			props.setProperty("mail.smtp.host", "smtp.gmail.com");
			props.setProperty("mail.smtp.port", "587");
			// Kết nối
			Session session = Session.getInstance(props, new Authenticator() {
				protected PasswordAuthentication getPasswordAuthentication() {
					String username = fromMail;
					String password = matKhau;
					return new PasswordAuthentication(username, password);
				}
			});
			//Tạo massage
			MimeMessage message = new MimeMessage(session);
			try {
//				message.setFrom(new InternetAddress(fromMail));
				message.setRecipients(Message.RecipientType.TO, toMail);
				message.setSubject(subject, "utf-8");
				message.setText(content, "utf-8", "html");
				message.setReplyTo(message.getFrom());
				
			} catch (MessagingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			// Gửi message
			try {
				Transport.send(message);
				request.setAttribute("message", "Gửi mail thành công!");
				
			} catch (MessagingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				request.setAttribute("message", "Gửi mail thất bại!");
				System.out.println(e);
			}
			request.setAttribute("message", "Lấy mật khẩu thành công, vui lòng kiểm tra Email để nhận lại mật khẩu!");
			response.sendRedirect("/ASM_Java4/dangNhap");
			return;
		}
		request.getRequestDispatcher("/views/quenMk.jsp").forward(request, response);
	}
}
