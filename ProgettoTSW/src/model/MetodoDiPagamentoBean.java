package model;

import java.io.Serializable;

public class MetodoDiPagamentoBean implements Serializable {

	private static final long serialVersionUID = 1L;
	
	private int numPagamentoProgressivo;
	private String utente;
	private String via;
	private String citta;
	private String CAP;
	private String civico;
	private String provincia;
	private String nazione;
	private String tipo;
	private String IBAN;
	private String numCarta;
	private String preferito;
	
	public MetodoDiPagamentoBean() {
		this.numPagamentoProgressivo = -1;
		this.utente = "null";
		this.via = "null";
		this.citta = "null";
		this.CAP = "null";
		this.civico = "null";
		this.provincia = "null";
		this.nazione = "null";
		this.tipo = "null";
		this.IBAN = "null";
		this.numCarta = "null";
		this.preferito = "null";
	}

	public int getNumPagamentoProgressivo() {
		return numPagamentoProgressivo;
	}

	public void setNumPagamentoProgressivo(int numPagamentoProgressivo) {
		this.numPagamentoProgressivo = numPagamentoProgressivo;
	}

	public String getUtente() {
		return utente;
	}

	public void setUtente(String utente) {
		this.utente = utente;
	}

	public String getVia() {
		return via;
	}

	public void setVia(String via) {
		this.via = via;
	}

	public String getCitta() {
		return citta;
	}

	public void setCitta(String citta) {
		this.citta = citta;
	}

	public String getCAP() {
		return CAP;
	}

	public void setCAP(String cAP) {
		CAP = cAP;
	}

	public String getCivico() {
		return civico;
	}

	public void setCivico(String civico) {
		this.civico = civico;
	}
	
	
	public String getProvincia() {
		return provincia;
	}

	public void setProvincia(String provincia) {
		this.provincia = provincia;
	}

	public String getTipo() {
		return tipo;
	}

	public void setTipo(String tipo) {
		this.tipo = tipo;
	}

	public String getIBAN() {
		return IBAN;
	}

	public void setIBAN(String iBAN) {
		IBAN = iBAN;
	}

	public String getNumCarta() {
		return numCarta;
	}

	public void setNumCarta(String numCarta) {
		this.numCarta = numCarta;
	}

	public String getPreferito() {
		return preferito;
	}

	public void setPreferito(String preferito) {
		this.preferito = preferito;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public String getNazione() {
		return nazione;
	}

	public void setNazione(String nazione) {
		this.nazione = nazione;
	}
	
	
}
