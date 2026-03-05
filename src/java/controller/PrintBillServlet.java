package controller;

import dao.ReservationDAO;
import model.Reservation;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import javax.servlet.RequestDispatcher;

@WebServlet("/printBill")
public class PrintBillServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));

        ReservationDAO dao = new ReservationDAO();
        Reservation r = dao.getReservationById(id);

        request.setAttribute("reservation", r);

        RequestDispatcher rd = request.getRequestDispatcher("bill.jsp");
        rd.forward(request, response);
    }
}