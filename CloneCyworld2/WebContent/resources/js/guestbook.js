document.addEventListener('DOMContentLoaded', function() {
	var deleteButtons = document.querySelectorAll('.delete-btn');

	deleteButtons.forEach(function(button) {
		button.addEventListener('click', function() {
			var no = this.getAttribute('data-no');
			var confirmDelete = confirm("게시글을 삭제하시겠습니까?");

			if (confirmDelete) {
				window.location.href = "GuestbookServlet?id=" + ownerId + "&deleteNo=" + no;
			}
		});
	});
});