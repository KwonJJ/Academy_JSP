// 회원가입 화면의 입력값들을 검사한다.      
function checkValue() {
	var form = document.frm;
	
	if (form.emailAuthenticationKey.value === "0") {
		alert("이메일 본인인증을 해주세요.");
		return false;
	}

}



// 취소 버튼 클릭시 첫화면으로 이동       
function goMypage() {
	location.href = "mypage.jsp";
}

  
// 닉네임 중복체크 화면open      
function opennicknameChk(form) {
	var url = "NickNameCheckServlet.do?nickname=" + form.nickname.value;
	window.open(url, "_blank",
		"toolbar=no, menubar=no, scrollbars=yes, resizable=no, width=450, height=200");

}
 



// 이메일 본인인증 화면open      
function authEmailChk(form) {
	var url = "sendmailServlet.do?email=" + form.email.value;
	window.open(url, "_blank",
		"toolbar=no, menubar=no, scrollbars=yes, resizable=no, width=450, height=200");
	

}







