package controller;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import model.photoGallery;
import model.photoGalleryDAO;

public class photoGalleryServlet extends HttpServlet{
	
	private photoGalleryDAO photoDAO;
	
	public void init() {
		photoDAO = new photoGalleryDAO();
	}
	
	@Override
	public void destroy() {
		photoDAO.close();
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String realFolder = req.getServletContext().getRealPath("/resources/img");
		String realFolder2 = "C:\\jsp\\CloneCyworld\\WebContent\\resources\\img";
		resp.setContentType("text/html; charset=UTF-8");
		int maxSize = 5 * 1024 * 1024;
		String encType = "UTF-8";
		
		MultipartRequest mr = new MultipartRequest(req, realFolder, maxSize, encType, new DefaultFileRenamePolicy());
		
		String id = mr.getParameter("id");
		String title = mr.getParameter("title");
		String content = mr.getParameter("content");
		
		Enumeration files = mr.getFileNames();
		String image = (String)files.nextElement();
		String fileName = mr.getFilesystemName(image);
		
		photoGallery photo = new photoGallery();
		photo.setId(id);
		photo.setTitle(title);
		photo.setContent(content);
		photo.setImage(fileName);
		
		try {
			
			photoDAO.InsertPhoto(photo);
			req.getSession().setAttribute("id", id);
			resp.sendRedirect("photoGallery.jsp?id=" + id);
			
		} catch (Exception e) {
			e.printStackTrace();
			resp.sendRedirect("error.jsp");
		}
		
	}
}
