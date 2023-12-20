package model;

public class JavaBeans {
	private String idcar;
	private String marca;
	private String tipo;
	private String modelo;
	private String cor;
	private String ano;
	private String fotoPrin;
	private String fotoSec;
	private String descricao;
	private String diaria;
	private String avaliacao;

	public JavaBeans() {
		super();
		// TODO Auto-generated constructor stub
	}

	public JavaBeans(String idcar, String marca, String tipo, String modelo, String cor, String ano, String fotoPrin,
			String fotoSec, String descricao, String diaria, String avaliacao) {
		super();
		this.idcar = idcar;
		this.marca = marca;
		this.tipo = tipo;
		this.modelo = modelo;
		this.cor = cor;
		this.ano = ano;
		this.fotoPrin = fotoPrin;
		this.fotoSec = fotoSec;
		this.descricao = descricao;
		this.diaria = diaria;
		this.avaliacao = avaliacao;
	}

	public String getIdcar() {
		return idcar;
	}

	public void setIdcar(String idcar) {
		this.idcar = idcar;
	}

	public String getMarca() {
		return marca;
	}

	public void setMarca(String marca) {
		this.marca = marca;
	}

	public String getTipo() {
		return tipo;
	}

	public void setTipo(String tipo) {
		this.tipo = tipo;
	}

	public String getModelo() {
		return modelo;
	}

	public void setModelo(String modelo) {
		this.modelo = modelo;
	}

	public String getCor() {
		return cor;
	}

	public void setCor(String cor) {
		this.cor = cor;
	}

	public String getAno() {
		return ano;
	}

	public void setAno(String ano) {
		this.ano = ano;
	}

	public String getFotoPrin() {
		return fotoPrin;
	}

	public void setFotoPrin(String fotoPrin) {
		this.fotoPrin = fotoPrin;
	}

	public String getFotoSec() {
		return fotoSec;
	}

	public void setFotoSec(String fotoSec) {
		this.fotoSec = fotoSec;
	}

	public String getDescricao() {
		return descricao;
	}

	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}

	public String getDiaria() {
		return diaria;
	}

	public void setDiaria(String diaria) {
		this.diaria = diaria;
	}

	public String getAvaliacao() {
		return avaliacao;
	}

	public void setAvaliacao(String avaliacao) {
		this.avaliacao = avaliacao;
	}
}
