package Servlet;

import java.io.IOException;
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
 * Servlet implementation class concimaServlet
 */
@WebServlet("/concimaServlet")
public class concimaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public concimaServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Campo campoSelezionato = (Campo) request.getSession().getAttribute("campo_selezionato");
		String concime = request.getParameter("colture");
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
		
		try {
			item = itemModel.doRetrieveById(concime);
			ris2 = dispositivoModel.updateStatoById(robot, stato);
			
		
			if(ris2==1) {
				listaDispositivi = dispositivoModel.doRetrieveByNomeCampo(campoSelezionato.getNome());
				request.getSession().setAttribute("lista_dispositivi", listaDispositivi);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		if(ris2==1) {
			response.sendRedirect("./jsp/visualizzaCampo.jsp");
		}
		else {
			
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
