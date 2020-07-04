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

import Model.Utente;
import Model.UtenteModel;

/**
 * Servlet implementation class ricercaRUServlet
 */
@WebServlet("/ricercaRUServlet")
public class ricercaRUServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ricercaRUServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    
    /**
     * Il metodo restituisce il conome del docente dalla stringa in formato "Nome Cognome".
     * @param fullName
     * @return String nome
     */
    private static String getSurname(String fullName){
    	try {
    		return fullName.split(" (?!.* )")[1];
    	}catch(Exception e) {
    		return "";
    	}
    }
    
    /**
     * Il metodo restituisce il nome del docente dalla stringa in formato "Nome Cognome".
     * @param fullName
     * @return String cognome
     */
    private static String getName(String fullName){
    	try {
    		return fullName.split(" (?!.* )")[0];
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
		
		String nome = ricercaRUServlet.getName(search);
		String cognome = ricercaRUServlet.getSurname(search);
		
		System.out.println(nome);
		System.out.println(cognome);
		
		UtenteModel utenteModel = new UtenteModel();
		
		ArrayList<Utente> utenti = new ArrayList<Utente>();
		
		try {
			utenti = utenteModel.ricercaDipendenti(nome, cognome);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		response.sendRedirect("./jsp/ricercautente.jsp");
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
