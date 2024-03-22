<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link href="signup.css" rel="stylesheet">
</head>
<body>
<section class="home">
    <div class="open-overlay">
        <h2>Register Here</h2>
        <form action="handleCreation.jsp" method="post">
            <label for="firstName">First Name:</label>
            <input type="text" id="firstName" name="firstName"  value="" placeholder="Enter First Name">
            <br>
            <label for="lastName">Last Name:</label>
            <input type="text" id="lastName" name="lastName" value="" placeholder="Enter Last Name">
            <label for="email">Email:</label>
            <input type="email" id="email" name="email"  value=""placeholder="Enter your Email">
            <label for="Role">Role:</label>
            <select id="role" name="role">
                   <option value="teacher">teacher</option>
                   <option value="student">student</option>
              </select>
            <br>
            <label for="password">Password:</label>
            <input type="password" id="password" name="password" value="" placeholder="Enter your Password" >
            <br>
            <button class="btn" type="submit" value="Signup">SignUp</button>
            <p>Already Have an Account? <a href="Login.jsp">Login</a></p>
            
        </form>
    </div>
</section>

</body>
</html>
