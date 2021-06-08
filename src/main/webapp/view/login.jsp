<%@page import="com.ict.db.DAO"%>
<%@page import="com.ict.db.VO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("utf-8");
	// 파라미터 값이 VO에 속하면 VO객체를 생성해서 VO객체에 넣자
	VO vo = new VO();
	
	// VO에 입력받은 id와 pw를 넣음
	vo.setId(request.getParameter("id"));
	vo.setPw(request.getParameter("pw"));
	
	// DB에 해당 id와 pw가 맞는지 검사하자
	VO vo2 = DAO.getInstance().getLogIn(vo); // getInstance로 DB로그인 후 getLogIn으로 넣은
											 // vo의 값을 사용해서 검사
											 
	// JSTL과 EL은 pageContext, request, session, application에 저장되어있어야 한다.
	// 로그인 정보는 기본적으로 session에 저장한다.
	session.setAttribute("vo2", vo2);
%>
	<!-- vo2가 비었는지 묻는 것 : 비었으면 로그인 실패  -->
<c:choose>
	<c:when test="${empty vo2}">
		<script>
			/* alert("로그인실패"); */
			var k = confirm("로그인실패\n회원가입할까요?");
			if(k){
				location.href="join.jsp"; // 확인 
			}else{
				location.href="index.jsp"; // 취소
			}
		</script>
	</c:when>
	<c:otherwise>
		<script>
			alert("로그인 성공");
			location.href="onelist.jsp"; // 자기 정보를 다 보여주는 곳
		</script>
	</c:otherwise>	
</c:choose>



