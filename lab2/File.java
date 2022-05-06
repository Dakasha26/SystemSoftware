import java.util.ArrayList;

public class File {
    private static final int N = 2;
    private ArrayList<Float> buffer = new ArrayList<>();

    public synchronized void add(float el) {
        while(buffer.size() >= N) {
            try {
                wait();
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        }
        buffer.add(el);
        notify();
    }

    public synchronized float get() {
        while (buffer.size() < 1) {
            try {
                wait();
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        }
        notify();
        return buffer.remove(0);
    }
}
