package controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.ComposizioneOrdineBean;
import model.ComposizioneOrdineDAO;
import model.OrdineBean;
import model.OrdineDAO;

/**
 * Servlet implementation class GestisciOrdineServlet
 */
@WebServlet("/gestisciOrdine")
public class GestisciOrdineServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GestisciOrdineServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String ordineID = request.getParameter("ordine");
		OrdineBean ordine = new OrdineBean();
		OrdineDAO dbOrdini = new OrdineDAO();
		List<ComposizioneOrdineBean> composizioneOrdine = null;
		ComposizioneOrdineDAO dbComposizioni = new ComposizioneOrdineDAO();
		
		try {
			ordine = dbOrdini.doRetrieveByKey(ordineID, (String) request.getSession().getAttribute("utente"));
			composizioneOrdine = dbComposizioni.doRetrieveAllByKey(ordineID);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		request.setAttribute("ordine", ordine);
		request.setAttribute("composizione", composizioneOrdine);
		RequestDispatcher view = request.getRequestDispatcher("./dettagliOrdine.jsp");
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
