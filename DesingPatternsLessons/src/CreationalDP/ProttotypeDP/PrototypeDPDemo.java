package CreationalDP.ProttotypeDP;

public class PrototypeDPDemo {
    public static void main(String[] args) {
        Soldier availableSoldier=new Soldier(100,45,20,50,60,5,
                "Kilic",true);

        //clone ozelligi ile asker uretelim

        /* normalde boyle yapardik ama her asker icin tek tek yapmamiz lazim boyle
        Soldier notAvailableSoldier=new Soldier(100,45,20,50,60,5,
                "Kilic",false);
                /*
         */

        //boyle yapmak daha clean code
        Soldier notAvailableSoldier=availableSoldier.clone();
        notAvailableSoldier.setAvailableForWar(false);
    }
}