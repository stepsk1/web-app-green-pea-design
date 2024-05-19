package com.example.servlet.cart;

import java.io.*;
import java.util.*;

import com.example.model.Cart;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@WebServlet(name = "QuantityChangeServlet", value = "/quantity-change")
public class QuantityChangeServlet extends HttpServlet
{
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException
    {
        String action = request.getParameter("action");
        int id = Integer.parseInt(request.getParameter("id"));

        ArrayList<Cart> cartList = (ArrayList<Cart>) request.getSession().getAttribute("cart-list");

        if ( action != null && id > 0 )
        {
            for (Cart c : cartList)
            {
                if (c.getId() == id)
                {
                    int quantity = c.getQuantity();
                    if (action.equalsIgnoreCase("inc"))
                    {
                        quantity += 1;
                        c.setQuantity(quantity);
                    }
                    else if ( action.equalsIgnoreCase("dec") && quantity > 1 )
                    {
                        quantity -= 1;
                        c.setQuantity(quantity);
                    }
                    break;
                }
            }
            response.sendRedirect("/cart");
        }
        else
        {
            response.sendRedirect("/cart");
        }
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException
    {

    }
}