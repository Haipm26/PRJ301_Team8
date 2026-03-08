/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Config;

import jakarta.servlet.MultipartConfigElement;
import jakarta.servlet.ServletRegistration;
import org.springframework.web.servlet.support.AbstractAnnotationConfigDispatcherServletInitializer;

/**
 *
 * @author Pham Minh Hai
 */
public class MyWebAppInitializer extends AbstractAnnotationConfigDispatcherServletInitializer {

    @Override
    protected Class<?>[] getRootConfigClasses() {
        // Connect the Database Pantry
        return new Class<?>[]{DatabaseConfig.class};
    }

    @Override
    protected Class<?>[] getServletConfigClasses() {
        // Set up the Kitchen Layout (Views/Controllers)
        return new Class<?>[]{WebConfig.class};
    }

    @Override
    protected String[] getServletMappings() {
        // Handle all requests starting from the root "/"
        return new String[]{"/"};
    }

    @Override
    protected void customizeRegistration(ServletRegistration.Dynamic registration) {
        registration.setMultipartConfig(
                new MultipartConfigElement(
                        null,
                        5000000,
                        5000000 * 2,
                        0));
    }
}
