package tools;

import cartago.Artifact;
import cartago.OPERATION;



public class ElectronicMachine extends Artifact{
	
	
	@OPERATION
	public void init() {
		defineObsProperty("task", 0);
	}
	
	
	@OPERATION
	public void transfer() {
		System.out.println("Apenas testando...  transferBook");
		// propriedade observável holdBook(multiAgentSystem); 
		// Quem coloca o holdBook pra valer. 
	}
	
	@OPERATION
	public void signLoan() {
		System.out.println("Apenas testando...  signLoan");
	}
	
	
	@OPERATION
	public void receiveABook() {
		System.out.println("Apenas testando...  receiveABook");
	}
	
	@OPERATION
	public void putBookOnShelf() {
		System.out.println("Apenas testando...  putBookOnShelf");
	}
	
	
	


}
