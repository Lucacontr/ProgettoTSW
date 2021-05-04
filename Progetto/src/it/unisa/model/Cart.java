package it.unisa.model;

import java.util.ArrayList;
import java.util.List;

public class Cart {

	private List<ProductBean> products;
	
	public Cart() {
		products = new ArrayList<ProductBean>();
	}
	
	public void addProduct(ProductBean product) {
		products.add(product);
	}
	
	public ProductBean getProduct(int id) {
		for(ProductBean prod : products) {
			if(prod.getCode() == id) {
				return prod;
			}
		}
		return null;
	}
	
	public void deleteProduct(ProductBean product) {
		for(ProductBean prod : products) {
			if(prod.getCode() == product.getCode()) {
				products.remove(prod);
				break;
			}
		}
 	}
	
	public boolean isInCart(int id) {
		for(ProductBean prod : products) {
			if(prod.getCode() == id) {
				return true;
			}
		}
		return false;
	}
	
	public List<ProductBean> getProducts() {
		return  products;
	}
	
	public int getSize() {
		return products.size();
	}
	
	public boolean replaceProduct(ProductBean bean) {
		for(int i=0;i<products.size();i++){
			if(bean.getCode()==products.get(i).getCode()) {
				products.set(i, bean);
				return true;
			}
		}
		return false;
	}
	
}
