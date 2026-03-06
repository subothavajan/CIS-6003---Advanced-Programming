package service;

import java.time.LocalDate;
import java.time.temporal.ChronoUnit;
import model.RoomRateFactory;

public class BillingService {

    private BillingService() {}

    public static long calculateNights(String checkinDate, String checkoutDate) {
        LocalDate inDate = LocalDate.parse(checkinDate);
        LocalDate outDate = LocalDate.parse(checkoutDate);

        long nights = ChronoUnit.DAYS.between(inDate, outDate);

        // must be at least 1 night
        if (nights <= 0) return 0;
        return nights;
    }

    public static double calculateTotalBill(String roomType, String checkinDate, String checkoutDate) {
        long nights = calculateNights(checkinDate, checkoutDate);
        if (nights <= 0) return 0;

        double rate = RoomRateFactory.getRatePerNight(roomType);
        return nights * rate;
    }
}