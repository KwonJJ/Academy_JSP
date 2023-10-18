package utils;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.jsp.JspWriter;

public class JSFunction {
	public static void alertLocation(String msg, String url, JspWriter out) {
		try {
			String script = "<script>"
					+ " alert('" + msg + "'); "
					+ " location.href ='" + url + "';"
					+ "</script>";
			out.println(script);
		} catch(Exception e) {}
	}
	
	public static void alertBack(String msg, JspWriter out) {
		// 메시지 알림창을 띄운 후 이전 페이지로 돌아감
		try {
			String script = ""
					+ "<script>"
					+ " alert('" + msg + "');"
					+ " history.back();"
					+ "</script>";
			out.println(script);
		} catch(Exception e) {}
		
	}

	public static void alertLocation(HttpServletResponse resp, String msg, String url) {
		try {
			resp.setContentType("text/html;charset=utf-8");
			PrintWriter writer = resp.getWriter();
					
			String script = "" 
					+ "<script>"
					+ " alert('" + msg + "'); "
					+ " location.href ='" + url + "';"
					+ "</script>";
			writer.println(script);
		} catch(Exception e) {}
	}

	public static void alertBack(HttpServletResponse resp, String msg) {
		// 메시지 알림창을 띄운 후 이전 페이지로 돌아감
		try {
			resp.setContentType("text/html;charset=utf-8");
			PrintWriter writer = resp.getWriter();
			String script = ""
					+ "<script>"
					+ " alert('" + msg + "');"
					+ " history.back();"
					+ "</script>";
			writer.println(script);
		} catch(Exception e) {}
		
	}
}