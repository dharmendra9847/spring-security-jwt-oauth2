<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="icon" href="${pageContext.request.contextPath}/img/favicon.png" type="image/png">
    <title>Contact — Dharmendra Kumar</title>
</head>
<body>

<%@include file="header.jsp"%>

<!-- PAGE BANNER -->
<section class="pk-page-banner">
    <div class="pk-banner-glow"></div>
    <div class="container">
        <div class="pk-banner-content pk-animate">
            <div class="pk-badge" style="justify-content:center;">Get In Touch</div>
            <h2>Contact Us</h2>

            <!-- Flash message from RedirectAttributes -->
            <c:if test="${not empty result}">
                <div class="pk-alert ${result == 'Your Data Submitted Successfully!' ? 'pk-alert-success' : 'pk-alert-error'}"
                     style="display:inline-flex;margin-top:20px;">
                    <span>${result == 'Your Data Submitted Successfully!' ? '✅' : '⚠'}</span>
                    <span>${result}</span>
                </div>
            </c:if>

            <div class="pk-breadcrumb" style="margin-top:16px;">
                <a href="${pageContext.request.contextPath}/client/home">Home</a>
                <span>/</span>
                <span>Contact</span>
            </div>
        </div>
    </div>
</section>

<!-- CONTACT SECTION -->
<section class="section_gap">
    <div class="container">
        <div class="pk-contact-grid">

            <!-- LEFT: Contact info -->
            <div class="pk-animate">
                <div class="pk-badge">Let's Connect</div>
                <h2 class="pk-section-title" style="margin-bottom:12px;">Let's Work<br>Together</h2>
                <p style="color:var(--muted);font-size:15px;margin-bottom:36px;line-height:1.75;">
                    Have a project in mind? I'd love to hear about it. Fill in the form and I'll get back to you within 24 hours.
                </p>

                <div class="pk-contact-info-item">
                    <div class="pk-contact-icon">📍</div>
                    <div>
                        <h6>Address</h6>
                        <p>WZ-239, Gali No.3, Guru Nanak Nagar MBS Nagar, Sant Garh, Delhi-110018</p>
                    </div>
                </div>

                <div class="pk-contact-info-item">
                    <div class="pk-contact-icon">📞</div>
                    <div>
                        <h6>Phone</h6>
                        <p><a href="tel:+919315917780">+91 9315917780</a> &nbsp;|&nbsp; Mon–Fri 9AM to 6PM</p>
                    </div>
                </div>

                <div class="pk-contact-info-item">
                    <div class="pk-contact-icon">📧</div>
                    <div>
                        <h6>Email</h6>
                        <p><a href="mailto:support@techportfolio.com">support@techportfolio.com</a></p>
                        <p>Send us your query anytime!</p>
                    </div>
                </div>

                <!-- Social links -->
                <div style="margin-top:24px;">
                    <p style="font-size:12px;color:var(--muted);text-transform:uppercase;letter-spacing:2px;font-weight:600;margin-bottom:14px;">Follow Me</p>
                    <div class="pk-social-row">
                        <a href="#" class="pk-social-btn">fb</a>
                        <a href="#" class="pk-social-btn">tw</a>
                        <a href="#" class="pk-social-btn">in</a>
                        <a href="#" class="pk-social-btn">GH</a>
                    </div>
                </div>
            </div>

            <!-- RIGHT: Contact form — action points to MyController.saveContact() -->
            <div class="pk-animate pk-delay-2">
                <div class="pk-form-card">
                    <h3 class="pk-form-title">Send a Message</h3>
                    <p class="pk-form-subtitle">Fill in the form below. I'll respond within 24 hours.</p>

                    <form action="${pageContext.request.contextPath}/client/saveContact"
                          method="post" id="pk-contact-form" novalidate>

                        <div class="pk-form-row">
                            <!-- Name -->
                            <div class="pk-form-group">
                                <label for="pk-field-name">Full Name</label>
                                <c:forEach var="err" items="${errors}">
                                    <c:if test="${err.field=='name'}">
                                        <span class="pk-field-error" id="pk-err-name">⚠ ${err.defaultMessage}</span>
                                    </c:if>
                                </c:forEach>
                                <input type="text" id="pk-field-name" name="name"
                                       placeholder="Dharmendra Kumar"
                                       style="<c:forEach var='err' items='${errors}'><c:if test='${err.field==\"name\"}'>border-color:var(--accent3);</c:if></c:forEach>">
                            </div>

                            <!-- Email -->
                            <div class="pk-form-group">
                                <label for="pk-field-email">Email Address</label>
                                <c:forEach var="err" items="${errors}">
                                    <c:if test="${err.field=='email'}">
                                        <span class="pk-field-error" id="pk-err-email">⚠ ${err.defaultMessage}</span>
                                    </c:if>
                                </c:forEach>
                                <input type="email" id="pk-field-email" name="email"
                                       placeholder="name@email.com"
                                       style="<c:forEach var='err' items='${errors}'><c:if test='${err.field==\"email\"}'>border-color:var(--accent3);</c:if></c:forEach>">
                            </div>
                        </div>

                        <!-- Subject -->
                        <div class="pk-form-group">
                            <label for="pk-field-subject">Subject</label>
                            <c:forEach var="err" items="${errors}">
                                <c:if test="${err.field=='subject'}">
                                    <span class="pk-field-error" id="pk-err-subject">⚠ ${err.defaultMessage}</span>
                                </c:if>
                            </c:forEach>
                            <input type="text" id="pk-field-subject" name="subject"
                                   placeholder="Project Enquiry / Freelance Work"
                                   style="<c:forEach var='err' items='${errors}'><c:if test='${err.field==\"subject\"}'>border-color:var(--accent3);</c:if></c:forEach>">
                        </div>

                        <!-- Message -->
                        <div class="pk-form-group">
                            <label for="pk-field-message">Message</label>
                            <c:forEach var="err" items="${errors}">
                                <c:if test="${err.field=='message'}">
                                    <span class="pk-field-error" id="pk-err-message">⚠ ${err.defaultMessage}</span>
                                </c:if>
                            </c:forEach>
                            <textarea id="pk-field-message" name="message" rows="5"
                                      placeholder="Tell me about your project..."
                                      style="<c:forEach var='err' items='${errors}'><c:if test='${err.field==\"message\"}'>border-color:var(--accent3);</c:if></c:forEach>"></textarea>
                        </div>

                        <button type="submit" class="pk-btn pk-btn-primary" style="width:100%;justify-content:center;font-size:15px;padding:15px;">
                            Send Message →
                        </button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</section>

<%@include file="footer.jsp"%>
</body>
</html>
