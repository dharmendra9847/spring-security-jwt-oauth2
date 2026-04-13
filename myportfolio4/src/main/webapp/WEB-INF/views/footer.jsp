<%-- ============================================================
     footer.jsp  —  src/main/webapp/WEB-INF/views/footer.jsp
     ============================================================ --%>
<footer class="pk-footer">
    <div class="container">
        <div class="pk-footer-top">
            <!-- Brand -->
            <div class="pk-footer-brand">
                <a href="${pageContext.request.contextPath}/client/home" class="pk-logo" style="font-size:22px;">DK<span>.</span></a>
                <p>Full Stack Java Developer crafting scalable, high-performance web solutions. Let's build something great together.</p>
                <div class="pk-social-row">
                    <a href="#" class="pk-social-btn" title="LinkedIn">in</a>
                    <a href="#" class="pk-social-btn" title="GitHub">GH</a>
                    <a href="#" class="pk-social-btn" title="Twitter">tw</a>
                    <a href="#" class="pk-social-btn" title="YouTube">▶</a>
                </div>
            </div>
            <!-- Navigation -->
            <div class="pk-footer-col">
                <h5>Navigation</h5>
                <ul>
                    <li><a href="${pageContext.request.contextPath}/client/home">Home</a></li>
                    <li><a href="${pageContext.request.contextPath}/client/about">About Me</a></li>
                    <li><a href="${pageContext.request.contextPath}/client/services">Services</a></li>
                    <li><a href="${pageContext.request.contextPath}/client/contact">Contact</a></li>
                </ul>
            </div>
            <!-- Services -->
            <div class="pk-footer-col">
                <h5>Services</h5>
                <ul>
                    <li><a href="#">Web Development</a></li>
                    <li><a href="#">API Development</a></li>
                    <li><a href="#">UI/UX Design</a></li>
                    <li><a href="#">Database Design</a></li>
                    <li><a href="#">Code Review</a></li>
                </ul>
            </div>
            <!-- Contact -->
            <div class="pk-footer-col">
                <h5>Contact</h5>
                <ul>
                    <li><a href="tel:+919315917780">+91 9315917780</a></li>
                    <li><a href="mailto:support@techportfolio.com">support@techportfolio.com</a></li>
                    <li><a href="#">Delhi, India</a></li>
                    <li><a href="#">Mon–Fri: 9am – 6pm</a></li>
                </ul>
            </div>
        </div>

        <div class="pk-footer-bottom">
            <span>© <script>document.write(new Date().getFullYear());</script> Dharmendra Kumar. All rights reserved.</span>
            <span>Built with ♥ using <a href="#">Spring Boot</a> &amp; Modern Frontend</span>
        </div>
    </div>
</footer>

<!-- ── JS ── -->
<script src="${pageContext.request.contextPath}/js/portfolio.js"></script>
