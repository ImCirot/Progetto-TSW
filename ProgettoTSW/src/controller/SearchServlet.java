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
		String target = request.getParameter("target");
		
		
		if(target.equals("search-bar")) {
			response.setContentType("text/html");
			Writer out = response.getWriter();
			try {
				prodottiTrovati = dbProdotti.searchBy(search);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			if(prodottiTrovati.isEmpty()) {
				out.append("Nessun prodotto"); 
			} else {
				Iterator<ProdottoBean> iterProdotti = prodottiTrovati.iterator();
				
				while(iterProdotti.hasNext()) {
					prodotto = iterProdotti.next();
					out.append("<a class=\"result\" href=\"SelectProdottoServlet?prodotto=" + prodotto.getCodiceSeriale() + "\">" + prodotto.getNome() + " " +  prodotto.getMarca() + "</a>");
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
					request.setAttribute("empty", true);
				} else {
					request.setAttribute("empty", false);
					request.setAttribute("prodottiTrovati", prodottiTrovati);
				}
				
				RequestDispatcher view = request.getRequestDispatcher("./searchProduct.jsp");
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
