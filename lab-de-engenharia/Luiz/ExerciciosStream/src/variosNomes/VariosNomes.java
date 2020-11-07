package variosNomes;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;


public class VariosNomes {

	public static void main(String[] args) throws IOException {

		InputStream is = System.in;
		File arquivo = new File("VariosNomes.txt");
		InputStreamReader isr = new InputStreamReader(is);
		BufferedReader br = new BufferedReader(isr);
		
		FileWriter fw = new FileWriter(arquivo);
		BufferedWriter bw = new BufferedWriter(fw);
		
		int execucao = 1;
		
		do {
			System.out.print("Escreva: ");
			String linha = br.readLine();
					
			if(linha.equalsIgnoreCase("sair")) {	
				execucao = 0;
				System.out.println("Execução interrompida!");			
			}
				
			try {
				bw.write(linha);
				bw.newLine();
				linha = "";
				bw.flush();	
			} catch (IOException e) {
				e.printStackTrace();
			}			
		}while (execucao == 1);
		
		bw.close();
	}

}
