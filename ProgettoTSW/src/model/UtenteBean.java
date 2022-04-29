package model;

import java.io.Serializable;

public class UtenteBean implements Serializable {
	private static final long serialVersionUID = 1L;
	
	private String username;
	private String password;
	private String email;
	private String nome;
	private String cognome;
	private String sesso;
	private boolean admin;
	
	public UtenteBean() {
		this.username = "null";
		this.password = "null";
		this.email = "null";
		this.nome = "null";
		this.cognome = "null";
		this.sesso = "null";
		this.admin = false;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getCognome() {
		return cognome;
	}

	public void setCognome(String cognome) {
		this.cognome = cognome;
	}

	public String getSesso() {
		return sesso;
	}

	public void setSesso(String sesso) {
		this.sesso = sesso;
	}

	public Boolean isAdmin() {
		return admin;
	}

	public void setAdmin(boolean admin) {
		this.admin = admin;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	
}
