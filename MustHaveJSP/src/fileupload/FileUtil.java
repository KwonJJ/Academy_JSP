package fileupload;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.io.OutputStream;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;

public class FileUtil {

	public static MultipartRequest uploadFile(HttpServletRequest request, String saveDirectory, int maxPostSize) {

		try {
			System.out.println("FileUtil.java 파일 업로드 성공");
			return new MultipartRequest(request, saveDirectory, maxPostSize, "utf-8");
		} catch (Exception e) {
			System.out.println("FileUtil.java 파일 업로드 실패");
			e.printStackTrace();
			return null;
		}

	}

	public static void download(HttpServletRequest request, HttpServletResponse response, String directory, String sfileName, String ofileName) {
		String sDirectory = request.getServletContext().getRealPath(directory);
		try {
			File file = new File(sDirectory, sfileName);
			InputStream iStream = new FileInputStream(file);

			String client = request.getHeader("User-Agent");
			if (client.indexOf("WOW64") == -1) {
				ofileName = new String(ofileName.getBytes("utf-8"), "ISO-8859-1");
			} else {
				ofileName = new String(ofileName.getBytes("KSC5601"), "ISO-8859-1");
			}

			response.reset(); // 응답 헤더 초기화
			response.setContentType("application/octet-stream"); // 8비트 스트림 설정
			response.setHeader("Content-Disposition", "attachment; filename=\"" + ofileName + "\"");
			response.setHeader("Content-Length", "" + file.length());

			OutputStream oStream = response.getOutputStream();

			byte b[] = new byte[(int) file.length()];
			int readBuffer = 0;
			while ((readBuffer = iStream.read(b)) > 0) {
				oStream.write(b, 0, readBuffer);
			}

			iStream.close();
			oStream.close();

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("파일을 찾을 수 없습니다.");
		}

	}
	
	public static void deleteFile(HttpServletRequest request, String directory, String filename) {
		String sDirectory = request.getServletContext().getRealPath(directory);
		File file = new File(sDirectory + File.separator + filename);
		if(file.exists()) {
			file.delete();
		}
	}
	
	
}
