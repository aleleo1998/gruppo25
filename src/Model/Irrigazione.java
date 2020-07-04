package Model;

public class Irrigazione {
	
       

	public Irrigazione() {
		super();
	}
	public Irrigazione(int id, String giorno, String ora_inizio, String ora_fine, String campo) {
		super();
		this.id = id;
		this.giorno = giorno;
		this.ora_inizio = ora_inizio;
		this.ora_fine = ora_fine;
		this.campo = campo;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getGiorno() {
		return giorno;
	}
	public void setGiorno(String giorno) {
		this.giorno = giorno;
	}
	public String getOra_inizio() {
		return ora_inizio;
	}
	public void setOra_inizio(String ora_inizio) {
		this.ora_inizio = ora_inizio;
	}
	public String getOra_fine() {
		return ora_fine;
	}
	public void setOra_fine(String ora_fine) {
		this.ora_fine = ora_fine;
	}
	public String getCampo() {
		return campo;
	}
	public void setCampo(String campo) {
		this.campo = campo;
	}
	private int id;
	private String giorno;
	private String ora_inizio;
	private String ora_fine;
	private String campo;
}
