package csv;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;

public class LerCsv {

	@SuppressWarnings({ "unused", "resource" })
	public static void main(String[] args) throws IOException {
	
		File arquivoCsv = new File("a.csv");
		FileReader fr = new FileReader(arquivoCsv);
		
		BufferedReader br = new BufferedReader(fr);	
		FileWriter fw = new FileWriter("C:\\eclipse-workspace\\ExerciciosStream\\b.csv");
		BufferedWriter bw = new BufferedWriter(fw);
		
		try {
			String dadosNoArquivo;

			while ((dadosNoArquivo = br.readLine()) != null) {
				String[] linha =  dadosNoArquivo.split(";");
				String nome = linha [0];
				String strNota = linha[1];
				Float nota = Float.parseFloat(strNota.replace(",", "."));
				nota = nota + 1;
				
				bw.write(linha[0]);
				bw.write(";");
				bw.write(nota.toString().replace(".", ","));
				bw.newLine();

			}
			bw.flush();
			bw.close();
		} catch (IOException e) {
			System.out.println("Erro ao realizar leitura: " +e.getMessage());
			e.printStackTrace();
		}
		
	}

}
