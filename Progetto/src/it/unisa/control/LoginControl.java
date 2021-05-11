package it.unisa.control;


import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import it.unisa.model.*;

/**
 * Servlet implementation class LoginControl
 */
@WebServlet("/LoginControl")
public class LoginControl extends HttpServlet {
	private static final long serialVersionUID = 1L;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginControl() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String action = request.getParameter("action");
		
		if(action!=null) {
			if(action.equalsIgnoreCase("checkout")) {
				response.sendRedirect("LoginView.jsp");
			}
			else if(action.equalsIgnoreCase("verify")) {
				try {
					 HttpSession session = request.getSession(true);
			    	 UserBean user= new UserBean();
				     user.setUserName(request.getParameter("un"));
				     user.setPassword(request.getParameter("pw"));
				     user = UserDAO.doRetrieve(user);
				     System.out.println("login"+user.isValid());
				     if (user.isValid()){
				    	 session.setAttribute("currentSessionUser", user);
				         response.sendRedirect("userLogged.jsp"); //logged-in page      		
				     }
				     else{
				    	 response.sendRedirect("invalidLogin.jsp"); //error page 
				     }
				} 		
				catch (Throwable theException){
				     System.out.println(theException); 
				}
			}
			else if(action.equalsIgnoreCase("registration")) {
				UserBean bean= new UserBean();
				bean.setFirstName(action);
				bean.setLastName(action);
				bean.setUserName(action);
				bean.setPassword(action);
				
			}
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
