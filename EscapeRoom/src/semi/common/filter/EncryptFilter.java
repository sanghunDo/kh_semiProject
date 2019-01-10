package semi.common.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;

import semi.common.wrapper.EncryptWrapper;

/**
 * Servlet Filter implementation class EncryptFilter
 */
@WebFilter({"/member/login", "/member/memberRegisterEnd", "/member/updatePasswordEnd"})
public class EncryptFilter implements Filter {

    /**
     * Default constructor. 
     */
    public EncryptFilter() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		System.out.println(3);
		// 암호화래퍼객체 생성
		EncryptWrapper encRequest = new EncryptWrapper((HttpServletRequest)request);
		System.out.println("~~~~~~~~~~~~~~~~~~~~~~~");
		System.out.println("EncryptFilter처리 완료!");
		System.out.println("~~~~~~~~~~~~~~~~~~~~~~~");
	
		// ServletRequest타입의 파라미터에
		// EncryptWrapper객체 (encRequest) 전달
		// 계층도 : ServletRequest - HttpServletRequest - HttpServletRequestWrapper - EncryptWrapper
		// request.setAttribute("userId", request.getAttribute("userId"));
		chain.doFilter(encRequest, response);
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}
	

}
