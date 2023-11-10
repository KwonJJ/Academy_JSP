function openPage() {
	var selectedPage = document.querySelector('#pageSelect').value;
	if (!selectedPage) {
		return;
	}
	
	window.open(selectedPage, "_blank");
}