package day03;

import Day03.C05_Mock_Islemler;
import org.junit.jupiter.api.Test;
import org.mockito.InOrder;
import org.mockito.Mockito;

import static org.mockito.Mockito.*;

public class C05_Mock_OkulTest {


    @Test
    void islemler(){
        C05_Mock_Islemler dummyObject= Mockito.mock(C05_Mock_Islemler.class);
        dummyObject.guncelleOgrenci("Ahmet");
        dummyObject.silOgrenci("Mehmet");
        dummyObject.ekleOgrenci("Kasım");
        //metodlar çağırılmış mı kontrol edelim
        verify(dummyObject).ekleOgrenci("Kasım");
        verify(dummyObject).silOgrenci("Mehmet");
        verify(dummyObject).guncelleOgrenci("Ahmet");
    }

    //Metod'un kaç kere çağırıldığını test edelim
    @Test
    void testKacKereCagirildi(){
        C05_Mock_Islemler dummyobject2=Mockito.mock(C05_Mock_Islemler.class);
        dummyobject2.ekleOgrenci("Ahmet");
        dummyobject2.ekleOgrenci("Ahmet");
        dummyobject2.ekleOgrenci("Mehmet");
        //acaba ahmet parametresiyle ekleOgrenci() metodu 2 defa çağırıldı mı
        verify(dummyobject2,times(2)).ekleOgrenci("Ahmet");
        //ekleOgrenci() buse parametresi ile çağırılıp çağırılmadığını test ediyoruz
        verify(dummyobject2,times(0)).ekleOgrenci("Buse");
        //herhangi bir parametre ile hiç çağrılmayan metodu test etmek istersek
        verify(dummyobject2,never()).silOgrenci(anyString());
        //metodun en az iki defa çağırıldığını test etmek için
        verify(dummyobject2,atLeast(2)).ekleOgrenci("Ahmet");


    }

    //etodların çağırılma sırasını test etmek için
    @Test
    void testSiralama(){
        C05_Mock_Islemler dummyObject3=Mockito.mock(C05_Mock_Islemler.class);
        dummyObject3.ekleOgrenci("Ahmet");
        dummyObject3.ekleOgrenci("Mehmet");
        dummyObject3.silOgrenci("Ahmet");
        //InOrder class'ı sıralama için kullanılır
        InOrder inOrder=inOrder(dummyObject3);
        inOrder.verify(dummyObject3).ekleOgrenci("Ahmet");
        inOrder.verify(dummyObject3).ekleOgrenci("Mehmet");
        inOrder.verify(dummyObject3).silOgrenci("Ahmet");
    }
}
