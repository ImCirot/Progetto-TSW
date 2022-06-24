package controller;

import java.io.IOException;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.RecensioneBean;
import model.RecensioneDAO;

/**
 * Servlet implementation class RecensioneServlet
 */
@WebServlet("/recensione")
public class RecensioneServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RecensioneServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mode = request.getParameter("mode");
		String path = null;
		
		if(mode.equalsIgnoreCase("aggiungi")) {
			String codiceSeriale = request.getParameter("seriale");
			String prodotto = request.getParameter("prodotto");
			String cliente = (String) request.getSession().getAttribute("utente");
			String testo = request.getParameter("testo");
			String anonimo = request.getParameter("anonimo");
			int voto = Integer.parseInt(request.getParameter("voto"));
			
			RecensioneDAO dbRecensioni = new RecensioneDAO();
			RecensioneBean recensione = new RecensioneBean();
			List<RecensioneBean> recensioni = new ArrayList<>();
			
			recensione.setCodiceSerialeProdotto(codiceSeriale);
			recensione.setData(LocalDate.now().toString());
			recensione.setCliente(cliente);
			recensione.setProdotto(prodotto);
			recensione.setTestoRecensione(testo);
			if(anonimo.equalsIgnoreCase("si")) {
				recensione.setAnonimo(true);
			} else {
				recensione.setAnonimo(false);
			}
			recensione.setVoto(voto);
			
			try {
				dbRecensioni.doSave(recensione);
				recensioni = dbRecensioni.doRetrieveAllByKey(cliente);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			request.getSession().setAttribute("recensioni", recensioni);
			path = "select?type=prodotto&prodotto=" + codiceSeriale;
		} else if(mode.equalsIgnoreCase("modifica")) {
			
		}
		
		RequestDispatcher view = request.getRequestDispatcher(path);
		view.forward(request, response);
	}

}
