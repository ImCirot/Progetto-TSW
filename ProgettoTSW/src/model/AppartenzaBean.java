package model;

import java.io.Serializable;

public class AppartenzaBean implements Serializable{
	private static final long serialVersionUID = 1L;
	
	private String prodotto;
	private String sottocategoria;
	
	public AppartenzaBean() {
		this.prodotto="null";
		this.sottocategoria="null";
	}

	public String getProdotto() {
		return prodotto;
	}

	public void setProdotto(String prodotto) {
		this.prodotto = prodotto;
	}

	public String getSottocategoria() {
		return sottocategoria;
	}

	public void setSottocategoria(String sottocategoria) {
		this.sottocategoria = sottocategoria;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	
}
