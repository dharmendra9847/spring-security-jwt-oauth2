<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard | BrandName</title>
    <style>
        /* CSS Reset & Variables (Matching previous design) */
        :root {
            --primary-color: #2563eb;
            --admin-color: #047857; /* Distinct admin color */
            --admin-hover: #065f46;
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
            background-color: #111827; /* Darker sidebar for admin feel */
            color: var(--white);
            display: flex;
            flex-direction: column;
            transition: all 0.3s;
        }

        .sidebar-header {
            padding: 1.5rem;
            font-size: 1.5rem;
            font-weight: bold;
            border-bottom: 1px solid #374151;
            text-align: center;
            color: var(--admin-color);
        }

        .sidebar-menu {
            list-style: none;
            padding: 1rem 0;
            flex-grow: 1;
        }

        .sidebar-menu li a {
            display: flex;
            align-items: center;
            padding: 1rem 1.5rem;
            color: #d1d5db;
            text-decoration: none;
            transition: background 0.2s, color 0.2s;
            gap: 10px;
        }

        .sidebar-menu li a:hover, .sidebar-menu li a.active {
            background-color: #374151;
            color: var(--white);
            border-left: 4px solid var(--admin-color);
        }

        .logout-btn {
            padding: 1rem 1.5rem;
            background-color: #991b1b;
            color: white;
            text-decoration: none;
            text-align: center;
            transition: background 0.3s;
        }

        .logout-btn:hover {
            background-color: #7f1d1d;
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
            justify-content: space-between;
            align-items: center;
            box-shadow: 0 1px 3px rgba(0,0,0,0.1);
        }

        .search-bar {
            padding: 0.5rem 1rem;
            border: 1px solid var(--border-color);
            border-radius: 0.375rem;
            width: 300px;
            outline: none;
        }

        .search-bar:focus {
            border-color: var(--admin-color);
        }

        .admin-profile {
            display: flex;
            align-items: center;
            gap: 10px;
            font-weight: 600;
        }

        /* Dashboard Content */
        .dashboard-container {
            padding: 2rem;
            flex-grow: 1;
        }

        .page-title {
            margin-bottom: 2rem;
            font-size: 1.8rem;
            color: var(--text-dark);
        }

        /* Stats Grid */
        .stats-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 1.5rem;
            margin-bottom: 2.5rem;
        }

        .stat-card {
            background-color: var(--white);
            padding: 1.5rem;
            border-radius: 0.5rem;
            box-shadow: 0 1px 3px rgba(0,0,0,0.1);
            border-top: 4px solid var(--admin-color);
        }

        .stat-card h3 {
            font-size: 0.875rem;
            color: var(--text-light);
            text-transform: uppercase;
            letter-spacing: 0.05em;
        }

        .stat-card .number {
            font-size: 2rem;
            font-weight: bold;
            color: var(--text-dark);
            margin-top: 0.5rem;
        }

        /* Data Table */
        .table-container {
            background-color: var(--white);
            border-radius: 0.5rem;
            box-shadow: 0 1px 3px rgba(0,0,0,0.1);
            overflow: hidden;
        }

        .table-header {
            padding: 1.5rem;
            border-bottom: 1px solid var(--border-color);
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .btn-action {
            background-color: var(--admin-color);
            color: var(--white);
            padding: 0.5rem 1rem;
            border-radius: 0.375rem;
            text-decoration: none;
            font-size: 0.875rem;
        }

        .btn-action:hover {
            background-color: var(--admin-hover);
        }

        table {
            width: 100%;
            border-collapse: collapse;
            text-align: left;
        }

        th, td {
            padding: 1rem 1.5rem;
            border-bottom: 1px solid var(--border-color);
        }

        th {
            background-color: #f9fafb;
            font-weight: 600;
            color: var(--text-light);
        }

        tr:hover {
            background-color: #f9fafb;
        }

        .status {
            padding: 0.25rem 0.75rem;
            border-radius: 9999px;
            font-size: 0.75rem;
            font-weight: bold;
        }

        .status.active {
            background-color: #d1fae5;
            color: #065f46;
        }

        .status.pending {
            background-color: #fef3c7;
            color: #92400e;
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            body {
                flex-direction: column;
            }
            .sidebar {
                width: 100%;
                height: auto;
            }
            .sidebar-menu {
                display: flex;
                flex-wrap: wrap;
                justify-content: center;
            }
            .sidebar-menu li a {
                padding: 0.5rem 1rem;
                border-left: none;
                border-bottom: 2px solid transparent;
            }
            .sidebar-menu li a:hover, .sidebar-menu li a.active {
                border-left: none;
                border-bottom: 2px solid var(--admin-color);
            }
            .search-bar {
                width: 150px;
            }
            .table-container {
                overflow-x: auto;
            }
        }
    </style>
</head>
<body>

    <aside class="sidebar">
        <div class="sidebar-header">
            BrandName Admin
        </div>
        <ul class="sidebar-menu">
            <li><a href="${pageContext.request.contextPath}/test/admin" class="active">Dashboard</a></li>
            <li><a href="${pageContext.request.contextPath}/test/admin">Manage Users</a></li>
            <li><a href="${pageContext.request.contextPath}/test/admin">Subscriptions</a></li>
            <li><a href="${pageContext.request.contextPath}/test/admin">Analytics</a></li>
            <li><a href="${pageContext.request.contextPath}/test/admin">Settings</a></li>
        </ul>
        <a href="../index.html" class="logout-btn">ðª Logout to Public</a>
    </aside>

    <main class="main-content">

        <header class="top-header">
            <input type="text" class="search-bar" placeholder="Search users, IDs, or settings...">
            <div class="admin-profile">
                <span>Admin User</span>
                <div style="width: 35px; height: 35px; background: var(--admin-color); border-radius: 50%; color: white; display: flex; align-items: center; justify-content: center;">A</div>
            </div>
        </header>

        <div class="dashboard-container">
            <h1 class="page-title">Dashboard Overview</h1>

            <div class="stats-grid">
                <div class="stat-card">
                    <h3>Total Users</h3>
                    <div class="number">12,543</div>
                </div>
                <div class="stat-card">
                    <h3>Active Subscriptions</h3>
                    <div class="number">8,921</div>
                </div>
                <div class="stat-card">
                    <h3>Monthly Revenue</h3>
                    <div class="number">$45,200</div>
                </div>
                <div class="stat-card">
                    <h3>Pending Tickets</h3>
                    <div class="number">14</div>
                </div>
            </div>

            <div class="table-container">
                <div class="table-header">
                    <h2>Recent User Activity</h2>
                    <a href="#" class="btn-action">View All Users</a>
                </div>
                <table>
                    <thead>
                        <tr>
                            <th>User ID</th>
                            <th>Name</th>
                            <th>Email</th>
                            <th>Registration Date</th>
                            <th>Status</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>#10045</td>
                            <td>Jane Doe</td>
                            <td>jane.doe@example.com</td>
                            <td>Oct 24, 2026</td>
                            <td><span class="status active">Active</span></td>
                        </tr>
                        <tr>
                            <td>#10046</td>
                            <td>John Smith</td>
                            <td>john.smith@example.com</td>
                            <td>Oct 24, 2026</td>
                            <td><span class="status pending">Pending</span></td>
                        </tr>
                        <tr>
                            <td>#10047</td>
                            <td>Alice Johnson</td>
                            <td>alice.j@example.com</td>
                            <td>Oct 23, 2026</td>
                            <td><span class="status active">Active</span></td>
                        </tr>
                        <tr>
                            <td>#10048</td>
                            <td>Bob Williams</td>
                            <td>bob.w@example.com</td>
                            <td>Oct 22, 2026</td>
                            <td><span class="status active">Active</span></td>
                        </tr>
                    </tbody>
                </table>
            </div>

        </div>
    </main>

</body>
</html>