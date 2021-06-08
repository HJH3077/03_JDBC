<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
/* 	
	String idx = request.getParameter("idx");
	String pw = request.getParameter("pw"); 
	이걸 안쓰고 param으로 그냥 받아버림
*/
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
   div{text-align: center; margin: 100px auto; width: 500px;}

   input{
      padding : 10px;
   }
</style>
<script type="text/javascript">
	function delete_ok(f) {
		if("${param.pw}" == f.pw.value){
			var chk = confirm("정말 삭제할까요?");
			if(chk){
				f.action="delete_ok.jsp";
				f.submit();
			}else{
				history.go(-1);
			}
		}else{
			alert("비밀번호 틀림");
			f.pw.value="";
			f.pw.focus();
			return;
		}
	}
</script>
</head>
<body>
	<div>
		<form method="post">
			<fieldset>
				<legend>삭제하기</legend>
				비밀번호 : <input type="password" name="pw" placeholder="비밀번호입력">
				<input type="button" value="삭제하기" onclick="delete_ok(this.form)">
				<input type="hidden" name="idx" value="${param.idx}">
			</fieldset>
		</form>
	</div>
</body>
</html>