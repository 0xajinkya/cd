<?php
    include('./db.php');
    $message = '';

    if ($_SERVER['REQUEST_METHOD'] == 'POST') {
        $username = htmlspecialchars($_POST['username']);
        $email = htmlspecialchars($_POST['email']);
        $password = password_hash($_POST['password'], PASSWORD_DEFAULT);

        $query = "INSERT INTO users (username, email, password) VALUES (:username, :email, :password)";
        $stmt = $conn->prepare($query);

        if ($stmt->execute([':username' => $username, ':email' => $email, ':password' => $password])) {
            $message = "Account created successfully!";
        } else {
            $message = "Failed to create account. Please try again.";
        }
    }
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>Signup</title>
</head>
<body>
    <h1>Signup</h1>
    <p><?php echo $message; ?></p>
    <form method="POST">
        <input type="text" name="username" placeholder="Name" required>
        <input type="text" name="email" placeholder="Email">
        <input type="text" name="password" placeholder="Password">
        <button type="submit">Sign Up</button>
    </form>
    <a href="login.php">Login Page</a>
</body>
</html>
