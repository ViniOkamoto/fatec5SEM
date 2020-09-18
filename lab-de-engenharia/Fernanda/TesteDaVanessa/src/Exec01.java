import java.util.Scanner;
import java.util.Arrays;
	
public class Exec01 {
	   public static void main(String args[])
	   {
	      Scanner entrada = new Scanner(System.in);
	      double num, maior, menor, media, soma = 0;
	      int i, n = 0;
	  
	      double[] array;
	    
	      do
	      {
	         System.out.println("Digite a quantidade de numeros: ");
	         n = entrada.nextInt();
	         if(n<=0)
	            System.out.println("Erro.");
	      }
	      while(n<=0); 
	      
	      array = new double[n];
	       
	      for(i=0; i<n; i++)
	      {
	         System.out.println("Digite o "+ (i+1) +"o elemento ");
	         num = entrada.nextDouble();
	         array[i] = num;
	         soma += array[i];
	      }
	      for (int j = 0; j < array.length; j++) {
			System.out.println(array[j]);
		}
	      System.out.println(array.toString());
	      menor = array[0];
	      maior = array[0];
	      
	      for(i=0; i<array.length; i++)
	      {
	         if(array[i]>maior) {
	            maior = array[i];
	         }
	         else if (array[i]<menor){
	            menor = array[i];
	         }
	      }
	            
	      media = soma/n;
	      System.out.println("Media = " + media);
	      System.out.println("Maior numero = " + maior);
	      System.out.println("Menor numero = " + menor);
	   }
	}