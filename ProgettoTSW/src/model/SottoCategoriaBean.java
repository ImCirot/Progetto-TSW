package model;

import java.io.Serializable;

public class SottoCategoriaBean implements Serializable {
	private static final long serialVersionUID = 1L;
	
	private String nome;

	public SottoCategoriaBean() {
		this.nome="null";
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
}
