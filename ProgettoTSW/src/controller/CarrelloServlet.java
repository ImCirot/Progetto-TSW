package controller;

import java.io.IOException;
import java.math.BigDecimal;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.HashMap;
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
			request.getSession().setAttribute("aggiunto", "Aggiunto al carrello!");
			redirectPath = "SelectProdottoServlet?prodotto=" + prodotto;
			
		} else if(mode.equalsIgnoreCase("update")) {
			quantita = Integer.parseInt(request.getParameter("quantita"));
			carrello = (Map<String,Integer>) request.getSession().getAttribute("carrello");
			
			if(quantita == 0) {
				carrello.remove(prodotto); 
			} else {
			carrello.put(prodotto, quantita);
			}
			
			request.getSession().setAttribute("carrello", carrello);
			redirectPath = "carrello.jsp";
		} else if(mode.equalsIgnoreCase("remove")) {
			carrello = (Map<String,Integer>) request.getSession().getAttribute("carrello");
			carrello.remove(prodotto);
			
			if(carrello.isEmpty()) {
				request.getSession().removeAttribute("carrello");
			}
			
			redirectPath = "carrello.jsp";
		}
		
		RequestDispatcher view = request.getRequestDispatcher(redirectPath);
		view.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String indirizzo = request.getParameter("indirizzo");
		String metodoDiPagamento = request.getParameter("metodoDiPagamento");
		String utente = (String) request.getSession().getAttribute("utente");
		double costoTot = Double.parseDouble(request.getParameter("costoTot"));
		
		IndirizzoDAO dbIndirizzi = new IndirizzoDAO();
		MetodoDiPagamentoDAO dbMetodiDiPagamento = new MetodoDiPagamentoDAO();
		OrdineDAO dbOrdini = new OrdineDAO();
		
		try {
			IndirizzoBean datiIndirizzo = dbIndirizzi.doRetrieveByKey(indirizzo, utente);
			MetodoDiPagamentoBean datiMetodoDiPagamento = dbMetodiDiPagamento.doRetrieveByKey(metodoDiPagamento, utente);
			
			OrdineBean ordine = new OrdineBean();
			
			ordine.setCliente(utente);
			ordine.setCostoTotale(BigDecimal.valueOf(costoTot));
			ordine.setTipoPagamento(datiMetodoDiPagamento.getTipo());
			
			if(datiMetodoDiPagamento.getTipo().equals("IBAN")) {
				ordine.setIBAN(datiMetodoDiPagamento.getIBAN());
			} else {
				ordine.setNumCarta(datiMetodoDiPagamento.getNumCarta());
			}
			
			ordine.setCitta(datiIndirizzo.getCitta());
			ordine.setCAP(datiIndirizzo.getCitta());
			ordine.setVia(datiIndirizzo.getVia());
			ordine.setCivico(datiIndirizzo.getCivico());
			ordine.setProvincia(datiIndirizzo.getProvincia());
			ordine.setNazione(datiIndirizzo.getNazione());
			ordine.setDataAcquisto(LocalDate.now().toString());
			
			dbOrdini.doSave(ordine);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
