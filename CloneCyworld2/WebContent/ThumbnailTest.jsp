<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<input type="file" name="photo" onchange="setThumbnail(event)" />
	<div id="photo-container"></div>
	<script>
		function setThumbnail(event) {
			var reader = new FileReader();
			var file = event.target.files[0];

			if (file && file.type.match("image.*")) {
				reader.onload = function(e) {
					var img = document.createElement("img");
					img.setAttribute("src", e.target.result);
					document.querySelector("#photo-container").innerHTML = "";
					document.querySelector("#photo-container").appendChild(img);
				}
				reader.readAsDataURL(file);
			}
		}
	</script>
</body>
</html>