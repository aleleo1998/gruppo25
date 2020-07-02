package Servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.Item;
import Model.ItemModel;
import Model.Utente;


/**
 * Servlet implementation class inserisciItemServlet
 */
@WebServlet("/inserisciItemServlet")
public class inserisciItemServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public inserisciItemServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		int ris=0;
		String risposta = "";
		int rs=0; //conterrà il risultato ritornato dalla query che verrà effettuata (inizializzata a 0 perchè se la query ritorna 0 è fallita);

		String nomeItem = request.getParameter("nome");
		String tipo = request.getParameter("tipo");
		String quantita = request.getParameter("quantita");
		
		Utente utente = (Utente) request.getSession().getAttribute("utente"); //Preleva utente dalla sessione
		
		ItemModel itemQuery = new ItemModel();  
		try {
			ris = itemQuery.doSave(nomeItem, tipo, quantita, utente.getId());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
		
		if(ris==1) {
			risposta = "1";
		}
		else {
			risposta = "0";
		}
		out.write(risposta);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
