package it.unisa.model;

public class DetailBean {
	
	private int id_prodotto;
	private int id_ordine;
	private int quantit�;
	private int prezzo;
	
	public DetailBean() {
		
	}
	
	public int getId_ordine() {
		return id_ordine;
	}
	
	public int getId_prodotto() {
		return id_prodotto;
	}
	
	public int getPrezzo() {
		return prezzo;
	}
	
	public int getQuantit�() {
		return quantit�;
	}
	
	public void setId_ordine(int id_ordine) {
		this.id_ordine = id_ordine;
	}
	
	public void setId_prodotto(int id_prodotto) {
		this.id_prodotto = id_prodotto;
	}
	
	public void setPrezzo(int prezzo) {
		this.prezzo = prezzo;
	}
	
	public void setQuantit�(int quantit�) {
		this.quantit� = quantit�;
	}
}
