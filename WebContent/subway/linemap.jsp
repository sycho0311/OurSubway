<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<script>
	function zoomInAndOut(string) {
		var image = document.getElementById("linemap")
		var currentWidth = image.width;
		var currentHeight = image.height;
		if (string == "in") {
			var width = parseInt(currentWidth * 1.2);
			var height = parseInt(currentHeight * 1.2);
		} else if (string == "out") {
			var width = parseInt(currentWidth * 0.8);
			var height = parseInt(currentHeight * 0.8);
		}
		
		if (width < 1280)
			width = 1280;
		else if (width > 3840)
			width = 3840;
		if (height < 810)
			height = 810;
		else if (height > 2430)
			height = 2430;
		
		image.width = width;
		image.height = height;
		
		var canvas = document.getElementById("linemap");
	}

	function wheel(e, obj) {
		var image = document.getElementById("linemap");
		var currentWidth = image.width;
		var currentHeight = image.height;
		if (e.wheelDelta < 0) {
			var width = parseInt(currentWidth * 0.8);
			var height = parseInt(currentHeight * 0.8);

			if (width < 1280)
				width = 1280;
			if (height < 810)
				height = 810;
			
			image.width = width;
			image.height = height;

		} else if (e.wheelDelta > 0) {
			var width = parseInt(currentWidth * 1.2);
			var height = parseInt(currentHeight * 1.2);

			if (width > 3840)
				width = 3840;
			if (height > 2430)
				height = 2430;

			image.width = width;
			image.height = height;
		}

		function down(e, obj) {
		}
		
		function up(e, obj) {
		}

		function move(e, obj) {
		}
	}
</script>

</head>
<body>

<input type="button" value="  +  " onmouseup="zoomInAndOut('in')">
<input type="button" value="  -  " onmouseup="zoomInAndOut('out')">

<div id="container" style="width: 85em; height: 55em; overflow: auto">
<img id="linemap" src="/OurSubway/images/SubwayLine.png" name="linemap"
	width="1280" height="810"
	onmousewheel="wheel(event, this)" onmousedown="down(event, this)" onmouseup="up(event, this)"
	onmousemove="move(event, this)">
</div>
</body>
</html>