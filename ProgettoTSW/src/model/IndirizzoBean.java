package model;

import java.io.Serializable;

public class IndirizzoBean implements Serializable {

	private static final long serialVersionUID = 1L;
	
	private int numIndirizzoProgressivo;
	private String utente;
	private String via;
	private String citta;
	private String CAP;
	private String civico;
	private String provincia;
	private String nazione;
	private String scala;
	private String interno;
	private String preferito;
	
	
	public IndirizzoBean() {
		this.numIndirizzoProgressivo = -1;
		this.utente = "null";
		this.via = "null";
		this.citta = "null";
		this.CAP = "null";
		this.civico = "null";
		this.provincia = "null";
		this.scala = "null";
		this.interno = "null";
		this.preferito = "null";
	}

	public int getNumIndirizzoProgressivo() {
		return numIndirizzoProgressivo;
	}

	public void setNumIndirizzoProgressivo(int numIndirizzoProgressivo) {
		this.numIndirizzoProgressivo = numIndirizzoProgressivo;
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

	public String getScala() {
		return scala;
	}

	public void setScala(String scala) {
		this.scala = scala;
	}

	public String getInterno() {
		return interno;
	}

	public void setInterno(String interno) {
		this.interno = interno;
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
