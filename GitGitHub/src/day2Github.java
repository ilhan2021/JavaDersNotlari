public class day2Github {
    /*
     1-) git init --> Local repo olusturmak icin yani  .git ile klasörümüzün
     içindeki dosyaları
     ilişkilendirmek için kullanılır
     2-) git add . --> Working space'den (yani yerel) dosyalarımı staging area'ya
     (yani commitlemek için beklenen yer) gönderir
     3-) git status working space'deki ve staging areadaki
     4-) git commiit -m "mesaj" --> Staging area'dan commit stora
     dosyalarımı göndermek için kullanılır
     (commit yani versiyon yani sürüm oluşturmuş olurum)
     5-) git push --> Uzak repo'ya(yani remote - GitHub)
      göndermek için kullandıgımız kod
     yalnız git push komutunu diirekt kullanmak istersek 1 kez
             git remote add origin adress
             git push -u origin master
    NOT: Yukarıdaki iki komutu tek seferde kullandıktan sonra ikinci commit'lerim için sadece git push
    kullanırız.
    6-) git pull --> Remote (yani uzak depo) dosyalarımızı güncellemek için kullanılır
    
    
      */
    
    public static void main(String[] args) {
        System.out.println("GitHub'ı ogrendim");
        System.out.println("branch deneme");
        System.out.println("branch deneme2");
        System.out.println("branch deneme3");
    }
}
