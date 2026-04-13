<%-- ============================================================
     header.jsp  —  src/main/webapp/WEB-INF/views/header.jsp
     ============================================================ --%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link href="https://fonts.googleapis.com/css2?family=Syne:wght@400;600;700;800&family=DM+Sans:ital,opsz,wght@0,9..40,300;0,9..40,400;0,9..40,500;0,9..40,600;1,9..40,300&display=swap" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/portfolio-theme.css">

<header class="pk-header" id="pk-header">
    <div class="container">
        <div class="pk-nav-inner">
            <!-- Logo -->
            <a href="${pageContext.request.contextPath}/client/home" class="pk-logo">DK<span>.</span></a>

            <!-- Desktop nav links -->
            <ul class="pk-nav-links">
                <li><a href="${pageContext.request.contextPath}/client/home">Home</a></li>
                <li><a href="${pageContext.request.contextPath}/client/about">About</a></li>
                <li><a href="${pageContext.request.contextPath}/client/services">Services</a></li>
                <li><a href="${pageContext.request.contextPath}/client/contact">Contact</a></li>
            </ul>

            <!-- CTA buttons -->
            <div class="pk-nav-actions">
                <a href="${pageContext.request.contextPath}/admin/home" class="pk-btn pk-btn-ghost pk-btn-sm">⚙ Admin</a>
                <a href="${pageContext.request.contextPath}/client/contact" class="pk-btn pk-btn-primary pk-btn-sm">Hire Me</a>
                <form action="${pageContext.request.contextPath}/doLogout" method="POST" style="display:inline;margin:0;">
                    <button type="submit" class="pk-btn pk-btn-ghost pk-btn-sm" style="cursor:pointer;">🚪 Logout</button>
                </form>
                <button class="pk-nav-hamburger" id="pk-hamburger" aria-label="Menu">☰</button>
            </div>
        </div>
    </div>

    <!-- Mobile dropdown -->
    <div class="pk-mobile-menu" id="pk-mobile-menu">
        <a href="${pageContext.request.contextPath}/client/home">Home</a>
        <a href="${pageContext.request.contextPath}/client/about">About</a>
        <a href="${pageContext.request.contextPath}/client/services">Services</a>
        <a href="${pageContext.request.contextPath}/client/contact">Contact</a>
        <a href="${pageContext.request.contextPath}/admin/home">Admin Panel</a>
        <form action="${pageContext.request.contextPath}/doLogout" method="POST" style="margin:0;">
            <button type="submit" style="background:none;border:none;color:inherit;font-size:inherit;padding:12px 20px;width:100%;text-align:left;cursor:pointer;">🚪 Logout</button>
        </form>
    </div>
</header>
