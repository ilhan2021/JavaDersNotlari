package JUnit_Test_Prc;

import org.junit.jupiter.api.Test;

import java.util.Arrays;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertTrue;

public class J01TestPractice {

    //task length i test eden test method yaziniz


    @Test
    void testLength(){
        int actualLength="Merhaba".length();
        int expectedLength=7;
        // assertEquals(expectedLength,actualLength);
        assertEquals(expectedLength,actualLength,"test gecmedi");

        //assertTrue
        //assertFalse

    }

    @Test
    void testUpperCase(){
        String actualValue="Merhaba".toUpperCase();//MERHABA
        String expectedValue="MERHABA";
        assertEquals(expectedValue,actualValue,"test gecmedi");

    }
    //task contains methodu ile test yaziniz
    @Test
    void testContainsMethod(){
        assertEquals(false,"Junit".contains("z"));

    }
    @Test
    void testFindMin(){
        assertEquals(15.8,Math.min(15.8, 25.6));

    }
    //task string bir objeyi array a cavirip string in yeni cretate ettiginiz
    // array ile uyusup uyusmadigini kontrol ediniz
    @Test
    void testArray(){
        String str="hibernate mvc boot junit mongodb";
        String[] actualArr=str.split(" ");
        String[] expextedArr={"hibernate", "mvc" ,"boot", "junit" ,"mongodb"};

        assertTrue(Arrays.equals(expextedArr, actualArr));


    }



}