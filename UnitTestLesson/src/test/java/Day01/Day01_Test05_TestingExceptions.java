package Day01;

import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.assertThrows;

public class Day01_Test05_TestingExceptions {
    //test ettiğimiz method beklediğimiz exceptionı fırlattı mı
    @Test
    void testException(){
        String str="Merhaba Dünya";
        assertThrows(NullPointerException.class,()->{
            System.out.println("TestException is run");
            str.length();
        });
    }
    //bölme işlemi için exception kontrolü
    @Test
    void testException2(){
        int sayi1=1;
        int sayi2=0;
        //parenti de yazılabilir : RuntimeException
        assertThrows(ArithmeticException.class,()->{
            System.out.println(sayi1/sayi2);
        });
    }

    @Test
    void testException3(){
        int sayi1=1;
        int sayi2=0;
        assertThrows(ArithmeticException.class,()->{
            divide(sayi1,sayi2);
        });
    }

    private int divide(int a,int b){
        return a/b;
    }
}
