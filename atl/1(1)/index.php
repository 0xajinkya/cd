<?php
    session_start();

    if (isset($_SESSION['user'])) {
        header('Location: welcome.php');
        exit;
    }
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home</title>
</head>
<body>
    <h1>Please login or sign up to continue</h1>
    <div>
        <a href="pages/login.php
