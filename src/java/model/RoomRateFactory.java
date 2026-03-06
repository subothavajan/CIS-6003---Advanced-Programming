package model;

public class RoomRateFactory {

    private RoomRateFactory() {}

    public static double getRatePerNight(String roomType) {
        if (roomType == null) return 0;

        switch (roomType) {
            case "Single":
                return 5000.0;
            case "Double":
                return 8000.0;
            case "Deluxe":
                return 12000.0; // choose ONE rate and keep same everywhere
            default:
                return 5000.0;
        }
    }
}