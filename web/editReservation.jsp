<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="model.Reservation" %>
<%
    Reservation r = (Reservation) request.getAttribute("r");
    if(r == null){
        response.sendRedirect("ViewReservationServlet");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Reservation</title>
    <style>
        body{font-family:Arial;background:#f5f5f5;}
        .card{width:520px;margin:30px auto;background:#fff;padding:20px;border-radius:10px;box-shadow:0 4px 12px rgba(0,0,0,.1);}
        input,select{width:100%;padding:10px;margin:8px 0;border:1px solid #ccc;border-radius:6px;}
        button{width:100%;padding:10px;border:none;border-radius:6px;cursor:pointer;background:#198754;color:#fff;font-weight:bold;}
        a{display:inline-block;margin-top:10px;color:#1f6feb;text-decoration:none;}
    </style>
</head>
<body>
<div class="card">
    <h2>Edit Reservation (ID: <%=r.getReservationId()%>)</h2>

    <form action="UpdateReservationServlet" method="post">
        <input type="hidden" name="reservation_id" value="<%=r.getReservationId()%>" />

        Guest Name:
        <input type="text" name="guest_name" value="<%=r.getGuestName()%>" required />

        Address:
        <input type="text" name="address" value="<%=r.getAddress()%>" required />

        Contact:
        <input type="text" name="contact" value="<%=r.getContact()%>" required />

        Room Type:
        <select name="room_type" required>
            <option value="Single" <%= "Single".equals(r.getRoomType())?"selected":"" %>>Single</option>
            <option value="Double" <%= "Double".equals(r.getRoomType())?"selected":"" %>>Double</option>
            <option value="Deluxe" <%= "Deluxe".equals(r.getRoomType())?"selected":"" %>>Deluxe</option>
        </select>

        Check-in Date:
        <input type="date" name="checkin_date" value="<%=r.getCheckinDate()%>" required />

        Check-out Date:
        <input type="date" name="checkout_date" value="<%=r.getCheckoutDate()%>" required />

        

        <button type="submit">Update Reservation</button>
    </form>

    <a href="ViewReservationServlet">← Back to Reservations</a>
</div>
</body>
</html>