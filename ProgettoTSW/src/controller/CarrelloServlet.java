package controller;

import java.io.IOException;
import java.math.BigDecimal;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.IndirizzoBean;
import model.IndirizzoDAO;
import model.MetodoDiPagamentoBean;
import model.MetodoDiPagamentoDAO;
import model.OrdineBean;
import model.OrdineDAO;
import model.UtenteBean;
import model.UtenteDAO;

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
		Integer quantita;
		String mode = request.getParameter("mode");
		String redirectPath = null;
		
		Integer quantitaPresente;
		
		Map<String,Integer> carrello = new HashMap<>();
		
		if(mode.equalsIgnoreCase("add")) {
			quantita = Integer.parseInt(request.getParameter("quantita"));
			if(request.getSession().getAttribute("carrello") != null) {
				carrello = (Map<String,Integer>) request.getSession().getAttribute("carrello");
				if(carrello.containsKey(prodotto)) {
					quantitaPresente = carrello.get(prodotto);
					carrello.put(prodotto,quantita + quantitaPresente);
				} else {
					carrello.put(prodotto,quantita);
				}
			} else {
				carrello.put(prodotto, quantita);
			}
			
			request.getSession().setAttribute("carrello", carrello);
			if(request.getParameter("catalogo") != null) {
				redirectPath = "catalogo";
			} else {
				request.getSession().setAttribute("aggiunto", "Aggiunto al carrello!");
				redirectPath = "SelectProdottoServlet?prodotto=" + prodotto;
			}
		} else if(mode.equalsIgnoreCase("update")) {
			quantita = Integer.parseInt(request.getParameter("quantita"));
			carrello = (Map<String,Integer>) request.getSession().getAttribute("carrello");
			
			if(quantita == 0) {
				carrello.remove(prodotto); 
				
				
				
			} else {
			carrello.put(prodotto, quantita);
			}
			
			if(carrello.isEmpty()) {
				request.getSession().removeAttribute("carrello");
			} else {
			request.getSession().setAttribute("carrello", carrello);
			}
			redirectPath = "./carrello.jsp";
		} else if(mode.equalsIgnoreCase("remove")) {
			carrello = (Map<String,Integer>) request.getSession().getAttribute("carrello");
			carrello.remove(prodotto);
			
			if(carrello.isEmpty()) {
				request.getSession().removeAttribute("carrello");
			}
			
			redirectPath = "./carrello.jsp";
		} else if(mode.equalsIgnoreCase("reset")) {
			request.getSession().removeAttribute("carrello");
			redirectPath = "./carrello.jsp";
		}
		
//		double costoTotale = 0.0;
//		String key = null;
//		Iterator<String> iterKeys = carrello.keySet().iterator();
//		
//		while(iterKeys.hasNext()) {
//			key = iterKeys.next();
//		}
		RequestDispatcher view = request.getRequestDispatcher(redirectPath);
		view.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}
}
