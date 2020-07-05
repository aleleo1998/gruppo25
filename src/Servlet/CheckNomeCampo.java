package Servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.*;

/**
 * Servlet implementation class AggiungiCampoServlet
 */
@WebServlet("/CheckNomeCampo")
public class CheckNomeCampo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CheckNomeCampo() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	  PrintWriter out = response.getWriter();
	  String nome=request.getParameter("nome");
	  String cord=request.getParameter("cord");
	  String proprietario=request.getParameter("proprietario");
	  System.out.println(proprietario);
	  String tipo=request.getParameter("tipo");
	  String ettari=request.getParameter("ettari");
	  int temp=(int)(Math.random()*30);
	  int umidità1=(int)(Math.random()*80);
	  System.out.println(temp);
	  String temperatura=temp+"°";
	  String umidità=umidità1+"%";
	  
	  CampoModel cm=new CampoModel();
	  try {
		Campo campo=cm.doRetrieveByNome(nome);
		if(campo.getNome()==null)
		  {
			cm.doSave(nome, cord, proprietario, tipo, ettari, temperatura, umidità);
			out.print("campo salvato");
		  }
		else
		{
			out.print("Nome già presente");
		}
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
		doGet(request,response);
	}

}

