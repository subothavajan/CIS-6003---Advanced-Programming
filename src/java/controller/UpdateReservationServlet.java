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

public class UpdateReservationServlet extends HttpServlet {

    private double getRoomRate(String roomType) {
        switch (roomType) {
            case "Single": return 5000;
            case "Double": return 8000;
            case "Deluxe": return 12000;
            default: return 5000;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String base = request.getContextPath();

        try {
            int id = Integer.parseInt(request.getParameter("reservation_id"));
            String guestName = request.getParameter("guest_name");
            String address = request.getParameter("address");
            String contact = request.getParameter("contact");
            String roomType = request.getParameter("room_type");
            String checkinDate = request.getParameter("checkin_date");
            String checkoutDate = request.getParameter("checkout_date");

            LocalDate inDate = LocalDate.parse(checkinDate);
            LocalDate outDate = LocalDate.parse(checkoutDate);
            long nights = ChronoUnit.DAYS.between(inDate, outDate);

            if (nights <= 0) {
                response.sendRedirect(base + "/EditReservationServlet?id=" + id);
                return;
            }

            double totalBill = nights * getRoomRate(roomType);

            Reservation r = new Reservation(guestName, address, contact, roomType, checkinDate, checkoutDate, totalBill);
            r.setReservationId(id);

            ReservationDAO dao = new ReservationDAO();
            dao.updateReservation(r);

            response.sendRedirect(base + "/ViewReservationServlet");

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect(base + "/ViewReservationServlet");
        }
    }
}