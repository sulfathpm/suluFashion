<?php
session_start();
error_reporting(0);
// Connect to MySQL database
$dbcon = mysqli_connect("localhost", "root", "", "fashion");

// Check connection
if (!$dbcon) {
    die("Connection failed: " . mysqli_connect_error());
}
if($_SERVER["REQUEST_METHOD"] == "GET"){
    $order_id=$_GET['id'];
    $sql="SELECT * FROM orders where ORDER_ID='$order_id'";
    $data=mysqli_query($dbcon,$sql);
    if($data){
        $order_row=mysqli_fetch_array($data);

        $sql="SELECT * FROM dress WHERE DRESS_ID='$order_row[DRESS_ID]'";
        $data3=mysqli_query($dbcon,$sql);
        if($data3){
            $dress_row=mysqli_fetch_array($data3);

            //if its a complete customization
            if($order_row['OPTION_ID']!=null&&$order_row['FABRIC_ID']!=null){
                $sql="SELECT * FROM fabrics WHERE FABRIC_ID='$order_row[FABRIC_ID]'";
                $data4=mysqli_query($dbcon,$sql);
                if($data4){
                    $fabric_row=mysqli_fetch_array($data4);
                    $sql="SELECT * FROM customizations WHERE OPTION_ID='$order_row[OPTION_ID]'";
                    $data4=mysqli_query($dbcon,$sql);
                    if($data4){
                        $custmize_row=mysqli_fetch_array($data4);
                    }
                }
            }
        }
    }
}

?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Order Details</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background-color: #f8f9fa;
            margin: 0;
            padding: 0;
            color: #333;
        }

        .order-details-container {
            max-width: 1000px;
            margin: 50px auto;
            background-color: #fff;
            padding: 30px;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
        }

        .order-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 30px;
        }

        .order-header h2 {
            font-weight: 600;
            color: palevioletred;
        }

        .order-header .status {
            color: #28a745;
            font-weight: bold;
            font-size: 18px;
        }

        .order-section {
            margin-bottom: 30px;
        }

        .order-section h3 {
            margin-bottom: 10px;
            font-size: 20px;
            color: palevioletred;
            border-bottom: 2px solid #ececec;
            padding-bottom: 10px;
        }

        .order-details {
            display: flex;
            justify-content: space-between;
            padding: 20px;
            border: 1px solid #ececec;
            border-radius: 10px;
            background-color: #f9f9f9;
        }

        .order-details img {
            width: 180px;
            border-radius: 10px;
        }

        .order-info {
            width: 70%;
        }

        .order-info h4 {
            font-size: 22px;
            margin-bottom: 10px;
        }

        .order-info p {
            font-size: 16px;
            margin-bottom: 8px;
            color: #555;
        }

        .order-info p span {
            font-weight: bold;
        }

        .tracking-info {
            margin-bottom: 20px;
        }

        .tracking-info p {
            font-size: 16px;
            color: #555;
        }

        .tracking-info p span {
            font-weight: bold;
            color: palevioletred;
        }

        .track-order-button {
            background-color: palevioletred;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            transition: background-color 0.3s ease;
        }

        .track-order-button:hover {
            background-color: #d75a8a;
        }

        .invoice-button {
            background-color: #6c757d;
            color: white;
            padding: 10px 20px;
            border-radius: 5px;
            text-decoration: none;
            font-size: 16px;
            transition: background-color 0.3s ease;
        }

        .invoice-button:hover {
            background-color: #5a6268;
        }

        .footer {
            text-align: center;
            padding: 10px;
            background-color: #343a40;
            color: white;
            position: fixed;
            bottom: 0;
            width: 100%;
        }
    </style>
</head>
<body>


    <div class="order-details-container">
        <!-- Order Header -->
        <div class="order-header">
            <h2>Order #<?php echo $order_id; ?></h2>
            <p class="status"><?php echo $order_row['STATUSES']; ?></p>
        </div>

        <!-- Dress Details -->
        <div class="order-section">
            <h3>Dress Details</h3>
            <?php
                if($order_type=='Dress order'){
                    echo "<div class='order-details'>
                            <img src='".$dress_row['IMAGE_URL']."' alt='Dress Image'>
                            <div class='order-info'>
                                <h4>".$dress_row['NAME']." - ".$order_type."</h4>
                                <p><span>Color:</span>".$dress_row['COLOR']."</p>
                                <p><span>Size:</span> ".$order_row['SSIZE']."</p>
                                <p><span>Price:</span> $".$order_row['TOTAL_PRICE']."</p>
                            </div>
                        </div>";
                }else{
                    echo "<div class='order-details'>
                            <img src='".$dress_row['IMAGE_URL']."' alt='Dress Image'>
                            <div class='order-info'>
                                <h4>".$dress_row['NAME']." - ".$order_type."</h4>
                                <p><span>Fabric:</span> ".$fabric_row['NAME']."</p>
                                <p><span>Color:</span> ".$custmize_row['COLOR']."</p>
                                <p><span>Embellishments:</span> ".$custmize_row['EMBELLISHMENTS']."</p>
                                <p><span>Size:</span> ".$order_row['SSIZE']."</p>
                                <p><span>Price:</span> $".$order_row['TOTAL_PRICE']."</p>
                            </div>
                        </div>";
                }
                    
            ?>
        </div>

        <!-- Tracking Information -->
        <div class="order-section tracking-info">
            <h3>Tracking Information</h3>
            <p>Order placed on <span><?php echo substr($order_row['CREATED_AT'],0,11) ?></span></p>
            <?php
                if($order_row['STATUSES']=='DELIVERED'){
                    echo "<p>Delivered on <span>".$order_row['ACTUAL_DELIVERY_DATE']."</span></p>";
                }else if($order_row['STATUSES']=='CANCELLED'){
                    echo "<p>CANCELLED</p>";
                }else{
                    echo "<p>Delivered on <span>".$order_row['ACTUAL_DELIVERY_DATE']."</span></p>";
                }
            ?>
            <button class="track-order-button">Message shop</button>
        </div>

        <!-- Payment Information -->
        <!-- <div class="order-section">
            <h3>Payment Information</h3>
            <p>Total Amount: <strong>$150</strong></p>
            <a href="#" class="invoice-button">Download Invoice</a>
        </div> -->
    </div>

    <div class="footer">
        <p>&copy; 2024 Women's Boutique. All Rights Reserved.</p>
    </div>

</body>
</html>
