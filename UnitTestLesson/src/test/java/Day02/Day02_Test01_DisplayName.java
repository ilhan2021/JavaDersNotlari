package Day02;

import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.assertThrows;

public class Day02_Test01_DisplayName {
    @Test
    @DisplayName("Test parseInt() to check if it is throwing for non-digit value")
    void testException(){
        String str="Merhaba";
        assertThrows(NumberFormatException.class,()->{
            Integer.parseInt(str);
        });
    }
}
