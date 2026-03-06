import static org.junit.Assert.assertEquals;
import org.junit.Test;
import service.BillingService;

public class BillingServiceTest {

    @Test
    public void testSingleRoomOneNight() {

        double expected = 5000.0;

        double actual = BillingService.calculateTotalBill(
                "Single",
                "2026-03-05",
                "2026-03-06"
        );

        assertEquals(expected, actual, 0.01);
    }

    @Test
    public void testDoubleRoomTwoNights() {

        double expected = 16000.0;

        double actual = BillingService.calculateTotalBill(
                "Double",
                "2026-03-05",
                "2026-03-07"
        );

        assertEquals(expected, actual, 0.01);
    }

    @Test
    public void testDeluxeRoomThreeNights() {

        double expected = 36000.0;

        double actual = BillingService.calculateTotalBill(
                "Deluxe",
                "2026-03-05",
                "2026-03-08"
        );

        assertEquals(expected, actual, 0.01);
    }

    @Test
    public void testInvalidDateRange() {

        double expected = 0.0;

        double actual = BillingService.calculateTotalBill(
                "Single",
                "2026-03-07",
                "2026-03-05"
        );

        assertEquals(expected, actual, 0.01);
    }
}