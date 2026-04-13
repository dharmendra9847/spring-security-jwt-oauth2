<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="icon" href="${pageContext.request.contextPath}/img/favicon.png" type="image/png">
    <title>About — Dharmendra Kumar</title>
</head>
<body>

<%@include file="header.jsp"%>

<!-- PAGE BANNER -->
<section class="pk-page-banner">
    <div class="pk-banner-glow"></div>
    <div class="container">
        <div class="pk-banner-content pk-animate">
            <div class="pk-badge" style="justify-content:center;">Get to know me</div>
            <h2>About Me</h2>
            <div class="pk-breadcrumb">
                <a href="${pageContext.request.contextPath}/client/home">Home</a>
                <span>/</span>
                <span>About</span>
            </div>
        </div>
    </div>
</section>

<!-- ABOUT SECTION -->
<section class="section_gap" style="background:var(--bg2);">
    <div class="container">
        <div style="display:grid;grid-template-columns:1fr 1fr;gap:70px;align-items:start;">

            <!-- Image -->
            <div class="pk-animate">
                <div style="border-radius:28px;overflow:hidden;border:1px solid var(--border);background:var(--card);">
                    <img src="${pageContext.request.contextPath}/img/about-us.png" alt="About Dharmendra" style="width:100%;display:block;">
                </div>
                <!-- Skill progress bars -->
                <div style="background:var(--card);border:1px solid var(--border);border-radius:24px;padding:32px;margin-top:24px;" class="pk-animate pk-delay-2">
                    <h4 style="font-size:16px;margin-bottom:22px;">Skill Proficiency</h4>
                    <div style="margin-bottom:16px;">
                        <div style="display:flex;justify-content:space-between;font-size:14px;margin-bottom:6px;"><span>Java / Spring Boot</span><span style="color:var(--muted);">92%</span></div>
                        <div style="height:5px;background:rgba(255,255,255,.06);border-radius:3px;overflow:hidden;"><div style="width:92%;height:100%;background:linear-gradient(90deg,var(--accent),var(--accent2));border-radius:3px;"></div></div>
                    </div>
                    <div style="margin-bottom:16px;">
                        <div style="display:flex;justify-content:space-between;font-size:14px;margin-bottom:6px;"><span>React.js / JavaScript</span><span style="color:var(--muted);">80%</span></div>
                        <div style="height:5px;background:rgba(255,255,255,.06);border-radius:3px;overflow:hidden;"><div style="width:80%;height:100%;background:linear-gradient(90deg,var(--accent),var(--accent2));border-radius:3px;"></div></div>
                    </div>
                    <div style="margin-bottom:16px;">
                        <div style="display:flex;justify-content:space-between;font-size:14px;margin-bottom:6px;"><span>MySQL / JPA</span><span style="color:var(--muted);">85%</span></div>
                        <div style="height:5px;background:rgba(255,255,255,.06);border-radius:3px;overflow:hidden;"><div style="width:85%;height:100%;background:linear-gradient(90deg,var(--accent),var(--accent2));border-radius:3px;"></div></div>
                    </div>
                    <div style="margin-bottom:16px;">
                        <div style="display:flex;justify-content:space-between;font-size:14px;margin-bottom:6px;"><span>REST API Design</span><span style="color:var(--muted);">88%</span></div>
                        <div style="height:5px;background:rgba(255,255,255,.06);border-radius:3px;overflow:hidden;"><div style="width:88%;height:100%;background:linear-gradient(90deg,var(--accent),var(--accent2));border-radius:3px;"></div></div>
                    </div>
                    <div>
                        <div style="display:flex;justify-content:space-between;font-size:14px;margin-bottom:6px;"><span>Docker / DevOps</span><span style="color:var(--muted);">65%</span></div>
                        <div style="height:5px;background:rgba(255,255,255,.06);border-radius:3px;overflow:hidden;"><div style="width:65%;height:100%;background:linear-gradient(90deg,var(--accent),var(--accent2));border-radius:3px;"></div></div>
                    </div>
                </div>
            </div>

            <!-- Text -->
            <div class="pk-animate pk-delay-1">
                <div class="pk-badge">Full Stack Developer</div>
                <h2 class="pk-section-title">let's Introduce<br>about myself</h2>
                <div class="pk-about-text">
                    <p>I'm a <strong>passionate Full Stack Developer</strong> specializing in the Java ecosystem. I build scalable web applications that serve real business needs.</p>
                    <p>Is give may shall likeness made yielding spirit a itself together created after sea is in beast beginning signs open god you're gathering whose gathered cattle let. Creature whales fruit unto meat the life beginning all in under give two.</p>
                </div>

                <!-- Personal info grid -->
                <div class="pk-info-grid">
                    <div class="pk-info-item"><label>Name</label><span>Dharmendra Kumar</span></div>
                    <div class="pk-info-item"><label>Role</label><span>Full Stack Developer</span></div>
                    <div class="pk-info-item"><label>Location</label><span>Delhi, India</span></div>
                    <div class="pk-info-item"><label>Email</label><span>support@techportfolio.com</span></div>
                    <div class="pk-info-item"><label>Phone</label><span>+91 9315917780</span></div>
                    <div class="pk-info-item"><label>Status</label><span>✅ Available for Hire</span></div>
                </div>

                <div style="display:flex;gap:14px;flex-wrap:wrap;margin-top:32px;">
                    <a href="${pageContext.request.contextPath}/client/downloadResume" class="pk-btn pk-btn-primary">Download CV 📄</a>
                    <a href="${pageContext.request.contextPath}/client/contact" class="pk-btn pk-btn-outline">Hire Me →</a>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- BRANDS / EXPERIENCE -->
<section class="section_gap">
    <div class="container">
        <div style="display:grid;grid-template-columns:1.5fr 1fr;gap:60px;align-items:center;">
            <!-- Brand logos -->
            <div class="pk-animate">
                <div class="pk-badge">Tech I Work With</div>
                <h2 class="pk-section-title" style="margin-bottom:36px;">Tools &amp; Technologies</h2>
                <div class="pk-brands-grid" style="grid-template-columns:repeat(3,1fr);">
                    <div class="pk-brand-cell" style="font-family:var(--syne);font-weight:800;font-size:15px;color:rgba(255,255,255,.35);">Java</div>
                    <div class="pk-brand-cell" style="font-family:var(--syne);font-weight:800;font-size:15px;color:rgba(255,255,255,.35);">Spring</div>
                    <div class="pk-brand-cell" style="font-family:var(--syne);font-weight:800;font-size:15px;color:rgba(255,255,255,.35);">React</div>
                    <div class="pk-brand-cell" style="font-family:var(--syne);font-weight:800;font-size:15px;color:rgba(255,255,255,.35);">MySQL</div>
                    <div class="pk-brand-cell" style="font-family:var(--syne);font-weight:800;font-size:15px;color:rgba(255,255,255,.35);">Docker</div>
                    <div class="pk-brand-cell" style="font-family:var(--syne);font-weight:800;font-size:15px;color:rgba(255,255,255,.35);">Maven</div>
                    <div class="pk-brand-cell" style="font-family:var(--syne);font-weight:800;font-size:15px;color:rgba(255,255,255,.35);">Git</div>
                    <div class="pk-brand-cell" style="font-family:var(--syne);font-weight:800;font-size:15px;color:rgba(255,255,255,.35);">AWS</div>
                    <div class="pk-brand-cell" style="font-family:var(--syne);font-weight:800;font-size:15px;color:rgba(255,255,255,.35);">Postman</div>
                </div>
            </div>
            <!-- Client stats -->
            <div class="pk-animate pk-delay-2">
                <div class="pk-client-info">
                    <div class="pk-big-number" data-target="10">0</div>
                    <div class="pk-big-label">Years Experience Working</div>
                    <div class="pk-phone-wrap">
                        <div class="pk-phone-icon">📞</div>
                        <div>
                            <div class="pk-phone-label">Call us now</div>
                            <div class="pk-phone-num">+91 9315917780</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- TESTIMONIALS -->
<section class="section_gap_bottom pk-testi-area" style="background:var(--bg2);">
    <div class="container">
        <div style="text-align:center;margin-bottom:56px;" class="pk-animate">
            <div class="pk-badge" style="justify-content:center;">Testimonials</div>
            <h2 class="pk-section-title">Client Say About Me</h2>
            <p style="color:var(--muted);max-width:500px;margin:0 auto;font-size:15px;">Is give may shall likeness made yielding spirit a itself togeth created after sea.</p>
        </div>
        <div class="pk-testi-grid">
            <div class="pk-testi-card pk-animate pk-delay-1">
                <div class="pk-quote">"</div>
                <p>Him, made can't called over won't there on divide there male fish beast own his day third seed sixth seas unto. Saw from where we started to where we ended up — remarkable growth.</p>
                <div class="pk-testi-author">
                    <div class="pk-testi-avatar">EM</div>
                    <div><h5>Elite Martin</h5><span>Product Manager</span></div>
                </div>
            </div>
            <div class="pk-testi-card pk-animate pk-delay-2">
                <div class="pk-quote">"</div>
                <p>Him, made can't called over won't there on divide there male fish beast own his day third seed sixth seas unto. The attention to detail is second to none.</p>
                <div class="pk-testi-author">
                    <div class="pk-testi-avatar" style="background:linear-gradient(135deg,#00d4aa,#0099ff);">DS</div>
                    <div><h5>Davil Saden</h5><span>CTO, StartupHub</span></div>
                </div>
            </div>
        </div>
    </div>
</section>

<%@include file="footer.jsp"%>
</body>
</html>
