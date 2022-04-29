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
		
		try {
			prodotti = dbProdotti.doRetrieveAll("codiceSeriale");
			dettagliProdotti = dbDettagli.doRetrieveAll("tipo");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		request.setAttribute("prodotti", prodotti);
		request.setAttribute("dettagliProdotti", dettagliProdotti);
		request.getSession().setAttribute("admin", (Boolean) false);
		
		RequestDispatcher view = request.getRequestDispatcher("./mainpage.jsp");
		view.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ProdottoDAO dbProdotti = new ProdottoDAO();
		DettaglioProdottoDAO dbDettagli = new DettaglioProdottoDAO();
		List<ProdottoBean> prodotti = new ArrayList<>();
		List<DettaglioProdottoBean> dettagliProdotti = new ArrayList<>();
		
		try {
			prodotti = dbProdotti.doRetrieveAll("codiceSeriale");
			dettagliProdotti = dbDettagli.doRetrieveAll("tipo");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		request.setAttribute("prodotti", prodotti);
		request.setAttribute("dettagliProdotti", dettagliProdotti);
		
		RequestDispatcher view = request.getRequestDispatcher("./mainpage.jsp");
		view.forward(request, response);
	}

}
