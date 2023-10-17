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

public class AccessFilter implements Filter {

	public void init(FilterConfig filterConfig) throws ServletException {
		// 필요한 초기화 작업이 있으면 여기에 추가할 수 있습니다.
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest httpRequest = (HttpServletRequest) request;
		HttpServletResponse httpResponse = (HttpServletResponse) response;

		String requestURI = httpRequest.getRequestURI();

		if (requestURI.equals(httpRequest.getContextPath() + "/main/login")
				|| requestURI.startsWith(httpRequest.getContextPath() + "/employee/loginPro")
				|| requestURI.startsWith(httpRequest.getContextPath() + "/employee/logout")
				|| requestURI.startsWith(httpRequest.getContextPath() + "/main/productShipRate")
				|| requestURI.startsWith(httpRequest.getContextPath() + "/main/monthlyShip")
				|| requestURI.startsWith(httpRequest.getContextPath() + "/notice/recentNotice")
				|| requestURI.startsWith(httpRequest.getContextPath() + "/line/getLineInfo")
				|| requestURI.startsWith(httpRequest.getContextPath() + "/resources/")) {
			// 로그인 페이지 및 로그인 처리 페이지로의 요청은 항상 허용
			chain.doFilter(request, response);
		} else {
			if (httpRequest.getSession().getAttribute("empId") != null) {
				if (httpRequest.getSession().getAttribute("empRole").equals(3)) {
					chain.doFilter(request, response);
				}
				else if (httpRequest.getSession().getAttribute("departmentName").equals("인사부")) {
					if (requestURI.startsWith(httpRequest.getContextPath() + "/employee/")
							|| requestURI.startsWith(httpRequest.getContextPath() + "/main/")
							|| requestURI.startsWith(httpRequest.getContextPath() + "/employee/employeeDetails")
							|| requestURI.startsWith(httpRequest.getContextPath() + "/notice/")) {
						chain.doFilter(request, response);
					}
				} else if (httpRequest.getSession().getAttribute("departmentName").equals("영업부")) {
					if (requestURI.startsWith(httpRequest.getContextPath() + "/employee/")
							|| requestURI.startsWith(httpRequest.getContextPath() + "/main/")
							|| requestURI.startsWith(httpRequest.getContextPath() + "/employee/employeeDetails")
							|| requestURI.startsWith(httpRequest.getContextPath() + "/notice/")
							|| requestURI.startsWith(httpRequest.getContextPath() + "/receive/")
							|| requestURI.startsWith(httpRequest.getContextPath() + "/customer/")) {
						chain.doFilter(request, response);
					}
				} else if (httpRequest.getSession().getAttribute("departmentName").equals("자재부")) {
					if (requestURI.startsWith(httpRequest.getContextPath() + "/employee/")
							|| requestURI.startsWith(httpRequest.getContextPath() + "/main/")
							|| requestURI.startsWith(httpRequest.getContextPath() + "/employee/employeeDetails")
							|| requestURI.startsWith(httpRequest.getContextPath() + "/notice/")
							|| requestURI.startsWith(httpRequest.getContextPath() + "/material/")
							|| requestURI.startsWith(httpRequest.getContextPath() + "/product/")
							|| requestURI.startsWith(httpRequest.getContextPath() + "/purchase/")
							|| requestURI.startsWith(httpRequest.getContextPath() + "/receipt/")
							|| requestURI.startsWith(httpRequest.getContextPath() + "/require/")) {
						chain.doFilter(request, response);
					}
				} else if (httpRequest.getSession().getAttribute("departmentName").equals("생산부")) {
					if (requestURI.startsWith(httpRequest.getContextPath() + "/employee/")
							|| requestURI.startsWith(httpRequest.getContextPath() + "/main/")
							|| requestURI.startsWith(httpRequest.getContextPath() + "/employee/employeeDetails")
							|| requestURI.startsWith(httpRequest.getContextPath() + "/notice/")
							|| requestURI.startsWith(httpRequest.getContextPath() + "/workOrder/")
							|| requestURI.startsWith(httpRequest.getContextPath() + "/line/")
							|| requestURI.startsWith(httpRequest.getContextPath() + "/production/")
							|| requestURI.startsWith(httpRequest.getContextPath() + "/qc/")) {
						chain.doFilter(request, response);
					}
				}

				// 사용자가 로그인되어 있지 않으면 알림창 띄우고 메인 페이지로 리다이렉트
				String backwardScript = "<script>alert('접근권한이 없습니다.');" + "window.location.href='"
						+ httpRequest.getContextPath() + "/main/main'</script>";
				httpResponse.setContentType("text/html;charset=UTF-8");
				httpResponse.getWriter().write(backwardScript);

			} else {
				// 사용자가 로그인되어 있지 않으면 알림창 띄우고 로그인 페이지로 리다이렉트
				String alertScript = "<script>alert('로그인이 필요합니다.'); " + "window.location.href='"
						+ httpRequest.getContextPath() + "/main/login'</script>";
				httpResponse.setContentType("text/html;charset=UTF-8");
				httpResponse.getWriter().write(alertScript);
			}
		}
	}

	public void destroy() {
		// 필요한 정리 작업이 있으면 여기에 추가할 수 있습니다.
	}
}