package Servlet;
import Model.*;
import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.IrrigazioneModel;

/**
 * Servlet implementation class AggiungiIrrigazioneServlet
 */
@WebServlet("/AggiungiIrrigazioneServlet")
public class AggiungiIrrigazioneServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AggiungiIrrigazioneServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String ora_inizio=request.getParameter("ora-inizio");
		String ora_fine=request.getParameter("ora-fine");
		String giorno=request.getParameter("giorno");
		//Campo c=(Campo) request.getSession().getAttribute("campo_selezionato");
		IrrigazioneModel ir=new IrrigazioneModel();
		ir.doSave(giorno, ora_inizio, ora_fine, "campo1");
		response.sendRedirect("./jsp/IrrigazioneView.jsp");
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
