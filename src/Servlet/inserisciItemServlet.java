package Servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.Item;
import Model.ItemModel;


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

		java.io.PrintWriter out = response.getWriter();  //Andrà a costruire la responseText
		int rs=0; //conterrà il risultato ritornato dalla query che verrà effettuata (inizializzata a 0 perchè se la query ritorna 0 è fallita);

		String nomeItem = request.getParameter("nome");
		String tipo = request.getParameter("tipo");
		String quantita = request.getParameter("quantita");
	
		
		ItemModel itemQuery = new ItemModel();  
		try {
			itemQuery.doSave(nomeItem, tipo, quantita) ;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
		String x;
		if(rs==0) {
			x="Inserimento Non Riuscito. Riprovare!";
			request.getSession().setAttribute("msg", x);
		}
		else {
			x="Inserimento Completato";
			request.getSession().setAttribute("msg", x);
		}
		response.sendRedirect("./jsp/login.jsp");	
		response.getWriter().append("Served at: ").append(request.getContextPath());
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
