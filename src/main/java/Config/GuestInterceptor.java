/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Config;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.springframework.web.servlet.HandlerInterceptor;

/**
 *
 * @author Pham Minh Hai
 */
public class GuestInterceptor implements HandlerInterceptor {
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        HttpSession session = request.getSession();
        
        // If user is already logged in
        if (session.getAttribute("user") != null) {
            // Send them to the home page
            response.sendRedirect(request.getContextPath() + "/");
            return false; // STOP the request from reaching the Controller
        }
        
        return true; // Proceed if user is NOT logged in
    }
}
