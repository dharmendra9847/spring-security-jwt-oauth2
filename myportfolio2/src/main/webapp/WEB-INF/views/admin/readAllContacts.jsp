<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>All Contacts — Admin</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link href="https://fonts.googleapis.com/css2?family=Syne:wght@400;600;700;800&family=DM+Sans:opsz,wght@9..40,300;9..40,400;9..40,500;9..40,600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/portfolio-theme.css">
</head>
<body class="pk-admin-body">
<div class="pk-admin-wrap">

    <%-- SIDEBAR --%>
    <aside class="pk-sidebar">
        <a href="${pageContext.request.contextPath}/admin/home" class="pk-sidebar-logo">Admin<span>.</span></a>
        <div class="pk-sidebar-user">
            <div class="pk-sidebar-avatar">DK</div>
            <div><h5>Dharmendra Kumar</h5><span>Administrator</span></div>
        </div>
        <nav class="pk-sidebar-nav"><ul>
            <li><a href="${pageContext.request.contextPath}/admin/home"><span class="nav-ic">🏠</span> Dashboard</a></li>
            <li class="pk-active"><a href="${pageContext.request.contextPath}/admin/readAllContacts"><span class="nav-ic">📬</span> Contacts</a></li>
            <li><a href="${pageContext.request.contextPath}/admin/addService"><span class="nav-ic">➕</span> Add Service</a></li>
            <li><a href="${pageContext.request.contextPath}/admin/readAllServices"><span class="nav-ic">🛠</span> All Services</a></li>
            <li><a href="${pageContext.request.contextPath}/admin/uploadResume"><span class="nav-ic">📄</span> Resume</a></li>
            <hr class="pk-sidebar-divider">
            <li><a href="${pageContext.request.contextPath}/client/home"><span class="nav-ic">←</span> Back to Site</a></li>
        </ul></nav>
    </aside>

    <%-- MAIN --%>
    <main class="pk-admin-main">
        <div class="pk-admin-topbar">
            <div>
                <h1>Contact Messages</h1>
                <p class="pk-topbar-sub">All enquiries submitted through the contact form.</p>
            </div>
        </div>

        <div class="pk-admin-table-card">
            <div class="pk-admin-table-head">
                <h3>All Contacts</h3>
                <span style="color:var(--muted);font-size:14px;">
                    <c:choose>
                        <c:when test="${not empty contactData}">
                            ${fn:length(contactData)} messages
                        </c:when>
                        <c:otherwise>0 messages</c:otherwise>
                    </c:choose>
                </span>
            </div>

            <c:choose>
                <c:when test="${not empty contactData}">
                    <div style="overflow-x:auto;">
                        <table class="pk-admin-table">
                            <thead>
                                <tr>
                                    <th>#</th>
                                    <th>Name</th>
                                    <th>Email</th>
                                    <th>Subject</th>
                                    <th>Message</th>
                                    <th>Date &amp; Time</th>
                                    <th>Status</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="contact" items="${contactData}" varStatus="st">
                                    <tr>
                                        <td style="color:var(--muted);font-size:13px;">${contact.id}</td>
                                        <td><strong>${contact.name}</strong></td>
                                        <td>
                                            <a href="mailto:${contact.email}"
                                               style="color:var(--accent);font-size:13px;">${contact.email}</a>
                                        </td>
                                        <td style="font-weight:500;">${contact.subject}</td>
                                        <td><div class="pk-msg-preview" title="${contact.message}">${contact.message}</div></td>
                                        <td style="color:var(--muted);font-size:13px;white-space:nowrap;">${contact.datetime}</td>
                                        <td><span class="pk-status-badge pk-status-new">New</span></td>
                                        <td>
                                            <div class="pk-actions-cell">
                                                <a href="${pageContext.request.contextPath}/admin/deleteContactById?id=${contact.id}"
                                                   class="pk-btn-del"
                                                   onclick="return confirm('Delete this contact message?')">
                                                    🗑 Delete
                                                </a>
                                            </div>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </c:when>
                <c:otherwise>
                    <table class="pk-admin-table">
                        <tbody>
                            <tr class="pk-empty-row">
                                <td colspan="8">
                                    <span class="pk-empty-icon">📭</span>
                                    No contact messages yet. They'll appear here once visitors submit the form.
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </c:otherwise>
            </c:choose>
        </div>
    </main>
</div>
</body>
</html>
