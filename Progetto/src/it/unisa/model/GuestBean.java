package it.unisa.model;

import java.time.LocalDateTime;

public class GuestBean {

     private String email;
     private String nome;
     private String cognome;
     private String telefono;
     private String indirizzo;
     private String data;
     
     public GuestBean() {
    	 LocalDateTime now=LocalDateTime.now();
    	 this.data= now.getYear()+"-"+now.getMonthValue()+"-"+now.getDayOfMonth()+" "+now.getHour()+":"+now.getMinute()+":"+now.getSecond();
     }
     
     public String getData() {
		return data;
	}
    
     
     public String getCognome() {
		return cognome;
	}
     
    public String getEmail() {
		return email;
	}
    
    public String getIndirizzo() {
		return indirizzo;
	}
    
    public String getNome() {
		return nome;
	}
    
    public String getTelefono() {
		return telefono;
	}
    
    public void setData(String data) {
		this.data = data;
	}
    
    public void setCognome(String cognome) {
		this.cognome = cognome;
	}
    
    public void setEmail(String email) {
		this.email = email;
	}
    
    public void setIndirizzo(String indirizzo) {
		this.indirizzo = indirizzo;
	}
    
    public void setNome(String nome) {
		this.nome = nome;
	}
    
    public void setTelefono(String telefono) {
		this.telefono = telefono;
	}
}