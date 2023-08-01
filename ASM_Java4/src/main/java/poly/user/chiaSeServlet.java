package poly.user;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import poly.DAO.ShareDAO;
import poly.DAO.likeDAO;
import poly.DAO.videosDAO;
import poly.entities.like;
import poly.entities.share;
import poly.entities.users;
import poly.entities.videos;

/**
 * Servlet implementation class chiaSeServlet
 */
@WebServlet("/chiaSeMail/*")
public class chiaSeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public chiaSeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uri = request.getRequestURI();
		users user = (users) request.getSession().getAttribute("user");
		HttpSession session = request.getSession();
		
		if(user==null) {
			session.setAttribute("trangTruoc", request.getRequestURI());
			response.sendRedirect("/ASM_Java4/dangNhap");
			return;
		}
		session.setAttribute("trangTruoc", "?");
		String maVideo = uri.substring(uri.lastIndexOf("/") + 1);
		likeDAO likeDao = new likeDAO();
		videosDAO videoDao = new videosDAO();
		videos entity = videoDao.findById(maVideo);
		request.setAttribute("video",entity );
		request.setAttribute("link", entity.getLink());
		request.setAttribute("email", user.getEmail());
		
		request.getRequestDispatcher("/views/chiaSe.jsp").forward(request, response);
	}
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uri = request.getRequestURI();
		users user = (users) request.getSession().getAttribute("user");
		HttpSession session2 = request.getSession();
		session2.setAttribute("trangTruoc", null);
		String maVideo = uri.substring(uri.lastIndexOf("/") + 1);
		videosDAO videoDao = new videosDAO();
		videos entity = videoDao.findById(maVideo);
		entity= videoDao.findById(maVideo);
		
		request.setAttribute("link", entity.getLink());
		request.setAttribute("email", user.getEmail()); 
		request.setAttribute("matKhau", request.getParameter("matKhau"));
		String fromMail = user.getEmail();
		String toMail = request.getParameter("emailNhan");
		String subject = "Bạn nhận được video chia sẻ";
		
		String content = "        <h5 style=\"color: #E53F31;\">"+entity.getChuDe()+"</h5>\r\n"
				+ "<h5> Người gửi: "+user.getTenND()+" </h5>\\r\\n"	
				+ "        <img src="+entity.getPoster()+" style=\"border-radius: 15px;\" width=\"50%\" alt=\"\">\r\n"
				+ "    <h5>Link video:"+entity.getLink()+"</h5>\r\n";
		
		
		String matKhau = request.getParameter("matKhau");
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
//			message.setFrom(new InternetAddress(fromMail));
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
			request.setAttribute("message", "Đã chia sẻ video qua mail!");
			Date d = new Date();
			share likeEntity = new share();
			ShareDAO sDao = new ShareDAO();
			likeEntity.setNgayShare(d);
			likeEntity.setUser(user);
			likeEntity.setVideo(videoDao.findById(maVideo));
			sDao.create(likeEntity);
		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			request.setAttribute("message", "Gửi mail thất bại!");
			System.out.println(e);
		}
		
		request.getRequestDispatcher("/views/chiaSe.jsp").forward(request, response);
	}

}
