public class Changer implements Runnable {
    private File file;

    public Changer(File file) {
        this.file = file;
    }

    @Override
    public void run() {
        for (int i = 0; i<30 ; i++) {
            float el = file.get();
            System.out.println("Номер обрабатываемого числа: " + (i+1) + "\tНомер потока: " + 2 +
                    "\tЗначение результата: " + Float.toString(el*el));
        }
    }
}
