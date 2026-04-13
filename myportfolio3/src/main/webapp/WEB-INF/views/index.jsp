<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="icon" href="${pageContext.request.contextPath}/img/favicon.png" type="image/png">
    <title>Dharmendra Kumar — Full Stack Developer</title>
</head>
<body>

<%@include file="header.jsp"%>

<!-- ════════════════════════════════════════════════
     HERO SECTION
════════════════════════════════════════════════ -->
<section class="pk-hero">
    <!-- Ambient orbs -->
    <div class="pk-hero-orb pk-hero-orb-1"></div>
    <div class="pk-hero-orb pk-hero-orb-2"></div>

    <div class="container">
        <div class="pk-hero-grid">

            <!-- LEFT: Content -->
            <div class="pk-animate">
                <div class="pk-hero-tag">Available for work</div>
                <h1 class="pk-hero-name">
                    I'm <span class="pk-grad">Dharmendra</span><br>Kumar
                </h1>
                <p class="pk-hero-role">
                    Full Stack <strong>Java Developer</strong> — building robust web applications
                    with Spring Boot, REST APIs, and modern frontend technologies.
                </p>
                <div class="pk-hero-actions">
                    <a href="${pageContext.request.contextPath}/client/contact" class="pk-btn pk-btn-primary">
                        Let's Talk →
                    </a>
                    <a href="${pageContext.request.contextPath}/client/downloadResume" class="pk-btn pk-btn-outline">
                        📄 Download CV
                    </a>
                </div>
                <div class="pk-hero-stats">
                    <div>
                        <div class="pk-stat-num"><span data-target="5">0</span><sup>+</sup></div>
                        <div class="pk-stat-label">Years Exp.</div>
                    </div>
                    <div>
                        <div class="pk-stat-num"><span data-target="40">0</span><sup>+</sup></div>
                        <div class="pk-stat-label">Projects</div>
                    </div>
                    <div>
                        <div class="pk-stat-num"><span data-target="20">0</span><sup>+</sup></div>
                        <div class="pk-stat-label">Clients</div>
                    </div>
                </div>
            </div>

            <!-- RIGHT: Avatar card -->
            <div class="pk-hero-visual pk-animate pk-delay-2">
                <div style="position:relative;">
                    <div class="pk-avatar-card">
                        <div class="pk-avatar-bg"></div>
                        <div class="pk-avatar-grid-lines"></div>
                        <div class="pk-avatar-monogram">DK</div>
                        <div class="pk-avatar-info">
                            <h4><span class="pk-avail-dot"></span>Dharmendra Kumar</h4>
                            <p>Full Stack Developer · Spring Boot · React</p>
                        </div>
                    </div>
                    <div class="pk-chip pk-chip-1">☕ Spring Boot</div>
                    <div class="pk-chip pk-chip-2">🛢 MySQL &amp; JPA</div>
                    <div class="pk-chip pk-chip-3">⚛ React.js</div>
                </div>
            </div>

        </div>
    </div>
</section>

<!-- ════════════════════════════════════════════════
     SCROLLING MARQUEE BAND
════════════════════════════════════════════════ -->
<div class="pk-marquee-band">
    <div class="pk-marquee-track" id="pk-marquee">
        <span>Spring Boot</span><span>React.js</span><span>MySQL</span><span>REST API</span>
        <span>Java 17+</span><span>JPA / Hibernate</span><span>Maven</span><span>JSP</span>
        <span>Bootstrap</span><span>Git &amp; GitHub</span><span>Docker</span><span>Microservices</span>
        <span>Spring Boot</span><span>React.js</span><span>MySQL</span><span>REST API</span>
        <span>Java 17+</span><span>JPA / Hibernate</span><span>Maven</span><span>JSP</span>
        <span>Bootstrap</span><span>Git &amp; GitHub</span><span>Docker</span><span>Microservices</span>
    </div>
</div>

<!-- ════════════════════════════════════════════════
     ABOUT PREVIEW
════════════════════════════════════════════════ -->
<section class="section_gap" style="background:var(--bg2);">
    <div class="container">
        <div style="display:grid;grid-template-columns:1fr 1fr;gap:70px;align-items:center;">
            <!-- Image -->
            <div class="pk-animate" style="position:relative;">
                <div style="border-radius:28px;overflow:hidden;border:1px solid var(--border);background:var(--card);position:relative;">
                    <img src="${pageContext.request.contextPath}/img/about-us.png" alt="About Dharmendra" style="width:100%;display:block;">
                    <div style="position:absolute;inset:0;background:linear-gradient(to top,rgba(7,7,16,.7) 0%,transparent 50%);pointer-events:none;"></div>
                </div>
                <!-- Floating experience badge -->
                <div style="position:absolute;bottom:-20px;right:-20px;background:var(--accent);border-radius:20px;padding:20px 28px;box-shadow:0 12px 40px rgba(108,99,255,.5);">
                    <div style="font-family:var(--syne);font-size:2rem;font-weight:800;color:#fff;line-height:1;">5+</div>
                    <div style="font-size:12px;color:rgba(255,255,255,.8);text-transform:uppercase;letter-spacing:1px;">Years Exp.</div>
                </div>
            </div>

            <!-- Text -->
            <div class="pk-animate pk-delay-2">
                <div class="pk-badge">About Me</div>
                <h2 class="pk-section-title">let's Introduce<br>about myself</h2>
                <p class="pk-about-text" style="color:var(--muted);font-size:16px;line-height:1.85;margin-bottom:18px;">
                    I'm a <strong style="color:var(--text);font-weight:500;">passionate Full Stack Developer</strong> with hands-on expertise
                    in building enterprise-grade web applications using the Java ecosystem.
                </p>
                <p style="color:var(--muted);font-size:15px;line-height:1.8;margin-bottom:32px;">
                    My approach combines <strong style="color:var(--text);">clean architecture</strong>, thoughtful API design, and intuitive UI
                    to create solutions that are both technically excellent and a joy to use.
                </p>

                <!-- Mini skills -->
                <div style="display:flex;flex-wrap:wrap;gap:10px;margin-bottom:36px;">
                    <span style="padding:6px 16px;border-radius:8px;background:rgba(108,99,255,.1);border:1px solid rgba(108,99,255,.2);color:var(--accent);font-size:13px;font-weight:600;">Java / Spring Boot</span>
                    <span style="padding:6px 16px;border-radius:8px;background:rgba(108,99,255,.1);border:1px solid rgba(108,99,255,.2);color:var(--accent);font-size:13px;font-weight:600;">React.js</span>
                    <span style="padding:6px 16px;border-radius:8px;background:rgba(108,99,255,.1);border:1px solid rgba(108,99,255,.2);color:var(--accent);font-size:13px;font-weight:600;">MySQL / JPA</span>
                    <span style="padding:6px 16px;border-radius:8px;background:rgba(108,99,255,.1);border:1px solid rgba(108,99,255,.2);color:var(--accent);font-size:13px;font-weight:600;">REST API</span>
                    <span style="padding:6px 16px;border-radius:8px;background:rgba(108,99,255,.1);border:1px solid rgba(108,99,255,.2);color:var(--accent);font-size:13px;font-weight:600;">Docker</span>
                </div>

                <a href="${pageContext.request.contextPath}/client/downloadResume" class="pk-btn pk-btn-primary">
                    Download CV 📄
                </a>
            </div>
        </div>
    </div>
</section>

<!-- ════════════════════════════════════════════════
     SERVICES PREVIEW (static — dynamic is in services.jsp)
════════════════════════════════════════════════ -->
<section class="section_gap">
    <div class="container">
        <div style="text-align:center;margin-bottom:60px;" class="pk-animate">
            <div class="pk-badge" style="justify-content:center;">What I Offer</div>
            <h2 class="pk-section-title">Service Offers</h2>
            <p style="color:var(--muted);max-width:520px;margin:0 auto;font-size:16px;line-height:1.75;">
                End-to-end development solutions — from architecture to deployment.
            </p>
        </div>
        <div style="display:grid;grid-template-columns:repeat(4,1fr);gap:20px;">
            <div class="pk-service-card pk-animate pk-delay-1">
                <div class="pk-service-num">01</div>
                <div style="font-size:32px;margin-bottom:16px;">🌐</div>
                <h3>Web Development</h3>
                <p>Full-stack web applications with Spring Boot backend and React frontend.</p>
            </div>
            <div class="pk-service-card pk-animate pk-delay-2">
                <div class="pk-service-num">02</div>
                <div style="font-size:32px;margin-bottom:16px;">⚡</div>
                <h3>API Development</h3>
                <p>Clean, documented REST APIs with authentication and robust error handling.</p>
            </div>
            <div class="pk-service-card pk-animate pk-delay-3">
                <div class="pk-service-num">03</div>
                <div style="font-size:32px;margin-bottom:16px;">🎨</div>
                <h3>UI/UX Design</h3>
                <p>Responsive, accessible pixel-perfect interfaces using React and Bootstrap.</p>
            </div>
            <div class="pk-service-card pk-animate pk-delay-4">
                <div class="pk-service-num">04</div>
                <div style="font-size:32px;margin-bottom:16px;">🛢</div>
                <h3>Database Design</h3>
                <p>Optimised MySQL schemas, JPA entity modelling, and performance tuning.</p>
            </div>
        </div>
        <div style="text-align:center;margin-top:40px;">
            <a href="${pageContext.request.contextPath}/client/services" class="pk-btn pk-btn-outline">View All Services →</a>
        </div>
    </div>
</section>

<!-- ════════════════════════════════════════════════
     TESTIMONIALS
════════════════════════════════════════════════ -->
<section class="section_gap_bottom" style="background:var(--bg2);">
    <div class="container">
        <div style="text-align:center;margin-bottom:60px;" class="pk-animate">
            <div class="pk-badge" style="justify-content:center;">Testimonials</div>
            <h2 class="pk-section-title">Client Say About Me</h2>
        </div>
        <div class="pk-testi-grid">
            <div class="pk-testi-card pk-animate pk-delay-1">
                <div class="pk-quote">"</div>
                <p>Him, made can't called over won't there on divide there male fish beast own his day third seed sixth seas unto. Working with Dharmendra was an absolute pleasure.</p>
                <div class="pk-testi-author">
                    <div class="pk-testi-avatar">EM</div>
                    <div>
                        <h5>Elite Martin</h5>
                        <span>Product Manager, TechCorp</span>
                    </div>
                </div>
            </div>
            <div class="pk-testi-card pk-animate pk-delay-2">
                <div class="pk-quote">"</div>
                <p>Him, made can't called over won't there on divide there male fish beast own his day third seed sixth seas unto. Exceptional code quality and communication.</p>
                <div class="pk-testi-author">
                    <div class="pk-testi-avatar" style="background:linear-gradient(135deg,#00d4aa,#0099ff);">DS</div>
                    <div>
                        <h5>Davil Saden</h5>
                        <span>CTO, StartupHub</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<%@include file="footer.jsp"%>
</body>
</html>
