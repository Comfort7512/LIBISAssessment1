<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Log in to view</title>

    ```
    <!-- Local Bootstrap CSS -->
    <link rel="stylesheet" href="bootstrap-5.0.2-dist/css/bootstrap.min.css">
    ```

</head>


<body class="bg-light">

<div class="container min-vh-100 d-flex align-items-center justify-content-center">

    ```
    <div class="card shadow border-0 rounded-4" style="max-width: 430px; width: 100%;">

        <div class="card-body p-4 p-md-5">

            <div class="text-center mb-4">
                <h2 class="fw-bold">Welcome Back</h2>
                <p class="text-muted">
                    Log in to view member information
                </p>
            </div>

            <form method="post" action="member-validate">

                <div class="mb-3">
                    <label for="email" class="form-label fw-semibold">
                        Email address
                    </label>

                    <input
                            type="email"
                            name="email"
                            id="email"
                            class="form-control form-control-lg"
                            placeholder="Enter your email"
                            required>
                </div>

                <div class="mb-4">
                    <label for="password" class="form-label fw-semibold">
                        Password
                    </label>

                    <input
                            type="password"
                            name="password"
                            id="password"
                            class="form-control form-control-lg"
                            placeholder="Enter your password"
                            required>
                </div>

                <div class="d-grid">
                    <button type="submit" class="btn btn-primary btn-lg">
                        Log In
                    </button>
                </div>

            </form>

        </div>

    </div>
    ```

</div>

<!-- Local Bootstrap JS -->

<script src="bootstrap-5.0.2-dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
