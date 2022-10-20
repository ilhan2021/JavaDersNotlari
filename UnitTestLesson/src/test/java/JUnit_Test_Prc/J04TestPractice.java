package JUnit_Test_Prc;

import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.assertThrows;

public class J04TestPractice {
    //Test ettğimiz kodun bizim beklediğimiz excetionu fırlattı mı test örneği gosteriniz?

    @Test
    @DisplayName("test exception hata filatma si kontrol ediliyor")
    void testException(){
        String str="Java";

        assertThrows(NumberFormatException.class, ()->{
            Integer.valueOf(str);
        });
    }

    @Test
    @DisplayName("test exception sifira bolunme kontrol ediliyor")
    void testException1(){
        int x=21;
        int y=0;
        assertThrows(ArithmeticException.class, ()-> bolumIslem(x,y));


    }

    private int bolumIslem(int x, int y) {
        return x/y;

    }
    @Test
    @DisplayName(" testException2  DisplayName ile verildi")
    void testException2(){
        int age=15;
        assertThrows(IllegalArgumentException.class,() -> checkAge(age) );


    }

    private void checkAge(int age) {//sart ile belirlenen bir age in test i yapildi
        if (age<0){
            throw new IllegalArgumentException();
        }else{
            System.out.println(age);
        }


    }


}