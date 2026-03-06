import static org.junit.Assert.assertEquals;
import org.junit.Test;
import model.RoomRateFactory;

public class RoomRateFactoryTest {

    @Test
    public void testSingleRate() {
        assertEquals(5000.0, RoomRateFactory.getRatePerNight("Single"), 0.01);
    }

    @Test
    public void testDoubleRate() {
        assertEquals(8000.0, RoomRateFactory.getRatePerNight("Double"), 0.01);
    }

    @Test
    public void testDeluxeRate() {
        assertEquals(12000.0, RoomRateFactory.getRatePerNight("Deluxe"), 0.01);
    }
}