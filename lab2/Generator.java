public class Generator implements Runnable{
    private File file;

    public Generator(File file) {
        this.file = file;
    }

    @Override
    public void run() {
        float el;
        for(int i = 0; i < 30; ++i) {
            el = (float) (-1 + Math.random() * (1 - -1));
            file.add(el);
            System.out.println("Номер обрабатываемого числа: " + (i+1) + "\tНомер потока: " + 1 +
                    "\tЗначение результата: " + Float.toString(el));
        }
    }
}
