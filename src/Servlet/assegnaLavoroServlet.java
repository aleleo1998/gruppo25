package Servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.UtenteModel;

/**
 * Servlet implementation class assegnaLavoroServlet
 */
@WebServlet("/assegnaLavoroServlet")
public class assegnaLavoroServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public assegnaLavoroServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PrintWriter out = response.getWriter();
		
		String success = "0";
		
		String id = request.getParameter("id");
		String campo_selezionato = request.getParameter("campo_selezionato");
		String attivita_selezionata = request.getParameter("attivita_selezionata");
		String durata_selezionata = request.getParameter("durata_selezionata");
		
		UtenteModel utenteModel = new UtenteModel();
		
		try {
			if(utenteModel.assegnaLavoro(id, campo_selezionato, attivita_selezionata, durata_selezionata) == 1)
				success = "1";
			else
				success = "0";
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		out.write(success);
			
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
