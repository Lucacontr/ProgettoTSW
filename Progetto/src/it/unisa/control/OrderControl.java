package it.unisa.control;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import it.unisa.model.*;

/**
 * Servlet implementation class Order
 */
@WebServlet("/Order")
public class OrderControl extends HttpServlet {
	private static final long serialVersionUID = 1L;  
	private static OrderDAO model= new OrderDAO();
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrderControl() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		
		try {
			if(action!=null) {
				if(action.equalsIgnoreCase("checkout")){
					Cart cart= (Cart) request.getSession().getAttribute("cart");
					if(cart.getSize()==0) {
						 RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/CartView.jsp");
				    	 dispatcher.forward(request, response);
					}
					else if(request.getAttribute("currentsessionUser")==null) response.sendRedirect("LoginView.jsp");
					else{
						
						//inserire ordine nel db
						
						UserBean user= (UserBean)request.getAttribute("currentsessionUser");
						request.getSession().setAttribute("orders", model.doRetrieveByUser(user.getUsername()));
						RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/userLoggedjsp");
						dispatcher.forward(request, response);
					}
				}
			}
		}
		catch (Exception e) {
			System.out.println("Error:" + e.getMessage());
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
