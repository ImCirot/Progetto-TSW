package controller;

import java.io.IOException;
import java.io.Writer;
import java.math.BigDecimal;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.ComposizioneOrdineBean;
import model.ComposizioneOrdineDAO;
import model.DettaglioProdottoBean;
import model.DettaglioProdottoDAO;
import model.IndirizzoBean;
import model.IndirizzoDAO;
import model.MetodoDiPagamentoBean;
import model.MetodoDiPagamentoDAO;
import model.OrdineBean;
import model.OrdineDAO;
import model.ProdottoBean;
import model.ProdottoDAO;

/**
 * Servlet implementation class ScegliInfoAcquistoServlet
 */
@WebServlet("/ordine")
public class OrdineServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrdineServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/plain");
		
		if(request.getSession().getAttribute("logged") == null) {
			request.getSession().setAttribute("error", "Devi essere loggato per procedere all'acquisto");
			response.getWriter().print("./loginForm.jsp");
		} else {
			request.getSession().setAttribute("costoTot", (String) request.getParameter("costoTot"));
			response.getWriter().print("./riepilogoOrdine.jsp");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String path = null;
		if(request.getSession().getAttribute("logged") == null) {
			request.getSession().setAttribute("error", "Devi accedere per poter acquistare!");
			path = "./loginForm.jsp";
		}
		
		String indirizzoID = (String) request.getParameter("indirizzo");
		String metodoDiPagamentoID = (String) request.getParameter("metodoPagamento");
		IndirizzoBean indirizzo = new IndirizzoBean();
		MetodoDiPagamentoBean metodoDiPagamento = new MetodoDiPagamentoBean();
		String utente = (String) request.getSession().getAttribute("utente");
		String costoStr = (String) request.getSession().getAttribute("costoTot");
		costoStr = costoStr.replaceAll(",", ".");
		double costoTot = Double.parseDouble(costoStr);
		OrdineBean ordine = new OrdineBean();
		OrdineDAO dbOrdini = new OrdineDAO();
		IndirizzoDAO dbIndirizzi = new IndirizzoDAO();
		MetodoDiPagamentoDAO dbMetodi = new MetodoDiPagamentoDAO();
		
		try {
			indirizzo = dbIndirizzi.doRetrieveByKey(indirizzoID, utente);
			metodoDiPagamento = dbMetodi.doRetrieveByKey(metodoDiPagamentoID, utente);
			
			if(indirizzo == null || metodoDiPagamento == null) {
				if(request.getSession().getAttribute("logged") == null) {
					request.getSession().setAttribute("error", "Devi aggiungere un indirizzo/metodo di pagamento per poter acquistare!");
					path = "./personalArea.jsp";
					return;
				}
			}
			ordine.setCliente(utente);
			ordine.setCostoTotale(BigDecimal.valueOf(costoTot));
			ordine.setTipoPagamento(metodoDiPagamento.getTipo());
			
			if(metodoDiPagamento.getTipo().equals("IBAN")) {
				ordine.setIBAN(metodoDiPagamento.getIBAN());
			} else {
				ordine.setNumCarta(metodoDiPagamento.getNumCarta());
			}
			
			ordine.setCitta(indirizzo.getCitta());
			ordine.setCAP(indirizzo.getCAP());
			ordine.setVia(indirizzo.getVia());
			ordine.setCivico(indirizzo.getCivico());
			ordine.setProvincia(indirizzo.getProvincia());
			ordine.setNazione(indirizzo.getNazione());
			ordine.setDataAcquisto(LocalDate.now().toString());

			dbOrdini.doSave(ordine);
			
			Map<String,Integer> carrello = (Map<String,Integer>) request.getSession().getAttribute("carrello");
			String key;
			Iterator<String> keyIter = carrello.keySet().iterator();
			ComposizioneOrdineBean composizione = new ComposizioneOrdineBean();
			ComposizioneOrdineDAO dbComposizioni = new ComposizioneOrdineDAO();
			DettaglioProdottoDAO dbDettagli = new DettaglioProdottoDAO();
			
			while(keyIter.hasNext()) {
				key = keyIter.next();
				DettaglioProdottoBean prodotto = new DettaglioProdottoBean();
				prodotto = dbDettagli.doRetrieveByKey(key);
				List<OrdineBean> listaOrdini = dbOrdini.doRetrieveAllByKey(utente);
				composizione.setOrdine(listaOrdini.get(listaOrdini.size()-1).getNumOrdineProgressivo());
				composizione.setCliente(utente);
				composizione.setProdotto(key);
				composizione.setQuantitaProdotto(carrello.get(key).intValue());
				prodotto.setQuantita(prodotto.getQuantita() - carrello.get(key).intValue());
				if(prodotto.getPrezzoScontato() != null) {
				composizione.setCostoUnitario(prodotto.getPrezzoScontato());
				} else {
					composizione.setCostoUnitario(prodotto.getCostoUnitario());
				}
				
				dbComposizioni.doSave(composizione);
				dbDettagli.doUpdate(prodotto);
			}
			
			request.getSession().removeAttribute("carrello");
			request.getSession().removeAttribute("costoTot");
			response.reset();
			response.sendRedirect("./login?mode=getInfo&next=acquisto");
			return;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		RequestDispatcher view = request.getRequestDispatcher(path);
		view.forward(request, response);
	}
}
