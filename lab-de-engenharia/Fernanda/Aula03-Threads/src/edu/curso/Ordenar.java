package edu.curso;

public class Ordenar {

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
}
