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

	<%-- <fmt:formatDate value="${isoDate}" type="date" dateStyle="full"/> --%>

	<form action="${pageContext.request.contextPath}/user/uploadPic.action"
		method="post" enctype="multipart/form-data">
		<table>

			<tr>
				<td style="CURSOR: hand; HEIGHT: 22px" align="center">商品图片</td>
				<td style="CURSOR: hand; HEIGHT: 22px" align="center"><c:if
						test="item.pic!=null">
						<img src="/pic/${item.pic}" width="100" height="100" />
						<br />

					</c:if> <input type="file" name="multipartFile">
				</td>


			</tr>
			<td>
				<input type="submit" value="提交" />
			</td>
		</table>

	</form>
</body>
</html>