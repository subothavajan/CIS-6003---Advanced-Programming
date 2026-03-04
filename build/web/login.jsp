<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Hotel Reservation - Login</title>

    <!-- Bootstrap -->
    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">

    <!-- Bootstrap Icons -->
    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css">
</head>

<body style="background:#f5f5f5;">

<div class="container py-5" style="max-width: 520px;">

    <div class="card shadow-lg border-0">
        <div class="card-body p-4">

            <div class="text-center mb-3">
                <div style="font-size:48px;">
                    <i class="bi bi-building"></i>
                </div>
                <h2 class="mb-1">Hotel Reservation</h2>
                <div class="text-muted">Please login to continue</div>
            </div>

            <%
                String err = request.getParameter("error");
                if(err != null){
            %>
                <div class="alert alert-danger">
                    <i class="bi bi-exclamation-triangle"></i>
                    Invalid username or password
                </div>
            <% } %>

            <form action="LoginServlet" method="post">

                <div class="mb-3">
                    <label class="form-label">Username</label>
                    <div class="input-group">
                        <span class="input-group-text"><i class="bi bi-person"></i></span>
                        <input type="text" name="username" class="form-control" placeholder="Enter username" required>
                    </div>
                </div>

                <div class="mb-3">
                    <label class="form-label">Password</label>
                    <div class="input-group">
                        <span class="input-group-text"><i class="bi bi-lock"></i></span>
                        <input type="password" name="password" class="form-control" placeholder="Enter password" required>
                    </div>
                </div>

                <div class="d-grid mt-4">
                    <button class="btn btn-primary btn-lg">
                        <i class="bi bi-box-arrow-in-right"></i> Login
                    </button>
                </div>

            </form>


        </div>
    </div>

    <div class="text-center text-muted mt-3" style="font-size: 12px;">
        Room Reservation System • CIS6003 Advanced Programming
    </div>

</div>

</body>
</html>