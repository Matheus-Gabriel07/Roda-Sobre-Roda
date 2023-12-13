package model;

public class UserBeans {
	private String iduser;
	private String nome;
	private String email;
	private String senha;
	private String veiAlugados;
	private String veiDevolvidos;
	private String imagem;
	
	public UserBeans(String iduser, String nome, String email, String senha, String veiAlugados, String veiDevolvidos,
			String imagem) {
		super();
		this.iduser = iduser;
		this.nome = nome;
		this.email = email;
		this.senha = senha;
		this.veiAlugados = veiAlugados;
		this.veiDevolvidos = veiDevolvidos;
		this.imagem = imagem;
	}
	public String getIduser() {
		return iduser;
	}
	public void setIduser(String iduser) {
		this.iduser = iduser;
	}
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getSenha() {
		return senha;
	}
	public void setSenha(String senha) {
		this.senha = senha;
	}
	public String getVeiAlugados() {
		return veiAlugados;
	}
	public void setVeiAlugados(String veiAlugados) {
		this.veiAlugados = veiAlugados;
	}
	public String getVeiDevolvidos() {
		return veiDevolvidos;
	}
	public void setVeiDevolvidos(String veiDevolvidos) {
		this.veiDevolvidos = veiDevolvidos;
	}
	public String getImagem() {
		return imagem;
	}
	public void setImagem(String imagem) {
		this.imagem = imagem;
	}
	
	
}
