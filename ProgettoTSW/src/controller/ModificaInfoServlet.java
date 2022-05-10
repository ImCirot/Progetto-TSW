package controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.IndirizzoBean;
import model.IndirizzoDAO;
import model.UtenteBean;
import model.UtenteDAO;

/**
 * Servlet implementation class ModificaInfoServlet
 */
@WebServlet("/modificaInfo")
public class ModificaInfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ModificaInfoServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mode = request.getParameter("mode");
		String target = request.getParameter("target");
		String username = request.getParameter("utente");
		String pathRedirect = null;
		
		if(mode.equals("update")) {
			if(target.equals("utente")) {
				 UtenteDAO dbUtenti = new UtenteDAO();
				 UtenteBean utente = new UtenteBean();
				 
				 try {
					utente = dbUtenti.doRetrieveByKey(username);
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
				request.setAttribute("utente", utente);
				request.setAttribute("target", "utente");
				pathRedirect = "./modificaInfoForm.jsp";
				
			} else if (target.equals("indirizzo")) {
				String indirizzoID = request.getParameter("indirizzoID");
				IndirizzoDAO dbIndirizzi = new IndirizzoDAO();
				IndirizzoBean indirizzo = new IndirizzoBean();
				
				try {
					indirizzo = dbIndirizzi.doRetrieveByKey(indirizzoID, username);
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
				request.setAttribute("indirizzo", indirizzo);
				request.setAttribute("target", "indirizzo");
				pathRedirect = "./modificaInfoForm.jsp";
			} else if (target.equals("metodoPagamento")) {
				
			}
		} else if (mode.equals("add")) {
			if(target.equals("indirizzo")) {
				
			} else if (target.equals("metodoPagamento")) {
				
			}
		}
		
		RequestDispatcher view = request.getRequestDispatcher(pathRedirect);
		view.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
