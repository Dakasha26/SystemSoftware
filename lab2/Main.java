public class Main {

    public static File file = new File();

    public static Generator generator = new Generator(file);
    public static Changer changer = new Changer(file);

    public static Thread thread1 = new Thread(generator);
    public static Thread thread2 = new Thread(changer);

    public static void main(String[] args) {
        thread1.start();
        thread2.start();
    }
}
