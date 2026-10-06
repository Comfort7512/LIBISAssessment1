<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    ```
    <title>Book Catalogue</title>

    <!-- Local Bootstrap CSS -->
    <link rel="stylesheet" href="bootstrap-5.0.2-dist/css/bootstrap.min.css">

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

        .action-placeholder {
            pointer-events: none;
            opacity: 0.55;
        }

        .welcome-text {
            color: #6b7280;
        }
    </style>
    ```

</head>

<body>

<!-- Navigation -->

<nav class="navbar navbar-light bg-white shadow-sm">
    <div class="container py-2">

        ```
        <a class="navbar-brand fw-bold text-primary" href="#">
            📚 LIBIS
        </a>

        <div class="d-flex align-items-center">
        <span class="welcome-text me-3">
            Welcome,
            <strong class="text-dark">
                <c:out value="${sessionScope.username}"/>
            </strong>
        </span>
        </div>

    </div>
    ```

</nav>

<!-- Main content -->

<div class="container py-5">

    ```
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
                        Books in catalogue
                    </div>

                    <div class="fs-3 fw-bold">
                        ${books.size()}
                    </div>

                </div>
            </div>

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

                    <c:forEach
                            items="${applicationScope.books}"
                            var="book"
                            varStatus="st">

                        <tr>

                            <!-- Number -->
                            <td class="book-number">
                                    ${st.count}
                            </td>

                            <!-- Title -->
                            <td class="book-title">
                                <c:out value="${book.title}"/>
                            </td>

                            <!-- Author -->
                            <td>
                                <c:out value="${book.author}"/>
                            </td>

                            <!-- Genre -->
                            <td>
                            <span class="badge bg-light text-dark border">
                                <c:out value="${book.genre}"/>
                            </span>
                            </td>

                            <!-- Future actions -->
                            <td class="text-center">

                            <span class="badge bg-light text-secondary border action-placeholder me-1">
                                Search
                            </span>

                                <span class="badge bg-light text-secondary border action-placeholder me-1">
                                Borrow
                            </span>

                                <span class="badge bg-light text-secondary border action-placeholder">
                                Reserve
                            </span>

                            </td>

                        </tr>

                    </c:forEach>

                    </tbody>

                </table>

            </div>

        </div>

    </div>

    <!-- Footer note -->
    <div class="text-center mt-4 text-muted small">
        Library Information Management System
    </div>
    ```

</div>

<!-- Local Bootstrap JS -->

<script src="bootstrap-5.0.2-dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
