package Day03;

import org.junit.jupiter.api.Test;
import org.mockito.Mockito;

public class Co6_ErrorTest {

    @Test
    void test(){
        //ErrorRunner clasında divide metodu 5 ve 0 parametreleri
        //ile hata fırlatırken aynı metodu mocklanan obje üzerinden
        // çağırdığımızda hata fırlatmaz obje sahte olduğu için metod
        //gerçekten çalışmaz
        //burada divide metodu çağırıldı mı onu test ettik
        C06_Error testObj= Mockito.mock(C06_Error.class);
        testObj.divide(5,0);
    }
}
