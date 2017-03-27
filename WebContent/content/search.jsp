<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script>
	$(document).ready(function(){
		
		$("#searchBy").change(function(){
			if($("#searchBy").val() == 'style'){
				$("#searchFor").html(
					"<select id='style' name='style'><option value='classic'>Classic</option><option value='casual'>Casual</option>	<option value='street'>Street</option></select>"
				);
			} else if($("#searchBy").val() == 'tag'){
				$("#searchFor").html(
					"<input type='text' name='tag' value='#' size='5'>"
				);
			}
		});
	})

</script>
</head>
<body>
	<form>
		<select id="searchBy" name="searchBy">
			<option value="style">Style</option>
			<option value="tag">Tag</option>
		</select> 
		<span id="searchFor">
			<select id="style" name="style">
				<option value="calssic">Classic</option>
				<option value="casual">Casual</option>
				<option value="street">Street</option>
			</select>
		</span>
	</form>
</body>
</html>