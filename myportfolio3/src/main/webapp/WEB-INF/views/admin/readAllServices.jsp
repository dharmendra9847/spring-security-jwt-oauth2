<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>All Services — Admin</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link href="https://fonts.googleapis.com/css2?family=Syne:wght@400;600;700;800&family=DM+Sans:opsz,wght@9..40,300;9..40,400;9..40,500;9..40,600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/portfolio-theme.css">
</head>
<body class="pk-admin-body">
<div class="pk-admin-wrap">

    <aside class="pk-sidebar">
        <a href="${pageContext.request.contextPath}/admin/home" class="pk-sidebar-logo">Admin<span>.</span></a>
        <div class="pk-sidebar-user">
            <div class="pk-sidebar-avatar">DK</div>
            <div><h5>Dharmendra Kumar</h5><span>Administrator</span></div>
        </div>
        <nav class="pk-sidebar-nav"><ul>
            <li><a href="${pageContext.request.contextPath}/admin/home"><span class="nav-ic">🏠</span> Dashboard</a></li>
            <li><a href="${pageContext.request.contextPath}/admin/readAllContacts"><span class="nav-ic">📬</span> Contacts</a></li>
            <li><a href="${pageContext.request.contextPath}/admin/addService"><span class="nav-ic">➕</span> Add Service</a></li>
            <li class="pk-active"><a href="${pageContext.request.contextPath}/admin/readAllServices"><span class="nav-ic">🛠</span> All Services</a></li>
            <li><a href="${pageContext.request.contextPath}/admin/uploadResume"><span class="nav-ic">📄</span> Resume</a></li>
            <hr class="pk-sidebar-divider">
            <li><a href="${pageContext.request.contextPath}/client/home"><span class="nav-ic">←</span> Back to Site</a></li>
        </ul></nav>
    </aside>

    <main class="pk-admin-main">
        <div class="pk-admin-topbar">
            <div>
                <h1>All Services</h1>
                <p class="pk-topbar-sub">Manage your portfolio services.</p>
            </div>
            <div class="pk-topbar-right">
                <a href="${pageContext.request.contextPath}/admin/addService" class="pk-btn pk-btn-primary pk-btn-sm">+ Add New Service</a>
            </div>
        </div>

        <c:if test="${not empty result}">
            <div class="pk-alert pk-alert-success" style="margin-bottom:24px;">
                ✅ <span>${result}</span>
            </div>
        </c:if>

        <div class="pk-admin-table-card">
            <div class="pk-admin-table-head">
                <h3>Services List</h3>
                <span style="color:var(--muted);font-size:14px;">
                    <c:choose>
                        <c:when test="${not empty listOfServices}">${fn:length(listOfServices)} services</c:when>
                        <c:otherwise>0 services</c:otherwise>
                    </c:choose>
                </span>
            </div>
            <c:choose>
                <c:when test="${not empty listOfServices}">
                    <div style="overflow-x:auto;">
                        <table class="pk-admin-table">
                            <thead>
                                <tr>
                                    <th>#</th>
                                    <th>Image</th>
                                    <th>Title</th>
                                    <th>Description</th>
                                    <th>Date Added</th>
                                    <th>Actions</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="service" items="${listOfServices}" varStatus="st">
                                    <tr>
                                        <td style="color:var(--muted);font-size:13px;">${service.id}</td>
                                        <td>
                                            <img class="pk-service-thumb"
                                                 src="${pageContext.request.contextPath}/img/services/${service.filename}"
                                                 alt="${service.title}"
                                                 onerror="this.style.background='var(--card2)';this.style.opacity='.4'">
                                        </td>
                                        <td><strong>${service.title}</strong></td>
                                        <td><div class="pk-msg-preview" title="${service.description}">${service.description}</div></td>
                                        <td style="color:var(--muted);font-size:13px;white-space:nowrap;">${service.datetime}</td>
                                        <td>
                                            <div class="pk-actions-cell">
                                                <a href="${pageContext.request.contextPath}/admin/updateService?id=${service.id}"
                                                   class="pk-btn-edit">✏ Edit</a>
                                                <a href="${pageContext.request.contextPath}/admin/deleteService?id=${service.id}&filename=${service.filename}"
                                                   class="pk-btn-del"
                                                   onclick="return confirm('Delete this service?')">🗑 Delete</a>
                                            </div>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </c:when>
                <c:otherwise>
                    <table class="pk-admin-table"><tbody>
                        <tr class="pk-empty-row">
                            <td colspan="6">
                                <span class="pk-empty-icon">🛠</span>
                                No services yet.
                                <a href="${pageContext.request.contextPath}/admin/addService" style="color:var(--accent);">Add your first service →</a>
                            </td>
                        </tr>
                    </tbody></table>
                </c:otherwise>
            </c:choose>
        </div>
    </main>
</div>
</body>
</html>
