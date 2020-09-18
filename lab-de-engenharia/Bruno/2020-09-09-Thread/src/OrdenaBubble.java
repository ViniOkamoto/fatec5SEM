import java.util.Random;

public class OrdenaBubble implements Runnable {

	public int[] cria1000() {
		int[] vetor = new int[1000];
		Random rnd = new Random();
		for (int i = 0; i < vetor.length; i++) {
			vetor[i] = rnd.nextInt();
		}

		return vetor;
	}

	public static void bubbleSort(int[] numeros) {
		for (int i = 0; i < numeros.length; i++) {
			if (numeros[i] > numeros[i + 1]) {
				int temp = numeros[i];
				numeros[i] = numeros[i + 1];
				numeros[i + 1] = temp;
			}
		}
	}
	
	public static void criarString(String caracter, int tamanho) {
		StringBuffer strBuf = new StringBuffer();
		for (int i = 0; i < tamanho; i++) {
			strBuf.append(caracter + " ");
		}
	}
	
	public static boolean estaOrdenada(int[] numeros) {
		int i = 0;
		boolean ordenada = true;
		while (i < numeros.lenght - 1 && ordenada) {
			
		}
	}

	@Override
	public void run() {
		// TODO Auto-generated method stub

	}

}
