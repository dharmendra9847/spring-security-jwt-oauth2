<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@taglib prefix="c" uri="jakarta.tags.core"%>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="icon" href="${pageContext.request.contextPath}/img/favicon.png" type="image/png">
    <title>Services — Dharmendra Kumar</title>
</head>
<body>

<%@include file="header.jsp"%>

<!-- PAGE BANNER -->
<section class="pk-page-banner">
    <div class="pk-banner-glow"></div>
    <div class="container">
        <div class="pk-banner-content pk-animate">
            <div class="pk-badge" style="justify-content:center;">What I Offer</div>
            <h2>Services</h2>
            <div class="pk-breadcrumb">
                <a href="${pageContext.request.contextPath}/client/home">Home</a>
                <span>/</span>
                <span>Services</span>
            </div>
        </div>
    </div>
</section>

<!-- SERVICES GRID — populated by Spring model: listOfServices -->
<section class="section_gap_top section_gap_bottom">
    <div class="container">
        <div style="text-align:center;margin-bottom:64px;" class="pk-animate">
            <div class="pk-badge" style="justify-content:center;">Portfolio</div>
            <h2 class="pk-section-title">Service Offers</h2>
            <p style="color:var(--muted);max-width:520px;margin:0 auto;font-size:16px;line-height:1.75;">
                Is give may shall likeness made yielding spirit a itself togeth created
                after sea — is in beast beginning signs open god you're gathering ithe.
            </p>
        </div>

        <c:choose>
            <c:when test="${not empty listOfServices}">
                <div class="pk-services-grid">
                    <c:forEach var="service" items="${listOfServices}" varStatus="status">
                        <div class="pk-service-card pk-animate pk-delay-${(status.index % 3) + 1}">
                            <div class="pk-service-num">0${status.index + 1}</div>
                            <!-- Service image from DB -->
                            <img
                                class="pk-service-img"
                                src="${pageContext.request.contextPath}/img/services/${service.filename}"
                                alt="${service.title}"
                                onerror="this.style.display='none'">
                            <h3>${service.title}</h3>
                            <p>${service.description}</p>
                        </div>
                    </c:forEach>
                </div>
            </c:when>
            <c:otherwise>
                <div style="text-align:center;padding:80px 0;color:var(--muted);">
                    <div style="font-size:48px;margin-bottom:16px;">🛠</div>
                    <p style="font-size:16px;">No services added yet. Check back soon!</p>
                </div>
            </c:otherwise>
        </c:choose>
    </div>
</section>

<!-- TESTIMONIALS -->
<section class="section_gap_bottom" style="background:var(--bg2);">
    <div class="container">
        <div style="text-align:center;margin-bottom:56px;" class="pk-animate">
            <div class="pk-badge" style="justify-content:center;">Testimonials</div>
            <h2 class="pk-section-title">Client Say About Me</h2>
        </div>
        <div class="pk-testi-grid">
            <div class="pk-testi-card pk-animate pk-delay-1">
                <div class="pk-quote">"</div>
                <p>Him, made can't called over won't there on divide there male fish beast own his day third seed sixth seas unto. Saw from where we started to the end.</p>
                <div class="pk-testi-author">
                    <div class="pk-testi-avatar">EM</div>
                    <div><h5>Elite Martin</h5><span>Product Manager</span></div>
                </div>
            </div>
            <div class="pk-testi-card pk-animate pk-delay-2">
                <div class="pk-quote">"</div>
                <p>Him, made can't called over won't there on divide there male fish beast own his day third seed sixth seas unto. Exceptional quality and delivery.</p>
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
