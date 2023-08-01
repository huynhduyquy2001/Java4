package poly.filters;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet Filter implementation class LocaleFilter
 */
@WebFilter("/*")
public class LocaleFilter extends HttpFilter implements Filter {
       
	@Override
	public void doFilter(HttpServletRequest req, HttpServletResponse resp,
	FilterChain chain) throws IOException, ServletException {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
	String lang = req.getParameter("lang");
	if(lang != null) {
	req.getSession().setAttribute("lang", lang);
	}

	chain.doFilter(req, resp);
	}

}

