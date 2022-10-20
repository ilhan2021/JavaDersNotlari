package JUnit_Test_Prc.service;

import repository.MessageRepository;

import java.sql.SQLException;
import java.util.Arrays;
import java.util.List;

public class MessageService {

    //bu class da repsotiry e erisim methoidlari yazilir yani bussiness logic in yapildigi yer
    //testi yapilacak classs burasdudir
    private MessageRepository repository;

    public MessageService(MessageRepository repository){
        this.repository=repository;
    }

    public void addMessage(String message){//esas test edecegim yer bu methodun calsiip calismadigi

        repository.addMassage(message);//iste testt te test edilecek kisim tam olarak burasi
    }
    public List<String> getMessages(){
        try {
            return repository.getMessages();
        } catch (SQLException e) {
            return Arrays.asList();
        }
    }

}
