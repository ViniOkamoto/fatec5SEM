import java.io.File;
import java.io.FileWriter;
import java.io.IOException;

public class Main {

	
	public static void main(String[] args) throws IOException {
		File f = new File("/home/feevars/teste.txt");
		FileWriter fw = new FileWriter(f);
		
		fw.write("Fernandinha");
		fw.close();
	}

}