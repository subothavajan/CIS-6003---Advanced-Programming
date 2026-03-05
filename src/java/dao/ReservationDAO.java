package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import model.Reservation;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.Reservation;

public class ReservationDAO {

    public boolean addReservation(Reservation r) {
        boolean status = false;

        String sql = "INSERT INTO reservations (guest_name, address, contact, room_type, checkin_date, checkout_date, total_bill) "
                + "VALUES (?, ?, ?, ?, ?, ?, ?)";

        try (Connection con = DBConnection.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, r.getGuestName());
            ps.setString(2, r.getAddress());
            ps.setString(3, r.getContact());
            ps.setString(4, r.getRoomType());
            ps.setString(5, r.getCheckinDate());
            ps.setString(6, r.getCheckoutDate());
            ps.setDouble(7, r.getTotalBill());

            int rows = ps.executeUpdate();
            status = rows > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return status;
    }

    public List<Reservation> getAllReservations() {
        List<Reservation> list = new ArrayList<>();
        String sql = "SELECT * FROM reservations ORDER BY reservation_id DESC";

        try (Connection con = DBConnection.getConnection(); PreparedStatement ps = con.prepareStatement(sql); ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Reservation r = new Reservation();
                r.setReservationId(rs.getInt("reservation_id"));
                r.setGuestName(rs.getString("guest_name"));
                r.setAddress(rs.getString("address"));
                r.setContact(rs.getString("contact"));
                r.setRoomType(rs.getString("room_type"));
                r.setCheckinDate(rs.getString("checkin_date"));
                r.setCheckoutDate(rs.getString("checkout_date"));
                r.setTotalBill(rs.getDouble("total_bill"));
                list.add(r);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public boolean deleteReservation(int id) {
        String sql = "DELETE FROM reservations WHERE reservation_id=?";
        try (Connection con = DBConnection.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, id);
            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public Reservation getReservationById(int id) {
        Reservation r = null;
        String sql = "SELECT * FROM reservations WHERE reservation_id=?";

        try (Connection con = DBConnection.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, id);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    r = new Reservation();
                    r.setReservationId(rs.getInt("reservation_id"));
                    r.setGuestName(rs.getString("guest_name"));
                    r.setAddress(rs.getString("address"));
                    r.setContact(rs.getString("contact"));
                    r.setRoomType(rs.getString("room_type"));
                    r.setCheckinDate(rs.getString("checkin_date"));
                    r.setCheckoutDate(rs.getString("checkout_date"));
                    r.setTotalBill(rs.getDouble("total_bill"));
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return r;
    }

    public boolean updateReservation(Reservation r) {
        String sql = "UPDATE reservations SET guest_name=?, address=?, contact=?, room_type=?, checkin_date=?, checkout_date=?, total_bill=? "
                + "WHERE reservation_id=?";

        try (Connection con = DBConnection.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, r.getGuestName());
            ps.setString(2, r.getAddress());
            ps.setString(3, r.getContact());
            ps.setString(4, r.getRoomType());
            ps.setString(5, r.getCheckinDate());
            ps.setString(6, r.getCheckoutDate());
            ps.setDouble(7, r.getTotalBill());
            ps.setInt(8, r.getReservationId());

            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
}
