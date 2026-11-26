<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
  <meta charset="UTF-8">
  <title>Trang chủ</title>
  <style>
    body { font-family: Arial, sans-serif; text-align: center; padding-top: 100px; }
    button { padding: 10px 20px; background: #e53935; color: #fff; border: 0; border-radius: 4px; cursor: pointer; }
  </style>
</head>
<body>
  <h1>Xin chào, <c:out value="${username}"/>!</h1>

  <form method="post" action="/logout">
    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
    <button type="submit">Đăng xuất</button>
  </form>
</body>
</html>