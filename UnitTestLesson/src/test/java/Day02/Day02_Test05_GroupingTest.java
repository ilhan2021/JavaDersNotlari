package Day02;

import org.junit.jupiter.api.Nested;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.CsvSource;

import static org.junit.jupiter.api.Assertions.assertEquals;

public class Day02_Test05_GroupingTest {
    //amacımız birbiriyle ilişkili testleri gruplamak
    //aynı sınıfın içinde 2 parametreli test yazarak
    // gruplamak istiyoruz
    @Nested
            //Math class'ının multiplyExact() metodunu, sıfırlı veya sıfırsız
            // parametreler ile test etmek için yazdığım 2 test metodunu
            // @Nested annotation ile grupluyorum
    class MultiplyTest{
        @ParameterizedTest
        @CsvSource(value = {"-12,-4,3","-12,4,-3","12,-4,-3"})
        void testMultiplyWithNonZero(int rs,int x,int y){
            assertEquals(rs,Math.multiplyExact(x,y));
        }
        @ParameterizedTest
        @CsvSource(value = {"0,-4,0","0,4,0","0,0,4"})
        void testMultiplyWithZero(int rs,int x,int y){
            assertEquals(rs,Math.multiplyExact(x,y));
        }
    }
    //birinci grup testin sonu
    @Nested
            //Math class'ının addExact() metodunu, sıfırlı veya sıfırsız
            // parametreler ile test etmek için yazdığım 2 test metodunu
            // @Nested annotation ile grupluyorum
    class AddTest{
        @ParameterizedTest
        @CsvSource(value ={"-1,-4,3","1,4,-3","-7,-4,-3"})
        void testAddWithNonZero(int rs,int x,int y){
            assertEquals(rs,Math.addExact(x,y));
        }
        @ParameterizedTest
        @CsvSource(value ={"9,0,9","2,2,0","4,4,0"})
        void testAddWithZero(int rs,int x,int y){
            assertEquals(rs,Math.addExact(x,y));
        }
    }
    //2.grup test sonu
}
