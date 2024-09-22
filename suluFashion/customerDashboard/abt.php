<?php
    session_start();
    error_reporting(0);
    $_SESSION["DRESS_ID"]=null;
    $_SESSION["FABRIC_ID"]=null;
    
    $dbcon = mysqli_connect("localhost", "root", "", "fashion");
    
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>About Us - Custom Dress</title>
    <link rel="stylesheet" href="abt.css">
</head>
<body>
    <header>
        <nav>
            <div class="navbar">
                <a href="custmrdshbrd.php">Home</a>
                <a href="fabric.php">Choose by Fabric</a>
                <a href="abt.php">About</a>
                <a href="contact1.php">Contact</a>
                <?php
                if($_SESSION["USER_ID"]==null){
                echo "<a href='login.php'>Login</a>";
                }else{
                    echo "<a href='logout.php'>Logout</a>";
                }
                ?>
                <a href="customize1.php" class="customize-button">Customize Now</a>
            </div>
        </nav>
    </header>

    <section class="about-section">
        <div class="container">
            <h1>About Us</h1>
            <p>Welcome to the fashion fix, where your imagination meets craftsmanship. We specialize in creating customized dresses that reflect your unique style and personality. Our team of expert designers and tailors work with you to bring your vision to life.</p>

            <h2>Our Story</h2>
            <p>The fashion fix was founded in 2002 with the belief that fashion should be as unique as the individual. We started with a small team of passionate designers and have grown into a full-fledged customization service, catering to fashion enthusiasts across the globe.</p>

            <h2>Our Mission</h2>
            <p>Our mission is to empower individuals to express themselves through personalized fashion. We believe that every dress we create should tell a story - your story.</p>

            <h2>Our Team</h2>
            <p>Our team is made up of seasoned professionals with years of experience in fashion design and tailoring. We are committed to quality, creativity, and customer satisfaction.</p>

            <h2>Why Choose Us?</h2>
            <ul>
                <li>Expert Craftsmanship</li>
                <li>Personalized Designs</li>
                <li>Quality Fabrics</li>
                <li>Global Delivery</li>
            </ul>
        </div>
    </section>
    
    <div class="footer">
        <p>&copy; 2024 Women's Boutique. All Rights Reserved.</p>
    </div>
</body>
</html>
