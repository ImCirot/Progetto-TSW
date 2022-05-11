package controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Base64;
import java.util.Base64.Encoder;
import java.util.Iterator;
import java.util.List;

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
import model.UtenteBean;
import model.UtenteDAO;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mode = request.getParameter("mode");
		
		if(mode.equalsIgnoreCase("getInfo")) {
			String utente = request.getParameter("utente");
			List<IndirizzoBean> indirizzi = new ArrayList<>();
			List<MetodoDiPagamentoBean> metodiPagamento = new ArrayList<>();
			List<OrdineBean> ordini = new ArrayList<>();
			
			IndirizzoDAO dbIndirizzo = new IndirizzoDAO();
			MetodoDiPagamentoDAO dbPagamento = new MetodoDiPagamentoDAO();
			OrdineDAO dbOrdine = new OrdineDAO();
			
			try {
				indirizzi = dbIndirizzo.doRetrieveAllByKey(utente);
				metodiPagamento = dbPagamento.doRetrieveAllByKey(utente);
				ordini = dbOrdine.doRetrieveAllByKey(utente);
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			request.getSession().setAttribute("indirizzi", indirizzi);
			request.getSession().setAttribute("metodiPagamento", metodiPagamento);
			request.getSession().setAttribute("ordini", ordini);
			
			RequestDispatcher view = request.getRequestDispatcher("./userPersonalArea.jsp");
			view.forward(request, response);
		} else if(mode.equalsIgnoreCase("register")) {
			response.sendRedirect("./registerForm.jsp");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mode = request.getParameter("mode");
		String path = null;
		
		if(mode.equalsIgnoreCase("login")) {
			String username = request.getParameter("username");
			Encoder encoder = Base64.getEncoder();
			String password64 = encoder.encodeToString(request.getParameter("password").getBytes());
			UtenteBean user = checkLogin(username, password64);
			
			if(user != null) {
				request.getSession().setAttribute("nome", user.getNome());
				request.getSession().setAttribute("cognome", user.getCognome());
				request.getSession().setAttribute("utente", user.getUsername());
				request.getSession().setAttribute("logged", (Boolean) true);
				
				if(user.isAdmin()) {
					request.getSession().setAttribute("admin", true);
				} else {
					request.getSession().setAttribute("admin", false);
				}
				
				path = "login?utente=" + username +"&mode=getInfo";
			} else {
				request.getSession().setAttribute("logged", (Boolean) false);
				request.getSession().setAttribute("error", "Username e/o password invalidi.");
				path = "./loginForm.jsp";
			}
		} else if(mode.equalsIgnoreCase("register")) {
			String username = request.getParameter("username");
			String password = request.getParameter("password");
			String passwordCheck = request.getParameter("passwordCheck");
			String email = request.getParameter("email");
			String nome = request.getParameter("nome");
			String cognome = request.getParameter("cognome");
			String sesso = request.getParameter("sesso");
			Encoder encoder = Base64.getEncoder();
			String pwd64 = null;
			String pwdchk64 = null;
			
			pwd64 = encoder.encodeToString(password.getBytes());
			pwdchk64 = encoder.encodeToString(passwordCheck.getBytes());
			
			try {
				if(pwd64.equals(pwdchk64)) {
					UtenteBean utente = new UtenteBean();
					UtenteDAO dbUtenti = new UtenteDAO();
					UtenteBean utenteRicercato = new UtenteBean();
					boolean flag = false;
					List<UtenteBean> listaUtenti = dbUtenti.doRetrieveAll(username);
					Iterator<UtenteBean> iterUtenti = listaUtenti.iterator();
					
					utente.setUsername(username);
					utente.setPassword(pwd64);
					
					while(iterUtenti.hasNext()) {
						utenteRicercato = iterUtenti.next();
						if(!utenteRicercato.getUsername().equalsIgnoreCase(utente.getUsername())) {
							if(utenteRicercato.getEmail().equalsIgnoreCase(email)) {
								flag = true;
								break;
							}
						}
					}
					
					utente.setEmail(email);
					utente.setNome(nome);
					utente.setCognome(cognome);
					utente.setSesso(sesso);
					utente.setAdmin(false);
					
					if(!flag) {
						dbUtenti.doSave(utente);
						request.getSession().setAttribute("result", "Registrato con successo!");
					} else {
						request.getSession().setAttribute("error", "Registrazione non completata. Riprovare.");
					}
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
			path = "./loginForm.jsp";
			
			RequestDispatcher view = request.getRequestDispatcher(path);
			view.forward(request, response);
		}
	}
	
	private UtenteBean checkLogin(String username, String password64) {
		UtenteDAO database = new UtenteDAO();
		UtenteBean user = new UtenteBean();
		
		try {
			user = database.doRetrieveByKey(username);
			
			if(user.getUsername().equals(username) && user.getPassword().equals(password64)) {
				return user;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return null;
	}
}
