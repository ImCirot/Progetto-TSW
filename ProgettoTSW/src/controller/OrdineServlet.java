package controller;

import java.io.IOException;
import java.math.BigDecimal;
import java.sql.SQLException;
import java.time.LocalDate;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.IndirizzoBean;
import model.IndirizzoDAO;
import model.MetodoDiPagamentoBean;
import model.MetodoDiPagamentoDAO;
import model.OrdineBean;
import model.OrdineDAO;

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
		String redirectPath = null;
		
		if(request.getSession().getAttribute("logged") == null) {
			request.getSession().setAttribute("error", "Devi essere loggato per procedere all'acquisto");
			redirectPath = "./loginForm.jsp";
		} else {
			request.setAttribute("costoTot", request.getParameter("costoTot"));
			redirectPath = "./riepilogoOrdine.jsp";
		}
		
		RequestDispatcher view = request.getRequestDispatcher(redirectPath);
		view.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String redirectPath = null;
		
		if(request.getSession().getAttribute("logged") == null) {
			request.getSession().setAttribute("error", "Devi essere loggato per poter acquistare!");
			redirectPath = "./loginForm.jsp";
		}
		
		String indirizzoID = (String) request.getParameter("indirizzo");
		String metodoDiPagamentoID = (String) request.getParameter("metodoPagamento");
		IndirizzoBean indirizzo = new IndirizzoBean();
		MetodoDiPagamentoBean metodoDiPagamento = new MetodoDiPagamentoBean();
		String utente = (String) request.getSession().getAttribute("utente");
		double costoTot = Double.parseDouble(request.getParameter("costoTot"));
		OrdineBean ordine = new OrdineBean();
		OrdineDAO dbOrdini = new OrdineDAO();
		IndirizzoDAO dbIndirizzi = new IndirizzoDAO();
		MetodoDiPagamentoDAO dbMetodi = new MetodoDiPagamentoDAO();
		
		try {
			indirizzo = dbIndirizzi.doRetrieveByKey(indirizzoID, utente);
			metodoDiPagamento = dbMetodi.doRetrieveByKey(metodoDiPagamentoID, utente);
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
			
//			response.getOutputStream().println("indirizzo " + indirizzoID + "\nmetodo " + metodoDiPagamentoID + "\n" + ordine.getCliente() + " " + ordine.getCostoTotale().toPlainString() + " " + ordine.getTipoPagamento()
//					+ " " + ordine.getIBAN() + " " + ordine.getNumCarta() + " " + ordine.getCitta() + " " + ordine.getCAP() + " " + ordine.getVia()
//					+ " " + ordine.getCivico() + " " + ordine.getProvincia() + " " + ordine.getNazione() + " " + ordine.getDataAcquisto());
			dbOrdini.doSave(ordine);
			
			request.getSession().removeAttribute("carrello");
			redirectPath = "./acquisto.jsp";
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		RequestDispatcher view = request.getRequestDispatcher(redirectPath);
		view.forward(request, response);
	}

}
