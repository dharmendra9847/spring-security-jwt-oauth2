/* ============================================================
   portfolio.js  —  Place in: src/main/webapp/js/portfolio.js
   ============================================================ */

(function () {
  "use strict";

  /* ── NAVBAR SCROLL ── */
  var navbar = document.querySelector(".pk-header");
  function handleScroll() {
    if (!navbar) return;
    navbar.classList.toggle("scrolled", window.scrollY > 60);
  }
  window.addEventListener("scroll", handleScroll, { passive: true });

  /* ── ACTIVE NAV LINK ── */
  function setActiveNav() {
    var path = window.location.pathname;
    document.querySelectorAll(".pk-nav-links li").forEach(function (li) {
      li.classList.remove("active");
    });
    document.querySelectorAll(".pk-nav-links li a").forEach(function (a) {
      var href = a.getAttribute("href") || "";
      if (
        (path.includes("/home") && href.includes("/home")) ||
        (path.includes("/about") && href.includes("/about")) ||
        (path.includes("/services") && href.includes("/services")) ||
        (path.includes("/contact") && href.includes("/contact"))
      ) {
        a.closest("li").classList.add("active");
      }
    });
  }
  setActiveNav();

  /* ── MOBILE MENU ── */
  var hamburger = document.getElementById("pk-hamburger");
  var mobileMenu = document.getElementById("pk-mobile-menu");
  if (hamburger && mobileMenu) {
    hamburger.addEventListener("click", function () {
      mobileMenu.classList.toggle("open");
    });
  }

  /* ── SCROLL-REVEAL ANIMATIONS ── */
  if ("IntersectionObserver" in window) {
    var revealObserver = new IntersectionObserver(
      function (entries) {
        entries.forEach(function (e) {
          if (e.isIntersecting) {
            e.target.classList.add("pk-visible");
            revealObserver.unobserve(e.target);
          }
        });
      },
      { threshold: 0.1, rootMargin: "0px 0px -40px 0px" }
    );
    document.querySelectorAll(".pk-animate").forEach(function (el) {
      revealObserver.observe(el);
    });
  } else {
    document.querySelectorAll(".pk-animate").forEach(function (el) {
      el.classList.add("pk-visible");
    });
  }

  /* ── COUNTER ANIMATION ── */
  function animateCounter(el) {
    var target = parseInt(el.dataset.target, 10);
    var duration = 1600;
    var start = null;
    function step(ts) {
      if (!start) start = ts;
      var progress = Math.min((ts - start) / duration, 1);
      var eased = 1 - Math.pow(1 - progress, 3);
      el.textContent = Math.floor(eased * target);
      if (progress < 1) requestAnimationFrame(step);
      else el.textContent = target;
    }
    requestAnimationFrame(step);
  }
  if ("IntersectionObserver" in window) {
    var counterObserver = new IntersectionObserver(
      function (entries) {
        entries.forEach(function (e) {
          if (e.isIntersecting) {
            animateCounter(e.target);
            counterObserver.unobserve(e.target);
          }
        });
      },
      { threshold: 0.5 }
    );
    document.querySelectorAll("[data-target]").forEach(function (el) {
      counterObserver.observe(el);
    });
  }

  /* ── SIMPLE TESTIMONIAL SLIDER ── */
  var slider = document.querySelector(".pk-testi-track");
  if (slider) {
    var items = slider.querySelectorAll(".pk-testi-slide");
    var idx = 0;
    var total = items.length;
    var prev = document.getElementById("pk-testi-prev");
    var next = document.getElementById("pk-testi-next");
    var dots = document.querySelectorAll(".pk-testi-dot");

    function showSlide(i) {
      items.forEach(function (el, j) {
        el.style.display = j === i ? "block" : "none";
      });
      dots.forEach(function (d, j) {
        d.classList.toggle("active", j === i);
      });
    }
    showSlide(0);
    if (next) next.addEventListener("click", function () { idx = (idx + 1) % total; showSlide(idx); });
    if (prev) prev.addEventListener("click", function () { idx = (idx - 1 + total) % total; showSlide(idx); });
    dots.forEach(function (d, j) { d.addEventListener("click", function () { idx = j; showSlide(idx); }); });
    setInterval(function () { idx = (idx + 1) % total; showSlide(idx); }, 5000);
  }

  /* ── CONTACT FORM CLIENT VALIDATION (backup; server validates too) ── */
  var contactForm = document.getElementById("pk-contact-form");
  if (contactForm) {
    contactForm.addEventListener("submit", function (e) {
      var valid = true;
      var fields = [
        { id: "name",    minLen: 3,  maxLen: 30,  type: "text" },
        { id: "email",   minLen: 3,  maxLen: 40,  type: "email" },
        { id: "subject", minLen: 5,  maxLen: 50,  type: "text" },
        { id: "message", minLen: 10, maxLen: 1000, type: "text" }
      ];
      fields.forEach(function (f) {
        var el = document.getElementById("pk-field-" + f.id);
        var err = document.getElementById("pk-err-" + f.id);
        if (!el) return;
        var val = el.value.trim();
        var ok = val.length >= f.minLen && val.length <= f.maxLen;
        if (f.type === "email") ok = ok && /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(val);
        if (err) err.style.display = ok ? "none" : "block";
        el.style.borderColor = ok ? "" : "var(--accent3)";
        if (!ok) valid = false;
      });
      if (!valid) e.preventDefault();
    });
  }

  /* ── SMOOTH SCROLL FOR ANCHOR LINKS ── */
  document.querySelectorAll('a[href^="#"]').forEach(function (a) {
    a.addEventListener("click", function (e) {
      var target = document.querySelector(a.getAttribute("href"));
      if (target) {
        e.preventDefault();
        target.scrollIntoView({ behavior: "smooth", block: "start" });
      }
    });
  });

  /* ── PAGE LOAD ANIMATION ── */
  document.addEventListener("DOMContentLoaded", function () {
    document.body.style.opacity = "0";
    document.body.style.transition = "opacity 0.4s";
    requestAnimationFrame(function () {
      document.body.style.opacity = "1";
    });
  });

})();
