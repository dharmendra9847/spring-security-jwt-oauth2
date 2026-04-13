<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Welcome | Public Index</title>
    <style>
        /* CSS Reset & Variables */
        :root {
            --primary-color: #2563eb;
            --primary-hover: #1d4ed8;
            --admin-color: #047857; /* distinct color for admin */
            --admin-hover: #065f46;
            --text-dark: #1f2937;
            --text-light: #6b7280;
            --bg-color: #f9fafb;
            --white: #ffffff;
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
            line-height: 1.6;
        }

        /* Navigation */
        header {
            background-color: var(--white);
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
            position: sticky;
            top: 0;
            z-index: 1000;
        }

        nav {
            max-width: 1200px;
            margin: 0 auto;
            padding: 1rem 2rem;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .logo {
            font-size: 1.5rem;
            font-weight: bold;
            color: var(--primary-color);
            text-decoration: none;
        }

        .nav-center {
            display: flex;
            gap: 2rem;
            list-style: none;
        }

        .nav-center a {
            text-decoration: none;
            color: var(--text-dark);
            font-weight: 500;
            transition: color 0.3s;
        }

        .nav-center a:hover {
            color: var(--primary-color);
        }

        /* Auth Buttons in Nav */
        .nav-auth {
            display: flex;
            gap: 1rem;
        }

        .nav-btn {
            padding: 0.5rem 1rem;
            border-radius: 0.375rem;
            text-decoration: none;
            font-weight: 600;
            font-size: 0.875rem;
            transition: all 0.3s;
        }

        .nav-member {
            color: var(--primary-color);
            border: 1px solid var(--primary-color);
            background: transparent;
        }

        .nav-member:hover {
            background: var(--primary-color);
            color: var(--white);
        }

        .nav-admin {
            color: var(--white);
            background: var(--admin-color);
        }

        .nav-admin:hover {
            background: var(--admin-hover);
        }

        /* Hero Section */
        .hero {
            max-width: 1200px;
            margin: 0 auto;
            padding: 6rem 2rem;
            text-align: center;
        }

        .hero h1 {
            font-size: 3.5rem;
            line-height: 1.2;
            margin-bottom: 1.5rem;
            color: var(--text-dark);
        }

        .hero p {
            font-size: 1.25rem;
            color: var(--text-light);
            max-width: 600px;
            margin: 0 auto 2.5rem auto;
        }

        .btn {
            display: inline-block;
            padding: 0.875rem 2rem;
            font-size: 1.125rem;
            font-weight: 600;
            text-decoration: none;
            border-radius: 0.5rem;
            transition: background-color 0.3s;
        }

        .btn-primary {
            background-color: var(--primary-color);
            color: var(--white);
        }

        .btn-primary:hover {
            background-color: var(--primary-hover);
        }

        /* Portals Section (Member/Admin) */
        .portals {
            background-color: #f3f4f6;
            padding: 4rem 2rem;
        }

        .section-title {
            text-align: center;
            margin-bottom: 3rem;
            font-size: 2rem;
        }

        .portal-container {
            max-width: 900px;
            margin: 0 auto;
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 2rem;
        }

        .portal-card {
            background: var(--white);
            padding: 2.5rem 2rem;
            border-radius: 0.75rem;
            box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1);
            text-align: center;
        }

        .portal-card h3 {
            font-size: 1.5rem;
            margin-bottom: 1rem;
        }

        .portal-card p {
            color: var(--text-light);
            margin-bottom: 2rem;
        }

        .btn-member-login {
            background-color: var(--primary-color);
            color: var(--white);
            display: block;
            width: 100%;
        }

        .btn-admin-login {
            background-color: var(--admin-color);
            color: var(--white);
            display: block;
            width: 100%;
        }

        /* Features Section */
        .features {
            background-color: var(--white);
            padding: 5rem 2rem;
        }

        .features-container {
            max-width: 1200px;
            margin: 0 auto;
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 2rem;
        }

        .feature-card {
            padding: 2rem;
            border-radius: 0.5rem;
            border: 1px solid #e5e7eb;
            text-align: center;
            transition: transform 0.3s, box-shadow 0.3s;
        }

        .feature-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 15px -3px rgba(0, 0, 0, 0.1);
        }

        .feature-icon {
            font-size: 2.5rem;
            margin-bottom: 1rem;
        }

        /* Footer */
        footer {
            background-color: var(--text-dark);
            color: var(--white);
            text-align: center;
            padding: 2rem;
            margin-top: auto;
        }

        footer p {
            opacity: 0.8;
            font-size: 0.875rem;
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            nav {
                flex-direction: column;
                gap: 1rem;
            }
            .nav-center {
                flex-wrap: wrap;
                justify-content: center;
            }
            .hero h1 {
                font-size: 2.5rem;
            }
        }
    </style>
</head>
<body>

    <header>
        <nav>
            <a href="${pageContext.request.contextPath}/test/index" class="logo">BrandName</a>

            <ul class="nav-center">
                <li><a href="${pageContext.request.contextPath}/test/index">Home</a></li>
                <li><a href="${pageContext.request.contextPath}/test/features">Features</a></li>
                <li><a href="${pageContext.request.contextPath}/test/about">About</a></li>
            </ul>

            <div class="nav-auth">
                <a href="${pageContext.request.contextPath}/test/member" class="nav-btn nav-member">Member Login</a>
                <a href="${pageContext.request.contextPath}/test/admin" class="nav-btn nav-admin">Admin Portal</a>
            </div>
        </nav>
    </header>

    <section id="home" class="hero">
        <h1>Welcome to Our Platform</h1>
        <p>Discover a better way to connect, create, and grow. Join thousands of users who are already building the future with us today.</p>
        <div>
            <a href="#register" class="btn btn-primary">Create Public Account</a>
        </div>
    </section>

    <section id="portals" class="portals">
        <h2 class="section-title">Access Your Account</h2>
        <div class="portal-container">
            <div class="portal-card">
                <h3>Members</h3>
                <p>Access your personal dashboard, manage your subscriptions, and view your private content.</p>
                <a href="${pageContext.request.contextPath}/test/member" class="btn btn-member-login">Go to Member Dashboard</a>
            </div>

            <div class="portal-card">
                <h3>Administrators</h3>
                <p>Manage users, oversee system analytics, and configure platform-wide settings securely.</p>
                <a href="${pageContext.request.contextPath}/test/admin" class="btn btn-admin-login">Go to Control Panel</a>
            </div>
        </div>
    </section>

    <section id="features" class="features">
        <div class="features-container">
            <div class="feature-card">
                <div class="feature-icon"></div>
                <h3>Lightning Fast</h3>
                <p>Experience unparalleled speed and performance. Our platform is optimized to deliver results instantly.</p>
            </div>
            <div class="feature-card">
                <div class="feature-icon"></div>
                <h3>Secure by Design</h3>
                <p>Your data is safe with us. We utilize industry-leading encryption and security protocols to protect you.</p>
            </div>
            <div class="feature-card">
                <div class="feature-icon"></div>
                <h3>Intuitive Interface</h3>
                <p>No learning curve required. Navigate our platform effortlessly with our clean and user-friendly design.</p>
            </div>
        </div>
    </section>

    <footer>
        <p>&copy; 2026 BrandName. All rights reserved.</p>
    </footer>

</body>
</html>