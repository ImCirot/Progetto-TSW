package controller;

import java.io.IOException;
import java.sql.SQLException;
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

import model.DettaglioProdottoBean;
import model.DettaglioProdottoDAO;
import model.ProdottoBean;
import model.ProdottoDAO;
import model.RecensioneBean;
import model.RecensioneDAO;

/**
 * Servlet implementation class CatalogoServlet
 */
@WebServlet("/catalogo")
public class CatalogoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CatalogoServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ProdottoDAO dbProdotti = new ProdottoDAO();
		DettaglioProdottoDAO dbDettagli = new DettaglioProdottoDAO();
		List<ProdottoBean> prodotti = new ArrayList<>();
		List<ProdottoBean> prodottiSconto = new ArrayList<>();
		List<ProdottoBean> prodottiTerminati = new ArrayList<>();
		List<DettaglioProdottoBean> dettagliProdotti = new ArrayList<>();
		List<DettaglioProdottoBean> dettagliProdottiSconto = new ArrayList<>();
		Map<String,List<RecensioneBean>> recensioniPerProdotto = new HashMap<>();
		List<RecensioneBean> recensioniTemp = new ArrayList<>();
		List<RecensioneBean> recensioni = new ArrayList<>();
		RecensioneBean recensione = new RecensioneBean();
		RecensioneDAO dbRecensioni = new RecensioneDAO();
		DettaglioProdottoBean dettagli = new DettaglioProdottoBean();
		ProdottoBean prodotto = new ProdottoBean();
		String filter = request.getParameter("filter");
		String path = null;
		
		if(filter != null) {
			if(filter.equals("snack") || filter.equals("drink")) {
				try {
					dettagliProdotti = dbDettagli.filterByTipo(filter);
					Iterator<DettaglioProdottoBean> iterDettagliProdotti = dettagliProdotti.iterator();
					
					while(iterDettagliProdotti.hasNext()) {
						dettagli = iterDettagliProdotti.next();
						
						prodotto = dbProdotti.doRetrieveByKey(dettagli.getProdotto());
						
						if(dettagli.getQuantita() == 0) {
							prodottiTerminati.add(prodotto);
						} else {
							prodotti.add(prodotto);
						}
					}
				} catch (SQLException e) {
					// TODO Auto-generated catch block				
					request.getSession().setAttribute("prodottiTerminati", prodottiTerminati);
					request.getSession().setAttribute("prodotti", prodotti);
					request.getSession().setAttribute("dettagliProdotti", dettagliProdotti);
					if (request.getSession().getAttribute("admin") == null) {
						request.getSession().setAttribute("admin",false);
					}
					e.printStackTrace();
				}
			} else if(filter.equalsIgnoreCase("edLimitata")){
				try {
					prodotti = dbProdotti.filterByEDLimitata();
					Iterator<ProdottoBean> iterProdottiTrovati = prodotti.iterator();
					
					while(iterProdottiTrovati.hasNext()) {
						prodotto = iterProdottiTrovati.next();
						
						dettagli = dbDettagli.doRetrieveByKey(prodotto.getCodiceSeriale());
						if(dettagli.getQuantita() == 0) {
							prodottiTerminati.add(prodotto);
						}
						dettagliProdotti.add(dettagli);
					}
					
					iterProdottiTrovati = prodottiTerminati.iterator();
					while(iterProdottiTrovati.hasNext()) {
						prodotto = iterProdottiTrovati.next();
						prodotti.remove(prodotto);
					}
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			} else if (filter.equalsIgnoreCase("offerta")) {
				List<ProdottoBean> prodottiTotali = new ArrayList<>();
				try {
					dettagliProdotti = dbDettagli.filterByOfferta();
					prodottiTotali = dbProdotti.doRetrieveAll("tipo");
					Iterator<DettaglioProdottoBean> iterProdottiTrovati = dettagliProdotti.iterator();
					Iterator<ProdottoBean> iterProdotti;
					
					while(iterProdottiTrovati.hasNext()) {
						dettagli = iterProdottiTrovati.next();
						iterProdotti = prodottiTotali.iterator();
						
						while(iterProdotti.hasNext()) {
							prodotto = iterProdotti.next();
							if(prodotto.getCodiceSeriale().equalsIgnoreCase(dettagli.getProdotto())) {
								if(dettagli.getQuantita() == 0) {
									prodottiTerminati.add(prodotto);
								} else {
									prodotti.add(prodotto);
								}
							}
						}
					}
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			} else if (filter.equalsIgnoreCase("catalogo")) {
				try {
					prodotti = dbProdotti.doRetrieveAll("codiceSeriale");
					dettagliProdotti = dbDettagli.filterByTerminati();
					
					Iterator<ProdottoBean> iterProdotti;
					Iterator<DettaglioProdottoBean> iterDettagliTerminati = dettagliProdotti.iterator();
					DettaglioProdottoBean dettaglio = new DettaglioProdottoBean();
					
					while(iterDettagliTerminati.hasNext()) {
						dettaglio = iterDettagliTerminati.next();
						iterProdotti = prodotti.iterator();
						while(iterProdotti.hasNext()) {
							prodotto = iterProdotti.next();
							if(prodotto.getCodiceSeriale().equalsIgnoreCase(dettaglio.getProdotto())) {
								prodottiTerminati.add(prodotto);
							}
						}
						
						iterProdotti = prodottiTerminati.iterator();
						
						while(iterProdotti.hasNext()) {
							prodotto = iterProdotti.next();
							
							if(prodotti.contains(prodotto)) {
								prodotti.remove(prodotto);
							}
						}
					}
					
					dettagliProdotti = dbDettagli.doRetrieveAll("tipo");
					
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			path = "./catalogo.jsp";
		} else {
			Iterator<RecensioneBean> iterRecensioni = null;
			Iterator<DettaglioProdottoBean> iterDettagli = null;
			Iterator<ProdottoBean> iterProdotti = null;
			try {
				prodotti = dbProdotti.doRetrieveAll("codiceSeriale");
				dettagliProdotti = dbDettagli.doRetrieveAll("tipo");
				dettagliProdottiSconto = dbDettagli.filterByOfferta();
				recensioni = dbRecensioni.doRetrieveAll("prova");
				iterDettagli = dettagliProdottiSconto.iterator();
				while(iterDettagli.hasNext()) {
					dettagli = iterDettagli.next();
					iterProdotti = prodotti.iterator();
					while(iterProdotti.hasNext()) {
						prodotto = iterProdotti.next();
						
						if(prodotto.getCodiceSeriale().equalsIgnoreCase(dettagli.getProdotto())) {
							if(dettagli.getQuantita() == 0) {
								prodottiTerminati.add(prodotto);
							} else {
								prodottiSconto.add(prodotto);
							}
						}
					}
				}
				request.getSession().setAttribute("prodottiSconto", prodottiSconto);
				
				iterRecensioni = recensioni.iterator();
				
				while(iterRecensioni.hasNext()) {
					recensione = new RecensioneBean();
					recensione = iterRecensioni.next();
					
					if(recensioniPerProdotto.containsKey(recensione.getCodiceSerialeProdotto())) {
						recensioniTemp = recensioniPerProdotto.get(recensione.getCodiceSerialeProdotto());
					} else {
						recensioniTemp = new ArrayList<>();
					}
					
					recensioniTemp.add(recensione);
					recensioniPerProdotto.put(recensione.getCodiceSerialeProdotto(), recensioniTemp);
				}
				
				request.getSession().setAttribute("recensioniPerProdotto", recensioniPerProdotto);
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			path = "./home.jsp";
		}
		
		request.getSession().setAttribute("prodotti", prodotti);
		request.getSession().setAttribute("prodottiTerminati", prodottiTerminati);
		request.getSession().setAttribute("dettagliProdotti", dettagliProdotti);
		
		if (request.getSession().getAttribute("admin") == null) {
			request.getSession().setAttribute("admin",false);
		}	
		
		RequestDispatcher view = request.getRequestDispatcher(path);
		view.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}
}
