package controller;

import java.io.IOException;
import java.io.Writer;
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

import model.ProdottoBean;
import model.ProdottoDAO;
import model.SottoCategoriaBean;
import model.SottoCategoriaDAO;

/**
 * Servlet implementation class SearchServlet
 */
@WebServlet("/search")
public class SearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<ProdottoBean> prodottiTrovati = new ArrayList<>();
		ProdottoDAO dbProdotti = new ProdottoDAO();
		ProdottoBean prodotto = new ProdottoBean();
		String search = request.getParameter("search");
		String type = request.getParameter("type");
		String target = request.getParameter("target");
		
		
		if(target.equals("search-bar")) {
			response.setContentType("text/html");
			Writer out = response.getWriter();
			if(type.equals("product")) {
				try {
					prodottiTrovati = dbProdotti.searchBy(search);
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
				out.write("<h3>Prodotti</h3>");
				if(prodottiTrovati.isEmpty()) {
					out.append("Nessun prodotto trovato"); 
				} else {
					Iterator<ProdottoBean> iterProdotti = prodottiTrovati.iterator();
					
					
					while(iterProdotti.hasNext()) {
						prodotto = iterProdotti.next();
						out.write("<a class=\"result\" href=\"SelectProdottoServlet?prodotto=" + prodotto.getCodiceSeriale() + "\">" + prodotto.getNome() + "</a>");
					}
							
				}
			} else if(type.equals("type")) {
				List<SottoCategoriaBean> listaSottoCategorie = new ArrayList<>();
				SottoCategoriaBean sottoCategoria = new SottoCategoriaBean();
				SottoCategoriaDAO dbSottoCategorie = new SottoCategoriaDAO();
				
				try {
					listaSottoCategorie = dbSottoCategorie.searchBy(search);
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
				out.write("<h3>Categoria</h3>");
				if(listaSottoCategorie.isEmpty()) {
					out.append("Nessuna categoria trovata");
				} else {
					Iterator<SottoCategoriaBean> iterSottoCat = listaSottoCategorie.iterator();
					
					
					while(iterSottoCat.hasNext()) {
						sottoCategoria = iterSottoCat.next();
						out.write("<a class=\"result\" href=\"#\">" + sottoCategoria.getNome() + "</a>");
					}
				}
			} else if(type.equals("brand")) {
				try {
					prodottiTrovati = dbProdotti.searchBy(search);
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
				out.write("<h3>Marca</h3>");
				if(prodottiTrovati.isEmpty()) {
					out.append("Nessuna marca trovata"); 
				} else {
					Iterator<ProdottoBean> iterProdotti = prodottiTrovati.iterator();
					
					
					while(iterProdotti.hasNext()) {
						prodotto = iterProdotti.next();
						out.write("<a class=\"result\" href=\"#\">" + prodotto.getMarca() + "</a>");
					}
							
				}
			}
		} else if(target.equals("search-enter")) {
				try {
					prodottiTrovati = dbProdotti.searchBy(search);
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
				if(prodottiTrovati.isEmpty()) {
					request.getSession().setAttribute("empty", true);
					request.getSession().setAttribute("search", search);
					response.getWriter().print("./searchProduct.jsp");
				} else if(prodottiTrovati.size() == 1) {
					prodotto = prodottiTrovati.get(0);
					response.getWriter().print("SelectProdottoServlet?prodotto=" + prodotto.getCodiceSeriale());
				} else {
					request.getSession().setAttribute("empty", false);
					request.getSession().setAttribute("search", search);
					request.getSession().setAttribute("prodottiTrovati", prodottiTrovati);
					response.getWriter().print("./searchProduct.jsp");
				}
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
