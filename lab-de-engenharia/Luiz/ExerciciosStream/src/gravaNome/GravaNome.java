package gravaNome;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;

public class GravaNome {

	public static void main(String[] args) throws IOException {

		InputStream is = System.in;
		File arquivo = new File("SeuNome.txt");
		InputStreamReader isr = new InputStreamReader(is);
		BufferedReader br = new BufferedReader(isr);
		
		System.out.print("Informe seu nome: ");

		String nome = br.readLine();
		
		try {
			FileWriter fw = new FileWriter(arquivo);
			BufferedWriter bw = new BufferedWriter(fw);

			bw.write("NOME INFORMADO: ");
			bw.write(nome);
			bw.newLine();
			bw.write("----------------------");
			bw.flush();
			bw.close();

		} catch (IOException e) {
			e.printStackTrace();
		}
		
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
