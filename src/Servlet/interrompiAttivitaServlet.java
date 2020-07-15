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

import Model.Campo;
import Model.CampoModel;
import Model.Dispositivo;
import Model.DispositivoModel;
import Model.Item;
import Model.ItemModel;

/**
 * Servlet implementation class interrompiAttivitaServlet
 */
@WebServlet("/interrompiAttivitaServlet")
public class interrompiAttivitaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public interrompiAttivitaServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		String robot = request.getParameter("idRobot");
		
		 
		DispositivoModel dispositivoModel = new DispositivoModel();
		
		 
		ArrayList<Dispositivo> listaDispositivi = new ArrayList<Dispositivo>();
		Dispositivo disp = new Dispositivo();
		
		int ris=0;
		int ris2=0;
		
		String stato="disponibile";
		String risposta = "";
		try {
			 
			ris = dispositivoModel.updateStatoById(robot, stato);
			 
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		if(ris==1) {
			risposta="1";
		 
		}
		else {
			risposta="0";
		}
		System.out.println("risposta " +risposta);
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
