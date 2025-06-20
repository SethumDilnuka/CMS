<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <title>Complaint Management - Login</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Google Fonts: Inter -->
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">

    <style>
        body {
            font-family: 'Inter', sans-serif;
            background: #fff;
            height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0;
            padding: 15px;
            color: #000;
        }

        .login-card {
            width: 100%;
            max-width: 400px;
            background: #fff;
            border-radius: 12px;
            box-shadow: 0 0 20px rgba(0,0,0,0.1);
            padding: 40px 30px;
            transition: box-shadow 0.3s ease;
            border: 1px solid #000;
        }

        .login-card:hover {
            box-shadow: 0 0 30px rgba(0,0,0,0.3);
        }

        .card-header-title {
            font-weight: 700;
            font-size: 1.8rem;
            margin-bottom: 8px;
            color: #000;
        }

        .form-label {
            font-weight: 600;
            color: #000;
        }

        .form-control {
            background-color: #fff;
            border: 1.5px solid #000;
            border-radius: 8px;
            color: #000;
        }

        .form-control:focus {
            border-color: #444;
            box-shadow: none;
            background-color: #fff;
            color: #000;
        }

        .btn-primary {
            background-color: #000;
            border: none;
            font-weight: 600;
            padding: 12px;
            border-radius: 8px;
            transition: background-color 0.25s ease;
            color: #fff;
        }

        .btn-primary:hover {
            background-color: #333;
            color: #fff;
        }

        .text-muted {
            font-weight: 400;
            color: #444;
        }

        .alert {
            font-size: 0.9rem;
            border-radius: 8px;
        }

        a {
            color: #000;
            text-decoration: none;
            font-weight: 600;
        }

        a:hover {
            text-decoration: underline;
            color: #444;
        }

        /* Responsive for smaller devices */
        @media (max-width: 480px) {
            .login-card {
                padding: 30px 20px;
            }
        }
    </style>
</head>
<body>

<div class="login-card shadow-sm">
    <div class="text-center mb-4">
        <h2 class="card-header-title">Complaint Management</h2>
        <p class="text-muted">Login to continue</p>
    </div>

    <form action="login" method="post" novalidate>
        <div class="mb-3">
            <label for="username" class="form-label">Username</label>
            <input
                    type="text"
                    class="form-control"
                    id="username"
                    name="username"
                    placeholder="Enter your username"
                    required
                    autofocus
            >
        </div>

        <div class="mb-4">
            <label for="password" class="form-label">Password</label>
            <input
                    type="password"
                    class="form-control"
                    id="password"
                    name="password"
                    placeholder="Enter your password"
                    required
            >
        </div>

        <div class="d-grid mb-3">
            <button type="submit" class="btn btn-primary">Login</button>
        </div>
    </form>

    <% if ("true".equals(request.getParameter("success"))) { %>
    <div class="alert alert-success text-center" role="alert" style="color: black; background-color: #d4edda; border-color: #c3e6cb;">
        Registration successful! Please login.
    </div>
    <% } %>

    <% String errorMessage = (String) request.getAttribute("errorMessage");
        if (errorMessage != null) { %>
    <div class="alert alert-danger text-center" role="alert" style="color: black; background-color: #f8d7da; border-color: #f5c6cb;">
        <%= errorMessage %>
    </div>
    <% } %>

    <div class="text-center mt-3">
        <p>Don't have an account? <a href="signup.jsp">Sign Up</a></p>
    </div>
</div>

</body>
</html>
