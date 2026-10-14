<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">

  <title>Book Details</title>

  <link rel="stylesheet"
        href="bootstrap-5.0.2-dist/css/bootstrap.min.css">
</head>

<body class="bg-light">

<div class="container py-5">

  <a href="${pageContext.request.contextPath}/catalogue"
     class="btn btn-outline-primary mb-4">
    Back
  </a>

  <c:set var="found" value="${false}"/>

  <c:forEach items="${applicationScope.books}" var="book">

    <c:if test="${book.bookId == param.id}">

      <c:set var="found" value="${true}"/>

      <div class="card shadow-sm border-0">
        <div class="card-body p-4">

          <h1 class="mb-3">
            <c:out value="${book.title}"/>
          </h1>

          <p>
            <strong>Author:</strong>
            <c:out value="${book.author}"/>
          </p>

          <p>
            <strong>Genre:</strong>
            <c:out value="${book.genre}"/>
          </p>

          <p>
            <strong>Availability:</strong>

            <c:choose>
              <c:when test="${book.available}">
                                <span class="badge bg-success">
                                    Available
                                </span>
              </c:when>

              <c:otherwise>
                                <span class="badge bg-danger">
                                    Not Available
                                </span>
              </c:otherwise>
            </c:choose>
          </p>

          <hr>

          <h4>Synopsis</h4>

          <p class="text-muted">
            <c:out value="${book.synopsis}"/>
          </p>

        </div>
      </div>

    </c:if>

  </c:forEach>

  <c:if test="${not found}">
    <div class="alert alert-warning">
      Book not found.
    </div>
  </c:if>

</div>

</body>
</html>