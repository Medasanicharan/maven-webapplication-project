<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.net.*" %>

<%
InetAddress inetAddress = InetAddress.getLocalHost();
String serverIP = inetAddress.getHostAddress();
String serverHostName = inetAddress.getHostName();


String clientIP = request.getRemoteAddr();
String clientHostName = request.getRemoteHost();

%>

<!DOCTYPE html>

<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">


<title>DevSecOps.CloudnAI | M CHARAN</title>

<link href="images/devops.jpg" rel="icon">

<!-- Bootstrap -->
<link
    href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
    rel="stylesheet">

<!-- Google Font -->
<link
    href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap"
    rel="stylesheet">

<style>

    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
    }

    body {
        font-family: 'Inter', sans-serif;
        background: #070b14;
        color: #ffffff;
        min-height: 100vh;
    }

    /* =========================
       NAVBAR
    ========================== */

    .navbar {
        background: rgba(7, 11, 20, 0.85);
        backdrop-filter: blur(15px);
        border-bottom: 1px solid rgba(255,255,255,0.08);
        padding: 18px 0;
    }

    .navbar-brand {
        font-size: 22px;
        font-weight: 800;
        color: #ffffff !important;
    }

    .navbar-brand span {
        color: #00d4ff;
    }

    .nav-link {
        color: #b8c1d1 !important;
        margin-left: 25px;
        transition: 0.3s;
    }

    .nav-link:hover {
        color: #00d4ff !important;
    }

    /* =========================
       HERO
    ========================== */

    .hero {
        min-height: 560px;
        display: flex;
        align-items: center;
        position: relative;
        overflow: hidden;
        background:
            radial-gradient(circle at 15% 20%, rgba(0,212,255,0.15), transparent 30%),
            radial-gradient(circle at 85% 30%, rgba(123,97,255,0.18), transparent 30%),
            #070b14;
    }

    .hero-content {
        max-width: 900px;
        margin: auto;
        text-align: center;
        position: relative;
        z-index: 2;
    }

    .badge-custom {
        display: inline-block;
        padding: 8px 18px;
        border-radius: 50px;
        background: rgba(0,212,255,0.10);
        border: 1px solid rgba(0,212,255,0.3);
        color: #00d4ff;
        font-size: 14px;
        font-weight: 600;
        margin-bottom: 25px;
    }

    .hero h1 {
        font-size: clamp(42px, 7vw, 78px);
        font-weight: 800;
        line-height: 1.05;
        margin-bottom: 25px;
    }

    .gradient-text {
        background: linear-gradient(
            90deg,
            #00d4ff,
            #6c63ff,
            #b36cff
        );
        -webkit-background-clip: text;
        -webkit-text-fill-color: transparent;
    }

    .hero p {
        color: #aeb7c7;
        font-size: 19px;
        max-width: 720px;
        margin: auto;
        line-height: 1.7;
    }

    .hero-buttons {
        margin-top: 35px;
    }

    .btn-primary-custom {
        background: linear-gradient(90deg, #007bff, #00c6ff);
        border: none;
        padding: 14px 28px;
        border-radius: 10px;
        color: white;
        font-weight: 600;
        text-decoration: none;
        display: inline-block;
        margin: 5px;
        transition: 0.3s;
    }

    .btn-primary-custom:hover {
        transform: translateY(-3px);
        box-shadow: 0 10px 30px rgba(0,198,255,0.25);
        color: white;
    }

    .btn-outline-custom {
        border: 1px solid rgba(255,255,255,0.2);
        padding: 14px 28px;
        border-radius: 10px;
        color: white;
        text-decoration: none;
        display: inline-block;
        margin: 5px;
        transition: 0.3s;
    }

    .btn-outline-custom:hover {
        background: rgba(255,255,255,0.08);
        color: white;
    }

    /* =========================
       SECTION
    ========================== */

    .section {
        padding: 80px 0;
    }

    .section-title {
        text-align: center;
        margin-bottom: 50px;
    }

    .section-title h2 {
        font-size: 36px;
        font-weight: 800;
    }

    .section-title p {
        color: #8994a8;
        margin-top: 10px;
    }

    /* =========================
       CARDS
    ========================== */

    .glass-card {
        height: 100%;
        background: rgba(255,255,255,0.04);
        border: 1px solid rgba(255,255,255,0.08);
        border-radius: 18px;
        padding: 28px;
        transition: 0.35s;
        backdrop-filter: blur(12px);
    }

    .glass-card:hover {
        transform: translateY(-7px);
        border-color: rgba(0,212,255,0.35);
        box-shadow: 0 20px 50px rgba(0,0,0,0.25);
    }

    .card-icon {
        width: 55px;
        height: 55px;
        display: flex;
        align-items: center;
        justify-content: center;
        border-radius: 14px;
        background: rgba(0,212,255,0.1);
        font-size: 25px;
        margin-bottom: 20px;
    }

    .glass-card h4 {
        font-weight: 700;
        margin-bottom: 12px;
    }

    .glass-card p {
        color: #919caf;
        margin-bottom: 0;
    }

    /* =========================
       SERVER DASHBOARD
    ========================== */

    .info-value {
        color: #00d4ff;
        font-size: 17px;
        font-weight: 600;
        word-break: break-word;
    }

    .info-label {
        color: #7e899d;
        font-size: 13px;
        text-transform: uppercase;
        letter-spacing: 1px;
        margin-bottom: 5px;
    }

    .status {
        display: inline-flex;
        align-items: center;
        gap: 7px;
        padding: 6px 12px;
        border-radius: 50px;
        background: rgba(25, 210, 120, 0.1);
        color: #29dc88;
        font-size: 13px;
        font-weight: 600;
    }

    .status-dot {
        width: 8px;
        height: 8px;
        background: #29dc88;
        border-radius: 50%;
    }

    /* =========================
       TECHNOLOGIES
    ========================== */

    .tech-card {
        text-align: center;
        padding: 25px;
        background: rgba(255,255,255,0.035);
        border: 1px solid rgba(255,255,255,0.07);
        border-radius: 15px;
        transition: 0.3s;
    }

    .tech-card:hover {
        transform: translateY(-5px);
        background: rgba(255,255,255,0.07);
    }

    .tech-icon {
        font-size: 35px;
        margin-bottom: 12px;
    }

    .tech-card h6 {
        font-weight: 600;
        margin: 0;
    }

    /* =========================
       PROFILE
    ========================== */

    .profile-card {
        max-width: 850px;
        margin: auto;
        text-align: center;
        padding: 45px;
        background:
            linear-gradient(
                145deg,
                rgba(0,212,255,0.08),
                rgba(108,99,255,0.08)
            );
        border: 1px solid rgba(255,255,255,0.1);
        border-radius: 25px;
    }

    .profile-image {
        width: 125px;
        height: 125px;
        object-fit: cover;
        border-radius: 50%;
        border: 4px solid rgba(0,212,255,0.5);
        margin-bottom: 20px;
    }

    .profile-card h3 {
        font-weight: 800;
    }

    .profile-card p {
        color: #a3adbd;
    }

    .contact-info {
        margin: 20px 0;
        line-height: 2;
    }

    .contact-info a {
        color: #00d4ff;
        text-decoration: none;
    }

    /* =========================
       SERVICES
    ========================== */

    .service-card {
        padding: 30px;
        border-radius: 18px;
        background: linear-gradient(
            145deg,
            rgba(255,255,255,0.05),
            rgba(255,255,255,0.02)
        );
        border: 1px solid rgba(255,255,255,0.08);
        height: 100%;
    }

    .service-card h4 {
        font-weight: 700;
    }

    .service-card p {
        color: #8d98aa;
        line-height: 1.7;
    }

    /* =========================
       FOOTER
    ========================== */

    footer {
        border-top: 1px solid rgba(255,255,255,0.08);
        padding: 35px 0;
        text-align: center;
        color: #6f7a8d;
        background: #050810;
    }

    footer strong {
        color: #ffffff;
    }

    footer a {
        color: #00d4ff;
        text-decoration: none;
    }

    /* =========================
       RESPONSIVE
    ========================== */

    @media(max-width: 768px) {

        .hero {
            min-height: 500px;
        }

        .hero h1 {
            font-size: 45px;
        }

        .hero p {
            font-size: 16px;
        }

        .section {
            padding: 55px 0;
        }

        .profile-card {
            padding: 30px 20px;
        }

        .nav-link {
            margin-left: 0;
        }
    }

</style>


</head>

<body>

<!-- =========================
     NAVIGATION
========================== -->

<nav class="navbar navbar-expand-lg navbar-dark sticky-top">


<div class="container">

    <a class="navbar-brand" href="#">
        DevSecOps<span>.CloudnAI</span>
    </a>

    <button
        class="navbar-toggler"
        type="button"
        data-bs-toggle="collapse"
        data-bs-target="#navbarNav">

        <span class="navbar-toggler-icon"></span>

    </button>

    <div class="collapse navbar-collapse" id="navbarNav">

        <ul class="navbar-nav ms-auto">

            <li class="nav-item">
                <a class="nav-link" href="#about">About</a>
            </li>

            <li class="nav-item">
                <a class="nav-link" href="#infrastructure">Infrastructure</a>
            </li>

            <li class="nav-item">
                <a class="nav-link" href="#services">Services</a>
            </li>

            <li class="nav-item">
                <a class="nav-link" href="#contact">Contact</a>
            </li>

        </ul>

    </div>

</div>


</nav>

<!-- =========================
     HERO
========================== -->

<section class="hero" id="about">


<div class="container">

    <div class="hero-content">

        <div class="badge-custom">
            ⚡ CLOUD • DEVOPS • DEVSECOPS • AIOPS
        </div>

        <h1>
            Build.
            <span class="gradient-text">Automate.</span>
            Secure.
        </h1>

        <p>
            Welcome to the DevSecOps.CloudnAI platform —
            where cloud infrastructure, automation, security,
            Kubernetes and modern DevOps practices come together.
        </p>

        <div class="hero-buttons">

            <a
                href="services/employee/getEmployeeDetails"
                class="btn-primary-custom">

                🚀 Get Employee Details

            </a>

            <a
                href="#infrastructure"
                class="btn-outline-custom">

                Explore Infrastructure →

            </a>

        </div>

    </div>

</div>


</section>

<!-- =========================
     INFRASTRUCTURE
========================== -->

<section class="section" id="infrastructure">


<div class="container">

    <div class="section-title">

        <h2>Infrastructure Dashboard</h2>

        <p>
            Real-time information from your application server
        </p>

    </div>


    <div class="row g-4">

        <!-- Server -->

        <div class="col-lg-6">

            <div class="glass-card">

                <div class="card-icon">
                    🖥️
                </div>

                <h4>Server Information</h4>

                <hr>

                <div class="row g-4">

                    <div class="col-sm-6">

                        <div class="info-label">
                            Host Name
                        </div>

                        <div class="info-value">
                            <%= serverHostName %>
                        </div>

                    </div>

                    <div class="col-sm-6">

                        <div class="info-label">
                            Server IP
                        </div>

                        <div class="info-value">
                            <%= serverIP %>
                        </div>

                    </div>

                    <div class="col-12">

                        <span class="status">

                            <span class="status-dot"></span>

                            Application Server Online

                        </span>

                    </div>

                </div>

            </div>

        </div>


        <!-- Client -->

        <div class="col-lg-6">

            <div class="glass-card">

                <div class="card-icon">
                    🌐
                </div>

                <h4>Client Information</h4>

                <hr>

                <div class="row g-4">

                    <div class="col-sm-6">

                        <div class="info-label">
                            Client IP
                        </div>

                        <div class="info-value">
                            <%= clientIP %>
                        </div>

                    </div>

                    <div class="col-sm-6">

                        <div class="info-label">
                            Client Host
                        </div>

                        <div class="info-value">
                            <%= clientHostName %>
                        </div>

                    </div>

                    <div class="col-12">

                        <span class="status">

                            <span class="status-dot"></span>

                            Client Connected

                        </span>

                    </div>

                </div>

            </div>

        </div>

    </div>

</div>


</section>

<!-- =========================
     TECHNOLOGIES
========================== -->

<section class="section">


<div class="container">

    <div class="section-title">

        <h2>DevOps Technology Stack</h2>

        <p>
            Technologies used across modern cloud-native environments
        </p>

    </div>


    <div class="row g-3">

        <div class="col-6 col-md-3">
            <div class="tech-card">
                <div class="tech-icon">☁️</div>
                <h6>AWS Cloud</h6>
            </div>
        </div>

        <div class="col-6 col-md-3">
            <div class="tech-card">
                <div class="tech-icon">🐳</div>
                <h6>Docker</h6>
            </div>
        </div>

        <div class="col-6 col-md-3">
            <div class="tech-card">
                <div class="tech-icon">☸️</div>
                <h6>Kubernetes</h6>
            </div>
        </div>

        <div class="col-6 col-md-3">
            <div class="tech-card">
                <div class="tech-icon">🔧</div>
                <h6>Terraform</h6>
            </div>
        </div>

        <div class="col-6 col-md-3">
            <div class="tech-card">
                <div class="tech-icon">🔄</div>
                <h6>Jenkins</h6>
            </div>
        </div>

        <div class="col-6 col-md-3">
            <div class="tech-card">
                <div class="tech-icon">🐙</div>
                <h6>GitHub</h6>
            </div>
        </div>

        <div class="col-6 col-md-3">
            <div class="tech-card">
                <div class="tech-icon">🛡️</div>
                <h6>DevSecOps</h6>
            </div>
        </div>

        <div class="col-6 col-md-3">
            <div class="tech-card">
                <div class="tech-icon">🤖</div>
                <h6>AIOps</h6>
            </div>
        </div>

    </div>

</div>


</section>

<!-- =========================
     SERVICES
========================== -->

<section class="section" id="services">


<div class="container">

    <div class="section-title">

        <h2>What We Do</h2>

        <p>
            Cloud and DevOps solutions for modern engineering teams
        </p>

    </div>


    <div class="row g-4">

        <div class="col-md-4">

            <div class="service-card">

                <div class="card-icon">
                    ☁️
                </div>

                <h4>Cloud Engineering</h4>

                <p>
                    Design and automate scalable AWS cloud
                    infrastructure using modern cloud-native
                    architecture.
                </p>

            </div>

        </div>


        <div class="col-md-4">

            <div class="service-card">

                <div class="card-icon">
                    🚀
                </div>

                <h4>DevOps Automation</h4>

                <p>
                    Build CI/CD pipelines, infrastructure automation,
                    container platforms and reliable deployment
                    workflows.
                </p>

            </div>

        </div>


        <div class="col-md-4">

            <div class="service-card">

                <div class="card-icon">
                    🛡️
                </div>

                <h4>DevSecOps</h4>

                <p>
                    Integrate security into the software delivery
                    lifecycle with automated scanning and secure
                    cloud practices.
                </p>

            </div>

        </div>

    </div>

</div>


</section>

<!-- =========================
     PROFILE / CONTACT
========================== -->

<section class="section" id="contact">


<div class="container">

    <div class="profile-card">

        <img
            src="images/devops.jpg"
            alt="M CHARAN"
            class="profile-image">

        <h3>M CHARAN</h3>

        <p>
            Cloud • DevOps • DevSecOps • AIOps
        </p>

        <div class="contact-info">

            <div>
                📍 <strong>Whitefield, Bangalore</strong>
            </div>

            <div>
                📞
                <a href="tel:+919876543210">
                    +91-9876543210
                </a>
            </div>

            <div>
                ✉️
                <a href="mailto:devsecopscloudnai@gmail.com">
                    devsecopscloudnai@gmail.com
                </a>
            </div>

        </div>

        <a
            href="mailto:devsecopscloudnai@gmail.com"
            class="btn-primary-custom">

            ✉️ Contact M CHARAN

        </a>

    </div>

</div>


</section>

<!-- =========================
     FOOTER
========================== -->

<footer>


<div class="container">

    <p>
        © 2026
        <strong>DevSecOps.CloudnAI</strong>
        — M CHARAN
    </p>

    <p>
        Cloud • DevOps • DevSecOps • AIOps
    </p>

    <small>
        Built with Java • JSP • Bootstrap
    </small>

</div>


</footer>

<!-- Bootstrap JS -->

<script
    src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js">
</script>

</body>

</html>
