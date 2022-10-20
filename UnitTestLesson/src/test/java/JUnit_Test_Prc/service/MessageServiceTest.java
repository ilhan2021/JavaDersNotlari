package JUnit_Test_Prc.service;

import org.junit.jupiter.api.Test;

import static org.mockito.Mockito.*;

public class MessageServiceTest {


    @Test
    void addMessageTest() {
        MessageService service = mock(MessageService.class);
        service.addMessage("selam");
        service.addMessage("mockito");
        service.addMessage("mockito");
        service.addMessage("mockito");

        //mockito diye string bir obj veya parametre addMessaqge servisine verilmis mi verilmemismi
        verify(service).addMessage("mockito");
        verify(service,times(3)).addMessage("mockito");
    }

}
