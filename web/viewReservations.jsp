<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="model.Reservation" %>
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
    <title>View Reservations</title>

    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">
    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css">

</head>

<body style="background:#f5f5f5;">

<div class="container py-5">

    <div class="card shadow-lg border-0">
        <div class="card-body p-4">

            <div class="d-flex justify-content-between align-items-center">
                <div>
                    <h2 class="mb-1"><i class="bi bi-table"></i> All Reservations</h2>
                    <div class="text-muted">View, Edit or Delete reservations</div>
                </div>
                <div class="text-end">
                    Logged in as: <b><%=user%></b> |
                    <a href="LogoutServlet">Logout</a>
                </div>
            </div>

            <hr class="my-4">

            <div class="d-flex justify-content-between mb-3">
                <a class="btn btn-outline-primary" href="DashboardServlet">
                    <i class="bi bi-arrow-left"></i> Back to Dashboard
                </a>
                <a class="btn btn-primary" href="addReservation.jsp">
                    <i class="bi bi-plus-circle"></i> Add Reservation
                </a>
            </div>

            <div class="table-responsive">
                <table class="table table-striped table-hover align-middle">
                    <thead class="table-primary">
                        <tr>
                            <th>ID</th>
                            <th>Guest</th>
                            <th>Address</th>
                            <th>Contact</th>
                            <th>Room</th>
                            <th>Check-in</th>
                            <th>Check-out</th>
                            <th>Bill (Rs.)</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                    <%
                        List<Reservation> list = (List<Reservation>) request.getAttribute("reservations");
                        if(list != null){
                            for(Reservation r : list){
                                String badge = "bg-secondary";
                                if("Single".equals(r.getRoomType())) badge = "bg-info";
                                else if("Double".equals(r.getRoomType())) badge = "bg-warning text-dark";
                                else if("Deluxe".equals(r.getRoomType())) badge = "bg-success";
                    %>
                        <tr>
                            <td><%=r.getReservationId()%></td>
                            <td><%=r.getGuestName()%></td>
                            <td><%=r.getAddress()%></td>
                            <td><%=r.getContact()%></td>
                            <td><span class="badge <%=badge%>"><%=r.getRoomType()%></span></td>
                            <td><%=r.getCheckinDate()%></td>
                            <td><%=r.getCheckoutDate()%></td>
                            <td><b><%=r.getTotalBill()%></b></td>
                            <td>
                                <a class="btn btn-sm btn-primary"
                                   href="EditReservationServlet?id=<%=r.getReservationId()%>">
                                   <i class="bi bi-pencil-square"></i> Edit
                                </a>

                                <a class="btn btn-sm btn-danger"
                                   href="DeleteReservationServlet?id=<%=r.getReservationId()%>"
                                   onclick="return confirm('Delete this reservation?');">
                                   <i class="bi bi-trash3"></i> Delete
                                </a>
                            </td>
                        </tr>
                    <%
                            }
                        }
                    %>
                    </tbody>
                </table>
            </div>

            <div class="text-center text-muted mt-3">
                Room Reservation System • Reservations List
            </div>

        </div>
    </div>

</div>

</body>
</html>