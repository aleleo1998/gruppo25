package Servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.Utente;
import Model.UtenteModel;

/**
 * Servlet implementation class loginServlet
 */
@WebServlet("/loginServlet")
public class loginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public loginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("ciao ciao ciao");
		
		PrintWriter out = response.getWriter();
		
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String tipo = request.getParameter("tipo");
		//System.out.println("\n\n\n"+tipo+"\n\n\n");
		
		//System.out.println(email);
		
		UtenteModel utenteModel = new UtenteModel();
		
		Utente utente = new Utente();
		
		try {
			utente = utenteModel.searchUser(email, password, tipo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		System.out.println(utente.toString());
		
		String risposta = "";
		
		
		if(utente.getId()!=null)
		{
			request.getSession().setAttribute("utente",utente);  //memorizza l'utente nella sessione
			risposta = "1"; //è stato trovato un utente con email e password valide
			//REDIRECT
			//response.sendRedirect("./jsp/profilo.jsp");
		}
		else {
			risposta = "0"; //NON è stato trovato un utente con email e password valide
			//response.sendRedirect("./jsp/loginForm.jsp");
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
