package controllers;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import models.User;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/register")
@MultipartConfig(
    fileSizeThreshold = 1024 * 1024, // 1 MB
    maxFileSize = 1024 * 1024 * 5,   // 5 MB
    maxRequestSize = 1024 * 1024 * 10 // 10 MB
)
public class RegisterServlet extends HttpServlet {
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        List<String> errors = new ArrayList<>();
        
        // Validación
        String firstName = request.getParameter("firstName");
        if (firstName == null || firstName.trim().isEmpty()) {
            errors.add("First name is required");
        }
        
        String email = request.getParameter("email");
        if (email == null || !email.matches("^[A-Za-z0-9+_.-]+@(.+)$")) {
            errors.add("Valid email is required");
        }
        
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");
        if (password == null || password.length() < 6 || !password.equals(confirmPassword)) {
            errors.add("Password must be at least 6 characters and match confirmation");
        }
        
        // Si hay errores, volver al formulario
        if (!errors.isEmpty()) {
            request.setAttribute("errors", errors);
            request.getRequestDispatcher("/index.jsp").forward(request, response);
            return;
        }
        
        // Crear usuario si no hay errores
        User user = new User();
        user.setFirstName(firstName);
        user.setLastName(request.getParameter("lastName"));
        user.setEmail(email);
        user.setGender(request.getParameter("gender"));
        user.setHobbies(request.getParameterValues("hobbies"));
        user.setSourceOfIncome(request.getParameter("sourceOfIncome"));
        user.setIncome(Integer.parseInt(request.getParameter("income")));
        user.setAge(Integer.parseInt(request.getParameter("age")));
        user.setBio(request.getParameter("bio"));
        
        // Manejo de la imagen de perfil
        Part filePart = request.getPart("profilePicture");
        if (filePart != null && filePart.getSize() > 0) {
            String fileName = getSubmittedFileName(filePart);
            // Aquí deberías implementar la lógica para guardar el archivo
            user.setProfilePicture(fileName);
        }
        
        // Guardar usuario en la sesión
        request.getSession().setAttribute("user", user);
        
        // Redirigir a la página de bienvenida
        response.sendRedirect(request.getContextPath() + "/welcome.jsp");
    }
    
    private String getSubmittedFileName(Part part) {
        for (String content : part.getHeader("content-disposition").split(";")) {
            if (content.trim().startsWith("filename")) {
                return content.substring(content.indexOf('=') + 1).trim().replace("\"", "");
            }
        }
        return null;
    }
}