package Servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.Utente;
import Model.UtenteModel;

/**
 * Servlet implementation class registrazioneServlet
 */
@WebServlet("/registrazioneServlet")
public class registrazioneServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public registrazioneServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String nome = request.getParameter("nome");
		String cognome = request.getParameter("cognome");
		String sesso = request.getParameter("sesso");
		String email = request.getParameter("email");
		String telefono = request.getParameter("telefono");
		String codiceFiscale = request.getParameter("codiceFiscale");
		String tipo = request.getParameter("tipo");
		String dirigente = "";
		if(tipo != "Agricoltore aziendale") {
			dirigente = request.getParameter("dirigente");
		}
		String password = request.getParameter("password");
		
		
		UtenteModel utenteModel = new UtenteModel();
		
		try {
			if(tipo == "Agricoltore privato")
				utenteModel.doSaveAgricoltorePrivato(nome, cognome, sesso, email, telefono, codiceFiscale, tipo, password);
			if(tipo == "Agricoltore aziendale")
				utenteModel.doSaveAgricoltoreAziendale(nome, cognome, sesso, email, telefono, codiceFiscale, tipo, password, dirigente);
			if(tipo == "Dirigente aziendale")
				utenteModel.doSaveDirigenteAziendale(nome, cognome, sesso, email, telefono, codiceFiscale, tipo, password);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		request.getSession().setAttribute("ruolo_agricoltore", tipo);
		
		response.sendRedirect("./jsp/firstLogin.jsp");
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
