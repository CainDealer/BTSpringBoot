<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="vi">
<head>
  <meta charset="UTF-8">
  <title>Đăng ký</title>
  <style>
    body { font-family: Arial, sans-serif; background: #f2f4f7; display: flex; justify-content: center; padding-top: 80px; }
    .box { background: #fff; padding: 30px; border-radius: 8px; width: 320px; box-shadow: 0 2px 8px rgba(0,0,0,.1); }
    input { width: 100%; padding: 10px; margin: 8px 0 2px; box-sizing: border-box; }
    button { width: 100%; padding: 10px; margin-top: 10px; background: #2d7ff9; color: #fff; border: 0; border-radius: 4px; cursor: pointer; }
    .error { color: red; font-size: 13px; }
  </style>
</head>
<body>
  <div class="box">
    <h2>Đăng ký</h2>
    <form:form method="post" action="/register" modelAttribute="form">
      <form:input path="username" placeholder="Username"/>
      <form:errors path="username" cssClass="error"/>

      <form:input path="email" placeholder="Email"/>
      <form:errors path="email" cssClass="error"/>

      <form:password path="password" placeholder="Mật khẩu (tối thiểu 6 ký tự)"/>
      <form:errors path="password" cssClass="error"/>

      <button type="submit">Đăng ký</button>
    </form:form>
    <p>Đã có tài khoản? <a href="/login">Đăng nhập</a></p>
  </div>
</body>
</html>