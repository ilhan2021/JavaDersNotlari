package JUnit_Test_Prc.repository;

import java.sql.SQLException;
import java.util.Arrays;
import java.util.List;

public class MessageRepository {
    //database im bu list olsun
    private List<String> list= Arrays.asList("hello" ,"mockito","cok guzel");

    public void addMassage(String message){
    list.add(message);
    //burasi liste ekleme yapilan yer yani databese crate etigim yer

    }
    public List<String> getMessages()  throws SQLException {
        return list;
    }

}
