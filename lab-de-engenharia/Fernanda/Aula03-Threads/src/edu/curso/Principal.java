package edu.curso;

public class Principal {
	public static void main(String[] args) {
//		TesteThread1 th1 = new TesteThread1();
//		TesteThread2 th2 = new TesteThread2();
//		Thread thread2 = new Thread(th2);
//		
//		th1.start();
//		thread2.start();	
		
		OrdenaBubble ord = new OrdenaBubble();
		Thread t1 = new Thread(ord);
		t1.start();
	}
}
