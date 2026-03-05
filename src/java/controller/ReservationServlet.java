package controller;

import dao.ReservationDAO;
import java.io.IOException;
import java.time.LocalDate;
import java.time.temporal.ChronoUnit;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Reservation;

public class ReservationServlet extends HttpServlet {

    private double getRoomRate(String roomType) {
        switch (roomType) {
            case "Single": return 5000;
            case "Double": return 8000;
            case "Deluxe": return 12000;
            default: return 5000;
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect(request.getContextPath() + "/addReservation.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String base = request.getContextPath();

        try {
            String guestName = request.getParameter("guest_name");
            String address = request.getParameter("address");
            String contact = request.getParameter("contact");
            String roomType = request.getParameter("room_type");
            String checkinDate = request.getParameter("checkin_date");
            String checkoutDate = request.getParameter("checkout_date");

            // Calculate nights
            LocalDate inDate = LocalDate.parse(checkinDate);
            LocalDate outDate = LocalDate.parse(checkoutDate);

            long nights = ChronoUnit.DAYS.between(inDate, outDate);
            if (nights <= 0) {
                response.sendRedirect(base + "/addReservation.jsp?msg=Check-out must be after check-in");
                return;
            }

            double rate = getRoomRate(roomType);
            double totalBill = nights * rate;

            Reservation r = new Reservation(guestName, address, contact, roomType, checkinDate, checkoutDate, totalBill);

            ReservationDAO dao = new ReservationDAO();
            boolean ok = dao.addReservation(r);

            if (ok) {
                response.sendRedirect(base + "/addReservation.jsp?msg=Saved  Total Bill: " + totalBill);
            } else {
                response.sendRedirect(base + "/addReservation.jsp?msg=Failed to save reservation");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect(base + "/addReservation.jsp?msg=Error occurred");
        }
    }
}