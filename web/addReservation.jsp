<%@ page contentType="text/html;charset=UTF-8" %>
<%
    String user = (String) session.getAttribute("username");
    if (user == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <title>Add Reservation</title>

        <link rel="stylesheet"
              href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">
        <link rel="stylesheet"
              href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css">
    </head>

    <body style="background:#f5f5f5;">

        <div class="container py-5" style="max-width: 850px;">

            <div class="card shadow-lg border-0">
                <div class="card-body p-4">

                    <div class="d-flex justify-content-between align-items-center">
                        <div>
                            <h2 class="mb-1"><i class="bi bi-plus-circle"></i> Add Room Reservation</h2>
                            <div class="text-muted">Fill guest details and booking dates</div>
                        </div>
                        <div class="text-end">
                            Logged in as: <b><%=user%></b> |
                            <a href="LogoutServlet">Logout</a>
                        </div>
                    </div>

                    <hr class="my-4">

                    <%
                        String msg = request.getParameter("msg");
                        if (msg != null) {
                    %>
                    <div class="alert alert-info">
                        <i class="bi bi-info-circle"></i> <%=msg%>
                    </div>
                    <% }%>

                    <div class="alert alert-warning">
                        <i class="bi bi-calculator"></i>
                        Bill will be calculated automatically based on room type and nights.
                    </div>

                    <form action="ReservationServlet" method="post">

                        <div class="row g-3">
                            <div class="col-md-6">
                                <label class="form-label">Guest Name</label>
                                <input type="text" name="guest_name" class="form-control" placeholder="e.g., John" required>
                            </div>

                            <div class="col-md-6">
                                <label class="form-label">Contact</label>
                                <input type="text" name="contact" class="form-control" placeholder="e.g., 076xxxxxxx" required>
                            </div>

                            <div class="col-12">
                                <label class="form-label">Address</label>
                                <input type="text" name="address" class="form-control" placeholder="e.g., Colombo" required>
                            </div>

                            <div class="col-md-6">
                                <label class="form-label">Room Type</label>
                                <select name="room_type" class="form-select" required>
                                    <option value="Single">Single</option>
                                    <option value="Double">Double</option>
                                    <option value="Deluxe">Deluxe</option>
                                </select>
                            </div>

                            <div class="col-md-6">
                                <label class="form-label">Check-in Date</label>
                                <input type="date" name="checkin_date" class="form-control" required>
                            </div>

                            <div class="col-md-6">
                                <label class="form-label">Check-out Date</label>
                                <input type="date" name="checkout_date" class="form-control" required>
                            </div>
                        </div>

                        <div class="d-grid mt-4">
                            <button class="btn btn-primary btn-lg">
                                <i class="bi bi-save"></i> Save Reservation
                            </button>
                        </div>

                    </form>

                    <div class="d-flex justify-content-between align-items-center mt-4">
                        <a class="btn btn-outline-primary" href="DashboardServlet">
                            <i class="bi bi-arrow-left"></i> Back to Dashboard
                        </a>
                        <a class="btn btn-outline-success" href="ViewReservationServlet">
                            <i class="bi bi-table"></i> View Reservations
                        </a>
                    </div>

                </div>
            </div>

        </div>

    </body>
</html>