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
 * Servlet implementation class seminaServlet
 */
@WebServlet("/seminaServlet")
public class seminaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public seminaServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		
		Campo campoSelezionato = (Campo) request.getSession().getAttribute("campo_selezionato");
		String coltura = request.getParameter("colture");
		String robot = request.getParameter("robot");
		
	
		
		ItemModel itemModel = new ItemModel();
		CampoModel campoModel = new CampoModel();
		DispositivoModel dispositivoModel = new DispositivoModel();
		
		Item item = new Item();
		Campo campoUpdate = new Campo();
		ArrayList<Dispositivo> listaDispositivi = new ArrayList<Dispositivo>();
		Dispositivo disp = new Dispositivo();
		
		int ris=0;
		int ris2=0;
		
		String stato="occupato";
		String risposta = "";
		try {
			item = itemModel.doRetrieveById(coltura);
			ris = campoModel.updateColturaCampo(campoSelezionato.getNome(), item.getNome());
			ris2 = dispositivoModel.updateStatoById(robot, stato);
			if(ris==1) {
				campoUpdate = campoModel.doRetrieveByNome(campoSelezionato.getNome());
				request.getSession().setAttribute("campo_selezionato", campoUpdate);
			}
			
			if(ris2==1) {
				listaDispositivi = dispositivoModel.doRetrieveByNomeCampo(campoSelezionato.getNome());
				request.getSession().setAttribute("lista_dispositivi", listaDispositivi);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		if(ris==1 && ris2==1) {
			risposta="1";
			
		}
		else {
			risposta="0";
		}
		System.out.println("risposta ****" +risposta);
		response.sendRedirect("./jsp/i_miei_campi.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
