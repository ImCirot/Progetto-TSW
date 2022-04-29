package controller;

import java.io.IOException;
import java.math.BigDecimal;
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
 * Servlet implementation class RimuoviProdottoServlet
 */
@WebServlet("/modificaProdotto")
public class ModificaProdottoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ModificaProdottoServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mode = request.getParameter("mode");
		ProdottoDAO dbProdotto = new ProdottoDAO();
		DettaglioProdottoDAO dbDettagli = new DettaglioProdottoDAO();
		
		if(mode.equalsIgnoreCase("elimina")) {
			String prodotto = request.getParameter("prodotto");
			try {
				dbProdotto.doDelete(prodotto);
				} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else if (mode.equalsIgnoreCase("modifica")) {
			String codiceSeriale = request.getParameter("codiceSeriale");
			String nome = request.getParameter("nome");
			String marca = request.getParameter("marca");
			String descrizione = request.getParameter("desc");
			String edLimitata = request.getParameter("edLimitata");
			String tipo = request.getParameter("tipo");
			String costo = request.getParameter("costo");
			String IVA = request.getParameter("IVA");
			String quantita = request.getParameter("quantita");
			String origine = request.getParameter("origine");
			String scadenza = request.getParameter("scadenza");
			String peso = request.getParameter("peso");
			String volume = request.getParameter("volume");
			String img = request.getParameter("img");
			
			ProdottoBean prodotto = new ProdottoBean();
			DettaglioProdottoBean dettagli = new DettaglioProdottoBean();
			
			prodotto.setCodiceSeriale(codiceSeriale);
			prodotto.setNome(nome);
			prodotto.setMarca(marca);
			prodotto.setDescrizioneBreve(descrizione);
			if(edLimitata.equalsIgnoreCase("si")) {
				prodotto.setEdLimitata(true);
			} else {
				prodotto.setEdLimitata(false);
			}
			
			dettagli.setProdotto(codiceSeriale);
			dettagli.setTipo(tipo);
			dettagli.setCostoUnitario(BigDecimal.valueOf(Double.parseDouble(costo)));
			dettagli.setIVA(Integer.parseInt(IVA));
			dettagli.setQuantita(Integer.parseInt(quantita));
			dettagli.setOrigine(origine);
			dettagli.setScadenza(scadenza);
			dettagli.setPeso(peso);
			dettagli.setVolume(volume);
			dettagli.setImmagine(img);
			
			try {
				dbProdotto.doUpdate(prodotto);
				dbDettagli.doUpdate(dettagli);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		} else if (mode.equalsIgnoreCase("aggiungi")) {
			String codiceSeriale = request.getParameter("codiceSeriale");
			String nome = request.getParameter("nome");
			String marca = request.getParameter("marca");
			String descrizione = request.getParameter("desc");
			String edLimitata = request.getParameter("edLimitata");
			String tipo = request.getParameter("tipo");
			String costo = request.getParameter("costo");
			String IVA = request.getParameter("IVA");
			String quantita = request.getParameter("quantita");
			String origine = request.getParameter("origine");
			String scadenza = request.getParameter("scadenza");
			String peso = request.getParameter("peso");
			String volume = request.getParameter("volume");
			String img = request.getParameter("img");
			
			ProdottoBean prodotto = new ProdottoBean();
			DettaglioProdottoBean dettagli = new DettaglioProdottoBean();
			
			prodotto.setCodiceSeriale(codiceSeriale);
			prodotto.setNome(nome);
			prodotto.setMarca(marca);
			prodotto.setDescrizioneBreve(descrizione);
			
			if(edLimitata.equalsIgnoreCase("si")) {
				prodotto.setEdLimitata(true);
			} else {
				prodotto.setEdLimitata(false);
			}
			
			dettagli.setProdotto(codiceSeriale);
			dettagli.setTipo(tipo);
			dettagli.setCostoUnitario(BigDecimal.valueOf(Double.parseDouble(costo)));
			dettagli.setIVA(Integer.parseInt(IVA));
			dettagli.setQuantita(Integer.parseInt(quantita));
			dettagli.setOrigine(origine);
			dettagli.setScadenza(scadenza);
			if(tipo.equalsIgnoreCase("drink")) {
				dettagli.setVolume(volume);
			} else {
				dettagli.setPeso(peso);
			}
			dettagli.setImmagine(img);
			
			try {
				dbProdotto.doSave(prodotto);
				dbDettagli.doSave(dettagli);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		RequestDispatcher view = request.getRequestDispatcher("catalogo");
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
