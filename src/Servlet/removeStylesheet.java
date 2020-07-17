package Servlet;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class removeStylesheet
 */
@WebServlet("/removeStylesheet")
public class removeStylesheet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public removeStylesheet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PrintWriter out = response.getWriter();
		
		try {
			File file = new File("/Users/carminesorrentino/Desktop/acagreen/acagreen/WebContent/css/myStyle.css");
			PrintWriter printWriter = new PrintWriter(file);
			
			printWriter.write("@charset \"UTF-8\"");
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
