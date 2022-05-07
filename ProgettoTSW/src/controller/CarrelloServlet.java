package controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class CarrelloServlet
 */
@WebServlet("/Carrello")
public class CarrelloServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CarrelloServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String prodotto = request.getParameter("prodotto");
		Integer quantita = Integer.parseInt(request.getParameter("quantita"));
		Integer quantitaPresente;
		
		Map<String,Integer> carrello = new HashMap<>();
		
		if(request.getSession().getAttribute("carrello") == null) {
			carrello = (Map<String,Integer>) request.getSession().getAttribute("carrello");
		}
		
		if(carrello.containsKey(prodotto)) {
			quantitaPresente = carrello.get(prodotto);
			carrello.put(prodotto,quantita + quantitaPresente);
		} else {
			carrello.put(prodotto,quantita);
		}
		
		request.getSession().setAttribute("carrello", carrello);
		request.getSession().setAttribute("aggiunto", "Aggiunto al carrello!");
		
		RequestDispatcher view = request.getRequestDispatcher("SelectProdottoServlet?prodotto=" + prodotto);
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
