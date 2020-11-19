package simples;

import java.io.DataOutputStream;
import java.net.Socket;

public class SimplesSocketClient {

	public static void main(String[] args) {
		try {
			Socket socket = new Socket("localhost", 9001);
			DataOutputStream dout = new DataOutputStream(socket.getOutputStream());
			
			dout.writeUTF("Troca de mensagem por socket.");
			dout.flush();
			dout.close();
			socket.close();
		} catch (Exception e) {
			System.out.println(e);
		}
	}
}
