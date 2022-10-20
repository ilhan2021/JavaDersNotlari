package Day02;

import org.junit.jupiter.api.RepeatedTest;

import java.util.Random;

import static org.junit.jupiter.api.Assertions.assertEquals;

public class Day02_Test03_RepeatMultipleTimes {
    //testi tekrarlatmak istersem
    @RepeatedTest(5)
    void testSubstring(){
        assertEquals("Java is an OOP language".substring(0,4),"Java");
        System.out.println("Test çalıştı");
    }
    //2.örnek
    //@Disabled
    // harhangi bir testi disable etmek istersek @Disable annotationı ilgili test metodunun
    // üzerine yazmamız yeterli
    @RepeatedTest(3)
    void testRepeated(){
        assertEquals(2,Math.addExact(1,1));
        System.out.println("Çalıştı");
    }
    //3.örnek
    Random rm=new Random();
    @RepeatedTest(5)
    void testMathExact(){
        int sayi1=rm.nextInt(10);
        int sayi2=rm.nextInt(10);
        assertEquals(sayi1+sayi2,Math.addExact(sayi1,sayi2));
        System.out.println("sayı1 : "+sayi1+" sayı2 : "+sayi2);
    }
}
