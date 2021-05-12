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
			/*if(action.equalsIgnoreCase("checkout")){
				Cart cart= (Cart) request.getSession().getAttribute("cart");
				if(cart.getSize()==0) {
					 RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/CartView.jsp");
			    	 dispatcher.forward(request, response);
				}
				else response.sendRedirect("LoginView.jsp");
			}*/
			if(action.equalsIgnoreCase("verify")) {
				try {
					 HttpSession session = request.getSession(true);
			    	 UserBean user= new UserBean();
				     user.setUserName(request.getParameter("un"));
				     user.setPassword(request.getParameter("pw"));
				     user = UserDAO.doRetrieve(user);
				     session.setAttribute("currentSessionUser", user);
				     if (user.isValid()){
				    	 System.out.println("ciao");
				    	 RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/userLogged.jsp");
				    	 dispatcher.forward(request, response); 		
				     }
				     else{
				    	 RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/LoginView.jsp");
				    	 dispatcher.forward(request, response); 
				     }
				} 		
				catch (Throwable theException){
				     System.out.println(theException); 
				}
			}
			else if(action.equalsIgnoreCase("registration")) {
				UserBean bean= new UserBean();
				bean.setFirstName(request.getParameter("name"));
				bean.setLastName(request.getParameter("surname"));
				bean.setUserName(request.getParameter("username"));
				bean.setPassword(request.getParameter("pw"));
				if(UserDAO.doSave(bean)) {
					bean.setValid(true);
					request.getSession().setAttribute("currentSessionUser", bean);
					RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/userLogged.jsp");
			    	dispatcher.forward(request, response); 
				}
				else {
					request.getSession().setAttribute("username", "false");
					RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/registrazioneUtente.jsp");
			    	dispatcher.forward(request, response); 
				}
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
