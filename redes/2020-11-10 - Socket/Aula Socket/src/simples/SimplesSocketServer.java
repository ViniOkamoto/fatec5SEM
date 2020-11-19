package simples;

import java.io.DataInputStream;
import java.net.ServerSocket;
import java.net.Socket;

public class SimplesSocketServer {

	public static void main(String[] args) {
		try {
			ServerSocket socketServer = new ServerSocket(9001);
			Socket s = socketServer.accept();
			
			DataInputStream dis = new DataInputStream(s.getInputStream());
			String str = (String) dis.readUTF();
			
			System.out.println("Mensagem = " + str);
			socketServer.close();
		} catch (Exception e) {
			System.out.println(e);
		}
	}
}
