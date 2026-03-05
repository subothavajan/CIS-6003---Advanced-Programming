<%@ page contentType="text/html;charset=UTF-8" %>
<%
    String user = (String) session.getAttribute("username");
    if(user == null){
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Help</title>

    <!-- Bootstrap -->
    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">

    <!-- Bootstrap Icons -->
    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css">
</head>

<body style="background:#f5f5f5;">

<div class="container py-5">

    <div class="card shadow-lg border-0">
        <div class="card-body p-4">

            <div class="d-flex justify-content-between align-items-center">
                <div>
                    <h2 class="mb-1"><i class="bi bi-question-circle"></i> Help & User Guide</h2>
                    <div class="text-muted">How to use the Room Reservation System</div>
                </div>
                <div class="text-end">
                    Logged in as: <b><%=user%></b> |
                    <a href="LogoutServlet">Logout</a>
                </div>
            </div>

            <hr class="my-4">

            <div class="alert alert-info">
                <i class="bi bi-info-circle"></i>
                Follow these steps to manage reservations easily.
            </div>

            <div class="row g-3">

                <div class="col-md-6">
                    <div class="card border-0 shadow-sm h-100">
                        <div class="card-body">
                            <h5><i class="bi bi-box-arrow-in-right"></i> 1) Login</h5>
                            <p class="text-muted mb-0">
                                Enter your username & password to access the system.
                            </p>
                        </div>
                    </div>
                </div>

                <div class="col-md-6">
                    <div class="card border-0 shadow-sm h-100">
                        <div class="card-body">
                            <h5><i class="bi bi-speedometer2"></i> 2) Dashboard</h5>
                            <p class="text-muted mb-0">
                                Use the dashboard buttons to navigate: Add, View, Help.
                            </p>
                        </div>
                    </div>
                </div>

                <div class="col-md-6">
                    <div class="card border-0 shadow-sm h-100">
                        <div class="card-body">
                            <h5><i class="bi bi-plus-circle"></i> 3) Add Reservation</h5>
                            <p class="text-muted mb-0">
                                Fill guest details and dates. Total bill is auto-calculated.
                            </p>
                        </div>
                    </div>
                </div>

                <div class="col-md-6">
                    <div class="card border-0 shadow-sm h-100">
                        <div class="card-body">
                            <h5><i class="bi bi-table"></i> 4) View Reservations</h5>
                            <p class="text-muted mb-0">
                                View all bookings in a table with edit and delete options.
                            </p>
                        </div>
                    </div>
                </div>

                <div class="col-md-6">
                    <div class="card border-0 shadow-sm h-100">
                        <div class="card-body">
                            <h5><i class="bi bi-pencil-square"></i> 5) Edit / Update</h5>
                            <p class="text-muted mb-0">
                                Update reservation details. Bill recalculates automatically.
                            </p>
                        </div>
                    </div>
                </div>

                <div class="col-md-6">
                    <div class="card border-0 shadow-sm h-100">
                        <div class="card-body">
                            <h5><i class="bi bi-trash3"></i> 6) Delete</h5>
                            <p class="text-muted mb-0">
                                Delete incorrect reservations using the delete button.
                            </p>
                        </div>
                    </div>
                </div>

            </div>

            <div class="d-flex justify-content-between align-items-center mt-4">
                <a class="btn btn-outline-primary" href="DashboardServlet">
                    <i class="bi bi-arrow-left"></i> Back to Dashboard
                </a>

                <span class="text-muted">Room Reservation System • Help Page</span>
            </div>

        </div>
    </div>

</div>

</body>
</html>