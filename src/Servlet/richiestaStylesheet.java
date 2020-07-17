package Servlet;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URL;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



/**
 * Servlet implementation class richiestaStylesheet
 */
@WebServlet("/richiestaStylesheet")
public class richiestaStylesheet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public richiestaStylesheet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PrintWriter out = response.getWriter();
		
		System.out.println("Entrato in css servlet");
		
		String fontFamily = request.getParameter("fontFamily");
		String fontSize = request.getParameter("fontSize");
		String color = request.getParameter("color");
		String fontWeight = request.getParameter("fontWeight");
		String background = request.getParameter("background");
		
		System.out.println(fontFamily);
		System.out.println(fontSize);
		System.out.println(color);
		System.out.println(fontWeight);
		System.out.println(background);
		
		
		
		

		/*if (file.exists()) {
			System.out.println("Il file esiste"+file.getAbsolutePath());
			file.delete();
		}*/
		
		//System.out.println("Il file è stato creato "+file.getAbsolutePath());
		
		try {
		File file = new File("/Users/carminesorrentino/Desktop/acagreen/acagreen/WebContent/css/myStyle.css");
		
		PrintWriter printWriter = new PrintWriter(file);
		
		printWriter.write("@charset \"UTF-8\";\n\nbody{\nfont-family: "+fontFamily+", Arial !important;\nfont-size: "+fontSize+" !important;\n"
					+ "color: "+color+" !important; \nbackground-color: "
							+ ""+background+" !important;\nfont-weight: "+fontWeight+" !important;\n}");
		printWriter.flush();
		printWriter.close();
			
		out.write(1);
			
		}catch(Exception e) {
			System.out.println("Il file non può essere creato");
			out.write(0);
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
