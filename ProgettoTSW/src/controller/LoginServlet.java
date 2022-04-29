package controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Base64;
import java.util.Base64.Encoder;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("username");
		Encoder encoder = Base64.getEncoder();
		String password64 = encoder.encodeToString(request.getParameter("password").getBytes());
		UtenteBean user = checkLogin(username, password64);
		
		if(user != null) {
			request.getSession().setAttribute("nome", user.getNome());
			request.getSession().setAttribute("cognome", user.getCognome());
			request.getSession().setAttribute("logged", (Boolean) true);
			
			if(user.isAdmin()) {
				request.getSession().setAttribute("admin", true);
			} else {
				request.getSession().setAttribute("admin", false);
			}
			
			RequestDispatcher view = request.getRequestDispatcher("./userPersonalArea.jsp");
			view.forward(request, response);
		} else {
			request.getSession().setAttribute("logged", (Boolean) false);
			response.sendRedirect("./InvalidLogin.jsp");
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
