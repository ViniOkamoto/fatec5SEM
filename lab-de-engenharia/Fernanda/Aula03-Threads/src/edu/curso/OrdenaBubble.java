package edu.curso;

import java.util.Random;

public class OrdenaBubble implements Runnable {
	
	public OrdenaBubble() {
	
	}

	public int[] cria1000() {
		int[] vetor = new int[1000];
		Random rnd = new Random();
		for (int i = 0; i < vetor.length; i++) {
			vetor[i] = rnd.nextInt();
		}
		return vetor;
	}
	
	public static int[] bubbleSort(int[] numeros) {
		for (int i = 0; i < numeros.length; i++) {
			if (numeros[i] > numeros[i+1]) {
				int temp = numeros[i];
				numeros[i] = numeros[i+1];
				numeros[i+1] = temp;
			}
		}
		return numeros;
	}
	
	public static void printVetor(int[] numeros) {}
	
	public static void criarString(String caracter, int tamanho) {
		StringBuffer stbf = new StringBuffer();
		for (int i = 0; i < tamanho; i++) {
			stbf.append(caracter);
		}
	}
	
	public static boolean estaOrdenada(int[] numeros) {
		int i = 0;
		boolean ordenada = true;
		while (i < numeros.length - 1 && ordenada) {
			if (numeros[i] > numeros[i + 1]) {
				ordenada = false;
				i++;
				return ordenada;
			}
		}
	}
	
	
	@Override
	public void run() {
		int[] v1 = cria1000();
		
		while (!estaOrdenada(v1)) {
			bubbleSort(v1);
			printVetor(v1);
			try {
				Thread.sleep(700);
			} catch (InterruptedException e) {
				e.printStackTrace();
			}
		}
		}
	}
	
}
