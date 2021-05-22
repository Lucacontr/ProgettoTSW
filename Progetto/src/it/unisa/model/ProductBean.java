package it.unisa.model;

import java.io.Serializable;

public class ProductBean implements Serializable {

	private static final long serialVersionUID = 1L;
	
	int code;
	String name;
	String description;
	double price;
	int quantity;
	double sconto;
	double prezzoScontato;
	int nvendite;
	int nvisualizzazioni;
	double iva;
	int cartQuantity;
	double tot;
	
	public ProductBean() {
		code = -1;
		name = "";
		description = "";
	}

	public double getTot() {
		return tot;
	}

	public void setTot(double tot) {
		this.tot = tot;
	}
	
	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	
	public int getCartQuantity() {
		return this.cartQuantity;
	}

	public void setCartQuantity(int quantity) {
		this.cartQuantity = quantity;
	}

	@Override
	public String toString() {
		return name + " (" + code + "), " + price + " " + quantity + ". " + description;
	}

	public double getIva() {
		return iva;
	}
	
	public int getNvendite() {
		return nvendite;
	}
	
	public int getNvisualizzazioni() {
		return nvisualizzazioni;
	}
	
	public double getPrezzoScontato() {
		return prezzoScontato;
	}
	
	public double getSconto() {
		return sconto;
	}
	
	public void setIva(double iva) {
		this.iva = iva;
	}
	
	public void setNvendite(int nvendite) {
		this.nvendite = nvendite;
	}
	
	public void setNvisualizzazioni(int nvisualizzazioni) {
		this.nvisualizzazioni = nvisualizzazioni;
	}
	
	public void setPrezzoScontato(double prezzoScontato) {
		this.prezzoScontato = prezzoScontato;
	}
	
	public void setSconto(double sconto) {
		this.sconto = sconto;
	}
	
}
