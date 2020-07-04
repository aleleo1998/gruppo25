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

/**
 * Servlet implementation class visualizzaCampoServlet
 */
@WebServlet("/visualizzaCampoServlet")
public class visualizzaCampoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public visualizzaCampoServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
 
		String nomecampo = request.getParameter("nomecampo");
		
		CampoModel campoModel = new CampoModel();
		DispositivoModel dispositivoModel = new DispositivoModel();
		
		Campo campo = new Campo();
		ArrayList<Dispositivo> dispositiviList = new ArrayList<Dispositivo>();
		
		try {
			campo = campoModel.doRetrieveByNome(nomecampo);
			dispositiviList = dispositivoModel.doRetrieveByNomeCampo(nomecampo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		System.out.println(nomecampo);
		
	 
		request.getSession().setAttribute("campo_selezionato", campo);
		request.getSession().setAttribute("lista_dispositivi", dispositiviList);
		
		response.sendRedirect("./jsp/visualizzaCampo.jsp");
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		

		PrintWriter out = response.getWriter();
		
		String nomecampo = request.getParameter("nomecampo");
		
		CampoModel campoModel = new CampoModel();
		DispositivoModel dispositivoModel = new DispositivoModel();
		
		Campo campo = new Campo();
		ArrayList<Dispositivo> dispositiviList = new ArrayList<Dispositivo>();
		try {
			campo = campoModel.doRetrieveByNome(nomecampo);
			dispositiviList = dispositivoModel.doRetrieveByNomeCampo(nomecampo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		System.out.println(nomecampo);
		
		request.getSession().setAttribute("campo_selezionato", campo);
		request.getSession().setAttribute("lista_dispositivi", dispositiviList);
		
		out.write("1");
		
	}

}
