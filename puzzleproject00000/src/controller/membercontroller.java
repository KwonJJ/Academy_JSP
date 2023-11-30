package controller;

import java.io.IOException;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Properties;
import java.util.Random;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import memberDAO.memberDAO;
import memberDTO.memberDTO;
import productDAO.productDAO;
import productDTO.productDTO;



public class membercontroller extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String requestURI= request.getRequestURI(); // 프로젝트와 파일경로 둘다가져옴
		String contextPath= request.getContextPath(); // 프로젝트만 가져옴
		String command=requestURI.substring(contextPath.length()); // 파일경로만 가져옴 
		
		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("utf-8");
		
		//파일경로만 가져오기때문에 앞부분 자르고 *.do 가져올수 있음.
		if(command.equals("/loginprocess.do")) { // 로그인처리
			loginprocess(request, response);
			response.sendRedirect("welcome.jsp");
			//request.getRequestDispatcher("welcome.jsp").forward(request, response);
		} else if(command.equals("/registerprocess.do")){ // 회원가입처리
			registerprocess(request);
			response.sendRedirect("welcome.jsp");
		//	request.getRequestDispatcher("welcome.jsp").forward(request, response);
		} else if(command.equals("/logout.do")){ // 로그아웃처리
			logout(request, response);
			response.sendRedirect("welcome.jsp");
		}   else if(command.equals("/IdCheckServlet.do")){ // 아이디 중복체크 
			idcheck(request);
			request.getRequestDispatcher("idcheck.jsp").forward(request, response);
		}  else if(command.equals("/NickNameCheckServlet.do")){ // 닉네임 중복체크 
			nicknamecheck(request);
			request.getRequestDispatcher("nicknamecheck.jsp").forward(request, response);
		}  else if(command.equals("/EmailCheckServlet.do")){ // 이메일 중복체크 
			emailcheck(request);
			request.getRequestDispatcher("emailcheck.jsp").forward(request, response);
		}  else if(command.equals("/sendmailServlet.do")){ // 이메일 보내기 
			sendemail(request);
			request.getRequestDispatcher("emailauthcheck.jsp").forward(request, response);
		}  else if(command.equals("/emailauthServlet.do")){ // 이메일 본인인증  
			emailauth(request);
			request.getRequestDispatcher("emailauthcheck.jsp").forward(request, response);
		}  else if(command.equals("/memberedit.do")){ // 회원정보 변경  
			memberedit(request);
			response.sendRedirect("mypage.jsp");
		}
	}


	//로그인해주는 메소드
	public void loginprocess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		memberDAO dao=new memberDAO();
		memberDTO dto = new memberDTO();
		String id=request.getParameter("id"); //파라미터값 id, pw 받기
		String pw=request.getParameter("pw");
		String autologin = request.getParameter("autologin");
		  
		dto=dao.getMemberDTO(id, pw); // id,pw 일치하는지 확인해주고 만약 맞을경우 dto객체(해당유저 정보모음)보내줌.
		dao.close();
		if(dto.getId()!=null) {
			HttpSession session=request.getSession();
			session.setAttribute("id", dto.getId());
			session.setAttribute("userdto", dto);
			
			 if(autologin != null){
	                Cookie cookie = new Cookie("id", id);
	                cookie.setMaxAge(60);
	                cookie.setPath("/");
	                response.addCookie(cookie);
	                
	            }
		} else {
			request.setAttribute("warning", "아이디와 비밀번호를 확인해주세요"); //오류일경우 아이디 비밀번호 확인 메시지 보내기
			request.getRequestDispatcher("login.jsp").forward(request, response);
			
		}
		
	
		
	}
	
	//회원가입 메소드
	public void registerprocess(HttpServletRequest request) {
		memberDAO dao=new memberDAO();
		//파라미터값 받기 
		String id=request.getParameter("id");
		String pw=request.getParameter("pw");
		String name=request.getParameter("name");
		String nickname=request.getParameter("nickname");
		String birthday=request.getParameter("birthday");
		String address1=request.getParameter("address1");
		String address2=request.getParameter("address2");
		String address3=request.getParameter("address3");
		String address=address1+" "+address2+" "+address3;
		String email=request.getParameter("email");
		String recommender=request.getParameter("recommender");
		String phone = request.getParameter("phone");
		
		//회원가입 register메소드 마지막 0은 포인트값 0을 의미함.
		dao.register(id, pw, name, nickname, birthday, address, email, phone, recommender, 0);
		
		dao.close();
		
	}
	
	
	
	//로그아웃해주는 메소드
	public void logout(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session=request.getSession();
		if(session !=null) {
			session.invalidate();
			
			 Cookie[] cookies = request.getCookies();
			    if(cookies!=null){
			        for(Cookie tempCookie : cookies){
			            if(tempCookie.getName().equals("id")){
			                tempCookie.setMaxAge(0);
			                tempCookie.setPath("/");
			                response.addCookie(tempCookie);
			            	}
			        }
			    }
		}
		
	}
	
	//아이디 중복확인 메소드

		public void idcheck(HttpServletRequest request) {
			String id=request.getParameter("id");
			memberDAO dao = new memberDAO();
			int result=0;
			try {
				result=dao.CheckDuplicateId(id);
				dao.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			request.setAttribute("id", id);
			request.setAttribute("result", result);
			
		}
	
	//닉네임 중복확인 메소드
		public void nicknamecheck(HttpServletRequest request) {
			String nickname=request.getParameter("nickname");
			memberDAO dao = new memberDAO();
			int result=0;
			try {
				result=dao.CheckDuplicateNickName(nickname);
				dao.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			request.setAttribute("nickname", nickname);
			request.setAttribute("result", result);
		}
	
	//이메일 중복확인 체크 메소드
	public void emailcheck(HttpServletRequest request) {
		String email=request.getParameter("email"); // 받는사람의 이메일 주소
		memberDAO dao = new memberDAO();
		int result=0;
		try {
			result=dao.CheckDuplicateEmail(email);
			dao.close();
          
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		request.setAttribute("email", email);
		request.setAttribute("result", result);
		
		
	}
	
	//이메일 인증번호 보내는 메소드 
	public void sendemail(HttpServletRequest request) {
		String recipient=request.getParameter("email"); // 받는사람의 이메일 주소
		String AuthenticationKey ="";
		try {
				//인증 번호 생성기
                StringBuffer temp =new StringBuffer();
                Random rnd = new Random();
                for(int i=0;i<10;i++)
                {
                    int rIndex = rnd.nextInt(3);
                    switch (rIndex) {
                    case 0:
                        // a-z
                        temp.append((char) ((int) (rnd.nextInt(26)) + 97));
                        break;
                    case 1:
                        // A-Z
                        temp.append((char) ((int) (rnd.nextInt(26)) + 65));
                        break;
                    case 2:
                        // 0-9
                        temp.append((rnd.nextInt(10)));
                        break;
                    }
                }
                AuthenticationKey = temp.toString();
                System.out.println(AuthenticationKey);
                
                //메일보내기
                // 1. 발신자의 메일 계정과 비밀번호 설정
                final String user = "gudcjf532@gmail.com";
                final String password = "fwcqyfolaayqtjwi";
         
                // 2. Property에 SMTP 서버 정보 설정
                
            	Properties prop = System.getProperties();

        		// 로그인시 TLS를 사용할 것인지 설정
        		prop.put("mail.smtp.starttls.enable", "true");

        		// 이메일 발송을 처리해줄 SMTP서버
        		prop.put("mail.smtp.host", "smtp.gmail.com");

        		// SMTP 서버의 인증을 사용한다는 의미
        		prop.put("mail.smtp.auth", "true");

        		// TLS의 포트번호는 587이며 SSL의 포트번호는 465이다.
        		prop.put("mail.smtp.port", "587");

        		// soket문제와 protocol문제 해결
        		prop.put("mail.smtp.ssl.trust", "smtp.gmail.com");
        		prop.put("mail.smtp.socketFactory.fallback", "false");
        		prop.put("mail.smtp.ssl.protocols", "TLSv1.2");

         
                // 3. SMTP 서버정보와 사용자 정보를 기반으로 Session 클래스의 인스턴스 생성
                javax.mail.Session session = javax.mail.Session.getDefaultInstance(prop, new javax.mail.Authenticator() {
                    protected PasswordAuthentication getPasswordAuthentication() {
                        return new PasswordAuthentication(user, password);
                    }
                });
         
                // 4. Message 클래스의 객체를 사용하여 수신자와 내용, 제목의 메시지를 작성한다.
                // 5. Transport 클래스를 사용하여 작성한 메세지를 전달한다.
         
                MimeMessage message = new MimeMessage(session);
                try {
                    message.setFrom(new InternetAddress(user));
         
                    // 수신자 메일 주소
                    message.addRecipient(Message.RecipientType.TO, new InternetAddress(recipient));
         
                    // Subject
                    message.setSubject("퍼즐쇼핑몰에 가입을 환영합니다.");
         
                    // Text
                    message.setText("본인 인증키 : ["+AuthenticationKey+"]");
         
                    Transport.send(message);    // send message
         
         
                } catch (AddressException e) {
                    e.printStackTrace();
                } catch (MessagingException e) {
                    e.printStackTrace();
                }
         
		} catch (Exception e) {
			e.printStackTrace();
		}
		HttpSession session = request.getSession();
		session.setAttribute("AuthenticationKey", AuthenticationKey);
		
	}
	
	//이메일 암호 본인인증 
		public void emailauth(HttpServletRequest request) {
			String userAuthenticationKey=request.getParameter("userAuthenticationKey"); // 받는사람의 이메일 주소
			HttpSession session = request.getSession();
			String AuthenticationKey=(String)session.getAttribute("AuthenticationKey");
			int result=0;
			if(!userAuthenticationKey.equals(null) && userAuthenticationKey.equals(AuthenticationKey)) {
				result=1;
				session.invalidate();
			}
			request.setAttribute("result", result);
		}
		
		
	//회원정보수정 메소드 
	public void memberedit(HttpServletRequest request) {
		memberDAO dao=new memberDAO();
		memberDTO dto=new memberDTO();
		//파라미터값 받기 
		String id=request.getParameter("id");
		String pw=request.getParameter("pw");
		String nickname=request.getParameter("nickname");
		String address1=request.getParameter("address1");
		String address2=request.getParameter("address2");
		String address3=request.getParameter("address3");
		String address=address1+" "+address2+" "+address3;
		String phone = request.getParameter("phone");
				
		
		//회원가입 register메소드 마지막 0은 포인트값 0을 의미함.
		dao.EditMember(id, pw, nickname, address, phone);
		dto=dao.getMemberDTO(id, pw);
		HttpSession session=request.getSession();
		session.setAttribute("userdto", dto);
		dao.close();
		
	}
	
}


