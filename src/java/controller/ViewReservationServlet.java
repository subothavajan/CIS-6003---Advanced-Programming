package controller;

import dao.ReservationDAO;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Reservation;

public class ViewReservationServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        ReservationDAO dao = new ReservationDAO();
        List<Reservation> list = dao.getAllReservations();

        request.setAttribute("reservations", list);
        request.getRequestDispatcher("viewReservations.jsp").forward(request, response);
    }
}