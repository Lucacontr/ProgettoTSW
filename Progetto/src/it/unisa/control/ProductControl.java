package it.unisa.control;

import java.io.IOException; 
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import it.unisa.model.*;
/**
 * Servlet implementation class ProductControl
 */
public class ProductControl extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	public ProductControl() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		try {
			request.removeAttribute("categories");
			request.setAttribute("categories", CategoriaDAO.doRetrieveAll());
		} catch (SQLException e) {
			System.out.println("Error:" + e.getMessage());
		}
		
		String action = request.getParameter("action");

		try {
			if (action != null) {
				if (action.equalsIgnoreCase("search")) {
					Collection<ProductBean> list =(Collection<ProductBean>)ProductDAO.doRetrieveAll();
					ArrayList<String> result=new ArrayList<String>();
					String s=request.getParameter("search");
					for (ProductBean productBean : list) {
						if(productBean.getName().contains(s)) {
							result.add(productBean.getName());
						}
					}
					String json = new Gson().toJson(result);
					response.setContentType("application/json");
			        response.setCharacterEncoding("UTF-8");
			        response.getWriter().write(json);
				}
				if (action.equalsIgnoreCase("read")) {
					int id = Integer.parseInt(request.getParameter("id"));
					request.removeAttribute("product");
					ProductBean bean=ProductDAO.doRetrieveByKey(id);
					request.setAttribute("product", bean );
					bean.setNvisualizzazioni(bean.getNvisualizzazioni()+1);
					ProductDAO.doUpdate(bean);
					RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/DetailsView.jsp");
					dispatcher.forward(request, response);
				} else if (action.equalsIgnoreCase("delete")) {
					int id = Integer.parseInt(request.getParameter("id"));
					ProductDAO.doDelete(id);
					request.removeAttribute("products");
					request.setAttribute("products", ProductDAO.doRetrieveAll());
					if(request.getSession().getAttribute("adminRoles")!=null) {
						response.sendRedirect("admin/adminView.jsp");
					}
					else {
						response.sendRedirect("index.jsp");
					}
				} else if (action.equalsIgnoreCase("insert")) {
					ProductDAO.doSave(getProductbyRequest(request, response));
					String[] results = request.getParameterValues("categoria");
					for (int i = 0; i < results.length; i++) {
					    AppartenenzaDAO.doSave(new AppartenenzaBean(ProductDAO.getIdThumbnail(request.getParameter("thumb")), results[i]));
					}
					request.removeAttribute("products");
					request.setAttribute("products", ProductDAO.doRetrieveAll());
					if(request.getSession().getAttribute("adminRoles")!=null)
						response.sendRedirect("admin/adminView.jsp");
					else response.sendRedirect("index.jsp");
				}
				 else if (action.equalsIgnoreCase("modify")) {
					 ProductBean bean=ProductDAO.doRetrieveByKey(Integer.parseInt(request.getParameter("id")));
					 ProductBean nuovo=getProductbyRequest(request, response);
					 nuovo.setCode(bean.getCode());
					 nuovo.setNvendite(bean.getNvendite());
					 nuovo.setNvisualizzazioni(bean.getNvisualizzazioni());
					 ProductDAO.doUpdate(nuovo);
					 request.removeAttribute("products");
					 request.setAttribute("products", ProductDAO.doRetrieveAll());
					 if(request.getSession().getAttribute("adminRoles")!=null)
						 response.sendRedirect("admin/adminView.jsp");
					 else response.sendRedirect("index.jsp");
				 }
			}
			else {
				RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/index.jsp");
				dispatcher.forward(request, response);
			}
		} catch (SQLException e) {
			System.out.println("Error:" + e.getMessage());
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

	private ProductBean getProductbyRequest(HttpServletRequest request, HttpServletResponse response) {
		String name = request.getParameter("nome");
		String description = request.getParameter("descrizione");
		double price = Double.parseDouble(request.getParameter("prezzo"));
		int quantity = Integer.parseInt(request.getParameter("quantita"));
		double sconto = Double.parseDouble(request.getParameter("sconto"));
		double iva = Double.parseDouble(request.getParameter("iva"));
		String thumb= request.getParameter("thumb");
		ProductBean bean = new ProductBean();
		bean.setName(name);
		bean.setDescription(description);
		bean.setPrice(price);
		bean.setQuantity(quantity);
		bean.setIva(iva);
		bean.setSconto(sconto);
		bean.setThumbnail(thumb);
		return bean;
	}
	
}
