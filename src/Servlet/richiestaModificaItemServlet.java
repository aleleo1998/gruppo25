package Servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.InventarioModel;
import Model.Item;
import Model.ItemModel;
import Model.Utente;

/**
 * Servlet implementation class richiestaModificaItemServlet
 */
@WebServlet("/richiestaModificaItemServlet")
public class richiestaModificaItemServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public richiestaModificaItemServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		int risInv=0, risItem=0;
		String risposta = "";
		int rs=0; //conterrà il risultato ritornato dalla query che verrà effettuata (inizializzata a 0 perchè se la query ritorna 0 è fallita);

		String id = request.getParameter("id");
		
		
		Utente utente = (Utente) request.getSession().getAttribute("utente"); //Preleva utente dalla sessione
		
	
		ItemModel itemQuery = new ItemModel(); 
		
		try {
		
			Item item = itemQuery.doRetrieveById(id);
			request.getSession().setAttribute("itemDaModificare", item);
			rs=1;
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
		
		if(rs==1) {
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
