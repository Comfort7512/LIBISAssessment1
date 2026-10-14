<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">

  <title>Book Catalogue - LIBIS</title>

  <link rel="stylesheet"
        href="${pageContext.request.contextPath}/bootstrap-5.0.2-dist/css/bootstrap.min.css">

  <style>
    body {
      background-color: #f8f9fa;
    }

    .navbar-brand {
      letter-spacing: 0.3px;
    }

    .page-header {
      background: linear-gradient(135deg, #2563eb, #1d4ed8);
      color: white;
      border-radius: 16px;
    }

    .catalogue-card {
      border: none;
      border-radius: 16px;
      overflow: hidden;
    }

    .table thead th {
      background-color: #f1f5f9;
      color: #374151;
      font-size: 0.85rem;
      text-transform: uppercase;
      letter-spacing: 0.5px;
      border-bottom: none;
    }

    .table tbody tr {
      vertical-align: middle;
    }

    .table tbody tr:hover {
      background-color: #f8fafc;
    }

    .book-number {
      width: 60px;
      color: #6b7280;
      font-weight: 600;
    }

    .book-title {
      font-weight: 600;
      color: #111827;
    }

    .welcome-text {
      color: #6b7280;
    }
  </style>
</head>

<body>

<!-- Navigation -->
<nav class="navbar navbar-light bg-white shadow-sm">

  <div class="container py-2">

    <a class="navbar-brand fw-bold text-primary"
       href="${pageContext.request.contextPath}/catalogue">
      LIBIS
    </a>

    <div class="d-flex align-items-center">

            <span class="welcome-text me-3">
                Welcome,
                <strong class="text-dark">
                    <c:out value="${username}"/>
                </strong>
            </span>

      <a class="btn btn-outline-danger btn-sm"
         href="${pageContext.request.contextPath}/logout">
        Logout
      </a>

    </div>

  </div>

</nav>

<!-- Main content -->
<div class="container py-5">

  <!-- Page header -->
  <div class="page-header p-4 p-md-5 mb-4 shadow-sm">

    <div class="row align-items-center">

      <div class="col-md-8">

        <p class="mb-2 text-white-50 fw-semibold">
          LIBRARY MANAGEMENT SYSTEM
        </p>

        <h1 class="display-6 fw-bold mb-2">
          Book Catalogue
        </h1>

        <p class="mb-0 text-white-50">
          Browse the books currently available in our library.
        </p>

      </div>

      <div class="col-md-4 text-md-end mt-4 mt-md-0">

        <div class="bg-white text-primary d-inline-block
                            rounded-3 px-4 py-3 shadow-sm">

          <div class="small text-muted">
            Books displayed
          </div>

          <div class="fs-3 fw-bold">
            <c:out value="${books.size()}"/>
          </div>

        </div>

      </div>

    </div>

  </div>

  <!-- Search form -->
  <div class="card shadow-sm border-0 mb-4">

    <div class="card-body">

      <form action="${pageContext.request.contextPath}/catalogue"
            method="get"
            class="row g-2">

        <div class="col-md-10">

          <label for="search" class="visually-hidden">
            Search by book title
          </label>

          <input type="text"
                 id="search"
                 name="search"
                 class="form-control"
                 placeholder="Search by book title..."
                 value="<c:out value='${searchTerm}'/>">

        </div>

        <div class="col-md-2">

          <button type="submit"
                  class="btn btn-primary w-100">
            Search
          </button>

        </div>

      </form>

      <c:if test="${not empty searchTerm}">

        <p class="text-muted small mt-3 mb-0">
          Search results for:
          <strong><c:out value="${searchTerm}"/></strong>

          &middot;

          <a href="${pageContext.request.contextPath}/catalogue">
            Clear search
          </a>
        </p>

      </c:if>

    </div>

  </div>

  <!-- Catalogue table -->
  <div class="card catalogue-card shadow-sm">

    <div class="card-body p-0">

      <div class="table-responsive">

        <table class="table table-hover mb-0">

          <thead>
          <tr>
            <th class="book-number">#</th>
            <th>Title</th>
            <th>Author</th>
            <th>Genre</th>
            <th class="text-center">Actions</th>
          </tr>
          </thead>

          <tbody>

          <c:choose>

            <c:when test="${not empty books}">

              <c:forEach items="${books}"
                         var="book"
                         varStatus="st">

                <tr>

                  <td class="book-number">
                    <c:out value="${st.count}"/>
                  </td>

                  <td class="book-title">
                    <c:out value="${book.title}"/>
                  </td>

                  <td>
                    <c:out value="${book.author}"/>
                  </td>

                  <td>
                                        <span class="badge bg-light text-dark border">
                                            <c:out value="${book.genre}"/>
                                        </span>
                  </td>

                  <td class="text-center">

                   <span class="badge bg-light text-secondary border me-1">
                        <a href="${pageContext.request.contextPath}/book.jsp?id=${book.bookId}"
                           class="text-decoration-none">
                            View
                        </a>
                    </span>

                    <span class="badge bg-light text-secondary border me-1">
                                            Borrow
                                        </span>

                    <span class="badge bg-light text-secondary border">
                                            Reserve
                                        </span>

                  </td>

                </tr>

              </c:forEach>

            </c:when>

            <c:otherwise>

              <tr>
                <td colspan="5"
                    class="text-center text-muted py-5">

                  No books matched your search.

                </td>
              </tr>

            </c:otherwise>

          </c:choose>

          </tbody>

        </table>

      </div>

    </div>

  </div>

  <!-- Footer -->
  <div class="text-center mt-4 text-muted small">
    Library Information Management System
  </div>

</div>

<script src="${pageContext.request.contextPath}/bootstrap-5.0.2-dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>