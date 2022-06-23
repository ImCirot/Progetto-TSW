package controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.AppartenenzaBean;
import model.AppartenenzaDAO;
import model.DettaglioProdottoBean;
import model.DettaglioProdottoDAO;
import model.ProdottoBean;
import model.ProdottoDAO;
import model.SottoCategoriaBean;
import model.SottoCategoriaDAO;

/**
 * Servlet implementation class SelectProdottoServlet
 */
@WebServlet("/select")
public class SelectProdottoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectProdottoServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String type = request.getParameter("type");
		String path = null;
		ProdottoDAO dbProdotto = new ProdottoDAO();
		DettaglioProdottoDAO dbDettagli = new DettaglioProdottoDAO();
		
		ProdottoBean prodotto = new ProdottoBean();
		DettaglioProdottoBean dettagliProdotto = new DettaglioProdottoBean();
		if(type.equalsIgnoreCase("prodotto")) {
		try {
			prodotto = dbProdotto.doRetrieveByKey(request.getParameter("prodotto"));
			dettagliProdotto = dbDettagli.doRetrieveByKey(prodotto.getCodiceSeriale());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		request.setAttribute("prodotto", prodotto);
		request.setAttribute("dettagliProdotto", dettagliProdotto);
		path = "./prodotto.jsp";
		} else if(type.equalsIgnoreCase("marca")) {
			
			List<ProdottoBean> listaProdottiTrovati = new ArrayList<>();
			List<DettaglioProdottoBean> dettagli = new ArrayList<>();
			Iterator<ProdottoBean> iterProdotti;
			Iterator<DettaglioProdottoBean> iterDettagli;
			List<ProdottoBean> prodottiTerminati = new ArrayList<>();
			DettaglioProdottoBean dettaglio = new DettaglioProdottoBean();
			try {
				listaProdottiTrovati = dbProdotto.filterByMarca(request.getParameter("marca"));
				dettagli = dbDettagli.doRetrieveAll("prova");
				if(listaProdottiTrovati.isEmpty()) {
					request.getSession().setAttribute("empty", true);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			iterProdotti = listaProdottiTrovati.iterator();
			
			while(iterProdotti.hasNext()) {
				prodotto = iterProdotti.next();
				iterDettagli = dettagli.iterator();
				
				while(iterDettagli.hasNext()) {
					dettaglio = iterDettagli.next();
					
					if(dettaglio.getProdotto().equalsIgnoreCase(prodotto.getCodiceSeriale())) break;
				}
				
				if(dettaglio.getQuantita() == 0) {
					prodottiTerminati.add(prodotto);
				}
			}
			
			iterProdotti = prodottiTerminati.iterator();
			
			while(iterProdotti.hasNext()) {
				prodotto = iterProdotti.next();
				
				listaProdottiTrovati.remove(prodotto);
			}
			request.getSession().setAttribute("prodottiTerminati", prodottiTerminati);
			request.getSession().setAttribute("empty", false);
			request.getSession().setAttribute("prodottiTrovati", listaProdottiTrovati);
			path = "./searchProduct.jsp";
		} else if(type.equalsIgnoreCase("categoria")) {
			List<ProdottoBean> listaProdottiTrovati = new ArrayList<>();
			List <AppartenenzaBean> listaSottoCategorie = new ArrayList<>();
			List<DettaglioProdottoBean> dettagli = new ArrayList<>();
			Iterator<ProdottoBean> iterProdotti;
			Iterator<DettaglioProdottoBean> iterDettagliProd;
			List<ProdottoBean> prodottiTerminati = new ArrayList<>();
			DettaglioProdottoBean dettaglio = new DettaglioProdottoBean();
			AppartenenzaDAO dbCategorie = new AppartenenzaDAO();
			AppartenenzaBean sottoCat = new AppartenenzaBean();
			try {
				listaSottoCategorie = dbCategorie.filterByCategoria(request.getParameter("categoria"));
				dettagli = dbDettagli.doRetrieveAll("prova");
			} catch (SQLException e) {
				e.printStackTrace();
			}
			List<ProdottoBean> listaProdotti = (List<ProdottoBean>) request.getSession().getAttribute("prodotti");
			Iterator<ProdottoBean> iterProd;
			Iterator<AppartenenzaBean> iterDettagli = listaSottoCategorie.iterator();
			
			while(iterDettagli.hasNext()) {
				sottoCat = iterDettagli.next();
				iterProd = listaProdotti.iterator();
				while(iterProd.hasNext()) {
					prodotto = iterProd.next();
					if(prodotto.getCodiceSeriale().equalsIgnoreCase(sottoCat.getProdotto())) {
						listaProdottiTrovati.add(prodotto);
					}
				}
			}
			if(listaProdottiTrovati.isEmpty()) {
				request.getSession().setAttribute("empty", true);
			} else {
				iterProdotti = listaProdottiTrovati.iterator();
				
				while(iterProdotti.hasNext()) {
					prodotto = iterProdotti.next();
					iterDettagliProd = dettagli.iterator();
					
					while(iterDettagliProd.hasNext()) {
						dettaglio = iterDettagliProd.next();
						
						if(dettaglio.getProdotto().equalsIgnoreCase(prodotto.getCodiceSeriale())) break;
					}
					
					if(dettaglio.getQuantita() == 0) {
						prodottiTerminati.add(prodotto);
					}
				}
				
				iterProdotti = prodottiTerminati.iterator();
				
				while(iterProdotti.hasNext()) {
					prodotto = iterProdotti.next();
					
					listaProdottiTrovati.remove(prodotto);
				}
				request.getSession().setAttribute("prodottiTerminati", prodottiTerminati);
				request.getSession().setAttribute("empty", false);
				request.getSession().setAttribute("prodottiTrovati", listaProdottiTrovati);
			}
			path = "./searchProduct.jsp";
		}
		
		RequestDispatcher view = request.getRequestDispatcher(path);
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
