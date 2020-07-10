package Servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.Inventario;
import Model.InventarioModel;
import Model.Item;
import Model.ItemModel;
import Model.Utente;
import Model.UtenteModel;

/**
 * Servlet implementation class ricercaItemServlet
 */
@WebServlet("/ricercaItemServlet")
public class ricercaItemServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ricercaItemServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    
    /**
     * Il metodo restituisce il nome dell0item
     * @param fullName
     * @return String cognome
     */
    private static String getItem(String item){
    	try {
    		return item.split(" (?!.* )")[0];
    	}catch(Exception e) {
    		return "";
    	}
        
    }
    
    
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		
		String search = request.getParameter("search");
		request.getSession().setAttribute("nomeitem_ricercato", search);
		String item = ricercaItemServlet.getItem(search);
		
		
		InventarioModel invModel = new InventarioModel();
		 Model.Utente utente = (Utente) request.getSession().getAttribute("utente");
		ArrayList<Inventario> itemList = new ArrayList<Inventario>();
		
		
		
		try {
			itemList = invModel.ricercaItem(utente.getId(),item);
			 
			request.getSession().setAttribute("ricerca_item", itemList);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		response.sendRedirect("./jsp/inventarioRicercaItem.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
