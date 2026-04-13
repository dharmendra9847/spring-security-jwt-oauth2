<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Add Service — Admin</title>
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
            <li><a href="${pageContext.request.contextPath}/admin/readAllContacts"><span class="nav-ic">📬</span> Contacts</a></li>
            <li class="pk-active"><a href="${pageContext.request.contextPath}/admin/addService"><span class="nav-ic">➕</span> Add Service</a></li>
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
                <h1>Add New Service</h1>
                <p class="pk-topbar-sub">Add a service that will appear on the public Services page.</p>
            </div>
            <div class="pk-topbar-right">
                <a href="${pageContext.request.contextPath}/admin/readAllServices" class="pk-btn pk-btn-outline pk-btn-sm">
                    View All Services →
                </a>
            </div>
        </div>

        <%-- Flash / error alerts --%>
        <c:if test="${not empty result}">
            <div class="pk-alert ${result == 'Service Added Successfully!' ? 'pk-alert-success' : 'pk-alert-error'}"
                 style="margin-bottom:24px;">
                <span>${result == 'Service Added Successfully!' ? '✅' : '⚠'}</span>
                <span>${result}</span>
            </div>
        </c:if>

        <div style="display:grid;grid-template-columns:1.2fr 1fr;gap:28px;align-items:start;">

            <%-- ── ADD SERVICE FORM (action → AdminController.addService) ── --%>
            <div class="pk-admin-form-card">
                <h3>Service Details</h3>

                <form action="${pageContext.request.contextPath}/admin/addService"
                      method="post" enctype="multipart/form-data">

                    <%-- Title --%>
                    <div class="pk-form-group">
                        <label for="svc-title">Service Title *</label>
                        <c:forEach var="err" items="${errors}">
                            <c:if test="${err.field=='title'}">
                                <span class="pk-field-error">⚠ ${err.defaultMessage}</span>
                            </c:if>
                        </c:forEach>
                        <input type="text" id="svc-title" name="title"
                               placeholder="e.g. Web Development"
                               maxlength="30"
                               style="<c:forEach var='err' items='${errors}'><c:if test='${err.field==\"title\"}'>border-color:var(--accent3);</c:if></c:forEach>">
                    </div>

                    <%-- Description --%>
                    <div class="pk-form-group">
                        <label for="svc-desc">Description *</label>
                        <c:forEach var="err" items="${errors}">
                            <c:if test="${err.field=='description'}">
                                <span class="pk-field-error">⚠ ${err.defaultMessage}</span>
                            </c:if>
                        </c:forEach>
                        <textarea id="svc-desc" name="description" rows="4"
                                  placeholder="Brief description of this service (max 100 chars)..."
                                  maxlength="100"
                                  style="<c:forEach var='err' items='${errors}'><c:if test='${err.field==\"description\"}'>border-color:var(--accent3);</c:if></c:forEach>"></textarea>
                    </div>

                    <%-- File upload --%>
                    <div class="pk-form-group">
                        <label>Service Image *</label>
                        <c:if test="${not empty fileError}">
                            <span class="pk-field-error">⚠ ${fileError}</span>
                        </c:if>
                        <div class="pk-upload-zone" style="position:relative;" id="drop-zone">
                            <input type="file" name="serviceFile" accept="image/*"
                                   onchange="previewImage(this)" id="svc-file">
                            <div class="pk-upload-icon">🖼</div>
                            <p><strong>Click to upload</strong> or drag &amp; drop</p>
                            <p>PNG, JPG, GIF up to <strong>1MB</strong></p>
                        </div>
                        <div id="img-preview" style="display:none;margin-top:12px;">
                            <img id="preview-img" style="width:100%;max-height:180px;object-fit:cover;border-radius:var(--radius);border:1px solid var(--border);" alt="Preview">
                        </div>
                    </div>

                    <button type="submit" class="pk-btn pk-btn-primary" style="width:100%;justify-content:center;">
                        ✅ Save Service
                    </button>
                </form>
            </div>

            <%-- ── TIPS CARD ── --%>
            <div>
                <div class="pk-admin-form-card" style="margin-bottom:20px;">
                    <h3 style="font-size:16px;margin-bottom:16px;">📋 Tips</h3>
                    <ul style="color:var(--muted);font-size:14px;line-height:1.9;list-style:disc;padding-left:20px;">
                        <li>Title should be short and descriptive (max 30 chars)</li>
                        <li>Description should summarise the service clearly (max 100 chars)</li>
                        <li>Upload a clear, professional image (max 1MB)</li>
                        <li>Ideal image size: 400×300px</li>
                        <li>Services appear on the public Services page immediately</li>
                    </ul>
                </div>
                <div style="background:rgba(108,99,255,.08);border:1px solid var(--border2);border-radius:var(--radius-lg);padding:24px;">
                    <p style="font-size:13px;color:var(--muted);line-height:1.8;">
                        ✨ <strong style="color:var(--text);">Pro tip:</strong> Use icons or clear screenshots to represent each service. Visual content increases engagement.
                    </p>
                </div>
            </div>

        </div>
    </main>
</div>

<script>
function previewImage(input) {
    if (input.files && input.files[0]) {
        var reader = new FileReader();
        reader.onload = function(e) {
            document.getElementById('preview-img').src = e.target.result;
            document.getElementById('img-preview').style.display = 'block';
        };
        reader.readAsDataURL(input.files[0]);
    }
}
// Drag & drop style
var dz = document.getElementById('drop-zone');
if (dz) {
    dz.addEventListener('dragover', function(e){ e.preventDefault(); dz.style.borderColor='var(--accent)'; });
    dz.addEventListener('dragleave', function(){ dz.style.borderColor=''; });
    dz.addEventListener('drop', function(e){ e.preventDefault(); dz.style.borderColor=''; });
}
</script>
</body>
</html>
