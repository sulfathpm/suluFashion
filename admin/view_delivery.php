<?php
// Database connection
$conn = new mysqli("localhost", "root", "", "fashion");

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}
echo "<link rel='stylesheet' href='admin.css'>";
$order_id = $_GET['id'];

// Fetch order details
$sql = "SELECT orders.ORDER_ID, orders.USER_ID, orders.DRESS_ID, dress.NAME, orders.SSIZE,
        orders.STATUSES, orders.TOTAL_PRICE, orders.CREATED_AT, 
        orders.ESTIMATED_DELIVERY_DATE, orders.ACTUAL_DELIVERY_DATE 
        FROM orders 
        JOIN dress ON orders.DRESS_ID = dress.DRESS_ID 
        WHERE orders.ORDER_ID='$order_id'";
$result = $conn->query($sql);
$order = $result->fetch_assoc();

if ($order) {
    // Display order details in a table
    echo "<h1>Order Details</h1>";
    echo "<table border='1' cellpadding='10' cellspacing='0'>";
    echo "<tr><th>Order ID</th><td>" . $order['ORDER_ID'] . "</td></tr>";
    echo "<tr><th>User ID</th><td>" . $order['USER_ID'] . "</td></tr>";
    echo "<tr><th>Dress ID</th><td>" . $order['DRESS_ID'] . "</td></tr>";
    echo "<tr><th>Dress Name</th><td>" . $order['NAME'] . "</td></tr>";
    echo "<tr><th>Dress Size</th><td>" . $order['SSIZE'] . "</td></tr>";
    echo "<tr><th>Status</th><td>" . $order['STATUSES'] . "</td></tr>";
    echo "<tr><th>Total Price</th><td>" . $order['TOTAL_PRICE'] . "</td></tr>";
    echo "<tr><th>Ordered Date</th><td>" . $order['CREATED_AT'] . "</td></tr>";
    echo "<tr><th>Estimated Delivery Date</th><td>" . $order['ESTIMATED_DELIVERY_DATE'] . "</td></tr>";
    echo "<tr><th>Actual Delivery Date</th><td>" . $order['ACTUAL_DELIVERY_DATE'] . "</td></tr>";
    echo "</table>";
} else {
    echo "No order found.";
}
echo "<a href='delivery.php'><button>Back to delivery Management</button></a>";
$conn->close();
?>
