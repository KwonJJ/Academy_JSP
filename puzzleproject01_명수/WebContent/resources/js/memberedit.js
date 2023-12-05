// 회원가입 화면의 입력값들을 검사한다.      
function checkValue() {
	var form = document.frm;
	
	// 비밀번호는 최소 8자에서 16자까지, 영문자, 숫자 및 특수 문자를 포함해야 합니다.
	var passwordRegex = /^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[!@#$%^&*?_]).{8,16}$/;
	
	var emailRegex = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
		/*	^ [a - zA - Z0 -9._ % +-] +: 이메일 주소는 영문 대소문자, 숫자, 그리고 일부 특수문자(._ % +-)로 시작.
		@: 이어서는 '@' 기호가 와야 합니다.
		[a - zA - Z0 - 9. -] +: '@' 이후에는 다시 영문 대소문자, 숫자, 그리고 일부 특수문자(.-)가 포함될 수 있습니다.
		\.: 최소한 하나의 점('.')이 포함되어야 합니다.
		[a - zA - Z]{ 2,} $: 마지막으로, 이메일 주소는 최소 두 글자의 영문 대소문자로 끝나야 합니다.*/


	if (!form.pw.value) {
		alert("비밀번호를 입력하세요.");
		return false;
	}
	if (!passwordRegex.test(form.pw.value)) {
			alert("비밀번호는 최소 8자에서 16자까지, 영문자, 숫자 및 특수 문자를 포함해야 합니다.");
            return false;
	}
	// 비밀번호와 비밀번호 확인에 입력된 값이 동일한지 확인        
	if (form.pw.value != form.pwcheck.value) {
		alert("비밀번호를 동일하게 입력하세요.");
		return false;
	}
	
	
	if (form.emailAuthenticationKey.value === "0") {
		alert("이메일 본인인증을 해주세요.");
		return false;
	}
	
	if (!form.nickname.value) {
		alert("닉네임을 입력하세요.");
		return false;
	}
	if (form.nicknameDuplication.value != form.nickname.value) {
		alert("닉네임 중복확인을 해주세요.");
		return false;
	}
	
	if (form.nicknameDuplication.value === 0) {
		alert("닉네임 중복확인을 해주세요.");
		return false;
	}
	
	
	if (!form.address1.value) {
		alert("주소를 입력하세요.");
		return false;
	}
	if (!form.address2.value) {
		alert("주소를 입력하세요.");
		return false;
	}
	if (!form.address3.value) {
		alert("주소를 입력하세요.");
		return false;
	}

	if (!form.phone1.value) {
		alert("휴대폰번호를 입력하세요.");
		return false;
	}
	if (!form.phone2.value) {
		alert("휴대폰번호를 입력하세요.");
		return false;
	}
	if (!form.phone3.value) {
		alert("휴대폰번호를 입력하세요.");
		return false;
	}

	if (isNaN(form.phone1.value)) {
		alert("휴대폰번호는 숫자만 입력해주세요.");
		return false;
	}
	if (isNaN(form.phone2.value)) {
		alert("휴대폰번호는 숫자만 입력해주세요.");
		return false;
	}
	if (isNaN(form.phone3.value)) {
		alert("휴대폰번호는 숫자만 입력해주세요.");
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







