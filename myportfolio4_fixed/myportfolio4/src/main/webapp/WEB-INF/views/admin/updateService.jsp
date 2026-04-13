<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Update Service — Admin</title>
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
                <h1>Update Service</h1>
                <p class="pk-topbar-sub">Editing: <strong style="color:var(--accent);">${serviceData.title}</strong></p>
            </div>
            <div class="pk-topbar-right">
                <a href="${pageContext.request.contextPath}/admin/readAllServices" class="pk-btn pk-btn-outline pk-btn-sm">
                    ← Back to Services
                </a>
            </div>
        </div>

        <div style="display:grid;grid-template-columns:1.2fr 1fr;gap:28px;align-items:start;">

            <%-- UPDATE FORM — action → AdminController.updateServiceView (POST) --%>
            <div class="pk-admin-form-card">
                <h3>Edit Service Details</h3>

                <form action="${pageContext.request.contextPath}/admin/updateService"
                      method="post" enctype="multipart/form-data">

                    <%-- Hidden fields required by controller --%>
                    <input type="hidden" name="id"          value="${serviceData.id}">
                    <input type="hidden" name="oldFileName" value="${serviceData.filename}">

                    <div class="pk-form-group">
                        <label for="upd-title">Service Title *</label>
                        <input type="text" id="upd-title" name="title"
                               value="${serviceData.title}" maxlength="30"
                               placeholder="Service title">
                    </div>

                    <div class="pk-form-group">
                        <label for="upd-desc">Description *</label>
                        <textarea id="upd-desc" name="description" rows="4"
                                  maxlength="100"
                                  placeholder="Service description...">${serviceData.description}</textarea>
                    </div>

                    <%-- Current image preview --%>
                    <div class="pk-form-group">
                        <label>Current Image</label>
                        <div style="margin-bottom:12px;">
                            <img src="${pageContext.request.contextPath}/img/services/${serviceData.filename}"
                                 alt="${serviceData.title}"
                                 style="width:100%;max-height:160px;object-fit:cover;border-radius:var(--radius);border:1px solid var(--border);"
                                 onerror="this.style.display='none'">
                        </div>
                        <label>Replace Image (optional)</label>
                        <c:if test="${not empty fileError}">
                            <span class="pk-field-error">⚠ ${fileError}</span>
                        </c:if>
                        <div class="pk-upload-zone" style="position:relative;" id="drop-zone">
                            <input type="file" name="serviceFile" accept="image/*"
                                   onchange="previewImage(this)" id="upd-file">
                            <div class="pk-upload-icon" style="font-size:28px;">🖼</div>
                            <p><strong>Click to upload</strong> a new image</p>
                            <p>PNG, JPG — max <strong>1MB</strong>. Leave blank to keep current.</p>
                        </div>
                        <div id="img-preview" style="display:none;margin-top:10px;">
                            <img id="preview-img"
                                 style="width:100%;max-height:160px;object-fit:cover;border-radius:var(--radius);border:1px solid var(--border);"
                                 alt="New preview">
                        </div>
                    </div>

                    <div style="display:flex;gap:12px;">
                        <button type="submit" class="pk-btn pk-btn-primary" style="flex:1;justify-content:center;">
                            💾 Update Service
                        </button>
                        <a href="${pageContext.request.contextPath}/admin/readAllServices"
                           class="pk-btn pk-btn-outline">Cancel</a>
                    </div>
                </form>
            </div>

            <%-- Current data preview --%>
            <div>
                <div class="pk-admin-form-card">
                    <h3 style="font-size:16px;margin-bottom:20px;">📌 Current Data</h3>
                    <div style="margin-bottom:14px;">
                        <div style="font-size:11px;text-transform:uppercase;letter-spacing:2px;color:var(--muted);margin-bottom:4px;">ID</div>
                        <div style="font-size:14px;font-weight:500;">${serviceData.id}</div>
                    </div>
                    <div style="margin-bottom:14px;">
                        <div style="font-size:11px;text-transform:uppercase;letter-spacing:2px;color:var(--muted);margin-bottom:4px;">Title</div>
                        <div style="font-size:14px;font-weight:500;">${serviceData.title}</div>
                    </div>
                    <div style="margin-bottom:14px;">
                        <div style="font-size:11px;text-transform:uppercase;letter-spacing:2px;color:var(--muted);margin-bottom:4px;">Description</div>
                        <div style="font-size:13px;color:var(--muted);line-height:1.7;">${serviceData.description}</div>
                    </div>
                    <div>
                        <div style="font-size:11px;text-transform:uppercase;letter-spacing:2px;color:var(--muted);margin-bottom:4px;">Image File</div>
                        <div style="font-size:13px;color:var(--accent);">${serviceData.filename}</div>
                    </div>
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
</script>
</body>
</html>
