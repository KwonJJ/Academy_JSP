document.addEventListener('DOMContentLoaded', function() {
	var deleteButtons = document.querySelectorAll('.delete-btn');
	var deleteReply = document.querySelectorAll('.delete_Reply-btn');

	deleteButtons.forEach(function(button) {
		button.addEventListener('click', function() {
			var no = this.getAttribute('data-no');
			var confirmDelete = confirm("게시글을 삭제하시겠습니까?");

			if (confirmDelete) {
				window.location.href = "GuestbookServlet?id=" + ownerId + "&deleteNo=" + no;
			}
		});
	});
	
	deleteReply.forEach(function(button){
		button.addEventListener('click', function(){
			var r_no = this.getAttribute('data-r_no');
			var replyDelete = confirm("댓글을 삭제하시겠습니까?");
			
			if(replyDelete) {
				window.location.href = "GuestbookReplyServlet?id=" + ownerId + "&deleteR_no" + r_no;
			}
		});
	}); 
});