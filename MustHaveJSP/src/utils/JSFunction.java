package utils;

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
}