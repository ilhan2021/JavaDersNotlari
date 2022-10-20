package JUnit_Test_Prc;

import org.junit.jupiter.api.Nested;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.CsvSource;

import static org.junit.jupiter.api.Assertions.assertEquals;

public class J06TestPractice {

    @Nested
    class nestedTest{
        @ParameterizedTest
        @CsvSource(value={"27,9,3" ,"-21,-7,3"})
        //methoda ParameterizedTest annotu araciligi ile bu parametreli value olarak veriri
        void carpSonuc(int sonuc,int x, int y){
            assertEquals(sonuc,Math.multiplyExact(x,y));
        }
        @ParameterizedTest
        @CsvSource(value={"0,9,0" ,"0,-7,0"})
        void sonucSifir(int sonuc,int x, int y){
            assertEquals(sonuc,Math.multiplyExact(x,y));
        }

    }



}
