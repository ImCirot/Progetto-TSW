package model;

import java.io.Serializable;

public class OrdineBean implements Serializable {
	private static final long serialVersionUID = 1L;
	
	private int numOrdineProgressivo;
	private String cliente;
	private String tipoPagamento;
	private String IBAN;
	private String numCarta;
	private String citta;
	private String CAP;
	private String via;
	private String civico;
	private String provincia;
	private String dataAcquisto;
	
	public OrdineBean() {
		this.numOrdineProgressivo = -1;
		this.cliente = "null";
		this.tipoPagamento = "null";
		this.IBAN = "null";
		this.numCarta = "null";
		this.citta = "null";
		this.CAP = "null";
		this.via = "null";
		this.civico = "null";
		this.provincia = "null";
		this.dataAcquisto = "null";
		this.costoTotale = "null";
	}
	
	public int getNumOrdineProgressivo() {
		return numOrdineProgressivo;
	}
	public void setNumOrdineProgressivo(int numOrdineProgressivo) {
		this.numOrdineProgressivo = numOrdineProgressivo;
	}
	public String getCliente() {
		return cliente;
	}
	public void setCliente(String cliente) {
		this.cliente = cliente;
	}
	public String getTipoPagamento() {
		return tipoPagamento;
	}
	public void setTipoPagamento(String tipoPagamento) {
		this.tipoPagamento = tipoPagamento;
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
	public String getVia() {
		return via;
	}
	public void setVia(String via) {
		this.via = via;
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
	public String getDataAcquisto() {
		return dataAcquisto;
	}
	public void setDataAcquisto(String dataAcquisto) {
		this.dataAcquisto = dataAcquisto;
	}
	public String getCostoTotale() {
		return costoTotale;
	}
	public void setCostoTotale(String costoTotale) {
		this.costoTotale = costoTotale;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	private String costoTotale;
	
}
