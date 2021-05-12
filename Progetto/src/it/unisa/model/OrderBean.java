package it.unisa.model;

import java.time.LocalDateTime;

public class OrderBean {

	private LocalDateTime dataEff;
	private String utente;
	private double prezzoTot;
	private int id;
	
	public OrderBean() {

	}
	
	public int getId() {
		return id;
	}
	
	public void setId(int id) {
		this.id = id;
	}
	
	public LocalDateTime getDataEff() {
		return dataEff;
	}
	
	public double getPrezzoTot() {
		return prezzoTot;
	}
	
	public String getUtente() {
		return utente;
	}
	
	public void setDataEff(LocalDateTime dataEff) {
		this.dataEff = dataEff;
	}
	
	public void setPrezzoTot(double prezzoTot) {
		this.prezzoTot = prezzoTot;
	}
	
	public void setUtente(String utente) {
		this.utente = utente;
	}
	
}
