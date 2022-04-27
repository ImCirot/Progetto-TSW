package model;

import java.io.Serializable;

public class ProdottoBean implements Serializable {
	private static final long serialVersionUID = 1L;
	
	private String codiceSeriale;
	private String nome;
	private String marca;
	private String descrizioneBreve;
	private boolean	edLimitata;
	
	public ProdottoBean() {
		this.codiceSeriale = "null";
		this.nome = "null";
		this.marca = "null";
		this.descrizioneBreve = "null";
	}

	public String getCodiceSeriale() {
		return codiceSeriale;
	}

	public void setCodiceSeriale(String codiceSeriale) {
		this.codiceSeriale = codiceSeriale;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getMarca() {
		return marca;
	}

	public void setMarca(String marca) {
		this.marca = marca;
	}

	public String getDescrizioneBreve() {
		return descrizioneBreve;
	}

	public void setDescrizioneBreve(String descrizioneBreve) {
		this.descrizioneBreve = descrizioneBreve;
	}

	public boolean isEdLimitata() {
		return edLimitata;
	}

	public void setEdLimitata(boolean edLimitata) {
		this.edLimitata = edLimitata;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	
}
