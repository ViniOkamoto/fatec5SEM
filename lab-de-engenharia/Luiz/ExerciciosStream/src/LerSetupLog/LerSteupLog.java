package LerSetupLog;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;

public class LerSteupLog {

	public static void main(String[] args) throws IOException {

		InputStream is = System.in;
		File arquivo = new File("C:\\Windows\\setuplog.txt");
		InputStreamReader isr = new InputStreamReader(is);
		BufferedReader br = new BufferedReader(isr);
			
		//Leitura
		try {
			FileReader fr = new FileReader(arquivo);
			br = new BufferedReader(fr);
			String dadosNoArquivo;

			
			while ((dadosNoArquivo = br.readLine()) != null) {
				System.out.println(dadosNoArquivo);
			}
		} catch (IOException e) {
			System.out.println("Erro ao realizar leitura: " +e.getMessage());
			e.printStackTrace();
		}
		
	}
	
	
}
