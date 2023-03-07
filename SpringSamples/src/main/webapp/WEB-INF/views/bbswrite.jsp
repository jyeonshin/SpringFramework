<%@page import="mul.cam.a.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	MemberDto login = (MemberDto)session.getAttribute("login");		
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>bbs write</title>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.3/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>

<style type="text/css">
th{
	background-color: #007bff;
	color: white;
	text-align: center;
	vertical-align: middle;
}
</style>

</head>
<body>

<h1>글쓰기</h1>

<hr>

<div id="app" class="container">

<form action="bbswriteAf.do" id="frm" method="post">

<table class="table table-sm">
<col width="100px"><col width="500px">

<tr>
	<th>아이디</th>
	<td>
		<%-- <input type="text" name="id" size="50px" value="<%=login.getId() %>" readonly="readonly"> --%>
		
		<%=login.getId() %>
		<input type="hidden" name="id" value="<%=login.getId() %>">
	</td>
</tr>
<tr>
	<th class="align-middle">제목</th>
	<td>
		<input type="text" id="title" name="title" size="50px" class="form-control form-control-lg" placeholder="제목기입">
	</td>
</tr>
<tr>	
	<td colspan="2">
		<textarea rows="18" id="content" name="content" class="form-control" placeholder="내용기입"></textarea>
	</td>
</tr>
<tr>
	<td colspan="2" align="right" style="padding-top: 20px">
		<!-- <input type="submit" value="글쓰기"> -->
		<button type="button" class="btn btn-primary">글작성 완료</button>
	</td>
</tr>

</table>
</form>
</div>

<script type="text/javascript">
$(document).ready(function() {
	
	$("button").click(function() {
		
		if($("#title").val().trim() == "" ){
			alert("제목을 기입해 주십시오");
			return;
		}else if($("#content").val().trim() == "" ){
			alert("내용을 기입해 주십시오");
			return;
		}else{
			$("#frm").submit();
		}		
	});	
});
</script>


</body>
</html>







