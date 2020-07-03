package Servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.Campo;
import Model.CampoModel;

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
		
		Campo campo = new Campo();
		
		try {
			campo = campoModel.doRetrieveByNome(nomecampo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		System.out.println(nomecampo);
		
		request.getSession().setAttribute("campo_selezionato", campo);
		
		response.sendRedirect("../jsp/visualizzaCampo.jsp");
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PrintWriter out = response.getWriter();
		
		String nomecampo = request.getParameter("nomecampo");
		
		CampoModel campoModel = new CampoModel();
		
		Campo campo = new Campo();
		
		try {
			campo = campoModel.doRetrieveByNome(nomecampo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		System.out.println(nomecampo);
		
		request.getSession().setAttribute("campo_selezionato", campo);
		
		out.write("1");
		
	}

}
