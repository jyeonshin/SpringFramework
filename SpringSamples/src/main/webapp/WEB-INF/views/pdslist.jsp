<%@page import="mul.cam.a.dto.PdsDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
List<PdsDto> list = (List<PdsDto>)request.getAttribute("pdslist");
%>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h1>자료실</h1>

<hr>

<div align="center">
<table border="1">
<col width="50"><col width="100"><col width="300"><col width="50">
<col width="50"><col width="50"><col width="100">
<thead>
<tr>
	<th>번호</th><th>작성자</th><th>제목</th><th>다운로드</th>
	<th>조회수</th><th>다운수</th><th>작성일</th>
</tr>
</thead>

<tbody>
<%
for(int i = 0;i < list.size(); i++){
	PdsDto pds = list.get(i);
	%>
	<tr>
		<th><%=i + 1 %></th>
		<td><%=pds.getId() %></td>
		<td><%=pds.getTitle() %></td>
		<td>
			<input type="button" value="다운로드"
				onclick="filedown(<%=pds.getSeq() %>, <%=pds.getNewfilename() %>, <%=pds.getFilename() %>)">
		</td>
		<td><%=pds.getReadcount() %></td>
		<td><%=pds.getDowncount() %></td>
		<td><%=pds.getRegdate() %></td>
	</tr>
	<%
}
%>
</tbody>
</table>
<br>
<button type="button" onclick="pdsWrite()">자료추가</button>

</div>

<script type="text/javascript">
function pdsWrite() {
	location.href = "pdswrite.do";
}

</script>



</body>
</html>








