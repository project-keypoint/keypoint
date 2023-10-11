package com.keypoint.security;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;

public class AccessFilter implements Filter {

	public void init(FilterConfig filterConfig) throws ServletException {
		// 필요한 초기화 작업이 있으면 여기에 추가할 수 있습니다.
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest httpRequest = (HttpServletRequest) request;
		HttpServletResponse httpResponse = (HttpServletResponse) response;

		String requestURI = httpRequest.getRequestURI();
		
		if (requestURI.equals(httpRequest.getContextPath() + "/main/login") || 
			    requestURI.startsWith(httpRequest.getContextPath() + "/employee/loginPro") ||
			    requestURI.startsWith(httpRequest.getContextPath() + "/resources/")) {
			// 로그인 페이지 및 로그인 처리 페이지로의 요청은 항상 허용
			chain.doFilter(request, response);
		} else {
			if (httpRequest.getSession().getAttribute("empId") != null) {
				// 사용자가 로그인되어 있으면 요청을 허용
				chain.doFilter(request, response);
//			} else {
//				// 사용자가 로그인되어 있지 않으면 경고 메시지를 표시한 후 로그인 페이지로 이동 여부를 확인
//				String loginPage = httpRequest.getContextPath() + "/main/login";
//				String alertMessage = "로그인이 필요한 서비스입니다. 로그인 페이지로 이동하시겠습니까?";
//				String confirmationScript = String.format(
//						"if(confirm('%s')){window.location.href='%s';} else {window.close();}", alertMessage,
//						loginPage);
//				;
//
//				httpResponse.setContentType("text/html;charset=UTF-8");
//				PrintWriter out = httpResponse.getWriter();
//				out.println("<script>" + confirmationScript + "</script>");
			} else {
                // 사용자가 로그인되어 있지 않으면 알림창 띄우고 로그인 페이지로 리다이렉트
                String alertScript = "<script>alert('로그인이 필요합니다.'); window.location.href='" +
                        httpRequest.getContextPath() + "/main/login'</script>";
                httpResponse.setContentType("text/html;charset=UTF-8");
                httpResponse.getWriter().write(alertScript);
                
                
            }
			
		}
	}

	public void destroy() {
		// 필요한 정리 작업이 있으면 여기에 추가할 수 있습니다.
	}
}
