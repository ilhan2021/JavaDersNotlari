package Day03;

public class C01_StringModify {
    // Task: Kelimenin ilk iki harfinde "A" varsa ise silinsin
    // Kelime icideki harflerin hepsi buyuk olacak
    // AABC->BC   ,  ABC->BC  ,  A->"" , AA->""
    public String deleteAIfItIsinFirstTwoPosition(String str){
       if (str.length()<=2){
           return str.replace("A", "");
           }
       String firstTwoChars = str.substring(0,2);
       String afterFirstTwoChars = str.substring(2);
       return firstTwoChars.replaceAll("A","")+afterFirstTwoChars;
    }
}
