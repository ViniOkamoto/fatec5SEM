
public class TesteThread2 implements Runnable {
	
	@Override
	public void run() {
		while (true) {
			System.out.println("Rodando teste Thread 2: Interface Runnable");
		}
	}
}
