<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Member Dashboard | BrandName</title>
    <style>
        /* CSS Reset & Variables */
        :root {
            --primary-color: #2563eb;
            --primary-hover: #1d4ed8;
            --primary-light: #eff6ff; /* Light blue for active states */
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
            min-height: 100vh;
        }

        /* Sidebar Navigation */
        .sidebar {
            width: 260px;
            background-color: var(--white);
            border-right: 1px solid var(--border-color);
            display: flex;
            flex-direction: column;
            transition: all 0.3s;
        }

        .sidebar-header {
            padding: 1.5rem;
            font-size: 1.5rem;
            font-weight: bold;
            border-bottom: 1px solid var(--border-color);
            color: var(--primary-color);
            text-align: center;
        }

        .sidebar-menu {
            list-style: none;
            padding: 1.5rem 0;
            flex-grow: 1;
        }

        .sidebar-menu li {
            margin-bottom: 0.5rem;
            padding: 0 1rem;
        }

        .sidebar-menu li a {
            display: flex;
            align-items: center;
            padding: 0.75rem 1rem;
            color: var(--text-dark);
            text-decoration: none;
            border-radius: 0.5rem;
            font-weight: 500;
            transition: all 0.2s;
            gap: 12px;
        }

        .sidebar-menu li a:hover {
            background-color: #f9fafb;
            color: var(--primary-color);
        }

        .sidebar-menu li a.active {
            background-color: var(--primary-light);
            color: var(--primary-color);
        }

        .logout-container {
            padding: 1.5rem;
            border-top: 1px solid var(--border-color);
        }

        .logout-btn {
            display: block;
            width: 100%;
            padding: 0.75rem;
            background-color: transparent;
            color: var(--text-light);
            border: 1px solid var(--border-color);
            border-radius: 0.5rem;
            text-align: center;
            text-decoration: none;
            font-weight: 600;
            transition: all 0.3s;
        }

        .logout-btn:hover {
            background-color: #fef2f2;
            color: #ef4444;
            border-color: #ef4444;
        }

        /* Main Content Area */
        .main-content {
            flex-grow: 1;
            display: flex;
            flex-direction: column;
            overflow-x: hidden;
        }

        /* Top Header */
        .top-header {
            background-color: var(--white);
            padding: 1rem 2rem;
            display: flex;
            justify-content: flex-end;
            align-items: center;
            box-shadow: 0 1px 2px rgba(0,0,0,0.05);
            border-bottom: 1px solid var(--border-color);
        }

        .member-profile {
            display: flex;
            align-items: center;
            gap: 12px;
            cursor: pointer;
        }

        .member-info {
            text-align: right;
        }

        .member-name {
            font-weight: 600;
            font-size: 0.875rem;
        }

        .member-plan {
            font-size: 0.75rem;
            color: var(--primary-color);
            font-weight: bold;
        }

        .avatar {
            width: 40px;
            height: 40px;
            background: linear-gradient(135deg, var(--primary-light), var(--primary-color));
            border-radius: 50%;
            color: white;
            display: flex;
            align-items: center;
            justify-content: center;
            font-weight: bold;
        }

        /* Dashboard Content */
        .dashboard-container {
            padding: 2rem;
            flex-grow: 1;
            max-width: 1200px;
            margin: 0 auto;
            width: 100%;
        }

        /* Welcome Banner */
        .welcome-banner {
            background: linear-gradient(to right, #1e3a8a, var(--primary-color));
            color: var(--white);
            padding: 2rem;
            border-radius: 1rem;
            margin-bottom: 2rem;
            box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1);
        }

        .welcome-banner h1 {
            font-size: 2rem;
            margin-bottom: 0.5rem;
        }

        .welcome-banner p {
            opacity: 0.9;
        }

        /* Stats Grid */
        .stats-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 1.5rem;
            margin-bottom: 2.5rem;
        }

        .stat-card {
            background-color: var(--white);
            padding: 1.5rem;
            border-radius: 0.75rem;
            box-shadow: 0 1px 3px rgba(0,0,0,0.1);
            border: 1px solid var(--border-color);
        }

        .stat-card h3 {
            font-size: 0.875rem;
            color: var(--text-light);
            margin-bottom: 0.5rem;
        }

        .stat-card .number {
            font-size: 1.75rem;
            font-weight: bold;
            color: var(--text-dark);
        }

        /* Content Sections */
        .section-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 1.5rem;
        }

        .section-header h2 {
            font-size: 1.25rem;
            color: var(--text-dark);
        }

        .view-all {
            color: var(--primary-color);
            text-decoration: none;
            font-weight: 500;
            font-size: 0.875rem;
        }

        .view-all:hover {
            text-decoration: underline;
        }

        /* Cards Grid */
        .cards-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 1.5rem;
        }

        .content-card {
            background: var(--white);
            border-radius: 0.75rem;
            overflow: hidden;
            border: 1px solid var(--border-color);
            transition: transform 0.2s, box-shadow 0.2s;
        }

        .content-card:hover {
            transform: translateY(-3px);
            box-shadow: 0 10px 15px -3px rgba(0, 0, 0, 0.1);
        }

        .card-img {
            height: 140px;
            background-color: #e5e7eb;
            display: flex;
            align-items: center;
            justify-content: center;
            color: var(--text-light);
            font-size: 2rem;
        }

        .card-body {
            padding: 1.5rem;
        }

        .card-tag {
            display: inline-block;
            padding: 0.25rem 0.75rem;
            background-color: var(--primary-light);
            color: var(--primary-color);
            border-radius: 9999px;
            font-size: 0.75rem;
            font-weight: bold;
            margin-bottom: 0.75rem;
        }

        .card-body h3 {
            font-size: 1.125rem;
            margin-bottom: 0.5rem;
        }

        .card-body p {
            color: var(--text-light);
            font-size: 0.875rem;
            margin-bottom: 1.25rem;
        }

        .btn-outline {
            display: inline-block;
            width: 100%;
            padding: 0.5rem 1rem;
            border: 1px solid var(--primary-color);
            color: var(--primary-color);
            background: transparent;
            border-radius: 0.375rem;
            text-align: center;
            text-decoration: none;
            font-weight: 600;
            transition: all 0.3s;
        }

        .btn-outline:hover {
            background: var(--primary-color);
            color: var(--white);
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            body {
                flex-direction: column;
            }
            .sidebar {
                width: 100%;
                height: auto;
                border-right: none;
                border-bottom: 1px solid var(--border-color);
            }
            .sidebar-menu {
                display: flex;
                flex-wrap: wrap;
                justify-content: center;
                padding: 1rem;
            }
            .sidebar-menu li {
                margin-bottom: 0;
            }
            .welcome-banner {
                padding: 1.5rem;
            }
            .welcome-banner h1 {
                font-size: 1.5rem;
            }
        }
    </style>
</head>
<body>

    <aside class="sidebar">
        <div class="sidebar-header">
            BrandName
        </div>
        <ul class="sidebar-menu">
            <li><a href="#" class="active">Dashboard</a></li>
            <li><a href="#">My Library</a></li>
            <li><a href="#">Favorites</a></li>
            <li><a href="#">Billing & Plan</a></li>
            <li><a href="#">Account Settings</a></li>
        </ul>
        <div class="logout-container">
            <a href="${pageContext.request.contextPath}/test/myLogout" class="logout-btn">Log Out</a>
        </div>
    </aside>

    <main class="main-content">

        <header class="top-header">
            <div class="member-profile">
                <div class="member-info">
                    <div class="member-name">Alex Johnson</div>
                    <div class="member-plan">PRO MEMBER</div>
                </div>
                <div class="avatar">AJ</div>
            </div>
        </header>

        <div class="dashboard-container">

            <div class="welcome-banner">
                <h1>Welcome back, Alex!</h1>
                <p>You have 2 new notifications and 1 course ready to resume.</p>
            </div>

            <div class="stats-grid">
                <div class="stat-card">
                    <h3>Current Plan</h3>
                    <div class="number">Pro Tier</div>
                </div>
                <div class="stat-card">
                    <h3>Items Saved</h3>
                    <div class="number">24</div>
                </div>
                <div class="stat-card">
                    <h3>Days Active</h3>
                    <div class="number">142</div>
                </div>
            </div>

            <div class="section-header">
                <h2>Jump Back In</h2>
                <a href="#" class="view-all">View Library &rarr;</a>
            </div>

            <div class="cards-grid">
                <div class="content-card">
                    <div class="card-img"></div>
                    <div class="card-body">
                        <span class="card-tag">Video Series</span>
                        <h3>Advanced Techniques 101</h3>
                        <p>You left off at Episode 3. Continue to master the advanced fundamentals.</p>
                        <a href="#" class="btn-outline">Resume Module</a>
                    </div>
                </div>

                <div class="content-card">
                    <div class="card-img"></div>
                    <div class="card-body">
                        <span class="card-tag">Resource</span>
                        <h3>Ultimate Growth Checklist</h3>
                        <p>Your saved template for scaling your operations securely and efficiently.</p>
                        <a href="#" class="btn-outline">Download Resource</a>
                    </div>
                </div>

                <div class="content-card">
                    <div class="card-img"></div>
                    <div class="card-body">
                        <span class="card-tag">Premium Exclusive</span>
                        <h3>Weekly Q&A Recording</h3>
                        <p>Catch up on this week's live session covering community questions.</p>
                        <a href="#" class="btn-outline">Watch Now</a>
                    </div>
                </div>
            </div>

        </div>
    </main>

</body>
</html>