<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Logged Out</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/logout.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
</head>
<body>
    <div class="logout-card">
        <div class="icon-circle">
            <i class="fas fa-check"></i>
        </div>
        <h1>Successfully Logged Out</h1>
        <p>Thank you for using our service. You have been safely signed out of your account.</p>
        
        <div class="redirect-box">
            Redirecting to Login in <span id="countdown">5</span> seconds...
        </div>

        <div class="action-buttons">
            <a href="${pageContext.request.contextPath}/client/login" class="btn btn-primary">Login Again</a>
            <a href="${pageContext.request.contextPath}/client/home" class="btn btn-link">Back to Home</a>
        </div>
    </div>

    <script>
        // Simple countdown logic
        let seconds = 5;
        const display = document.getElementById('countdown');
        setInterval(() => {
            seconds--;
            if (seconds >= 0) display.textContent = seconds;
            if (seconds === 0) window.location.href = '${pageContext.request.contextPath}/client/login';
        }, 1000);
    </script>
</body>
</html>