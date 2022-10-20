package Day02;

import org.junit.jupiter.api.Test;

import java.time.Duration;
import java.util.stream.IntStream;

import static org.junit.jupiter.api.Assertions.assertTimeout;

public class Day02_Test04_PerformansTest {
    @Test
    void testPrintPerformans(){
        assertTimeout(Duration.ofSeconds(3),
                ()-> IntStream.rangeClosed(1,100000).forEach(System.out::println));
    }
    //2.örnek
    @Test
    void testPrintPerformans2(){
        assertTimeout(Duration.ofSeconds(1),
                ()->IntStream.rangeClosed(1,50000).reduce((x,y)->Math.addExact(x,y)));
    }
    //bunu nerede kullanırız?
    //mesela task olarak verdiğimiz sorunu çözümü için yazılan
    //kodun max 2 saniye içinde ekrana sonucu vermesini istiyorsak
    //performans testlerini uygularız
}
