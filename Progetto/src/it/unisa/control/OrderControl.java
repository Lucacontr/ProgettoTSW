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
		UserBean user=(UserBean)request.getSession().getAttribute("currentSessionUser");
		
		try {
			if(action!=null) {
				if(action.equalsIgnoreCase("checkout")){
					Cart cart= (Cart) request.getSession().getAttribute("cart");
					if(cart.getSize()==0) {
						 RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/CartView.jsp");
				    	 dispatcher.forward(request, response);
					}
					else if(user==null) {
						response.sendRedirect("LoginView.jsp");
					}
					else{
						OrderBean order=new OrderBean();
						order.setPrezzoTot(cart.getTotPrice());
						order.setUtente(user.getEmail());
						OrderDAO.doSave(order);
						DetailDAO.doSave(cart, order.getId());
						request.getSession().setAttribute("cart", new Cart());
						request.getSession().removeAttribute("orders");
						request.getSession().setAttribute("orders", OrderDAO.doRetrieveByUser(user.getEmail()));
						RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/userLogged.jsp");
						dispatcher.forward(request, response);
					}
				}
				else if(action.equalsIgnoreCase("detail")){
					int id = Integer.parseInt(request.getParameter("id"));
					request.getSession().removeAttribute("products");
					request.getSession().setAttribute("products", DetailDAO.doRetrieveProducts(id));
					RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/OrderDetailsView.jsp");
					dispatcher.forward(request, response);
				}
				else if(action.equalsIgnoreCase("guest")){
					
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