package Model;

public class Inventario {

	public Inventario() {}
	
	public Inventario(String idUtente, String idItem, String nome, String tipo, String quantita) {
		super();
		this.idUtente = idUtente;
		this.idItem = idItem;
		this.nome = nome;
		this.tipo = tipo;
		this.quantita = quantita;
	}
	
	public String getIdUtente() {
		return idUtente;
	}
	public void setIdUtente(String idUtente) {
		this.idUtente = idUtente;
	}
	public String getIdItem() {
		return idItem;
	}
	public void setIdItem(String idItem) {
		this.idItem = idItem;
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
	
	@Override
	public String toString() {
		return "Inventario [idUtente=" + idUtente + ", idItem=" + idItem + ", nome=" + nome + ", tipo=" + tipo
				+ ", quantita=" + quantita + "]";
	}
	
	
	private String idUtente;
	private String idItem;
	private String nome;
	private String tipo;
	private String quantita;
}
