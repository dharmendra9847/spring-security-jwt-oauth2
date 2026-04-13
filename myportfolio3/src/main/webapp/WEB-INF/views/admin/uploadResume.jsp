<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Upload Resume — Admin</title>
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
            <li><a href="${pageContext.request.contextPath}/admin/readAllServices"><span class="nav-ic">🛠</span> All Services</a></li>
            <li class="pk-active"><a href="${pageContext.request.contextPath}/admin/uploadResume"><span class="nav-ic">📄</span> Resume</a></li>
            <hr class="pk-sidebar-divider">
            <li><a href="${pageContext.request.contextPath}/client/home"><span class="nav-ic">←</span> Back to Site</a></li>
        </ul></nav>
    </aside>

    <main class="pk-admin-main">
        <div class="pk-admin-topbar">
            <div>
                <h1>Upload Resume</h1>
                <p class="pk-topbar-sub">Upload your latest CV/Resume in PDF format for visitors to download.</p>
            </div>
        </div>

        <%-- Flash messages from RedirectAttributes --%>
        <c:if test="${not empty result}">
            <div class="pk-alert pk-alert-success" style="margin-bottom:24px;">
                ✅ <span>${result}</span>
            </div>
        </c:if>
        <c:if test="${not empty fileError}">
            <div class="pk-alert pk-alert-error" style="margin-bottom:24px;">
                ⚠ <span>${fileError}</span>
            </div>
        </c:if>

        <div style="max-width:680px;">
            <div class="pk-admin-form-card">
                <h3>Resume Upload</h3>
                <p style="color:var(--muted);font-size:14px;margin-bottom:28px;line-height:1.7;">
                    Upload your latest CV in <strong style="color:var(--text);">PDF format only</strong>.
                    Max file size: <strong style="color:var(--text);">2MB</strong>.
                    The file will be saved as <code style="background:var(--card2);padding:2px 8px;border-radius:4px;font-size:13px;">MyResume.pdf</code>
                    and visitors can download it from the homepage.
                </p>

                <%-- Form → AdminController.uploadResume() --%>
                <form action="uploadResume" method="post" enctype="multipart/form-data">

                    <div class="pk-form-group">
                        <label>Select PDF File</label>
                        <div class="pk-upload-zone" style="position:relative;" id="resume-drop-zone">
                            <input type="file" name="resume" accept=".pdf,application/pdf"
                                   id="resume-file" onchange="handleResumeSelect(this)">
                            <div class="pk-upload-icon">📄</div>
                            <p><strong>Click to select</strong> your resume PDF</p>
                            <p>PDF only — max <strong>2MB</strong></p>
                        </div>

                        <%-- Selected file indicator --%>
                        <div id="resume-selected" style="display:none;margin-top:12px;
                             background:rgba(0,212,170,.07);border:1px solid rgba(0,212,170,.2);
                             border-radius:var(--radius);padding:14px 18px;
                             display:none;align-items:center;gap:14px;">
                            <span style="font-size:24px;">📄</span>
                            <div>
                                <div id="resume-fname" style="font-weight:600;font-size:14px;color:var(--white);"></div>
                                <div id="resume-fsize" style="font-size:12px;color:var(--muted);"></div>
                            </div>
                            <span style="margin-left:auto;color:var(--accent2);font-size:18px;">✓</span>
                        </div>
                    </div>

                    <button type="submit" class="pk-btn pk-btn-primary"
                            style="width:100%;justify-content:center;font-size:15px;padding:15px;">
                        ⬆ Upload Resume
                    </button>
                </form>
            </div>

            <%-- Info card --%>
            <div style="background:var(--card2);border:1px solid var(--border);border-radius:var(--radius-lg);padding:24px;margin-top:20px;">
                <h4 style="font-size:15px;margin-bottom:14px;">ℹ How Resume Download Works</h4>
                <ul style="color:var(--muted);font-size:14px;line-height:1.9;list-style:disc;padding-left:20px;">
                    <li>Visitors click <strong style="color:var(--text);">Download CV</strong> on the homepage</li>
                    <li>The server serves <code style="background:var(--card);padding:2px 6px;border-radius:4px;">MyResume.pdf</code> from the <code style="background:var(--card);padding:2px 6px;border-radius:4px;">/resume/</code> directory</li>
                    <li>Uploading a new resume replaces the old one automatically</li>
                    <li>The file is sent as <em>Dharmendra_CV.pdf</em> to the visitor</li>
                </ul>
            </div>
        </div>
    </main>
</div>

<script>
function handleResumeSelect(input) {
    var box = document.getElementById('resume-selected');
    if (input.files && input.files[0]) {
        var f = input.files[0];
        document.getElementById('resume-fname').textContent = f.name;
        document.getElementById('resume-fsize').textContent = (f.size / 1024).toFixed(1) + ' KB';
        box.style.display = 'flex';
        var zone = document.getElementById('resume-drop-zone');
        zone.style.borderColor = 'var(--accent2)';
        zone.style.background = 'rgba(0,212,170,.04)';
    }
}
</script>
</body>
</html>
