package controller;

import java.io.IOException;
import java.io.Writer;
import java.math.BigDecimal;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
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
		String pathForward = null;
		
		if(mode.equalsIgnoreCase("elimina")) {
			String prodotto = request.getParameter("prodotto");
			try {
				dbProdotto.doDelete(prodotto);
				} catch (SQLException e) {
				e.printStackTrace();
			}
			
			pathForward = "catalogo";
			
		} else if (mode.equalsIgnoreCase("modifica")) {
			ProdottoBean prodotto = new ProdottoBean();
			DettaglioProdottoBean dettagli = new DettaglioProdottoBean();
			String codiceSeriale = request.getParameter("prodotto");
			
			try {
				prodotto = dbProdotto.doRetrieveByKey(codiceSeriale);
				dettagli = dbDettagli.doRetrieveByKey(codiceSeriale);
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			
			request.setAttribute("prodotto", prodotto);
			request.setAttribute("dettagli", dettagli);
			pathForward = "./modificaProdottoForm.jsp";
			
		} else if (mode.equalsIgnoreCase("aggiungi")) {
			String codiceSeriale = request.getParameter("codiceSeriale");
			String nome = request.getParameter("nome");
			String marca = request.getParameter("marca");
			String descrizione = request.getParameter("desc");
			String edLimitata = request.getParameter("edLimitata");
			String tipo = request.getParameter("tipo");
			String costo = request.getParameter("costo");
			String sconto = request.getParameter("sconto");
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
			dettagli.setCostoUnitario(BigDecimal.valueOf(Double.parseDouble(sconto)));
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
				e.printStackTrace();
			}
			
			pathForward = "catalogo";
		}
		
		RequestDispatcher view = request.getRequestDispatcher(pathForward);
		view.forward(request, response);
	}

	/**
	 * @throws IOException 
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ProdottoDAO dbProdotto = new ProdottoDAO();
		DettaglioProdottoDAO dbDettagli = new DettaglioProdottoDAO();
		Writer out = response.getWriter();
		
		String codiceSeriale = request.getParameter("prodotto");
		String nome = request.getParameter("nome");
		String marca = request.getParameter("marca");
		String descrizione = request.getParameter("desc");
		String edLimitata = request.getParameter("edLimitata");
		String tipo = request.getParameter("tipo");
		BigDecimal valore = BigDecimal.valueOf(Double.parseDouble(request.getParameter("costo")));
		BigDecimal sconto = null;
		if(!request.getParameter("sconto").equalsIgnoreCase("")) {
			sconto = BigDecimal.valueOf(Double.parseDouble(request.getParameter("sconto")));
		}
		Integer IVA = Integer.parseInt(request.getParameter("IVA"));
		Integer quantita = Integer.parseInt(request.getParameter("quantita"));
		String origine = request.getParameter("origine");
		String scadenza = request.getParameter("scadenza");
		String peso = request.getParameter("peso");
		String volume = request.getParameter("volume");
		String img = request.getParameter("img");
		
		ProdottoBean prodotto = new ProdottoBean();
		DettaglioProdottoBean dettagli = new DettaglioProdottoBean();
		
		try {
			prodotto = dbProdotto.doRetrieveByKey(codiceSeriale);
			dettagli = dbDettagli.doRetrieveByKey(codiceSeriale);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		if(!prodotto.getNome().equals(nome)) {
			prodotto.setNome(nome);
		}
		
		if(!prodotto.getMarca().equals(marca)) {
			prodotto.setMarca(marca);
		}
		
		if(!prodotto.getDescrizioneBreve().equals(descrizione)) {
			prodotto.setDescrizioneBreve(descrizione);
		}
		
		if(prodotto.isEdLimitata() && edLimitata.equalsIgnoreCase("no")) {
			prodotto.setEdLimitata(false);
		} else if (!prodotto.isEdLimitata() && edLimitata.equalsIgnoreCase("si")) {
			prodotto.setEdLimitata(true);
		}
		
		if(!dettagli.getTipo().equalsIgnoreCase(tipo)) {
			if(tipo.equalsIgnoreCase("snack") || tipo.equalsIgnoreCase("drink")) {
				dettagli.setTipo(tipo.toLowerCase());
			}
		}
		
		if(!dettagli.getCostoUnitario().equals(valore)) {
			dettagli.setCostoUnitario(valore);
		}
		
		if(dettagli.getPrezzoScontato() != null) {
			if(!dettagli.getPrezzoScontato().equals(sconto)) {
				dettagli.setPrezzoScontato(sconto);
			}
		} else {
			if(sconto != null) {
				dettagli.setPrezzoScontato(sconto);
			}
		}
		
		if(dettagli.getIVA() != IVA) {
			dettagli.setIVA(IVA);
		}
		
		if(dettagli.getQuantita() != quantita.intValue()) {
			dettagli.setQuantita(quantita);
		}
		
		if(!dettagli.getOrigine().equalsIgnoreCase(origine)) {
			dettagli.setOrigine(origine);
		}
		
		if(!dettagli.getScadenza().equalsIgnoreCase(scadenza)) {
			dettagli.setScadenza(scadenza);
		}
		
		if(dettagli.getTipo().equalsIgnoreCase("snack")) {
			if(!dettagli.getPeso().equalsIgnoreCase(peso)) {
				dettagli.setPeso(peso);
			}
		}
		
		if(dettagli.getTipo().equalsIgnoreCase("drink")) {
			if(!dettagli.getVolume().equalsIgnoreCase(volume)) {
				dettagli.setVolume(volume);
			}
		}
		
		if(!dettagli.getImmagine().equals(img)) {
			dettagli.setImmagine(img);
		}
		
		try {
			dbProdotto.doUpdate(prodotto);
			dbDettagli.doUpdate(dettagli);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		RequestDispatcher view = request.getRequestDispatcher("./gestisciProdotti.jsp");
		view.forward(request, response);
	}

}
