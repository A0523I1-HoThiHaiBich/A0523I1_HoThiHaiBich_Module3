import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "DiscountPriceServlet", value = "/display-discount")

public class DiscountPriceServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {

    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String desc= request.getParameter("description");
        Integer price= Integer.parseInt(request.getParameter("listPrice"));
        Integer discount= Integer.valueOf(request.getParameter("discount"));

        double disAmount =  price*discount*0.01;
        double disPrice= price-disAmount;

        PrintWriter writer=response.getWriter();
        writer.println("<html>");
        writer.println("<h3>Product Description: "+desc+"</h3>" );
        writer.println("<h3>List Price: "+price+"</h3>" );
        writer.println("<h3>Discount Percent: "+discount+"</h3>" );
        writer.println("<h3>Discount Amoun: "+disAmount+"</h3>" );
        writer.println("<h3>Discount Price: "+disPrice+"</h3>" );
        writer.println("</html>");


    }
}