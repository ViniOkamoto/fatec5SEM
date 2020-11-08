package com.client;

import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.net.Socket;
import java.util.Scanner;

import javax.swing.JOptionPane;

public class Client {

	public static void main(String[] args) {
		try {
			boolean exit = false; 
			String m = "";
			Scanner sc = new Scanner(System.in);
			System.out.println("Sistema Cliente");
			Socket client = new Socket("localhost", 5555);
			System.out.println("Conecting into server in port 5555...");
			ObjectOutputStream output = new ObjectOutputStream(client.getOutputStream());
			ObjectInputStream input = new ObjectInputStream(client.getInputStream());
			
			String msg = JOptionPane.showInputDialog("HACKED. Insert safe words to unlock:");
			output.writeUTF(msg);
			output.flush();
			msg = input.readUTF();
			System.out.println("Server response: " +msg);
			
			while (!exit) {
				if (System.in.available() > 0) {
					m = sc.nextLine().toString();
					if (m.equals("exit")) {
						exit = true;
						System.out.println("Closing connection.");
						sc.close();
						client.close();
						return;
					}
					output.writeUTF(m);
				}
				
			}
			sc.close();
			input.close();
			output.close();
			client.close();
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		

	}
}
