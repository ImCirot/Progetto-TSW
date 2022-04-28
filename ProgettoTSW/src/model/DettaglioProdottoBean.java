package model;

import java.io.Serializable;

public class DettaglioProdottoBean implements Serializable {
	private static final long serialVersionUID = 1L;
	
	private String tipo;
	private String prodotto;
	private double costoUnitario;
	private int IVA;
	private int quantita;
	private String origine;
	private String scadenza;
	private String peso;
	private String volume;
	private String immagine;
	
	public DettaglioProdottoBean() {
		this.tipo = "null";
		this.prodotto = "null";
		this.costoUnitario = -1;
		this.IVA = -1;
		this.quantita = -1;
		this.origine = "null";
		this.scadenza = "null";
		this.peso = "null";
		this.volume = "null";
		this.immagine = "null";
	}

	public String getTipo() {
		return tipo;
	}

	public void setTipo(String tipo) {
		this.tipo = tipo;
	}

	public String getProdotto() {
		return prodotto;
	}

	public void setProdotto(String prodotto) {
		this.prodotto = prodotto;
	}

	public double getCostoUnitario() {
		return costoUnitario;
	}

	public void setCostoUnitario(double costoUnitario) {
		this.costoUnitario = costoUnitario;
	}

	public int getIVA() {
		return IVA;
	}

	public void setIVA(int iVA) {
		IVA = iVA;
	}

	public int getQuantita() {
		return quantita;
	}

	public void setQuantita(int quantita) {
		this.quantita = quantita;
	}

	public String getOrigine() {
		return origine;
	}

	public void setOrigine(String origine) {
		this.origine = origine;
	}

	public String getScadenza() {
		return scadenza;
	}

	public void setScadenza(String scadenza) {
		this.scadenza = scadenza;
	}

	public String getPeso() {
		return peso;
	}

	public void setPeso(String peso) {
		this.peso = peso;
	}

	public String getVolume() {
		return volume;
	}

	public void setVolume(String volume) {
		this.volume = volume;
	}

	public String getImmagine() {
		return immagine;
	}

	public void setImmagine(String immagine) {
		this.immagine = immagine;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	
}
