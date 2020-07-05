package Servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.DispositivoModel;

/**
 * Servlet implementation class AggiungiSensore
 */
@WebServlet("/AggiungiSensore")
public class AggiungiSensore extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AggiungiSensore() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String nome=request.getParameter("nome");
		String tipo=request.getParameter("tipo");
		String campo=request.getParameter("campo");
		System.out.println(campo);
		String proprietario=request.getParameter("proprietario");
		DispositivoModel dm=new DispositivoModel();
		dm.doSave(nome, tipo, campo, "disponibile", proprietario);
		response.sendRedirect("./jsp/SensoriRobotView.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
