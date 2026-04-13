<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login | BrandName</title>
    <style>
        /* CSS Reset & Variables */
        :root {
            --primary-color: #2563eb;
            --primary-hover: #1d4ed8;
            --text-dark: #1f2937;
            --text-light: #6b7280;
            --bg-color: #f3f4f6; /* Matching the portal background */
            --white: #ffffff;
            --border-color: #e5e7eb;
            --input-focus: #bfdbfe;
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        body {
            background-color: var(--bg-color);
            color: var(--text-dark);
            display: flex;
            align-items: center;
            justify-content: center;
            min-height: 100vh;
            padding: 1rem;
        }

        /* Authentication Container */
        .auth-container {
            width: 100%;
            max-width: 420px;
        }

        /* Branding Top */
        .brand-header {
            text-align: center;
            margin-bottom: 2rem;
        }

        .brand-logo {
            font-size: 2rem;
            font-weight: bold;
            color: var(--primary-color);
            text-decoration: none;
            display: inline-block;
        }

        /* The Auth Card */
        .auth-card {
            background-color: var(--white);
            padding: 2.5rem 2rem;
            border-radius: 1rem;
            box-shadow: 0 10px 15px -3px rgba(0, 0, 0, 0.1), 0 4px 6px -2px rgba(0, 0, 0, 0.05);
            border: 1px solid var(--border-color);
        }

        .auth-card h2 {
            font-size: 1.5rem;
            margin-bottom: 0.5rem;
            text-align: center;
            color: var(--text-dark);
        }

        .auth-card p.subtitle {
            color: var(--text-light);
            text-align: center;
            margin-bottom: 2rem;
            font-size: 0.875rem;
        }

        /* Form Elements */
        .form-group {
            margin-bottom: 1.25rem;
        }

        .form-group label {
            display: block;
            font-size: 0.875rem;
            font-weight: 500;
            margin-bottom: 0.5rem;
            color: var(--text-dark);
        }

        .form-group input {
            width: 100%;
            padding: 0.75rem 1rem;
            border: 1px solid var(--border-color);
            border-radius: 0.5rem;
            font-size: 1rem;
            transition: border-color 0.2s, box-shadow 0.2s;
            outline: none;
        }

        .form-group input:focus {
            border-color: var(--primary-color);
            box-shadow: 0 0 0 3px var(--input-focus);
        }

        /* Form Utilities (Remember Me & Forgot Password) */
        .form-utils {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 1.5rem;
            font-size: 0.875rem;
        }

        .remember-me {
            display: flex;
            align-items: center;
            gap: 0.5rem;
            cursor: pointer;
        }

        .remember-me input {
            cursor: pointer;
        }

        .forgot-password {
            color: var(--primary-color);
            text-decoration: none;
            font-weight: 500;
        }

        .forgot-password:hover {
            text-decoration: underline;
        }

        /* Buttons */
        .btn-submit {
            width: 100%;
            padding: 0.875rem;
            background-color: var(--primary-color);
            color: var(--white);
            border: none;
            border-radius: 0.5rem;
            font-size: 1rem;
            font-weight: 600;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .btn-submit:hover {
            background-color: var(--primary-hover);
        }

        /* Auth Footer */
        .auth-footer {
            margin-top: 1.5rem;
            text-align: center;
            font-size: 0.875rem;
            color: var(--text-light);
        }

        .auth-footer a {
            color: var(--primary-color);
            text-decoration: none;
            font-weight: 600;
        }

        .auth-footer a:hover {
            text-decoration: underline;
        }

        .back-link {
            display: block;
            text-align: center;
            margin-top: 2rem;
            color: var(--text-light);
            text-decoration: none;
            font-size: 0.875rem;
            transition: color 0.2s;
        }

        .back-link:hover {
            color: var(--text-dark);
        }
    </style>
</head>
<body>

    <div class="auth-container">

        <div class="brand-header">
            <a href="${pageContext.request.contextPath}/test/index" class="brand-logo">BrandName</a>
        </div>

        <div class="auth-card">
            <h2>Welcome Back</h2>
            <p class="subtitle">Please enter your details to sign in.</p>

            <form action="/doLogin" method="POST">

                <div class="form-group">
                    <label for="email">Email Address</label>
                    <input type="email" id="email" name="email" placeholder="you@example.com" required>
                </div>

                <div class="form-group">
                    <label for="password">Password</label>
                    <input type="password" id="password" name="pass" placeholder="enter password" required>
                </div>

                <div class="form-utils">
                    <label class="remember-me">
                        <input type="checkbox" name="remember">
                        Remember me
                    </label>
                    <a href="${pageContext.request.contextPath}/test/index" class="forgot-password">Forgot password?</a>
                </div>

                <button type="submit" class="btn-submit">Sign In</button>
            </form>

            <div class="auth-footer">
                Don't have an account? <a href="${pageContext.request.contextPath}/test/index">Sign up here</a>
            </div>
        </div>

        <a href="index.html" class="back-link">&larr; Back to Home</a>

    </div>

</body>
</html>