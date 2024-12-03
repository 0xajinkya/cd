<?php
    include('./db.php');
    $message = '';

    if ($_SERVER['REQUEST_METHOD'] == 'POST') {
        $email = htmlspecialchars($_POST['email']);
        $password = $_POST['password'];

        $query = "SELECT * FROM users WHERE email = :email";
        $stmt = $conn->prepare($query);
        $stmt->execute([':email' => $email]);
        $user = $stmt->fetch(PDO::FETCH_ASSOC);

        if ($user && password_verify($password, $user['password'])) {
            session_start();
            $_SESSION['user'] = $user['username'];
            header('Location: ./welcome.php');
            exit;
        } else {
            $message = "Invalid credentials. Please try again.";
        }
    }
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>Login</title>
</head>
<body>
    <h1>Login</h1>
    <p><?php echo $message; ?></p>
    <form method="POST">
        <input type="text" name="email" placeholder="Your Email">
        <input type="text" name="password" placeholder="Enter Your Password">
        <button type="submit">Submit</button>
    </form>
    <a href="signup.php">Go to Signup Page</a>
</body>
</html>
