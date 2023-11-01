function registerCheck() {
	var id = document.frm.id.value;
	var dupliId = document.frm.dupliId.value;
	var pw = document.frm.pw.value;
	var form = document.querySelector("form");
	var pwCheck = document.frm.pwCheck.value;
	var existingErrorMsg = document.querySelector("#errorMsg");
	
	if(existingErrorMsg){
		form.removeChild(existingErrorMsg);
	}
	
	if(id === "") {
		alert("아이디를 입력해 주세요");
		document.frm.id.focus();
		return;
	}
	
	if(pw === "") {
		alert("비밀번호를 입력해 주세요");
		document.frm.pw.focus();
		return;
	}
	
	if(pwCheck === "") {
		alert("비밀번호 확인을 입력해 주세요");
		document.frm.pwCheck.focus();
		return;
	}
	
	if(pw !== pwCheck) {
		var errorMsg = document.createElement("p");
		errorMsg.id = "errorMsg";
		errorMsg.style.color = "red";
		errorMsg.textContent = "비밀번호가 맞지 않습니다";
		form.insertBefore(errorMsg, form.querySelector(".email-wrapper"));
		return false;
	}
	
	// id, dupliId 동일한지 체크
	if(id != dupliId){
		alert("아이디 중복 체크를 해주세요.");
		return;
	}

	if(document.frm.dupliId.value.length === 0){
		alert("아이디 중복 체크를 해주세요. ");
		document.frm.id.focus();
		return;
	}
	
	document.frm.submit();
}

function idCheck() {
	var url = "idCheckServlet?id=" + document.frm.id.value;
	window.open(url, "_blank", "scrolbars = yes, width = 450, height = 200");
}

function idOk(){
	opener.frm.id.value = document.idCheckForm.id.value;
	opener.frm.dupliId.value = document.idCheckForm.id.value;
	self.close();
}