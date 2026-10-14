<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">

  <title>LIBIS Login</title>

  <link rel="stylesheet"
        href="${pageContext.request.contextPath}/bootstrap-5.0.2-dist/css/bootstrap.min.css">
</head>

<body class="bg-light">

<div class="container min-vh-100 d-flex align-items-center justify-content-center">

  <div class="card shadow-sm border-0" style="max-width: 420px; width: 100%;">

    <div class="card-body p-4 p-md-5">

      <h1 class="text-primary text-center mb-2">
        LIBIS
      </h1>

      <p class="text-muted text-center mb-4">
        Library Information Management System
      </p>

      <c:if test="${not empty error}">
        <div class="alert alert-danger">
          <c:out value="${error}"/>
        </div>
      </c:if>

      <c:if test="${param.logout == '1'}">
        <div class="alert alert-success">
          You have been logged out successfully.
        </div>
      </c:if>

      <form action="${pageContext.request.contextPath}/login"
            method="post">

        <div class="mb-3">

          <label for="email" class="form-label">
            Email address
          </label>

          <input type="email"
                 class="form-control"
                 id="email"
                 name="email"
                 required>
        </div>

        <div class="mb-4">

          <label for="password" class="form-label">
            Password
          </label>

          <input type="password"
                 class="form-control"
                 id="password"
                 name="password"
                 required>
        </div>

        <button type="submit"
                class="btn btn-primary w-100">
          Sign In
        </button>

      </form>

    </div>

  </div>

</div>

</body>
</html>