package OrdernarWindowsUpdate;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class OrdenarWindowsUpdate {

	public static void main(String[] args) throws IOException {
		
		File arquivoLogUpdate = new File("VariosNomes.txt");
		
		FileReader fr = new FileReader(arquivoLogUpdate);
		BufferedReader br = new BufferedReader(fr);	
		
		FileWriter fw = new FileWriter("WindowsUpdateOrdenado.log");
		BufferedWriter bw = new BufferedWriter(fw);

		String dadosNoArquivo;
		List<String> valores = new ArrayList<String>();
		
		try {
			dadosNoArquivo = br.readLine();
			
			while((dadosNoArquivo = br.readLine()) != null){
			valores.add(dadosNoArquivo);	
			}
			
			Collections.sort(valores);
			
		}
		catch (Exception e) {
		}
		
		for (String string : valores) {
			System.out.println(string);
		}
		
	}

}
