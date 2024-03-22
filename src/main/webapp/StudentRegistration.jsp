<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
   <link href="signup.css" rel="stylesheet"> 
</head>
<body>
<section class="home">
    <div class="open-overlay">
        <h2>Register Here</h2>
        <form action="Handle.jsp" method="post">
            <label for="RegNo">Reg No:</label>
            <input type="number" id="RegNo" name="regNo" value="" placeholder="Enter your ID">
            <br>
            <label for="lastNameL">First Name:</label>
            <input type="text" id="lastNameL" name="firstName"  value="" placeholder="Enter First Name">
            <br>
            <label for="lastName">Last Name:</label>
            <input type="text" id="lastName" name="lastName" value="" placeholder="Enter Last Name">
            <label for="email">Email:</label>
            <input type="email" id="email" name="email"  value=""placeholder="Enter your Email">
            <label for="phone">Phone:</label>
            <input type="text" id="phone" name="phone" value="" placeholder="Enter your Phone Number">
            <br>
            <label for="dob">Date of Birth:</label>
            <input type="date" id="dob" name="dateOfBirth" value="" placeholder="Enter your BirthDate">
            <br>
            
            <br>
            <button class="btn" type="submit" value="Signup">Register</button>
            <p>Already Have an Account? <a href="Login.jsp">Login</a></p>
            
        </form>
    </div>
</section>
</body>
</html>
