import io.restassured.response.Response;
import org.junit.Test;

import static io.restassured.RestAssured.given;

public class GetRequest01 {
    @Test
    public void get01(){
        // URL i ayarla :
        String url ="https://reqres.in/api/users/02"; // api end-point eklendi

        // requesti gönder :
        Response response = given().when().get(url);
        // request gönderildi, dönen değerimiz apiden gelen response oluyor

        response.prettyPrint(); // Json formatında dönen değer ekrana bastırılıyor
        response.then().assertThat().statusCode(200); // hata kodunu test ediyoruz
    }
}