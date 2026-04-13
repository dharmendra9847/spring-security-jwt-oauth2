<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Access Denied | BrandName</title>
    <style>
        /* CSS Reset & Variables */
        :root {
            --primary-color: #2563eb;
            --primary-hover: #1d4ed8;
            --error-color: #dc2626;
            --error-light: #fef2f2;
            --text-dark: #1f2937;
            --text-light: #6b7280;
            --bg-color: #f3f4f6;
            --white: #ffffff;
            --border-color: #e5e7eb;
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

        /* Error Container */
        .error-container {
            width: 100%;
            max-width: 480px;
            text-align: center;
        }

        .brand-header {
            margin-bottom: 2rem;
        }

        .brand-logo {
            font-size: 1.5rem;
            font-weight: bold;
            color: var(--text-light);
            text-decoration: none;
            letter-spacing: 0.05em;
            text-transform: uppercase;
        }

        /* Error Card */
        .error-card {
            background-color: var(--white);
            padding: 3rem 2.5rem;
            border-radius: 1rem;
            box-shadow: 0 10px 15px -3px rgba(0, 0, 0, 0.1), 0 4px 6px -2px rgba(0, 0, 0, 0.05);
            border: 1px solid var(--border-color);
            border-top: 5px solid var(--error-color);
        }

        /* Lock Icon */
        .icon-circle {
            width: 80px;
            height: 80px;
            background-color: var(--error-light);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 1.5rem auto;
            font-size: 2.5rem;
            color: var(--error-color);
        }

        .error-code {
            font-size: 4rem;
            font-weight: 800;
            color: var(--text-dark);
            line-height: 1;
            margin-bottom: 0.5rem;
        }

        .error-card h1 {
            font-size: 1.5rem;
            margin-bottom: 1rem;
            color: var(--text-dark);
        }

        .error-card p {
            color: var(--text-light);
            margin-bottom: 2.5rem;
            line-height: 1.6;
        }

        /* Action Buttons */
        .action-buttons {
            display: flex;
            flex-direction: column;
            gap: 1rem;
        }

        .btn {
            display: inline-block;
            width: 100%;
            padding: 0.875rem 1.5rem;
            font-size: 1rem;
            font-weight: 600;
            text-decoration: none;
            border-radius: 0.5rem;
            transition: all 0.3s;
            cursor: pointer;
        }

        .btn-primary {
            background-color: var(--primary-color);
            color: var(--white);
            border: 1px solid var(--primary-color);
        }

        .btn-primary:hover {
            background-color: var(--primary-hover);
            border-color: var(--primary-hover);
        }

        .btn-outline {
            background-color: transparent;
            color: var(--text-dark);
            border: 1px solid var(--border-color);
        }

        .btn-outline:hover {
            background-color: #f9fafb;
            border-color: #d1d5db;
        }

        /* Responsive Design */
        @media (min-width: 480px) {
            .action-buttons {
                flex-direction: row;
            }
        }
    </style>
</head>
<body>

    <div class="error-container">

        <div class="brand-header">
            <a href="${pageContext.request.contextPath}/test/index" class="brand-logo">BrandName</a>
        </div>

        <div class="error-card">
            <div class="icon-circle">ð</div>
            <div class="error-code">403</div>
            <h1>Access Denied</h1>
            <p>You do not have the necessary permissions to view this directory or page. If you believe this is a mistake, please check your credentials or contact the administrator.</p>

            <div class="action-buttons">
                <a href="${pageContext.request.contextPath}/test/index" class="btn btn-outline">Go to Homepage</a>
                <a href="${pageContext.request.contextPath}/test/myLogin" class="btn btn-primary">Sign In Again</a>
            </div>
        </div>

    </div>

</body>
</html>