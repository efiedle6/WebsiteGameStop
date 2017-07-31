package mybean;

import java.io.IOException;
import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.util.HashMap;
import java.util.Iterator;

public class AutoCompleteServlet extends HttpServlet {

    private ServletContext context;
    private ProductData prodData = new ProductData();
    private HashMap products = prodData.getProducts();

    @Override
    public void init(ServletConfig config) throws ServletException {
        this.context = config.getServletContext();
    }

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {

        String action = request.getParameter("action");
        String targetId = request.getParameter("id");
        StringBuffer sb = new StringBuffer();
		
		//if action is null just return to the homepage
		if (action == null) {
            context.getRequestDispatcher("/Home.jsp").forward(request, response);
        }
		
		//I chose to have it just return to the homepage rather than an error page
        if (targetId != null) {
            targetId = targetId.trim().toLowerCase();
        } else {
            context.getRequestDispatcher("/Home.jsp").forward(request, response);
        }

        boolean productsAdded = false;
        if (action.equals("complete")) {

            if (!targetId.equals("")) {

                Iterator it = products.keySet().iterator();

                while (it.hasNext()) {
                    String id = (String) it.next();
                    Product pro = (Product) products.get(id);

                    if ( // targetId matches producer
                         pro.getProducer().toLowerCase().startsWith(targetId) ||
                         // targetId matches item (product named item for simplicity)
                         pro.getItem().toLowerCase().startsWith(targetId) ||
                         // targetId matches both
                         pro.getProducer().toLowerCase().concat(" ")
                            .concat(pro.getItem().toLowerCase()).startsWith(targetId)) {
						
						//create XML object containing information on matches
                        sb.append("<product>");
                        sb.append("<id>" + pro.getId() + "</id>");
                        sb.append("<producer>" + pro.getProducer() + "</producer>");
                        sb.append("<item>" + pro.getItem() + "</item>");
                        sb.append("</product>");
                        productsAdded = true;
                    }
                }
            }

			//write contents within <products></products>
            if (productsAdded) {
                response.setContentType("text/xml");
                response.setHeader("Cache-Control", "no-cache");
                response.getWriter().write("<products>" + sb.toString() + "</products>");
            } else {
                response.setStatus(HttpServletResponse.SC_NO_CONTENT);
            }
        }

        if (action.equals("lookup")) {

            if ((targetId != null) && products.containsKey(targetId.trim())) {
                request.setAttribute("product", products.get(targetId));
                context.getRequestDispatcher("/productInfo.jsp").forward(request, response);
            }
        }
    }
}
