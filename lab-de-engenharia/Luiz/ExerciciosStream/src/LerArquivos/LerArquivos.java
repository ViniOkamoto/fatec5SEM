package LerArquivos;
import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;

public class LerArquivos {

	public static void main(String[] args) throws IOException {

		InputStream is = System.in;
		InputStreamReader isr = new InputStreamReader(is);
		BufferedReader br = new BufferedReader(isr);
		
		System.out.print("Qual o arquivo: ");
		String nomeArquivo = br.readLine();
			
		
		try {
			FileReader fr = new FileReader(nomeArquivo);
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
