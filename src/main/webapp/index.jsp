<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>

<html lang="en">

<head>

    ```
    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>LIBIS - Library Information Management System</title>

    <!-- Local Bootstrap CSS -->
    <link rel="stylesheet"
          href="bootstrap-5.0.2-dist/css/bootstrap.min.css">

    <style>

        body {
            background-color: #f8f9fa;
        }

        .hero {
            min-height: calc(100vh - 72px);
            background: linear-gradient(135deg, #2563eb, #1d4ed8);
        }

        .hero-card {
            background: rgba(255, 255, 255, 0.1);
            border: 1px solid rgba(255, 255, 255, 0.2);
            border-radius: 20px;
            backdrop-filter: blur(10px);
        }

        .library-icon {
            font-size: 4rem;
        }

        .btn-light {
            color: #2563eb;
        }

        .feature-card {
            border: none;
            border-radius: 16px;
        }

    </style>
    ```

</head>

<body>

<!-- Navigation -->

<nav class="navbar navbar-expand-lg navbar-light bg-white shadow-sm">

    ```
    <div class="container">

        <a class="navbar-brand fw-bold text-primary fs-4"
           href="index.jsp">

            📚 LIBIS

        </a>

        <a href="login.jsp"
           class="btn btn-primary">

            Log In

        </a>

    </div>
    ```

</nav>

<!-- Hero section -->

<section class="hero d-flex align-items-center text-white">

    ```
    <div class="container">

        <div class="row align-items-center">

            <!-- Left side -->
            <div class="col-lg-7">

                <div class="library-icon mb-3">
                    📚
                </div>

                <p class="fw-semibold text-white-50 mb-2">
                    LIBRARY INFORMATION MANAGEMENT SYSTEM
                </p>

                <h1 class="display-3 fw-bold mb-4">
                    Welcome to our Library
                </h1>

                <p class="lead text-white-50 mb-4"
                   style="max-width: 600px;">

                    Discover and explore our collection of books
                    through a simple and easy-to-use library system.

                </p>

                <div class="d-flex gap-3 flex-wrap">

                    <a href="login.jsp"
                       class="btn btn-light btn-lg px-4 fw-semibold">

                        Log In to Catalogue

                    </a>

                </div>

            </div>


            <!-- Right side -->
            <div class="col-lg-5 mt-5 mt-lg-0">

                <div class="hero-card p-4 p-md-5 shadow-lg">

                    <h3 class="fw-bold mb-3">
                        📖 Explore Our Collection
                    </h3>

                    <p class="text-white-50 mb-4">
                        Log in to access the library book catalogue
                        and view available books.
                    </p>

                    <div class="d-flex align-items-center mb-3">

                        <div class="fs-3 me-3">
                            🔎
                        </div>

                        <div>
                            <h6 class="mb-1 fw-bold">
                                Browse Books
                            </h6>

                            <small class="text-white-50">
                                Explore books in the catalogue
                            </small>
                        </div>

                    </div>


                    <div class="d-flex align-items-center mb-3">

                        <div class="fs-3 me-3">
                            📚
                        </div>

                        <div>
                            <h6 class="mb-1 fw-bold">
                                View Information
                            </h6>

                            <small class="text-white-50">
                                See titles, authors and genres
                            </small>
                        </div>

                    </div>


                    <div class="d-flex align-items-center">

                        <div class="fs-3 me-3">
                            🔐
                        </div>

                        <div>
                            <h6 class="mb-1 fw-bold">
                                Secure Access
                            </h6>

                            <small class="text-white-50">
                                Log in to access the catalogue
                            </small>
                        </div>

                    </div>

                </div>

            </div>

        </div>

    </div>
    ```

</section>

<!-- Footer -->

<footer class="bg-white py-3">

    ```
    <div class="container text-center">

        <small class="text-muted">
            © 2026 Library Information Management System
        </small>

    </div>
    ```

</footer>

<!-- Local Bootstrap JS -->

<script src="bootstrap-5.0.2-dist/js/bootstrap.bundle.min.js"></script>

</body>

</html>
