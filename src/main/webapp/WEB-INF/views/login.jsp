<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
  <meta charset="UTF-8">
  <title>Đăng nhập</title>
  <style>
    body { font-family: Arial, sans-serif; background: #f2f4f7; display: flex; justify-content: center; padding-top: 80px; }
    .box { background: #fff; padding: 30px; border-radius: 8px; width: 320px; box-shadow: 0 2px 8px rgba(0,0,0,.1); }
    input { width: 100%; padding: 10px; margin: 8px 0; box-sizing: border-box; }
    button { width: 100%; padding: 10px; background: #2d7ff9; color: #fff; border: 0; border-radius: 4px; cursor: pointer; }
    .error { color: red; } .ok { color: green; }
  </style>
</head>
<body>
  <div class="box">
    <h2>Đăng nhập</h2>

    <c:if test="${param.error != null}"><p class="error">Sai username hoặc password</p></c:if>
    <c:if test="${param.logout != null}"><p class="ok">Bạn đã đăng xuất</p></c:if>
    <c:if test="${success != null}"><p class="ok"><c:out value="${success}"/></p></c:if>

    <form method="post" action="/login">
      <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
      <input name="username" placeholder="Username">
      <input name="password" type="password" placeholder="Mật khẩu">
      <button type="submit">Đăng nhập</button>
    </form>
    <p>Chưa có tài khoản? <a href="/register">Đăng ký</a></p>
  </div>
</body>
</html>