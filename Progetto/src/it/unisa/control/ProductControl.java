package it.unisa.control;

import java.io.IOException; 
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import it.unisa.model.ProductModelDS;
import it.unisa.model.Cart;
import it.unisa.model.ProductBean;
/**
 * Servlet implementation class ProductControl
 */
public class ProductControl extends HttpServlet {
	private static final long serialVersionUID = 1L;

	static ProductModelDS model = new ProductModelDS();
	
	public ProductControl() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		Cart cart = (Cart)request.getSession().getAttribute("cart");
		if(cart == null) {
			cart = new Cart();
			request.getSession().setAttribute("cart", cart);
		}
		
		String sort = request.getParameter("sort");

		try {
			request.removeAttribute("products");
			request.setAttribute("products", model.doRetrieveAll(sort));
		} catch (SQLException e) {
			System.out.println("Error:" + e.getMessage());
		}
		
		String action = request.getParameter("action");

		try {
			if (action != null) {
				if (action.equalsIgnoreCase("addC") || action.equalsIgnoreCase("addCartDetails")) {
					int id = Integer.parseInt(request.getParameter("id"));
					ProductBean b=cart.getProduct(id);
					if(cart.isInCart(id)) {
						if(b.getCartQuantity()<b.getQuantity()) {
							b.setCartQuantity(b.getCartQuantity()+1);
							b.setTot(b.getCartQuantity()*b.getPrice());
						}
					}
					else {
						ProductBean bean= (ProductBean) model.doRetrieveByKey(id);
						bean.setCartQuantity(1);
						bean.setTot(bean.getPrice());
						cart.addProduct(bean);
					}
					request.getSession().setAttribute("cart", cart);
					request.setAttribute("cart", cart);
					if(action.equalsIgnoreCase("addCartDetails")) {
						request.removeAttribute("product");
						request.setAttribute("product", model.doRetrieveByKey(id));
						RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/DetailsView.jsp");
						dispatcher.forward(request, response);
					}
					RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/ProductView.jsp");
					dispatcher.forward(request, response);
				} else if (action.equalsIgnoreCase("deleteC")) {
					int id = Integer.parseInt(request.getParameter("id"));
					cart.deleteProduct(model.doRetrieveByKey(id));
					RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/CartView.jsp");
					dispatcher.forward(request, response);
				} else if (action.equalsIgnoreCase("read")) {
					int id = Integer.parseInt(request.getParameter("id"));
					request.removeAttribute("product");
					request.setAttribute("product", model.doRetrieveByKey(id));
					RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/DetailsView.jsp");
					dispatcher.forward(request, response);
				} else if (action.equalsIgnoreCase("delete")) {
					int id = Integer.parseInt(request.getParameter("id"));
					model.doDelete(id);
					request.removeAttribute("products");
					request.setAttribute("products", model.doRetrieveAll(sort));
					RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/ProductView.jsp");
					dispatcher.forward(request, response);
				} else if (action.equalsIgnoreCase("insert")) {
					System.out.println(request.getParameter("prezzo"));
					String name = request.getParameter("nome");
					String description = request.getParameter("descrizione");
					int price = Integer.parseInt(request.getParameter("prezzo"));
					int quantity = Integer.parseInt(request.getParameter("quantita"));

					ProductBean bean = new ProductBean();
					bean.setName(name);
					bean.setDescription(description);
					bean.setPrice(price);
					bean.setQuantity(quantity);
					System.out.println(name + description + price + quantity);
					model.doSave(bean);
					request.removeAttribute("products");
					request.setAttribute("products", model.doRetrieveAll(sort));
					RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/ProductView.jsp");
					dispatcher.forward(request, response);
				}else if (action.equalsIgnoreCase("car")) {
					RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/CartView.jsp");
					dispatcher.forward(request, response);
				}else if (action.equalsIgnoreCase("deleteCart")) {
					request.getSession().setAttribute("cart", new Cart());
					RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/CartView.jsp");
					dispatcher.forward(request, response);
				}
				else if (action.equalsIgnoreCase("decreaseQD")) {
					ProductBean b= cart.getProduct(Integer.parseInt(request.getParameter("id")));
					if(b.getCartQuantity()>0) {
						b.setCartQuantity(b.getCartQuantity()-1);
						b.setTot(b.getCartQuantity()*b.getPrice());
						cart.deleteProduct(b);
						cart.addProduct(b);
						request.getSession().setAttribute("cart", cart);
						request.setAttribute("cart", cart);
						RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/CartView.jsp");
						dispatcher.forward(request, response);
					}
					else {
						RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/CartView.jsp");
						dispatcher.forward(request, response);
					}
				}
				else if (action.equalsIgnoreCase("increaseQD")) {
					ProductBean b= cart.getProduct(Integer.parseInt(request.getParameter("id")));
					if(b.getCartQuantity()<b.getQuantity()) {
						b.setCartQuantity(b.getCartQuantity()+1);
						b.setTot(b.getCartQuantity()*b.getPrice());
						cart.deleteProduct(b);
						cart.addProduct(b);
						request.getSession().setAttribute("cart", cart);
						request.setAttribute("cart", cart);
						RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/CartView.jsp");
						dispatcher.forward(request, response);
					}
					else {
						RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/CartView.jsp");
						dispatcher.forward(request, response);
					}
				}
				
			}
			else {
				RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/ProductView.jsp");
				dispatcher.forward(request, response);
			}
		} catch (SQLException e) {
			System.out.println("Error:" + e.getMessage());
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}