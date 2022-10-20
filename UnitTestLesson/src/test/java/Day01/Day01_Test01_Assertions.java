package Day01;

import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.assertEquals;

public class Day01_Test01_Assertions {

    @Test
    public void test(){
       //main metodu yokken nasıl çalıştı
            //junit içinde gömülü gelen main metodu çağırılıyor
            //class boş olduğu için test geçti
    }

    @Test
    public void testLength(){
        String cumle="Merhaba Dünyam";//13 karakter
        int anlikDeger=cumle.length();
        int beklenenDeger=14;
        //assertEquals(beklenenDeger,anlikDeger);//önce beklenen değer sonra anlık değer yazılır assertin içine
        assertEquals(beklenenDeger,anlikDeger,"Uzunluklar uyuşmadı");
    }

    @Test
    public void testUpperCase(){
        String anlikdeger="Merhaba".toUpperCase();
        String beklenenDeger="MERHABA";
        assertEquals(beklenenDeger,anlikdeger,"UpperCase Metodu Düzgün Çalışmıyor");
    }

    //toplama işlemi test ediyoruz
    @Test
    public void testToplama(){
        int sayi1=10;
        int sayi2=5;
        int anlikDeger=Math.addExact(sayi1,sayi2);
        int beklenenDeger=15;
        assertEquals(beklenenDeger,anlikDeger);
    }

    //contains test edelim
    @Test
    public void testContains(){
        assertEquals(false,"Sadik".contains("z"));
    }

}
