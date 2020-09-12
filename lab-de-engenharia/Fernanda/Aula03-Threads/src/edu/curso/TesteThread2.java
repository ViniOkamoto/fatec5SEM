package edu.curso;

public class TesteThread2 implements Runnable {

	@Override
	public void run() {
		while (true) {
			System.out.println("Thread 2 - runnable - está executando.");
		}
	}

}
