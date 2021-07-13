package it.unisa.model;

public class CategoriaBean {

	public CategoriaBean(){
		
	}
	
	public String getNome() {
		return nome;
	}
	
	public String getThumbnail() {
		return thumbnail;
	}
	
	public void setNome(String nome) {
		this.nome = nome;
	}
	
	public void setThumbnail(String thumbnail) {
		this.thumbnail = thumbnail;
	}
	
	private String nome;
	private String thumbnail;
}
