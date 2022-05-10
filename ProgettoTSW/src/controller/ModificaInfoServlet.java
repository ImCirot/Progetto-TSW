package controller;

import java.io.IOException;
import java.io.Writer;
import java.sql.SQLException;
import java.util.Base64;
import java.util.Base64.Encoder;

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
import model.UtenteBean;
import model.UtenteDAO;

/**
 * Servlet implementation class ModificaInfoServlet
 */
@WebServlet("/modificaInfo")
public class ModificaInfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ModificaInfoServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mode = request.getParameter("mode");
		String target = request.getParameter("target");
		String username = request.getParameter("utente");
		String pathRedirect = null;
		
		if(mode.equals("update")) {
			if(target.equals("utente")) {
				 UtenteDAO dbUtenti = new UtenteDAO();
				 UtenteBean utente = new UtenteBean();
				 
				 try {
					utente = dbUtenti.doRetrieveByKey(username);
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
				request.setAttribute("utente", utente);
				request.setAttribute("target", "utente");
				pathRedirect = "./modificaInfoForm.jsp";
				
			} else if (target.equals("indirizzo")) {
				String indirizzoID = request.getParameter("indirizzoID");
				IndirizzoDAO dbIndirizzi = new IndirizzoDAO();
				IndirizzoBean indirizzo = new IndirizzoBean();
				
				try {
					indirizzo = dbIndirizzi.doRetrieveByKey(indirizzoID, username);
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
				request.setAttribute("indirizzo", indirizzo);
				request.setAttribute("target", "indirizzo");
				pathRedirect = "./modificaInfoForm.jsp";
			} else if (target.equals("metodoPagamento")) {
				String metodoPagamentoID = request.getParameter("metodoPagamentoID");
				MetodoDiPagamentoDAO dbMetodiPagamento = new MetodoDiPagamentoDAO();
				MetodoDiPagamentoBean metodoPagamento = new MetodoDiPagamentoBean();
				
				try {
					metodoPagamento = dbMetodiPagamento.doRetrieveByKey(metodoPagamentoID, username);
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
				request.setAttribute("metodoPagamento", metodoPagamento);
				request.setAttribute("target", "metodoPagamento");
				pathRedirect = "./modificaInfoForm.jsp";
			}
		} else if (mode.equals("add")) {
			if(target.equals("indirizzo")) {
				
			} else if (target.equals("metodoPagamento")) {
				
			}
		}
		
		RequestDispatcher view = request.getRequestDispatcher(pathRedirect);
		view.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String target = request.getParameter("target");
		String pathRedirect = null;
		
		if(target.equalsIgnoreCase("utente")) {
			UtenteDAO dbUtente = new UtenteDAO();
			UtenteBean utente = new UtenteBean();
			Encoder encoder = Base64.getEncoder();
			
			String username = request.getParameter("utente");
			String newUsername = request.getParameter("username");
			String password = request.getParameter("password");
			String passwordCheck = request.getParameter("passwordCheck");
			String email = request.getParameter("email");
			String nome = request.getParameter("nome");
			String cognome = request.getParameter("cognome");
			String sesso = request.getParameter("sesso");
			String pwd64 = null;
			
			Writer out = response.getWriter();
			
			out.append(username + "|" + newUsername + "|" + password + "|" + passwordCheck + "|" + email + "|" + nome + "|" + cognome + "|" + sesso + "\n");
			
			if(password.equals(passwordCheck)) {
				pwd64 = encoder.encodeToString(password.getBytes());
				try {
					utente = dbUtente.doRetrieveByKey(username);
					
					if(!utente.getUsername().equals(newUsername)) {
						utente.setUsername(newUsername);
						request.getSession().setAttribute("utente", newUsername);
					}
					
					if(!utente.getPassword().equals(pwd64)) {
						utente.setPassword(pwd64);
					}
					
					if(!utente.getEmail().equalsIgnoreCase(email)) {
						utente.setEmail(email);
					}
					
					if(!utente.getNome().equals(nome)) {
						utente.setNome(nome);
						request.getSession().setAttribute("nome", nome);
					}
					
					if(!utente.getCognome().equals(cognome)) {
						utente.setCognome(cognome);
						request.getSession().setAttribute("cognome", cognome);
					}
					
					if(!utente.getSesso().equals(sesso)) {
						utente.setSesso(sesso);
					}
					
					if(!dbUtente.doUpdate(utente,username)) {
						request.getSession().setAttribute("error", "Aggiornamento non effettuato!");
						response.sendRedirect("modificaInfo?mode=update&target=utente&utente=" + username);
					} else {
						request.getSession().setAttribute("message", "Aggiornato con successo!");
						response.sendRedirect("login?mode=getInfo&utente=" + newUsername);
					}
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			} else  {
				request.getSession().setAttribute("error", "Le password non corrispondono");
				response.sendRedirect("./modificaInfo?mode=update&target=utente&utente=" + username);
			}
		} else if(target.equalsIgnoreCase("indirizzo")) {
			
		} else if(target.equalsIgnoreCase("metodoPagamento")) {
		
		}
		
	}
}
