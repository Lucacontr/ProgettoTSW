<%@ page contentType="text/html; charset=UTF-8" import="java.util.*,it.unisa.model.*"%>

<div class="slideshow-container" >
		<a class="prev" onclick="plusSlides(-1)">&#10094;</a>
		<%
			Collection<?> visti = (Collection<?>) ProductDAO.doRetrievePiuVisti();
			if (visti != null && visti.size() != 0) {
				Iterator<?> it = visti.iterator();
				while (it.hasNext()) {
					ProductBean bean = (ProductBean) it.next();
		%>
			<div class="mySlides fade" style="width:50%; margin:auto;">
			  <div id="imgCarousel"><a href="product?action=read&id=<%=bean.getCode()%>">
			  	<img src="<%=bean.getThumbnail() %>" style="height:20em; margin:auto;" ></a>
			  </div>
			</div>
		<%
				}
			}
		%>
	
		
		<a class="next" onclick="plusSlides(1)">&#10095;</a>
	
	</div>
	<br>
	<div style="text-align:center">
		<%
			if (visti != null && visti.size() != 0) {
				Iterator<?> it = visti.iterator();
				int i=1;
				while (it.hasNext() && i<=visti.size()) {
		%>	
				 	<span class="dot" onclick="currentSlide(<%=i%>)"></span> 
		<%
				i+=1;
				}
			}
		%>
	</div>
<script type="text/javascript" src="js/carousel.js"></script>	
	