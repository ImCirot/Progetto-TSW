package controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
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
		String mode = request.getParameter("mode");
		OrdineBean ordine = new OrdineBean();
		OrdineDAO dbOrdini = new OrdineDAO();
		List<ComposizioneOrdineBean> composizioneOrdine = null;
		ComposizioneOrdineDAO dbComposizioni = new ComposizioneOrdineDAO();
		
		if(mode == null) {
			String ordineID = request.getParameter("ordine");
			String cliente = request.getParameter("cliente");
			
			
			try {
				ordine = dbOrdini.doRetrieveByKey(ordineID, cliente);
				composizioneOrdine = dbComposizioni.doRetrieveAllByKey(ordineID);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			request.setAttribute("ordine", ordine);
			request.setAttribute("composizione", composizioneOrdine);
			if(request.getParameter("acquisto") != null) {
				request.setAttribute("acquisto", "si");
			}
			RequestDispatcher view = request.getRequestDispatcher("./dettagliOrdine.jsp");
			view.forward(request, response);
		} else if(mode.equalsIgnoreCase("admin")) {
			String target = request.getParameter("target");
			List<OrdineBean> listaOrdiniCliente = new ArrayList<>();
			
			try {
				listaOrdiniCliente = dbOrdini.doRetrieveAllByKey(target);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			request.getSession().setAttribute("ordini", listaOrdiniCliente);
			request.setAttribute("cliente", target);
			RequestDispatcher view = request.getRequestDispatcher("./listaOrdini.jsp");
			view.forward(request, response);
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
