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
    <title>Dashboard</title>

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
                    <h2 class="mb-1">Dashboard</h2>
                    <div class="text-muted">Room Reservation Management System</div>
                </div>
                <div class="text-end">
                    Logged in as: <b><%=user%></b> |
                    <a href="LogoutServlet">Logout</a>
                </div>
            </div>

            <hr class="my-4">

            <!-- Stats Cards -->
            <div class="row g-3">
                <div class="col-md-4">
                    <div class="card border-0 shadow-sm">
                        <div class="card-body">
                            <div class="d-flex align-items-center justify-content-between">
                                <div>
                                    <div class="text-muted">Total Reservations</div>
                                    <h3 class="mb-0"><%= request.getAttribute("totalReservations") %></h3>
                                </div>
                                <div style="font-size:34px;">
                                    <i class="bi bi-journal-check"></i>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-md-4">
                    <div class="card border-0 shadow-sm">
                        <div class="card-body">
                            <div class="d-flex align-items-center justify-content-between">
                                <div>
                                    <div class="text-muted">Today's Check-ins</div>
                                    <h3 class="mb-0"><%= request.getAttribute("todayCheckins") %></h3>
                                </div>
                                <div style="font-size:34px;">
                                    <i class="bi bi-calendar-check"></i>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-md-4">
                    <div class="card border-0 shadow-sm">
                        <div class="card-body">
                            <div class="d-flex align-items-center justify-content-between">
                                <div>
                                    <div class="text-muted">Total Revenue</div>
                                    <h3 class="mb-0">Rs. <%= request.getAttribute("totalRevenue") %></h3>
                                </div>
                                <div style="font-size:34px;">
                                    <i class="bi bi-cash-coin"></i>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Buttons -->
            <div class="row g-3 mt-4">
                <div class="col-md-4">
                    <a href="addReservation.jsp" class="btn btn-primary btn-lg w-100">
                        <i class="bi bi-plus-circle"></i> Add Reservation
                    </a>
                </div>
                <div class="col-md-4">
                    <a href="ViewReservationServlet" class="btn btn-success btn-lg w-100">
                        <i class="bi bi-table"></i> View Reservations
                    </a>
                </div>
                <div class="col-md-4">
                    <a href="help.jsp" class="btn btn-info btn-lg w-100 text-white">
                        <i class="bi bi-question-circle"></i> Help
                    </a>
                </div>
            </div>

            <div class="text-center text-muted mt-4">
                Welcome! Use the menu above to manage room reservations.
            </div>

        </div>
    </div>

</div>
</body>
</html>