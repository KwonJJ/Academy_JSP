package fileupload;

import javax.servlet.http.HttpServletRequest;

import com.oreilly.servlet.MultipartRequest;

public class FileUtil {
	public static MultipartRequest uploadFile(HttpServletRequest request, String saveDirectory, int maxPostSize) {
		try {
			
			System.out.println("FileUtil.java파일 업로드 성공");
			
			return new MultipartRequest(request, saveDirectory, maxPostSize, "utf-8");
			
		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("FileUtil.java파일 업로드 실패");
			return null;
		}
	}
}
