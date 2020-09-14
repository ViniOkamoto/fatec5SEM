
public class TesteThread1 extends Thread {
	
	@Override
	public void run() {
		while (true) {
			System.out.println("Rodando Thread");
		}
	}
}
