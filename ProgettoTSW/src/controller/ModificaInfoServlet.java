package controller;

import java.io.IOException;
import java.io.Writer;
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
					e.printStackTrace();
				}
				
				request.setAttribute("metodoPagamento", metodoPagamento);
				request.setAttribute("target", "metodoPagamento");
				pathRedirect = "./modificaInfoForm.jsp";
			}
		} else if (mode.equals("add")) {
			String utente = request.getParameter("utente");
			request.setAttribute("utente", utente);
			if(target.equals("indirizzo")) {
				request.setAttribute("target", "indirizzo");
				pathRedirect = "./aggiungiInfoForm.jsp";
			} else if (target.equals("metodoPagamento")) {
				request.setAttribute("target", "metodoPagamento");
				pathRedirect = "./aggiungiInfoForm.jsp";
			}
		}
		
		RequestDispatcher view = request.getRequestDispatcher(pathRedirect);
		view.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String path = null;
		String target = request.getParameter("target");
		String mode = request.getParameter("mode");
		boolean flag = false;
		
		if(mode.equalsIgnoreCase("update")) {
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
							List<UtenteBean> listaUtenti = dbUtente.doRetrieveAll(username);
							Iterator<UtenteBean> iterUtenti = listaUtenti.iterator();
							UtenteBean utenteRicercato = new UtenteBean();
							while(iterUtenti.hasNext()) {
								utenteRicercato = iterUtenti.next();
								
								if(!utente.getUsername().equalsIgnoreCase(utenteRicercato.getUsername())) {
									if(utenteRicercato.getEmail().equalsIgnoreCase(email)) {
										flag = true;
										break;
									}
								}
							}
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
						
						if(!flag) {
							if(!dbUtente.doUpdate(utente,username)) {
								request.getSession().setAttribute("error", "Aggiornamento non effettuato!");
								path = "modificaInfo?mode=update&target=utente&utente=" + username;
							} else {
								request.getSession().setAttribute("message", "Aggiornato con successo!");
								path = "login?mode=getInfo&utente=" + newUsername;
							}
						} else {
							request.getSession().setAttribute("error", "Impossibile usare l'email scelta. Riprova.");
							path = "./modificaInfo?mode=update&target=utente&utente=" + username;
						}
					} catch (SQLException e) {
						e.printStackTrace();
					}
				} else  {
					request.getSession().setAttribute("error", "Le password non corrispondono");
					path = "./modificaInfo?mode=update&target=utente&utente=" + username;
				}
			} else if(target.equalsIgnoreCase("indirizzo")) {
				IndirizzoBean indirizzo = new IndirizzoBean();
				IndirizzoDAO dbIndirizzi = new IndirizzoDAO();
				
				String indirizzoID = request.getParameter("indirizzoID");
				String utente = request.getParameter("utente");
				String via = request.getParameter("via");
				String citta = request.getParameter("citta");
				String CAP = request.getParameter("CAP");
				String civico = request.getParameter("civico");
				String provincia = request.getParameter("provincia");
				String nazione = request.getParameter("nazione"); 
				String scala = request.getParameter("scala");
				String interno = request.getParameter("interno");
				String preferito = request.getParameter("preferito");
				
				try {
					indirizzo = dbIndirizzi.doRetrieveByKey(indirizzoID, utente);
					
					if(!indirizzo.getVia().equalsIgnoreCase(via)) {
						indirizzo.setVia(via);
					}
					
					if(!indirizzo.getCitta().equalsIgnoreCase(citta)) {
						indirizzo.setCitta(citta);
					}
					
					if(!indirizzo.getCAP().equalsIgnoreCase(CAP)) {
						indirizzo.setCAP(CAP);
					}
					
					if(!indirizzo.getCivico().equalsIgnoreCase(civico)) {
						indirizzo.setCivico(civico);
					}
					
					if(!indirizzo.getProvincia().equalsIgnoreCase(provincia)) {
						indirizzo.setProvincia(provincia);
					}
					
					if(!indirizzo.getNazione().equalsIgnoreCase(nazione)) {
						indirizzo.setNazione(nazione);
					}
					
					if(!scala.equalsIgnoreCase("null")) {
						if(!indirizzo.getScala().equalsIgnoreCase(scala)) {
							indirizzo.setScala(scala);
						}
					}
					
					if(!interno.equalsIgnoreCase("null")) {
						if(!indirizzo.getInterno().equalsIgnoreCase(interno)) {
							indirizzo.setInterno(interno);
						}
					}
					
					if(!indirizzo.getPreferito().equalsIgnoreCase(preferito)) {
						List<IndirizzoBean> listaIndirizzi = new ArrayList<>();
						listaIndirizzi = dbIndirizzi.doRetrieveAllByKey(utente);
						
						
						if(indirizzo.getPreferito().equalsIgnoreCase("no")) {
							IndirizzoBean indirizzoPreferito = new IndirizzoBean();
							Iterator<IndirizzoBean> iterIndirizzi = listaIndirizzi.iterator();
							
							while(iterIndirizzi.hasNext()) {
								indirizzoPreferito = iterIndirizzi.next();
								
								if(indirizzoPreferito.getPreferito().equalsIgnoreCase("si")) {
									indirizzoPreferito.setPreferito("no");
									break;
								}
							}
							
							indirizzo.setPreferito(preferito);
							
							if(!dbIndirizzi.doUpdate(indirizzoPreferito)) {
								request.getSession().setAttribute("error", "Aggiornamento non effettuato!");
								path = "modificaInfo?mode=update&target=indirizzo&utente=" + indirizzo.getUtente();
							}
						} else {
							indirizzo.setPreferito(preferito);
						}
					}
					
					if (!dbIndirizzi.doUpdate(indirizzo)) {
						request.getSession().setAttribute("error", "Aggiornamento non effettuato!");
						path = "modificaInfo?mode=update&target=indirizzo&utente=" + indirizzo.getUtente();
					} else {
						request.getSession().setAttribute("message", "Aggiornato con successo!");
						path = "login?mode=getInfo&utente=" + indirizzo.getUtente();
					}
				} catch (SQLException e) {
					e.printStackTrace();
				}
				
			} else if(target.equalsIgnoreCase("metodoPagamento")) {
				MetodoDiPagamentoBean metodoPagamento = new MetodoDiPagamentoBean();
				MetodoDiPagamentoDAO dbMetodiPagamento = new MetodoDiPagamentoDAO();
				
				String metodoPagamentoID = request.getParameter("metodoPagamentoID");
				String utente = request.getParameter("utente");
				String via = request.getParameter("via");
				String citta = request.getParameter("citta");
				String CAP = request.getParameter("CAP");
				String civico = request.getParameter("civico");
				String provincia = request.getParameter("provincia");
				String nazione = request.getParameter("nazione"); 
				String tipo = request.getParameter("tipo");
				String IBAN = request.getParameter("IBAN");
				String numCarta = request.getParameter("numCarta");
				String preferito = request.getParameter("preferito");
				
				try {
					metodoPagamento = dbMetodiPagamento.doRetrieveByKey(metodoPagamentoID, utente);
					
					if(!metodoPagamento.getVia().equalsIgnoreCase(via)) {
						metodoPagamento.setVia(via);
					}
					
					if(!metodoPagamento.getCitta().equalsIgnoreCase(citta)) {
						metodoPagamento.setCitta(citta);
					}
					
					if(!metodoPagamento.getCAP().equalsIgnoreCase(CAP)) {
						metodoPagamento.setCAP(CAP);
					}
					
					if(!metodoPagamento.getCivico().equalsIgnoreCase(civico)) {
						metodoPagamento.setCivico(civico);
					}
		
					if(!metodoPagamento.getProvincia().equalsIgnoreCase(provincia)) {
						metodoPagamento.setProvincia(provincia);
					}
					
					if(!metodoPagamento.getNazione().equalsIgnoreCase(nazione)) {
						metodoPagamento.setNazione(nazione);
					}
					
					if(tipo.equalsIgnoreCase("carta")) {
						if(!numCarta.equalsIgnoreCase("null")) {
							metodoPagamento.setTipo("carta");
							metodoPagamento.setNumCarta(numCarta);
							metodoPagamento.setIBAN("null");
						}
					}
					
					if(tipo.equalsIgnoreCase("IBAN")) {
						if(!IBAN.equalsIgnoreCase("null")) {
							metodoPagamento.setTipo("IBAN");
							metodoPagamento.setNumCarta("null");
							metodoPagamento.setIBAN(IBAN);
						}
					}
						
					if(!metodoPagamento.getPreferito().equalsIgnoreCase(preferito)) {
						List<MetodoDiPagamentoBean> listaMetodiPagamento = new ArrayList<>();
						listaMetodiPagamento = dbMetodiPagamento.doRetrieveAllByKey(utente);
						
						if(metodoPagamento.getPreferito().equalsIgnoreCase("no")) {
							MetodoDiPagamentoBean metodoPreferito = new MetodoDiPagamentoBean();
							Iterator<MetodoDiPagamentoBean> iterMetodi = listaMetodiPagamento.iterator();
							
							while(iterMetodi.hasNext()) {
								metodoPreferito = iterMetodi.next();
								
								if(metodoPreferito.getPreferito().equalsIgnoreCase("si")) {
									metodoPreferito.setPreferito("no");
									break;
								}
							}
							
							metodoPagamento.setPreferito(preferito);
							
							if(!dbMetodiPagamento.doUpdate(metodoPreferito)) {
								request.getSession().setAttribute("error", "Aggiornamento non effettuato!");
								path = "modificaInfo?mode=update&target=indirizzo&utente=" + metodoPagamento.getUtente();
							}
						} else {
							metodoPagamento.setPreferito(preferito);
						}
					}
					
					if (!dbMetodiPagamento.doUpdate(metodoPagamento)) {
						request.getSession().setAttribute("error", "Aggiornamento non effettuato!");
						path = "modificaInfo?mode=update&target=metodoPagamento&utente=" + metodoPagamento.getUtente();
					} else {
						request.getSession().setAttribute("message", "Aggiornato con successo!");
						path = "login?mode=getInfo&utente=" + metodoPagamento.getUtente();
					}	
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		} else if (mode.equalsIgnoreCase("add")) {
			String utente = request.getParameter("utente");
			if(target.equals("indirizzo")) {
				IndirizzoBean indirizzo = new IndirizzoBean();
				IndirizzoDAO dbIndirizzo = new IndirizzoDAO();
				
				String via = request.getParameter("via");
				String citta = request.getParameter("citta");
				String CAP = request.getParameter("CAP");
				String civico = request.getParameter("civico");
				String provincia = request.getParameter("provincia");
				String nazione = request.getParameter("nazione");
				String scala = request.getParameter("scala");
				String interno = request.getParameter("interno");
				String preferito = request.getParameter("preferito");
				
				indirizzo.setUtente(utente);
				indirizzo.setVia(via);
				indirizzo.setCitta(citta);
				indirizzo.setCAP(CAP);
				indirizzo.setCivico(civico);
				indirizzo.setProvincia(provincia);
				indirizzo.setNazione(nazione);
				
				if(scala != null) {
					indirizzo.setScala(scala);
				}
				
				if(interno != null) {
					indirizzo.setInterno(interno);
				}
				
				if(preferito.equals("si")) {
					List<IndirizzoBean> listaIndirizzi;
					try {
						listaIndirizzi = dbIndirizzo.doRetrieveAllByKey(utente);
						IndirizzoBean indirizzoPreferito = new IndirizzoBean();
						
						if(!listaIndirizzi.isEmpty()) {
							Iterator<IndirizzoBean> iterIndirizzi = listaIndirizzi.iterator();
							while(iterIndirizzi.hasNext()) {
								indirizzoPreferito = iterIndirizzi.next();
								
								if(indirizzoPreferito.getPreferito().equalsIgnoreCase("si")) {
									indirizzoPreferito.setPreferito("no");
									if(!dbIndirizzo.doUpdate(indirizzoPreferito)) {
										request.getSession().setAttribute("error", "Aggiunta non effettuata!");
										path = "modificaInfo?mode=add&target=indirizzo&utente=" + utente;
									}
									break;
								}
							}
							indirizzo.setPreferito("si");
						} else {
							indirizzo.setPreferito("si");
						}
					} catch (SQLException e) {
						e.printStackTrace();
					}
				} else {
					indirizzo.setPreferito("no");
				}
				try {
					dbIndirizzo.doSave(indirizzo);
					request.getSession().setAttribute("message", "Aggiunto nuovo indirizzo con successo!");
					path = "login?mode=getInfo&utente=" + utente;
				} catch (SQLException e) {
					e.printStackTrace();
				}
			} else if (target.equals("metodoPagamento")) {
				MetodoDiPagamentoBean metodoPagamento = new MetodoDiPagamentoBean();
				MetodoDiPagamentoDAO dbMetodiPagamento = new MetodoDiPagamentoDAO();
				
				String via = request.getParameter("via");
				String citta = request.getParameter("citta");
				String CAP = request.getParameter("CAP");
				String civico = request.getParameter("civico");
				String provincia = request.getParameter("provincia");
				String nazione = request.getParameter("nazione");
				String tipo = request.getParameter("tipo");
				String IBAN = request.getParameter("IBAN");
				String numCarta = request.getParameter("numCarta");
				String preferito = request.getParameter("preferito");
				
				metodoPagamento.setUtente(utente);
				metodoPagamento.setVia(via);
				metodoPagamento.setCitta(citta);
				metodoPagamento.setCAP(CAP);
				metodoPagamento.setCivico(civico);
				metodoPagamento.setProvincia(provincia);
				metodoPagamento.setNazione(nazione);
				metodoPagamento.setTipo(tipo);
				
				if (tipo.equals("IBAN")) {
					if (IBAN != null) {
						metodoPagamento.setIBAN(IBAN);
					} else {
						request.getSession().setAttribute("error", "Aggiunta non effettuata!");
						path = "modificaInfo?mode=add&target=indirizzo&utente=" + utente;
					}
				} else if (tipo.equals("carta")) {
					if (numCarta != null) {
						metodoPagamento.setNumCarta(numCarta);
					} else {
						request.getSession().setAttribute("error", "Aggiunta non effettuata!");
						path = "modificaInfo?mode=add&target=indirizzo&utente=" + utente;
					}
				}
				
				if (preferito.equals("si")) {
					try {
						List<MetodoDiPagamentoBean> listaMetodiPagamento = dbMetodiPagamento.doRetrieveAllByKey(utente);
						MetodoDiPagamentoBean metodoPreferito = new MetodoDiPagamentoBean();
						
						if(!listaMetodiPagamento.isEmpty()) {
							Iterator<MetodoDiPagamentoBean> iterMetodi = listaMetodiPagamento.iterator();
							while(iterMetodi.hasNext()) {
								metodoPreferito = iterMetodi.next();
								
								if(metodoPreferito.getPreferito().equals("si")) {
									metodoPreferito.setPreferito("no");
									if(!dbMetodiPagamento.doUpdate(metodoPreferito)) {
										request.getSession().setAttribute("error", "Aggiunta non effettuata!");
										path = "modificaInfo?mode=add&target=metodoPagamento&utente=" + utente;
									}
									break;
								}
							}
							
							metodoPagamento.setPreferito("si");
						} else {
							metodoPagamento.setPreferito("si");
						}
					} catch (SQLException e) {
						e.printStackTrace();
					}
				} else {
					metodoPagamento.setPreferito("no");
				}
				try {
					dbMetodiPagamento.doSave(metodoPagamento);
					request.getSession().setAttribute("message", "Aggiunto nuovo metodo di pamento con successo!");
					path = "login?mode=getInfo&utente=" + utente;
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		} else if (mode.equals("delete")) {
			String utente = request.getParameter("utente");
			if(target.equals("indirizzo")) {
				String indirizzoID= request.getParameter("indirizzoID");
				IndirizzoDAO dbIndirizzi = new IndirizzoDAO();
				
				try {
					if(!dbIndirizzi.doDelete(indirizzoID,utente)) {
						request.getSession().setAttribute("message", "Indirizzo non rimosso!");
						path = "login?mode=getInfo&utente=" + utente;
					} else {
						request.getSession().setAttribute("message", "Indirizzo rimosso correttamente!");
						path = "login?mode=getInfo&utente=" + utente;
					}
				} catch (SQLException e) {
					e.printStackTrace();
				}
			} else if (target.equals("metodoPagamento")) {
				String metodoPagamentoID = request.getParameter("metodoPagamentoID");
				MetodoDiPagamentoDAO dbMetodiPagamento = new MetodoDiPagamentoDAO();
				
				try {
					if(!dbMetodiPagamento.doDelete(metodoPagamentoID, utente)) {
						request.getSession().setAttribute("message", "Metodo di pagamento non rimosso!");
						path = "login?mode=getInfo&utente=" + utente;
					} else {
						request.getSession().setAttribute("message", "Metodo di pagamento rimosso correttamente!");
						path = "login?mode=getInfo&utente=" + utente;
					}
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		response.sendRedirect(path);
		}
	}

