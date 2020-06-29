package Model;

public class Item {
	
	public Item() {
		super();
	}
	public Item(String id, String nome, String tipo, String quantita, String descrizione) {
		super();
		this.id = id;
		this.nome = nome;
		this.tipo = tipo;
		this.quantita = quantita;
		this.descrizione = descrizione;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	public String getTipo() {
		return tipo;
	}
	public void setTipo(String tipo) {
		this.tipo = tipo;
	}
	public String getQuantita() {
		return quantita;
	}
	public void setQuantita(String quantita) {
		this.quantita = quantita;
	}
	public String getDescrizione() {
		return descrizione;
	}
	public void setDescrizione(String descrizione) {
		this.descrizione = descrizione;
	}
	private String id;
	private String nome;
	private String tipo;
	private String quantita;
	private String descrizione;
}
