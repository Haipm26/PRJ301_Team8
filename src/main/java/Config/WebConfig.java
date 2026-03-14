/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Config;

import jakarta.servlet.Filter;
import jakarta.servlet.MultipartConfigElement;
import jakarta.servlet.ServletRegistration;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.multipart.support.StandardServletMultipartResolver;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
import org.springframework.web.servlet.view.JstlView;

/**
 *
 * @author Pham Minh Hai
 */
@Configuration
@EnableWebMvc
@ComponentScan(basePackages = {"Controller", "Config", "Service"}) // Tell Spring where to find your @Controller
public class WebConfig implements WebMvcConfigurer {

    @Bean
    public ViewResolver viewResolver() {
        InternalResourceViewResolver bean = new InternalResourceViewResolver();
        bean.setViewClass(JstlView.class);
        bean.setPrefix("/WEB-INF/views/"); // Folder where your HTML/JSP files will live
        bean.setSuffix(".jsp"); // Using .jsp is standard for traditional MVC
        return bean;
    }

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        // This allows your app to load images, CSS, and JS files from a 'resources'
        // folder
        registry.addResourceHandler("/resources/**").addResourceLocations("/resources/");
    }

    @Bean
    public StandardServletMultipartResolver multipartResolver() {
        return new StandardServletMultipartResolver();
    }
    
    @Override
    public void addInterceptors(InterceptorRegistry registry) {

        registry.addInterceptor(new AdminInterceptor())
                .addPathPatterns(
                        "/laptops/manage",
                        "/laptops/delete/**",
                        "/laptops/update/**",
                        "/laptops",
                        "/users/manage",
                        "/users/delete/**",
                        "/users/update/**",
                        "/users/promote/**",
                        "/users/demote/**",
                        "/statistics/**"
                );
        
        registry.addInterceptor(new GuestInterceptor())
            .addPathPatterns(
                    "/login", 
                    "/register"
            );
    }

    

}
