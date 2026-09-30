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

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>DevSecOps.CloudnAI | M CHARAN</title>

    <link rel="icon" href="images/devops.jpg">

    <link rel="preconnect"
          href="https://fonts.googleapis.com">

    <link rel="preconnect"
          href="https://fonts.gstatic.com"
          crossorigin>

    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800;900&family=JetBrains+Mono:wght@400;500;600&display=swap"
          rel="stylesheet">


<style>

/* =========================================================
   GLOBAL
========================================================= */

* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

html {
    scroll-behavior: smooth;
}

body {
    background: #03050a;
    color: #ffffff;
    font-family: 'Inter', sans-serif;
    overflow-x: hidden;
}

a {
    text-decoration: none;
    color: inherit;
}


/* =========================================================
   CURSOR GLOW
========================================================= */

.cursor-glow {
    position: fixed;
    width: 450px;
    height: 450px;
    border-radius: 50%;

    background: radial-gradient(
        circle,
        rgba(0, 255, 200, 0.07),
        transparent 65%
    );

    pointer-events: none;

    transform: translate(-50%, -50%);

    z-index: 0;
}


/* =========================================================
   BACKGROUND GRID
========================================================= */

.background-grid {

    position: fixed;

    inset: 0;

    z-index: -2;

    background-image:

        linear-gradient(
            rgba(255,255,255,0.025) 1px,
            transparent 1px
        ),

        linear-gradient(
            90deg,
            rgba(255,255,255,0.025) 1px,
            transparent 1px
        );

    background-size: 55px 55px;

    mask-image: linear-gradient(
        to bottom,
        black,
        transparent 90%
    );
}


/* =========================================================
   NAVIGATION
========================================================= */

nav {

    position: fixed;

    top: 0;

    width: 100%;

    z-index: 100;

    padding: 22px 6%;

    display: flex;

    justify-content: space-between;

    align-items: center;

    backdrop-filter: blur(15px);

    background: rgba(3,5,10,0.65);

    border-bottom: 1px solid rgba(255,255,255,0.06);
}

.logo {

    font-size: 20px;

    font-weight: 800;

    letter-spacing: -0.5px;
}

.logo span {

    color: #00ffc3;
}

.nav-links {

    display: flex;

    gap: 35px;

    color: #8992a3;

    font-size: 14px;

    font-weight: 500;
}

.nav-links a {

    transition: 0.3s;
}

.nav-links a:hover {

    color: #00ffc3;
}


/* =========================================================
   HERO
========================================================= */

.hero {

    min-height: 100vh;

    padding: 150px 7% 80px;

    display: flex;

    align-items: center;

    position: relative;

    overflow: hidden;
}

.hero-container {

    width: 100%;

    max-width: 1400px;

    margin: auto;

    display: grid;

    grid-template-columns: 1.1fr 0.9fr;

    gap: 80px;

    align-items: center;
}


/* LEFT SIDE */

.eyebrow {

    font-family: 'JetBrains Mono', monospace;

    color: #00ffc3;

    font-size: 13px;

    letter-spacing: 3px;

    margin-bottom: 25px;
}

.hero h1 {

    font-size: clamp(
        55px,
        7vw,
        105px
    );

    line-height: 0.95;

    letter-spacing: -6px;

    font-weight: 900;

    max-width: 850px;
}

.hero h1 .outline {

    color: transparent;

    -webkit-text-stroke: 1px rgba(255,255,255,0.4);
}

.hero h1 .green {

    color: #00ffc3;
}

.hero-description {

    max-width: 650px;

    margin-top: 35px;

    color: #8d96a7;

    font-size: 18px;

    line-height: 1.8;
}


/* BUTTONS */

.hero-buttons {

    margin-top: 40px;

    display: flex;

    gap: 15px;

    flex-wrap: wrap;
}

.primary-button {

    padding: 15px 25px;

    background: #00ffc3;

    color: #020504;

    border-radius: 5px;

    font-weight: 700;

    transition: 0.3s;
}

.primary-button:hover {

    transform: translateY(-4px);

    box-shadow:
        0 10px 40px rgba(0,255,195,0.25);
}

.secondary-button {

    padding: 15px 25px;

    border: 1px solid rgba(255,255,255,0.15);

    border-radius: 5px;

    color: #ffffff;

    transition: 0.3s;
}

.secondary-button:hover {

    border-color: #00ffc3;

    color: #00ffc3;
}


/* =========================================================
   INFRASTRUCTURE VISUAL
========================================================= */

.infra-visual {

    position: relative;

    height: 500px;

    display: flex;

    align-items: center;

    justify-content: center;
}

.orbit {

    position: absolute;

    width: 420px;

    height: 420px;

    border: 1px solid rgba(0,255,195,0.15);

    border-radius: 50%;

    animation: rotate 25s linear infinite;
}

.orbit::before {

    content: "";

    position: absolute;

    width: 12px;

    height: 12px;

    background: #00ffc3;

    border-radius: 50%;

    top: -6px;

    left: 50%;

    box-shadow:
        0 0 25px #00ffc3;
}

.orbit-two {

    width: 300px;

    height: 300px;

    animation-duration: 18s;

    animation-direction: reverse;
}

.orbit-three {

    width: 190px;

    height: 190px;

    animation-duration: 12s;
}

@keyframes rotate {

    from {
        transform: rotate(0deg);
    }

    to {
        transform: rotate(360deg);
    }
}


.core {

    width: 145px;

    height: 145px;

    border-radius: 50%;

    display: flex;

    align-items: center;

    justify-content: center;

    flex-direction: column;

    background:
        radial-gradient(
            circle,
            rgba(0,255,195,0.15),
            #070b11
        );

    border: 1px solid rgba(0,255,195,0.5);

    box-shadow:
        0 0 80px rgba(0,255,195,0.12);

    z-index: 5;
}

.core-icon {

    font-size: 45px;

    margin-bottom: 5px;
}

.core-text {

    font-family: 'JetBrains Mono', monospace;

    font-size: 11px;

    color: #00ffc3;

    letter-spacing: 2px;
}


/* FLOATING TECH */

.tech-node {

    position: absolute;

    padding: 10px 15px;

    background: rgba(7,11,17,0.85);

    border: 1px solid rgba(255,255,255,0.1);

    backdrop-filter: blur(10px);

    font-family: 'JetBrains Mono', monospace;

    font-size: 12px;

    color: #b8c1cf;

    border-radius: 4px;
}

.node-one {

    top: 55px;

    right: 20px;
}

.node-two {

    bottom: 65px;

    right: 30px;
}

.node-three {

    bottom: 40px;

    left: 5px;
}

.node-four {

    top: 80px;

    left: 15px;
}


/* =========================================================
   SECTION
========================================================= */

section {

    padding: 120px 7%;

    position: relative;
}

.section-container {

    max-width: 1400px;

    margin: auto;
}

.section-tag {

    font-family: 'JetBrains Mono', monospace;

    color: #00ffc3;

    font-size: 12px;

    letter-spacing: 3px;

    margin-bottom: 20px;
}

.section-heading {

    font-size: clamp(
        38px,
        5vw,
        70px
    );

    letter-spacing: -3px;

    font-weight: 800;

    max-width: 800px;
}

.section-description {

    margin-top: 20px;

    color: #7e8798;

    max-width: 650px;

    line-height: 1.8;
}


/* =========================================================
   PIPELINE
========================================================= */

.pipeline {

    margin-top: 70px;

    display: grid;

    grid-template-columns:
        repeat(5, 1fr);

    border-top: 1px solid rgba(255,255,255,0.1);

    border-bottom: 1px solid rgba(255,255,255,0.1);
}

.pipeline-step {

    padding: 35px 25px;

    border-right: 1px solid rgba(255,255,255,0.08);

    transition: 0.3s;
}

.pipeline-step:last-child {

    border-right: none;
}

.pipeline-step:hover {

    background: rgba(0,255,195,0.03);
}

.step-number {

    font-family: 'JetBrains Mono', monospace;

    color: #596273;

    font-size: 12px;

    margin-bottom: 30px;
}

.step-icon {

    font-size: 32px;

    margin-bottom: 20px;
}

.pipeline-step h3 {

    font-size: 18px;

    margin-bottom: 10px;
}

.pipeline-step p {

    color: #737d8e;

    font-size: 13px;

    line-height: 1.7;
}


/* =========================================================
   TECHNOLOGIES
========================================================= */

.tech-grid {

    margin-top: 60px;

    display: grid;

    grid-template-columns:
        repeat(4, 1fr);

    gap: 1px;

    background: rgba(255,255,255,0.08);

    border: 1px solid rgba(255,255,255,0.08);
}

.tech {

    min-height: 170px;

    padding: 30px;

    background: #03050a;

    transition: 0.3s;
}

.tech:hover {

    background: #07120f;
}

.tech-number {

    color: #3e4654;

    font-family: 'JetBrains Mono', monospace;

    font-size: 11px;
}

.tech h3 {

    margin-top: 35px;

    font-size: 20px;
}

.tech p {

    color: #687284;

    font-size: 13px;

    margin-top: 8px;
}


/* =========================================================
   LIVE SERVER SECTION
========================================================= */

.server-section {

    background:
        linear-gradient(
            180deg,
            #03050a,
            #050a0d,
            #03050a
        );
}

.server-layout {

    margin-top: 65px;

    display: grid;

    grid-template-columns:
        1fr 1fr;

    gap: 25px;
}

.server-box {

    padding: 35px;

    border: 1px solid rgba(255,255,255,0.08);

    background:
        linear-gradient(
            135deg,
            rgba(255,255,255,0.035),
            rgba(255,255,255,0.01)
        );
}

.server-header {

    display: flex;

    justify-content: space-between;

    align-items: center;

    margin-bottom: 30px;
}

.server-title {

    font-family: 'JetBrains Mono', monospace;

    font-size: 13px;

    color: #aeb6c5;
}

.online {

    color: #00ffc3;

    font-family: 'JetBrains Mono', monospace;

    font-size: 11px;
}

.online::before {

    content: "";

    display: inline-block;

    width: 7px;

    height: 7px;

    border-radius: 50%;

    background: #00ffc3;

    margin-right: 8px;

    box-shadow:
        0 0 10px #00ffc3;
}

.server-data {

    display: grid;

    grid-template-columns:
        1fr 1fr;

    gap: 25px;
}

.data-label {

    color: #5f6878;

    font-family: 'JetBrains Mono', monospace;

    font-size: 10px;

    text-transform: uppercase;

    letter-spacing: 1px;

    margin-bottom: 8px;
}

.data-value {

    color: #e4e8ee;

    font-family: 'JetBrains Mono', monospace;

    font-size: 14px;

    word-break: break-word;
}


/* =========================================================
   PROFILE
========================================================= */

.profile {

    display: grid;

    grid-template-columns:
        0.7fr 1.3fr;

    gap: 80px;

    align-items: center;

    margin-top: 70px;
}

.profile-image-container {

    position: relative;

    display: flex;

    justify-content: center;
}

.profile-image {

    width: 280px;

    height: 280px;

    object-fit: cover;

    border-radius: 8px;

    filter: grayscale(15%);

    border: 1px solid rgba(0,255,195,0.3);

    box-shadow:
        20px 20px 0 rgba(0,255,195,0.08);
}

.profile-name {

    font-size: 50px;

    font-weight: 800;

    letter-spacing: -3px;
}

.profile-role {

    color: #00ffc3;

    font-family: 'JetBrains Mono', monospace;

    margin-top: 10px;

    font-size: 14px;
}

.profile-description {

    color: #7d8798;

    line-height: 1.8;

    margin-top: 25px;

    max-width: 650px;
}

.contact-row {

    margin-top: 30px;

    display: flex;

    flex-wrap: wrap;

    gap: 12px;
}

.contact-link {

    padding: 10px 15px;

    border: 1px solid rgba(255,255,255,0.1);

    font-family: 'JetBrains Mono', monospace;

    font-size: 11px;

    color: #9ba5b5;

    transition: 0.3s;
}

.contact-link:hover {

    color: #00ffc3;

    border-color: rgba(0,255,195,0.4);
}


/* =========================================================
   CTA
========================================================= */

.cta {

    text-align: center;

    padding: 150px 7%;

    background:
        radial-gradient(
            circle at center,
            rgba(0,255,195,0.08),
            transparent 45%
        );
}

.cta h2 {

    font-size: clamp(
        45px,
        7vw,
        90px
    );

    letter-spacing: -5px;

    font-weight: 900;
}

.cta h2 span {

    color: #00ffc3;
}

.cta p {

    color: #737d8d;

    margin: 25px auto 35px;

    max-width: 550px;

    line-height: 1.8;
}


/* =========================================================
   FOOTER
========================================================= */

footer {

    padding: 35px 7%;

    border-top: 1px solid rgba(255,255,255,0.07);

    display: flex;

    justify-content: space-between;

    align-items: center;

    color: #505968;

    font-family: 'JetBrains Mono', monospace;

    font-size: 11px;
}

.footer-brand {

    color: #ffffff;

    font-weight: 600;
}

.footer-brand span {

    color: #00ffc3;
}


/* =========================================================
   RESPONSIVE
========================================================= */

@media(max-width: 1000px) {

    .hero-container {

        grid-template-columns: 1fr;

    }

    .infra-visual {

        height: 400px;

    }

    .pipeline {

        grid-template-columns:
            repeat(2, 1fr);

    }

    .pipeline-step {

        border-bottom:
            1px solid rgba(255,255,255,0.08);

    }

    .tech-grid {

        grid-template-columns:
            repeat(2, 1fr);

    }

    .profile {

        grid-template-columns: 1fr;

        text-align: center;

    }

    .profile-description {

        margin-left: auto;

        margin-right: auto;

    }

    .contact-row {

        justify-content: center;

    }

}

@media(max-width: 600px) {

    nav {

        padding: 18px 5%;

    }

    .nav-links {

        display: none;

    }

    .hero {

        padding-left: 5%;

        padding-right: 5%;

    }

    .hero h1 {

        letter-spacing: -3px;

    }

    section {

        padding: 80px 5%;

    }

    .pipeline {

        grid-template-columns: 1fr;

    }

    .tech-grid {

        grid-template-columns: 1fr;

    }

    .server-layout {

        grid-template-columns: 1fr;

    }

    .server-data {

        grid-template-columns: 1fr;

    }

    .orbit {

        width: 300px;

        height: 300px;

    }

    .orbit-two {

        width: 220px;

        height: 220px;

    }

    .orbit-three {

        width: 140px;

        height: 140px;

    }

    .profile-name {

        font-size: 38px;

    }

    footer {

        flex-direction: column;

        gap: 10px;

        text-align: center;

    }

}

</style>

</head>


<body>


<!-- BACKGROUND -->

<div class="background-grid"></div>

<div class="cursor-glow" id="cursorGlow"></div>


<!-- ======================================================
     NAVIGATION
======================================================= -->

<nav>

    <div class="logo">
        DevSecOps<span>.CloudnAI</span>
    </div>

    <div class="nav-links">

        <a href="#platform">
            Platform
        </a>

        <a href="#technology">
            Technology
        </a>

        <a href="#infrastructure">
            Infrastructure
        </a>

        <a href="#contact">
            Contact
        </a>

    </div>

</nav>


<!-- ======================================================
     HERO
======================================================= -->

<section class="hero">

    <div class="hero-container">


        <!-- LEFT -->

        <div>

            <div class="eyebrow">
                SYSTEM / CLOUD / AUTOMATION
            </div>


            <h1>

                CODE

                <span class="outline">
                    TO
                </span>

                <span class="green">
                    CLOUD
                </span>

                <br>

                WITHOUT

                <span class="outline">
                    LIMITS
                </span>

            </h1>


            <p class="hero-description">

                Engineering modern infrastructure with
                cloud automation, DevSecOps practices,
                containers, Kubernetes and continuous delivery.

            </p>


            <div class="hero-buttons">

                <a
                    href="#infrastructure"
                    class="primary-button">

                    Explore Platform →

                </a>


                <a
                    href="services/employee/getEmployeeDetails"
                    class="secondary-button">

                    View Employee API

                </a>

            </div>

        </div>


        <!-- RIGHT VISUAL -->

        <div class="infra-visual">


            <div class="orbit"></div>

            <div class="orbit orbit-two"></div>

            <div class="orbit orbit-three"></div>


            <div class="core">

                <div class="core-icon">
                    ☁
                </div>

                <div class="core-text">
                    CLOUD
                </div>

            </div>


            <div class="tech-node node-one">
                AWS
            </div>

            <div class="tech-node node-two">
                KUBERNETES
            </div>

            <div class="tech-node node-three">
                TERRAFORM
            </div>

            <div class="tech-node node-four">
                CI/CD
            </div>


        </div>

    </div>

</section>


<!-- ======================================================
     PLATFORM
======================================================= -->

<section id="platform">

    <div class="section-container">

        <div class="section-tag">
            01 / DELIVERY PIPELINE
        </div>

        <h2 class="section-heading">

            From a single commit
            to a running workload.

        </h2>

        <p class="section-description">

            A modern engineering workflow connects source
            code, automation, security, infrastructure and
            production deployment into one continuous flow.

        </p>


        <div class="pipeline">


            <div class="pipeline-step">

                <div class="step-number">
                    01
                </div>

                <div class="step-icon">
                    🧑‍💻
                </div>

                <h3>
                    CODE
                </h3>

                <p>
                    Developers commit and push changes
                    through Git-based workflows.
                </p>

            </div>


            <div class="pipeline-step">

                <div class="step-number">
                    02
                </div>

                <div class="step-icon">
                    ⚙️
                </div>

                <h3>
                    BUILD
                </h3>

                <p>
                    Automated pipelines compile,
                    package and validate applications.
                </p>

            </div>


            <div class="pipeline-step">

                <div class="step-number">
                    03
                </div>

                <div class="step-icon">
                    🛡️
                </div>

                <h3>
                    SECURE
                </h3>

                <p>
                    Security checks become part of
                    the software delivery lifecycle.
                </p>

            </div>


            <div class="pipeline-step">

                <div class="step-number">
                    04
                </div>

                <div class="step-icon">
                    🏗️
                </div>

                <h3>
                    PROVISION
                </h3>

                <p>
                    Infrastructure is created and
                    managed using Infrastructure as Code.
                </p>

            </div>


            <div class="pipeline-step">

                <div class="step-number">
                    05
                </div>

                <div class="step-icon">
                    🚀
                </div>

                <h3>
                    DEPLOY
                </h3>

                <p>
                    Applications move into cloud-native
                    runtime environments.
                </p>

            </div>


        </div>

    </div>

</section>


<!-- ======================================================
     TECHNOLOGY
======================================================= -->

<section id="technology">

    <div class="section-container">

        <div class="section-tag">
            02 / ENGINEERING STACK
        </div>

        <h2 class="section-heading">

            The tools behind
            the infrastructure.

        </h2>


        <div class="tech-grid">


            <div class="tech">

                <div class="tech-number">
                    01
                </div>

                <h3>
                    AWS
                </h3>

                <p>
                    Cloud infrastructure
                </p>

            </div>


            <div class="tech">

                <div class="tech-number">
                    02
                </div>

                <h3>
                    Kubernetes
                </h3>

                <p>
                    Container orchestration
                </p>

            </div>


            <div class="tech">

                <div class="tech-number">
                    03
                </div>

                <h3>
                    Terraform
                </h3>

                <p>
                    Infrastructure as Code
                </p>

            </div>


            <div class="tech">

                <div class="tech-number">
                    04
                </div>

                <h3>
                    Docker
                </h3>

                <p>
                    Container platform
                </p>

            </div>


            <div class="tech">

                <div class="tech-number">
                    05
                </div>

                <h3>
                    Jenkins
                </h3>

                <p>
                    Continuous Integration
                </p>

            </div>


            <div class="tech">

                <div class="tech-number">
                    06
                </div>

                <h3>
                    GitHub
                </h3>

                <p>
                    Source control & collaboration
                </p>

            </div>


            <div class="tech">

                <div class="tech-number">
                    07
                </div>

                <h3>
                    DevSecOps
                </h3>

                <p>
                    Security-driven delivery
                </p>

            </div>


            <div class="tech">

                <div class="tech-number">
                    08
                </div>

                <h3>
                    AIOps
                </h3>

                <p>
                    Intelligent operations
                </p>

            </div>


        </div>

    </div>

</section>


<!-- ======================================================
     LIVE INFRASTRUCTURE
======================================================= -->

<section
    id="infrastructure"
    class="server-section">

    <div class="section-container">

        <div class="section-tag">
            03 / LIVE ENVIRONMENT
        </div>

        <h2 class="section-heading">

            This page is running
            somewhere.

        </h2>

        <p class="section-description">

            And you can see exactly where the application
            request is being processed.

        </p>


        <div class="server-layout">


            <!-- SERVER -->

            <div class="server-box">

                <div class="server-header">

                    <div class="server-title">
                        APPLICATION SERVER
                    </div>

                    <div class="online">
                        ONLINE
                    </div>

                </div>


                <div class="server-data">


                    <div>

                        <div class="data-label">
                            Host Name
                        </div>

                        <div class="data-value">
                            <%= serverHostName %>
                        </div>

                    </div>


                    <div>

                        <div class="data-label">
                            Server IP
                        </div>

                        <div class="data-value">
                            <%= serverIP %>
                        </div>

                    </div>


                </div>

            </div>


            <!-- CLIENT -->

            <div class="server-box">

                <div class="server-header">

                    <div class="server-title">
                        CLIENT REQUEST
                    </div>

                    <div class="online">
                        CONNECTED
                    </div>

                </div>


                <div class="server-data">


                    <div>

                        <div class="data-label">
                            Client IP
                        </div>

                        <div class="data-value">
                            <%= clientIP %>
                        </div>

                    </div>


                    <div>

                        <div class="data-label">
                            Client Host
                        </div>

                        <div class="data-value">
                            <%= clientHostName %>
                        </div>

                    </div>


                </div>

            </div>


        </div>

    </div>

</section>


<!-- ======================================================
     PROFILE
======================================================= -->

<section id="contact">

    <div class="section-container">


        <div class="section-tag">
            04 / ENGINEER
        </div>


        <div class="profile">


            <div class="profile-image-container">

                <img
                    src="images/devops.jpg"
                    alt="M CHARAN"
                    class="profile-image">

            </div>


            <div>

                <h2 class="profile-name">
                    M CHARAN
                </h2>


                <div class="profile-role">

                    CLOUD / DEVOPS / DEVSECOPS / AIOPS

                </div>


                <p class="profile-description">

                    Building, automating and operating modern
                    cloud infrastructure with a focus on
                    reliability, security and continuous delivery.

                    <br><br>

                    DevSecOps.CloudnAI is a technology platform
                    focused on practical cloud engineering,
                    automation and DevOps learning.

                </p>


                <div class="contact-row">


                    <a
                        href="mailto:devsecopscloudnai@gmail.com"
                        class="contact-link">

                        EMAIL

                    </a>


                    <a
                        href="tel:+919876543210"
                        class="contact-link">

                        PHONE

                    </a>


                    <a
                        href="services/employee/getEmployeeDetails"
                        class="contact-link">

                        EMPLOYEE API

                    </a>


                </div>

            </div>


        </div>

    </div>

</section>


<!-- ======================================================
     CTA
======================================================= -->

<section class="cta">

    <h2>

        BUILD

        <span>
            SOMETHING
        </span>

        REAL.

    </h2>


    <p>

        Learn cloud. Automate infrastructure.
        Secure the pipeline. Deploy with confidence.

    </p>


    <a
        href="services/employee/getEmployeeDetails"
        class="primary-button">

        Enter the Platform →

    </a>

</section>


<!-- ======================================================
     FOOTER
======================================================= -->

<footer>

    <div>

        <span class="footer-brand">
            DevSecOps<span>.CloudnAI</span>
        </span>

        &nbsp; / &nbsp;

        M CHARAN

    </div>


    <div>

        © 2026

    </div>

</footer>


<!-- ======================================================
     JAVASCRIPT
======================================================= -->

<script>

    /*
     * Mouse-following glow
     */

    const glow =
        document.getElementById("cursorGlow");

    document.addEventListener(
        "mousemove",
        function(event) {

            glow.style.left =
                event.clientX + "px";

            glow.style.top =
                event.clientY + "px";

        }
    );


    /*
     * Small reveal animation
     */

    const elements =
        document.querySelectorAll(
            ".pipeline-step, .tech, .server-box"
        );


    const observer =
        new IntersectionObserver(
            function(entries) {

                entries.forEach(
                    function(entry) {

                        if (entry.isIntersecting) {

                            entry.target.style.opacity = "1";

                            entry.target.style.transform =
                                "translateY(0)";

                        }

                    }
                );

            },
            {
                threshold: 0.15
            }
        );


    elements.forEach(
        function(element) {

            element.style.opacity = "0";

            element.style.transform =
                "translateY(25px)";

            element.style.transition =
                "all 0.7s ease";

            observer.observe(element);

        }
    );

</script>


</body>

</html>
