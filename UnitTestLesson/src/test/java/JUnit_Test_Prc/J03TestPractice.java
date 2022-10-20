package JUnit_Test_Prc;
import org.junit.jupiter.api.*;

import java.util.Arrays;

import static org.junit.jupiter.api.Assertions.*;

public class J03TestPractice {

    @BeforeAll
    static void beforeAll(TestInfo info) {
        System.out.println("info.getDisplayName() = " + info.getDisplayName()+" calisti");
    }
    @AfterAll
    static void afterAll(TestInfo info) {
        System.out.println("info.getDisplayName() = " + info.getDisplayName()+" calisti");
    }
    @Test
     void testArray(TestInfo info){
        String str="hibernate mvc boot junit mongodb";
        String[] actualArr=str.split(" ");
        String[] expextedArr={"hibernate", "mvc" ,"boot", "junit" ,"mongodb"};

        assertArrayEquals(expextedArr, actualArr, " array eslesmediu");
        System.out.println("info.getDisplayName() = " + info.getDisplayName()+" calisti");

    }
        @Test
    void testArray1(TestInfo info) {
        //testini yaptiginiz array in test ismini konsola yazidiriniz
            String str="hibernate mvc boot junit mongodb";
        String []actualArr=str.split(" ");

        String[] expextedArr={"hibernate", "mvc" ,"boot", "junit" ,"mongodb"};
        System.out.println("info.getDisplayName() = " + info.getDisplayName()+" basladi");

        assertTrue(Arrays.equals(actualArr,expextedArr));


    }

}
