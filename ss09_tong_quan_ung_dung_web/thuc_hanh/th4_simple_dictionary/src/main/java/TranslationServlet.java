import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

@WebServlet(name = "TranslationServlet", value = "/translate")

public class TranslationServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {

    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        Map<String, String> dictionary= new HashMap<>();
        dictionary.put("hello", "xin chao");
        dictionary.put("how","the nao");
        dictionary.put("book","quyển sách");
        dictionary.put("computer","máy tính");

        String search= request.getParameter("txtSearch");

        PrintWriter writer= response.getWriter();
        writer.println("<html>");

        String results= dictionary.get(search);
        if(results !=null){
            writer.println("Word: " +search);
            writer.println("Results: "+ results);
        }else {
            writer.println("Not found!");
        }
        writer.println("</html>");
    }
}