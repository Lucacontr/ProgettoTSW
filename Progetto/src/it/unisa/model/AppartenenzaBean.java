package it.unisa.model;

public class AppartenenzaBean {

	private String categoria;
	private int prodotto;
	
	public AppartenenzaBean(){
		
	}
	
	public AppartenenzaBean(int cod, String cat) {
		categoria=cat;
		prodotto=cod;
	}
	
	public String getCategoria() {
		return categoria;
	}
	
	public int getProdotto() {
		return prodotto;
	}
	
	public void setCategoria(String categoria) {
		this.categoria = categoria;
	}
	
	public void setProdotto(int prodotto) {
		this.prodotto = prodotto;
	}
	
}
