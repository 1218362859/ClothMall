<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
${username}
<c:if test="${username!=null }"><br/>
<a href="${pageContext.request.contextPath }/user/logout.action">推出</a>
</c:if>
	<%-- <fmt:formatDate value="${isoDate}" type="date" dateStyle="full"/> --%>

	<table>
		<tr>
			<td align="center" width="2%">username</td>
			<td align="center" width="3%">password</td>

		</tr>
		<c:forEach items="${userlist}" var="item">

			<tr>
				<td style="CURSOR: hand; HEIGHT: 22px" align="center">${item.username}</td>
				<td style="CURSOR: hand; HEIGHT: 22px" align="center">${item.password}</td>




			</tr>
		</c:forEach>
	</table>

</body>
</html>