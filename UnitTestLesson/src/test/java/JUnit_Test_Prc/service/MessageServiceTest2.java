package JUnit_Test_Prc.service;

import JUnit_Test_Prc.repository.MessageRepository;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;

import java.sql.SQLException;
import java.util.Arrays;
import java.util.List;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.mockito.Mockito.when;

@ExtendWith(MockitoExtension.class)
public class MessageServiceTest2 {


    @Mock//mocklanacak kisim mocklandi ve bu classa verildi
    MessageRepository repository;

    @InjectMocks//service instance olusturup ve yuklaridaki mock lanan her objeyi bu class a enjekte eder
    MessageService service;


    @Test
    void testMessage(){

        try {
            when(repository.getMessages()).
                    thenReturn(Arrays.asList("add","Sa"));
        } catch (SQLException e) {
           e.printStackTrace();
        }

       List<String> actualList= service.getMessages();
        assertNotNull(actualList);
        assertEquals(2 , actualList.size());
    }


}
