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

import model.DettaglioProdottoBean;
import model.DettaglioProdottoDAO;
import model.ProdottoBean;
import model.ProdottoDAO;

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
		List<DettaglioProdottoBean> dettagliProdotti = new ArrayList<>();
		DettaglioProdottoBean dettagli = new DettaglioProdottoBean();
		String filter = request.getParameter("filter");
		
		if(filter != null) {
			if(filter.equals("snack") || filter.equals("drink")) {
				try {
					dettagliProdotti = dbDettagli.filterByTipo(filter);
					Iterator<DettaglioProdottoBean> iterDettagliProdotti = dettagliProdotti.iterator();
					
					while(iterDettagliProdotti.hasNext()) {
						dettagli = iterDettagliProdotti.next();
						ProdottoBean prodotto = new ProdottoBean();
						
						prodotto = dbProdotti.doRetrieveByKey(dettagli.getProdotto());
						
						prodotti.add(prodotto);
					}
				} catch (SQLException e) {
					// TODO Auto-generated catch block				
					request.getSession().setAttribute("prodotti", prodotti);
					request.getSession().setAttribute("dettagliProdotti", dettagliProdotti);
					if (request.getSession().getAttribute("admin") == null) {
						request.getSession().setAttribute("admin",false);
					}
					e.printStackTrace();
				}
			} else {
				ProdottoBean prodotto = new ProdottoBean();
				try {
					prodotti = dbProdotti.filterByEDLimitata();
					Iterator<ProdottoBean> iterProdottiTrovati = prodotti.iterator();
					
					while(iterProdottiTrovati.hasNext()) {
						prodotto = iterProdottiTrovati.next();
						
						dettagli = dbDettagli.doRetrieveByKey(prodotto.getCodiceSeriale());
						
						dettagliProdotti.add(dettagli);
					}
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		} else {
			try {
				prodotti = dbProdotti.doRetrieveAll("codiceSeriale");
				dettagliProdotti = dbDettagli.doRetrieveAll("tipo");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		request.getSession().setAttribute("prodotti", prodotti);
		request.getSession().setAttribute("dettagliProdotti", dettagliProdotti);
		if (request.getSession().getAttribute("admin") == null) {
			request.getSession().setAttribute("admin",false);
		}	
		
		RequestDispatcher view = request.getRequestDispatcher("./catalogo.jsp");
		view.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}
}
