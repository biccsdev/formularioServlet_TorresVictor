<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ page import="java.util.List" %>
        <!DOCTYPE html>
        <html lang="es">

        <head>
            <meta charset="UTF-8">
            <title>Create Account</title>
            <style>
                * {
                    margin: 0;
                    padding: 0;
                    box-sizing: border-box;
                    font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Arial, sans-serif;
                }

                body {
                    background-color: #f0f2f5;
                    display: flex;
                    justify-content: center;
                    align-items: center;
                    min-height: 100vh;
                    padding: 20px;
                }

                .container {
                    background: white;
                    border-radius: 8px;
                    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
                    width: 100%;
                    max-width: 500px;
                }

                .header {
                    padding: 15px 20px;
                    border-bottom: 1px solid #e0e0e0;
                }

                .header h1 {
                    font-size: 20px;
                    color: #333;
                    font-weight: normal;
                }

                .form-content {
                    padding: 20px;
                }

                .form-row {
                    display: flex;
                    gap: 15px;
                    margin-bottom: 15px;
                }

                .form-group {
                    flex: 1;
                }

                label {
                    display: block;
                    font-size: 14px;
                    color: #00c2a8;
                    margin-bottom: 5px;
                }

                label.required::after {
                    content: '*';
                    color: #00c2a8;
                    margin-left: 2px;
                }

                input[type="text"],
                input[type="email"],
                input[type="password"],
                input[type="number"],
                select,
                textarea {
                    width: 100%;
                    padding: 8px 12px;
                    border: 1px solid #ddd;
                    border-radius: 4px;
                    font-size: 14px;
                }

                textarea {
                    resize: vertical;
                    min-height: 100px;
                }

                .hobbies-group {
                    display: flex;
                    gap: 15px;
                }

                .hobby-option {
                    display: flex;
                    align-items: center;
                    gap: 5px;
                }

                input[type="radio"],
                input[type="checkbox"] {
                    margin-right: 5px;
                }

                .income-slider {
                    width: 100%;
                    margin-top: 10px;
                }

                .file-upload {
                    display: flex;
                    align-items: center;
                    gap: 10px;
                }

                .create-button {
                    background-color: #00c2a8;
                    color: white;
                    border: none;
                    padding: 10px 25px;
                    border-radius: 4px;
                    font-size: 16px;
                    cursor: pointer;
                    margin: 20px auto;
                    display: block;
                }

                .create-button:hover {
                    background-color: #00b09b;
                }

                /* Estilos para mensajes de error */
                .error-message {
                    background-color: #ffe6e6;
                    color: #ff0000;
                    padding: 10px;
                    margin-bottom: 15px;
                    border-radius: 4px;
                    font-size: 14px;
                }

                .error-message ul {
                    margin: 0;
                    padding-left: 20px;
                }

                .field-error {
                    border-color: #ff0000;
                }
            </style>
        </head>

        <body>
            <div class="container">
                <div class="header">
                    <h1>Create Account</h1>
                </div>
                <div class="form-content">
                    <!-- Mostrar errores si existen -->
                    <% List<String> errors = (List<String>) request.getAttribute("errors");
                            if (errors != null && !errors.isEmpty()) {
                            %>
                            <div class="error-message">
                                <ul>
                                    <% for (String error : errors) { %>
                                        <li>
                                            <%= error %>
                                        </li>
                                        <% } %>
                                </ul>
                            </div>
                            <% } %>

                                <form action="register" method="post" enctype="multipart/form-data">
                                    <div class="form-row">
                                        <div class="form-group">
                                            <label class="required">First name</label>
                                            <input type="text" name="firstName" placeholder="enter your first name"
                                                value="<%= request.getParameter(" firstName") !=null ?
                                                request.getParameter("firstName") : "" %>">
                                        </div>
                                        <div class="form-group">
                                            <label>Last name</label>
                                            <input type="text" name="lastName" placeholder="enter your last name"
                                                value="<%= request.getParameter(" lastName") !=null ?
                                                request.getParameter("lastName") : "" %>">
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="required">Email</label>
                                        <input type="email" name="email" placeholder="enter your email"
                                            value="<%= request.getParameter(" email") !=null ?
                                            request.getParameter("email") : "" %>">
                                    </div>

                                    <div class="form-row">
                                        <div class="form-group">
                                            <label class="required">Password</label>
                                            <input type="password" name="password" placeholder="enter your password">
                                        </div>
                                        <div class="form-group">
                                            <label class="required">Confirm Password</label>
                                            <input type="password" name="confirmPassword"
                                                placeholder="enter your password again">
                                        </div>
                                    </div>

                                    <div class="form-row">
                                        <div class="form-group">
                                            <label>Gender:</label>
                                            <div class="hobbies-group">
                                                <label class="hobby-option">
                                                    <input type="radio" name="gender" value="male" <%="male"
                                                        .equals(request.getParameter("gender")) ? "checked" : "" %>>
                                                    Male
                                                </label>
                                                <label class="hobby-option">
                                                    <input type="radio" name="gender" value="female" <%="female"
                                                        .equals(request.getParameter("gender")) ? "checked" : "" %>>
                                                    Female
                                                </label>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label>Hobbies</label>
                                            <div class="hobbies-group">
                                                <% String[] hobbies=request.getParameterValues("hobbies"); boolean
                                                    isChecked=false; if (hobbies !=null) { java.util.List<String>
                                                    hobbiesList = java.util.Arrays.asList(hobbies);
                                                    %>
                                                    <label class="hobby-option">
                                                        <input type="checkbox" name="hobbies" value="music"
                                                            <%=hobbiesList.contains("music") ? "checked" : "" %>> Music
                                                    </label>
                                                    <label class="hobby-option">
                                                        <input type="checkbox" name="hobbies" value="sports"
                                                            <%=hobbiesList.contains("sports") ? "checked" : "" %>>
                                                        Sports
                                                    </label>
                                                    <label class="hobby-option">
                                                        <input type="checkbox" name="hobbies" value="travel"
                                                            <%=hobbiesList.contains("travel") ? "checked" : "" %>>
                                                        Travel
                                                    </label>
                                                    <label class="hobby-option">
                                                        <input type="checkbox" name="hobbies" value="movies"
                                                            <%=hobbiesList.contains("movies") ? "checked" : "" %>>
                                                        Movies
                                                    </label>
                                                    <% } else { %>
                                                        <label class="hobby-option">
                                                            <input type="checkbox" name="hobbies" value="music"> Music
                                                        </label>
                                                        <label class="hobby-option">
                                                            <input type="checkbox" name="hobbies" value="sports"> Sports
                                                        </label>
                                                        <label class="hobby-option">
                                                            <input type="checkbox" name="hobbies" value="travel"> Travel
                                                        </label>
                                                        <label class="hobby-option">
                                                            <input type="checkbox" name="hobbies" value="movies"> Movies
                                                        </label>
                                                        <% } %>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="form-row">
                                        <div class="form-group">
                                            <label>Source of Income</label>
                                            <select name="sourceOfIncome">
                                                <option value="Employed" <%="Employed"
                                                    .equals(request.getParameter("sourceOfIncome")) ? "selected" : "" %>
                                                    >Employed</option>
                                                <option value="Self-employed" <%="Self-employed"
                                                    .equals(request.getParameter("sourceOfIncome")) ? "selected" : "" %>
                                                    >Self-employed</option>
                                                <option value="Other" <%="Other"
                                                    .equals(request.getParameter("sourceOfIncome")) ? "selected" : "" %>
                                                    >Other</option>
                                            </select>
                                        </div>
                                        <div class="form-group">
                                            <label>Income</label>
                                            <input type="range" name="income" class="income-slider" min="0" max="100"
                                                value="<%= request.getParameter(" income") !=null ?
                                                request.getParameter("income") : "20" %>">
                                        </div>
                                    </div>

                                    <div class="form-row">
                                        <div class="form-group">
                                            <label>Upload Profile Picture</label>
                                            <div class="file-upload">
                                                <input type="file" name="profilePicture" accept="image/*">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label>Age</label>
                                            <input type="number" name="age" min="18" max="100"
                                                value="<%= request.getParameter(" age") !=null ?
                                                request.getParameter("age") : "18" %>">
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label>Bio</label>
                                        <textarea
                                            name="bio"><%= request.getParameter("bio") != null ? request.getParameter("bio") : "" %></textarea>
                                    </div>

                                    <button type="submit" class="create-button">Create</button>
                                </form>
                </div>
            </div>
        </body>

        </html>