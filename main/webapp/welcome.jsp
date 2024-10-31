<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ page import="models.User" %>
        <!DOCTYPE html>
        <html>

        <head>
            <meta charset="UTF-8">
            <title>Welcome</title>
            <style>
                .id-card {
                    max-width: 500px;
                    margin: 50px auto;
                    padding: 20px;
                    border-radius: 10px;
                    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                    background: white;
                }

                .profile-section {
                    display: flex;
                    gap: 20px;
                    margin-bottom: 20px;
                }

                .profile-image {
                    width: 100px;
                    height: 100px;
                    border-radius: 50%;
                    background: #f0f0f0;
                    display: flex;
                    align-items: center;
                    justify-content: center;
                }

                .profile-info {
                    flex: 1;
                }

                .info-row {
                    margin: 10px 0;
                    padding: 5px 0;
                    border-bottom: 1px solid #eee;
                }

                .label {
                    font-weight: bold;
                    color: #00c2a8;
                }

                .hobbies-list {
                    display: flex;
                    gap: 10px;
                    flex-wrap: wrap;
                }

                .hobby-tag {
                    background: #e0f7f5;
                    padding: 5px 10px;
                    border-radius: 15px;
                    font-size: 0.9em;
                }
            </style>
        </head>

        <body>
            <% User user=(User) session.getAttribute("user"); if (user==null) { response.sendRedirect("index.jsp");
                return; } %>
                <div class="id-card">
                    <div class="profile-section">
                        <div class="profile-image">
                            <% if (user.getProfilePicture() !=null) { %>
                                <img src="uploads/<%= user.getProfilePicture() %>" alt="Profile">
                                <% } else { %>
                                    <span>No Image</span>
                                    <% } %>
                        </div>
                        <div class="profile-info">
                            <h2>
                                <%= user.getFirstName() %>
                                    <%= user.getLastName() %>
                            </h2>
                            <p>
                                <%= user.getEmail() %>
                            </p>
                        </div>
                    </div>

                    <div class="info-row">
                        <span class="label">Gender:</span>
                        <%= user.getGender() %>
                    </div>

                    <div class="info-row">
                        <span class="label">Hobbies:</span>
                        <div class="hobbies-list">
                            <% if (user.getHobbies() !=null) { for (String hobby : user.getHobbies()) { %>
                                <span class="hobby-tag">
                                    <%= hobby %>
                                </span>
                                <% } } %>
                        </div>
                    </div>

                    <div class="info-row">
                        <span class="label">Income Source:</span>
                        <%= user.getSourceOfIncome() %>
                    </div>

                    <div class="info-row">
                        <span class="label">Income Level:</span>
                        <%= user.getIncome() %>K
                    </div>

                    <div class="info-row">
                        <span class="label">Age:</span>
                        <%= user.getAge() %>
                    </div>

                    <div class="info-row">
                        <span class="label">Bio:</span>
                        <p>
                            <%= user.getBio() %>
                        </p>
                    </div>
                </div>
        </body>

        </html>