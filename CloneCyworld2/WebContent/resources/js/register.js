function registerCheck() {
	var id = document.frm.id.value;
	var pw = document.frm.pw.value;
	var form = document.querySelector("form");
	var pwCheck = document.frm.pwcheck.value;
	var existingErrorMsg = document.querySelector("#errorMsg");
	
	if(existingErrorMsg) {
		form.removeChild(existingErrorMsg);
	}
	
	if(id === "") {
		alert("아이디를 입력해주세요.");
		document.frm.id.focus();
		return;
	}
	
	if(pw === "") {
		alert("비밀번호를 입력해주세요.");
		document.frm.pw.focus();
		return;
	}
	
	if(pwCheck === "") {
		alert("비밀번호 확인을 입력해주세요.");
		document.frm.pwcheck.focus();
		return;
	}
	
	if(pw !== pwCheck) {
		var errorMsg = document.createElement("p");
		errorMsg.id = "errorMsg";
		errorMsg.style.color = "red";
		errorMsg.textContent = "비밀번호가 맞지 않습니다.";
		form.insertBefore(errorMsg, form.querySelector(".email-wrapper"));
		return false;
	}
	
	document.frm.submit();
}