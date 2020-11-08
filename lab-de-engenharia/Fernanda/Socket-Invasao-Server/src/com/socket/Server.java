package com.socket;

import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.net.ServerSocket;
import java.net.Socket;

public class Server {

	private ServerSocket serverSocket;

	private void createServerSocket(int port) throws IOException {
		serverSocket = new ServerSocket(port);
	}

	private Socket waitForConnection() throws IOException {
		System.out.println("Waiting for connection in port 5555...");
		Socket socket = serverSocket.accept();
		return socket;
	}

	/* Connection between socket and client */
	private void treatConnection(Socket socket) throws IOException {

		try {
			ObjectOutputStream output = new ObjectOutputStream(socket.getOutputStream());
			ObjectInputStream input = new ObjectInputStream(socket.getInputStream());

			String msg = input.readUTF();
			if (msg != null)
				System.out.println("received message.");
			if(msg.equals("ATTACK DISABLED") || msg.equals("UNLOCK SYSTEM")) {
				String m = "Connection established. Congrats.";
				output.writeUTF(m);
				output.flush();
				while(!msg.equals("exit")) {
					input.readUTF();
				}
			} else {
				String m = "Could not hold connection with server.";
				output.writeUTF(m);
				output.flush();
				closeConnection(socket);
			}
			input.close();
			output.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeConnection(socket);
		}

	}

	public void closeConnection(Socket s) throws IOException {
		s.close();
	}

	public static void main(String[] args) {

		try {
			Server server = new Server();
			server.createServerSocket(5555);
			Socket socket = server.waitForConnection();
			server.treatConnection(socket);
		} catch (IOException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}

	}
}
