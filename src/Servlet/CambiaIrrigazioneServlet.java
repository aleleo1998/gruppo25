package Servlet;
import Model.*;
import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class CambiaIrrigazioneServlet
 */
@WebServlet("/CambiaIrrigazioneServlet")
public class CambiaIrrigazioneServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CambiaIrrigazioneServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String giorno=request.getParameter("giorno2");
		String inizio=request.getParameter("ora-inizio2");
		String fine=request.getParameter("ora-fine2");
		String id=request.getParameter("id");
		IrrigazioneModel im=new IrrigazioneModel();
		try {
			im.updateIrrigazione(id, inizio, fine, giorno);
			response.sendRedirect("./jsp/IrrigazioneView.jsp");
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
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
