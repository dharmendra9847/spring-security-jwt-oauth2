<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Admin Dashboard — DK Portfolio</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link href="https://fonts.googleapis.com/css2?family=Syne:wght@400;600;700;800&family=DM+Sans:opsz,wght@9..40,300;9..40,400;9..40,500;9..40,600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/portfolio-theme.css">
</head>
<body class="pk-admin-body">
<div class="pk-admin-wrap">

    <%-- ═══ SIDEBAR ═══ --%>
    <aside class="pk-sidebar">
        <a href="${pageContext.request.contextPath}/admin/home" class="pk-sidebar-logo">Admin<span>.</span></a>
        <div class="pk-sidebar-user">
            <div class="pk-sidebar-avatar">DK</div>
            <div>
                <h5>Dharmendra Kumar</h5>
                <span>Administrator</span>
            </div>
        </div>
        <nav class="pk-sidebar-nav">
            <ul>
                <li class="pk-active">
                    <a href="${pageContext.request.contextPath}/admin/home">
                        <span class="nav-ic">🏠</span> Dashboard
                    </a>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath}/admin/readAllContacts">
                        <span class="nav-ic">📬</span> Contacts
                    </a>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath}/admin/addService">
                        <span class="nav-ic">➕</span> Add Service
                    </a>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath}/admin/readAllServices">
                        <span class="nav-ic">🛠</span> All Services
                    </a>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath}/admin/uploadResume">
                        <span class="nav-ic">📄</span> Resume
                    </a>
                </li>
                <hr class="pk-sidebar-divider">
                <li>
                    <a href="${pageContext.request.contextPath}/client/home">
                        <span class="nav-ic">←</span> Back to Site
                    </a>
                </li>
            </ul>
        </nav>
        <div class="pk-sidebar-footer">
            <p>DK Portfolio v1.0<br>Spring Boot 4.0</p>
        </div>
    </aside>

    <%-- ═══ MAIN CONTENT ═══ --%>
    <main class="pk-admin-main">

        <div class="pk-admin-topbar">
            <div>
                <h1>Dashboard</h1>
                <p class="pk-topbar-sub" id="dash-date">Welcome back, Dharmendra!</p>
            </div>
            <div class="pk-topbar-right">
                <a href="${pageContext.request.contextPath}/admin/addService" class="pk-btn pk-btn-primary pk-btn-sm">+ Add Service</a>
            </div>
        </div>

        <%-- ── STAT CARDS ── --%>
        <div class="pk-stat-cards">
            <div class="pk-stat-card">
                <div class="pk-stat-card-icon purple">📬</div>
                <div class="snum">—</div>
                <div class="slabel">Contact Messages</div>
            </div>
            <div class="pk-stat-card">
                <div class="pk-stat-card-icon teal">🛠</div>
                <div class="snum">—</div>
                <div class="slabel">Active Services</div>
            </div>
            <div class="pk-stat-card">
                <div class="pk-stat-card-icon gold">📄</div>
                <div class="snum">—</div>
                <div class="slabel">Resume Status</div>
            </div>
            <div class="pk-stat-card">
                <div class="pk-stat-card-icon red">👁</div>
                <div class="snum" data-target="1247">0</div>
                <div class="slabel">Portfolio Views</div>
            </div>
        </div>

        <%-- ── QUICK LINKS ── --%>
        <div style="display:grid;grid-template-columns:repeat(4,1fr);gap:16px;margin-bottom:32px;">
            <a href="${pageContext.request.contextPath}/admin/readAllContacts"
               style="background:var(--card);border:1px solid var(--border);border-radius:var(--radius-lg);padding:24px;text-align:center;transition:all .2s;display:block;"
               onmouseover="this.style.borderColor='var(--border2)'" onmouseout="this.style.borderColor='var(--border)'">
                <div style="font-size:28px;margin-bottom:10px;">📬</div>
                <div style="font-family:var(--syne);font-weight:700;font-size:14px;color:var(--white);">View Contacts</div>
            </a>
            <a href="${pageContext.request.contextPath}/admin/addService"
               style="background:var(--card);border:1px solid var(--border);border-radius:var(--radius-lg);padding:24px;text-align:center;transition:all .2s;display:block;"
               onmouseover="this.style.borderColor='var(--border2)'" onmouseout="this.style.borderColor='var(--border)'">
                <div style="font-size:28px;margin-bottom:10px;">➕</div>
                <div style="font-family:var(--syne);font-weight:700;font-size:14px;color:var(--white);">Add Service</div>
            </a>
            <a href="${pageContext.request.contextPath}/admin/readAllServices"
               style="background:var(--card);border:1px solid var(--border);border-radius:var(--radius-lg);padding:24px;text-align:center;transition:all .2s;display:block;"
               onmouseover="this.style.borderColor='var(--border2)'" onmouseout="this.style.borderColor='var(--border)'">
                <div style="font-size:28px;margin-bottom:10px;">🛠</div>
                <div style="font-family:var(--syne);font-weight:700;font-size:14px;color:var(--white);">All Services</div>
            </a>
            <a href="${pageContext.request.contextPath}/admin/uploadResume"
               style="background:var(--card);border:1px solid var(--border);border-radius:var(--radius-lg);padding:24px;text-align:center;transition:all .2s;display:block;"
               onmouseover="this.style.borderColor='var(--border2)'" onmouseout="this.style.borderColor='var(--border)'">
                <div style="font-size:28px;margin-bottom:10px;">📄</div>
                <div style="font-family:var(--syne);font-weight:700;font-size:14px;color:var(--white);">Upload Resume</div>
            </a>
        </div>

        <%-- ── INFO BANNER ── --%>
        <div style="background:linear-gradient(135deg,rgba(108,99,255,.15),rgba(0,212,170,.08));border:1px solid var(--border2);border-radius:var(--radius-lg);padding:32px 36px;display:flex;justify-content:space-between;align-items:center;flex-wrap:wrap;gap:20px;">
            <div>
                <h3 style="font-size:20px;margin-bottom:6px;">Welcome to your Admin Panel 👋</h3>
                <p style="color:var(--muted);font-size:14px;">Manage your portfolio content, contacts, and resume from here.</p>
            </div>
            <a href="${pageContext.request.contextPath}/client/home" class="pk-btn pk-btn-primary pk-btn-sm">View Portfolio →</a>
        </div>

    </main>
</div>

<script>
document.getElementById('dash-date').textContent =
    'Today — ' + new Date().toLocaleDateString('en-IN',{weekday:'long',year:'numeric',month:'long',day:'numeric'});
// animate counter
(function(){
  var el=document.querySelector('[data-target]');
  if(!el) return;
  var t=parseInt(el.dataset.target),s=null;
  function step(ts){if(!s)s=ts;var p=Math.min((ts-s)/1500,1),e=1-Math.pow(1-p,3);el.textContent=Math.floor(e*t);if(p<1)requestAnimationFrame(step);else el.textContent=t;}
  requestAnimationFrame(step);
})();
</script>
</body>
</html>
