package model;

import java.io.Serializable;

public class RecensioneBean implements Serializable {
	private static final long serialVersionUID = 1L;
	
	private String cliente;
	private String prodotto;
	private int voto;
	private String testoRecensione;
	private String data;
	private boolean anonimo;

	public RecensioneBean(){
		this.cliente = "null";
		this.prodotto = "null";
		this.voto = -1;
		this.testoRecensione = "null";
		this.data = "null";
		this.anonimo = false;
	}

	public void setCliente(String cliente){
		this.cliente = cliente;
	}

	public String getCliente(){
		return this.cliente;
	}

	public void setProdotto(String prodotto){
		this.prodotto = prodotto;
	}

	public String getProdotto(){
		return this.prodotto;
	}

	public void setVoto(int voto){
		this.voto = voto;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public int getVoto() {
		return voto;
	}

	public String getTestoRecensione() {
		return testoRecensione;
	}

	public void setTestoRecensione(String testoRecensione) {
		this.testoRecensione = testoRecensione;
	}

	public String getData() {
		return data;
	}

	public void setData(String data) {
		this.data = data;
	}

	public boolean isAnonimo() {
		return anonimo;
	}

	public void setAnonimo(boolean anonimo) {
		this.anonimo = anonimo;
	}
}
