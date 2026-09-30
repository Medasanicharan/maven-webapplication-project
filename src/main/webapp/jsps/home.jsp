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

    <title>DevSecOps.CloudnAI | Cloud Engineering</title>

    <style>

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        html {
            scroll-behavior: smooth;
        }

        body {
            font-family: Inter, Arial, Helvetica, sans-serif;
            background: #f5f7fb;
            color: #101828;
            overflow-x: hidden;
        }

        /* =========================
           BACKGROUND
        ========================== */

        body::before {
            content: "";
            position: fixed;
            inset: 0;
            pointer-events: none;
            background:
                radial-gradient(circle at 15% 10%, rgba(99,102,241,.12), transparent 25%),
                radial-gradient(circle at 85% 25%, rgba(6,182,212,.10), transparent 25%),
                radial-gradient(circle at 50% 90%, rgba(168,85,247,.08), transparent 25%);
            z-index: -2;
        }

        .grid {
            position: fixed;
            inset: 0;
            background-image:
                linear-gradient(rgba(15,23,42,.035) 1px, transparent 1px),
                linear-gradient(90deg, rgba(15,23,42,.035) 1px, transparent 1px);
            background-size: 55px 55px;
            pointer-events: none;
            z-index: -1;
        }

        /* =========================
           NAVBAR
        ========================== */

        nav {
            width: 100%;
            padding: 22px 7%;
            display: flex;
            align-items: center;
            justify-content: space-between;
            position: absolute;
            top: 0;
            z-index: 20;
        }

        .brand {
            display: flex;
            align-items: center;
            gap: 12px;
            font-weight: 800;
            font-size: 18px;
            letter-spacing: -.5px;
        }

        .brand-mark {
            width: 38px;
            height: 38px;
            border-radius: 12px;
            background: #111827;
            color: white;
            display: grid;
            place-items: center;
            box-shadow: 0 10px 30px rgba(15,23,42,.18);
        }

        .brand-mark span {
            font-size: 16px;
        }

        .nav-links {
            display: flex;
            gap: 30px;
            align-items: center;
        }

        .nav-links a {
            text-decoration: none;
            color: #475467;
            font-size: 14px;
            font-weight: 600;
            transition: .25s;
        }

        .nav-links a:hover {
            color: #4f46e5;
        }

        .nav-btn {
            background: #111827 !important;
            color: white !important;
            padding: 11px 18px;
            border-radius: 12px;
        }

        /* =========================
           HERO
        ========================== */

        .hero {
            min-height: 900px;
            padding: 150px 7% 100px;
            display: grid;
            grid-template-columns: 44% 56%;
            align-items: center;
            gap: 20px;
        }

        .hero-content {
            position: relative;
            z-index: 5;
        }

        .eyebrow {
            display: inline-flex;
            align-items: center;
            gap: 8px;
            padding: 8px 13px;
            border-radius: 30px;
            background: white;
            border: 1px solid #e4e7ec;
            color: #475467;
            font-size: 12px;
            font-weight: 700;
            box-shadow: 0 8px 30px rgba(15,23,42,.05);
            margin-bottom: 25px;
        }

        .status-dot {
            width: 8px;
            height: 8px;
            border-radius: 50%;
            background: #12b76a;
            box-shadow: 0 0 0 5px rgba(18,183,106,.12);
        }

        h1 {
            font-size: clamp(52px, 6vw, 88px);
            line-height: .95;
            letter-spacing: -5px;
            max-width: 700px;
            margin-bottom: 28px;
        }

        h1 .gradient {
            background: linear-gradient(
                90deg,
                #4f46e5,
                #7c3aed,
                #0891b2
            );
            -webkit-background-clip: text;
            color: transparent;
        }

        .hero-description {
            max-width: 580px;
            color: #667085;
            font-size: 18px;
            line-height: 1.7;
            margin-bottom: 35px;
        }

        .hero-actions {
            display: flex;
            gap: 14px;
            flex-wrap: wrap;
        }

        .primary-btn,
        .secondary-btn {
            text-decoration: none;
            padding: 15px 23px;
            border-radius: 13px;
            font-weight: 700;
            font-size: 14px;
            transition: .3s;
        }

        .primary-btn {
            background: #111827;
            color: white;
            box-shadow: 0 15px 35px rgba(17,24,39,.18);
        }

        .primary-btn:hover {
            transform: translateY(-3px);
            box-shadow: 0 20px 45px rgba(17,24,39,.25);
        }

        .secondary-btn {
            background: white;
            color: #344054;
            border: 1px solid #e4e7ec;
        }

        .secondary-btn:hover {
            transform: translateY(-3px);
            border-color: #98a2b3;
        }

        /* =========================
           INFRASTRUCTURE VISUAL
        ========================== */

        .network-stage {
            position: relative;
            width: 100%;
            height: 610px;
        }

        .network-card {
            position: absolute;
            inset: 40px 20px 40px 30px;
            background: rgba(255,255,255,.70);
            border: 1px solid rgba(255,255,255,.9);
            backdrop-filter: blur(25px);
            border-radius: 40px;
            box-shadow:
                0 40px 100px rgba(15,23,42,.10),
                inset 0 1px 0 white;
            overflow: hidden;
        }

        .network-card::before {
            content: "";
            position: absolute;
            width: 500px;
            height: 500px;
            border-radius: 50%;
            background: radial-gradient(
                circle,
                rgba(79,70,229,.15),
                transparent 65%
            );
            top: 40px;
            left: 50%;
            transform: translateX(-50%);
        }

        .network-label {
            position: absolute;
            top: 22px;
            left: 25px;
            font-size: 11px;
            text-transform: uppercase;
            letter-spacing: 2px;
            color: #98a2b3;
            font-weight: 800;
        }

        /* SVG */

        .network-svg {
            position: absolute;
            inset: 0;
            width: 100%;
            height: 100%;
        }

        .connection {
            fill: none;
            stroke: #c7d2fe;
            stroke-width: 2;
            stroke-dasharray: 7 9;
            animation: dash 12s linear infinite;
        }

        @keyframes dash {
            to {
                stroke-dashoffset: -300;
            }
        }

        /* CORE */

        .core {
            position: absolute;
            left: 50%;
            top: 50%;
            transform: translate(-50%,-50%);
            width: 150px;
            height: 150px;
            border-radius: 50%;
            background: #111827;
            color: white;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            box-shadow:
                0 0 0 15px rgba(79,70,229,.05),
                0 0 0 35px rgba(79,70,229,.025),
                0 30px 80px rgba(17,24,39,.30);
            z-index: 4;
        }

        .core strong {
            font-size: 14px;
            letter-spacing: -.3px;
        }

        .core small {
            margin-top: 7px;
            color: #98a2b3;
            font-size: 9px;
            letter-spacing: 1.5px;
        }

        .core::after {
            content: "";
            position: absolute;
            inset: -12px;
            border-radius: 50%;
            border: 1px solid rgba(79,70,229,.35);
            animation: pulse 2.5s ease-in-out infinite;
        }

        @keyframes pulse {
            50% {
                transform: scale(1.08);
                opacity: .3;
            }
        }

        /* NODE */

        .node {
            position: absolute;
            width: 125px;
            min-height: 75px;
            background: rgba(255,255,255,.9);
            border: 1px solid #eaecf0;
            border-radius: 18px;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            box-shadow: 0 15px 40px rgba(15,23,42,.08);
            z-index: 5;
            transition: .3s;
        }

        .node:hover {
            transform: translateY(-7px) scale(1.03);
            box-shadow: 0 25px 50px rgba(15,23,42,.14);
        }

        .node-icon {
            font-size: 21px;
            margin-bottom: 6px;
        }

        .node-name {
            font-size: 11px;
            font-weight: 800;
            color: #344054;
        }

        .node-status {
            font-size: 8px;
            color: #12b76a;
            margin-top: 3px;
            font-weight: 700;
        }

        .node-code {
            left: 8%;
            top: 18%;
        }

        .node-build {
            right: 8%;
            top: 18%;
        }

        .node-security {
            left: 4%;
            top: 62%;
        }

        .node-cloud {
            right: 4%;
            top: 62%;
        }

        .node-k8s {
            left: 50%;
            top: 7%;
            transform: translateX(-50%);
        }

        .node-k8s:hover {
            transform: translateX(-50%) translateY(-7px) scale(1.03);
        }

        /* Floating chips */

        .floating-chip {
            position: absolute;
            background: white;
            padding: 10px 14px;
            border-radius: 12px;
            font-size: 10px;
            font-weight: 800;
            box-shadow: 0 12px 30px rgba(15,23,42,.10);
            border: 1px solid #eaecf0;
            z-index: 7;
        }

        .chip-one {
            right: 0;
            top: 43%;
        }

        .chip-two {
            left: 1%;
            top: 42%;
        }

        /* =========================
           SECTION
        ========================== */

        .section {
            padding: 110px 7%;
        }

        .section-heading {
            max-width: 700px;
            margin-bottom: 55px;
        }

        .section-heading span {
            color: #6366f1;
            font-size: 12px;
            font-weight: 800;
            letter-spacing: 2px;
            text-transform: uppercase;
        }

        .section-heading h2 {
            font-size: clamp(38px, 4vw, 60px);
            line-height: 1;
            letter-spacing: -3px;
            margin-top: 12px;
        }

        .section-heading p {
            margin-top: 20px;
            color: #667085;
            line-height: 1.7;
        }

        /* =========================
           PIPELINE
        ========================== */

        .pipeline {
            background: #111827;
            border-radius: 35px;
            padding: 45px;
            color: white;
            overflow: hidden;
            position: relative;
        }

        .pipeline::after {
            content: "";
            position: absolute;
            width: 400px;
            height: 400px;
            border-radius: 50%;
            background: rgba(79,70,229,.20);
            filter: blur(80px);
            right: -100px;
            top: -150px;
        }

        .pipeline-flow {
            display: grid;
            grid-template-columns: repeat(5, 1fr);
            gap: 15px;
            position: relative;
            z-index: 2;
        }

        .stage {
            padding: 25px 18px;
            border: 1px solid rgba(255,255,255,.1);
            background: rgba(255,255,255,.04);
            border-radius: 20px;
            min-height: 150px;
            transition: .3s;
        }

        .stage:hover {
            background: rgba(255,255,255,.08);
            transform: translateY(-5px);
        }

        .stage-number {
            font-size: 11px;
            color: #98a2b3;
            margin-bottom: 25px;
        }

        .stage-icon {
            font-size: 25px;
            margin-bottom: 12px;
        }

        .stage h3 {
            font-size: 15px;
            margin-bottom: 7px;
        }

        .stage p {
            font-size: 11px;
            color: #98a2b3;
            line-height: 1.5;
        }

        /* =========================
           TERMINAL
        ========================== */

        .terminal-section {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 50px;
            align-items: center;
        }

        .terminal {
            background: #0b1220;
            border-radius: 25px;
            padding: 25px;
            box-shadow: 0 30px 80px rgba(15,23,42,.15);
            color: #d1d5db;
            font-family: "Courier New", monospace;
            font-size: 13px;
            line-height: 2;
            min-height: 330px;
        }

        .terminal-header {
            display: flex;
            gap: 7px;
            margin-bottom: 18px;
        }

        .terminal-dot {
            width: 9px;
            height: 9px;
            border-radius: 50%;
            background: #667085;
        }

        .terminal-line {
            opacity: 0;
            animation: terminalShow .5s forwards;
        }

        .terminal-line:nth-child(2) {
            animation-delay: .4s;
        }

        .terminal-line:nth-child(3) {
            animation-delay: .9s;
        }

        .terminal-line:nth-child(4) {
            animation-delay: 1.4s;
        }

        .terminal-line:nth-child(5) {
            animation-delay: 1.9s;
        }

        .terminal-line:nth-child(6) {
            animation-delay: 2.4s;
        }

        @keyframes terminalShow {
            to {
                opacity: 1;
            }
        }

        .green {
            color: #4ade80;
        }

        .blue {
            color: #60a5fa;
        }

        .purple {
            color: #c084fc;
        }

        .terminal-info h2 {
            font-size: 48px;
            letter-spacing: -2px;
            line-height: 1.05;
            margin-bottom: 20px;
        }

        .terminal-info p {
            color: #667085;
            line-height: 1.7;
        }

        /* =========================
           LIVE ENVIRONMENT
        ========================== */

        .environment {
            display: grid;
            grid-template-columns: repeat(3,1fr);
            gap: 20px;
        }

        .env-card {
            background: white;
            border: 1px solid #eaecf0;
            padding: 25px;
            border-radius: 22px;
            transition: .3s;
        }

        .env-card:hover {
            transform: translateY(-6px);
            box-shadow: 0 20px 50px rgba(15,23,42,.08);
        }

        .env-top {
            display: flex;
            justify-content: space-between;
            margin-bottom: 30px;
        }

        .env-title {
            font-weight: 800;
        }

        .live {
            color: #12b76a;
            font-size: 10px;
            font-weight: 800;
        }

        .env-value {
            font-size: 20px;
            font-weight: 800;
            margin-bottom: 6px;
        }

        .env-label {
            color: #98a2b3;
            font-size: 11px;
        }

        /* =========================
           PROFILE
        ========================== */

        .profile {
            background: #111827;
            border-radius: 35px;
            padding: 50px;
            color: white;
            display: grid;
            grid-template-columns: 120px 1fr auto;
            gap: 30px;
            align-items: center;
        }

        .profile-image {
            width: 110px;
            height: 110px;
            border-radius: 25px;
            overflow: hidden;
            border: 1px solid rgba(255,255,255,.15);
        }

        .profile-image img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        .profile h2 {
            font-size: 30px;
            margin-bottom: 7px;
        }

        .profile p {
            color: #98a2b3;
            line-height: 1.6;
            font-size: 13px;
        }

        .profile-btn {
            padding: 14px 22px;
            border-radius: 12px;
            background: white;
            color: #111827;
            text-decoration: none;
            font-weight: 800;
            font-size: 13px;
            white-space: nowrap;
        }

        /* =========================
           FOOTER
        ========================== */

        footer {
            padding: 50px 7%;
            border-top: 1px solid #eaecf0;
            display: flex;
            justify-content: space-between;
            align-items: center;
            color: #98a2b3;
            font-size: 12px;
        }

        /* =========================
           REVEAL
        ========================== */

        .reveal {
            opacity: 0;
            transform: translateY(35px);
            transition: 1s ease;
        }

        .reveal.show {
            opacity: 1;
            transform: translateY(0);
        }

        /* =========================
           RESPONSIVE
        ========================== */

        @media(max-width:1000px) {

            .hero {
                grid-template-columns: 1fr;
                padding-top: 130px;
            }

            .hero-content {
                text-align: center;
            }

            .hero-description {
                margin-left: auto;
                margin-right: auto;
            }

            .hero-actions {
                justify-content: center;
            }

            .network-stage {
                margin-top: 30px;
            }

            .pipeline-flow {
                grid-template-columns: repeat(2,1fr);
            }

            .terminal-section {
                grid-template-columns: 1fr;
            }

            .environment {
                grid-template-columns: 1fr;
            }

            .profile {
                grid-template-columns: 1fr;
                text-align: center;
                justify-items: center;
            }
        }

        @media(max-width:650px) {

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

            h1 {
                font-size: 50px;
                letter-spacing: -3px;
            }

            .network-stage {
                height: 500px;
            }

            .network-card {
                inset: 20px 0;
            }

            .node {
                width: 90px;
                min-height: 60px;
            }

            .node-code {
                left: 2%;
            }

            .node-build {
                right: 2%;
            }

            .node-security {
                left: 0;
            }

            .node-cloud {
                right: 0;
            }

            .core {
                width: 115px;
                height: 115px;
            }

            .floating-chip {
                display: none;
            }

            .section {
                padding: 75px 5%;
            }

            .pipeline {
                padding: 25px;
            }

            .pipeline-flow {
                grid-template-columns: 1fr;
            }

            .profile {
                padding: 35px 25px;
            }

            footer {
                flex-direction: column;
                gap: 15px;
            }
        }

    </style>
</head>

<body>

<div class="grid"></div>

<!-- =========================
     NAVIGATION
========================= -->

<nav>

    <div class="brand">
        <div class="brand-mark">
            <span>⌘</span>
        </div>

        <span>DevSecOps.CloudnAI</span>
    </div>

    <div class="nav-links">

        <a href="#architecture">Architecture</a>
        <a href="#pipeline">Pipeline</a>
        <a href="#runtime">Runtime</a>
        <a href="#about">About</a>

        <a
            class="nav-btn"
            href="services/employee/getEmployeeDetails">
            Explore
        </a>

    </div>

</nav>


<!-- =========================
     HERO
========================= -->

<section class="hero">

    <div class="hero-content">

        <div class="eyebrow">
            <span class="status-dot"></span>
            CLOUD INFRASTRUCTURE ONLINE
        </div>

        <h1>
            From
            <span class="gradient">commit</span>
            to
            <span class="gradient">cloud.</span>
        </h1>

        <p class="hero-description">

            A modern DevSecOps engineering environment where
            code, automation, security, infrastructure and
            Kubernetes come together as one continuous flow.

        </p>

        <div class="hero-actions">

            <a
                href="services/employee/getEmployeeDetails"
                class="primary-btn">

                Explore Platform →

            </a>

            <a
                href="#architecture"
                class="secondary-btn">

                View Architecture

            </a>

        </div>

    </div>


    <!-- NETWORK VISUAL -->

    <div class="network-stage">

        <div class="network-card">

            <div class="network-label">
                LIVE INFRASTRUCTURE MAP
            </div>


            <svg class="network-svg"
                 viewBox="0 0 700 600"
                 preserveAspectRatio="none">

                <path
                    class="connection"
                    d="M130 160 C250 210, 300 260, 350 300"/>

                <path
                    class="connection"
                    d="M570 160 C470 210, 420 260, 350 300"/>

                <path
                    class="connection"
                    d="M100 400 C220 360, 280 330, 350 300"/>

                <path
                    class="connection"
                    d="M600 400 C480 360, 420 330, 350 300"/>

                <path
                    class="connection"
                    d="M350 100 C350 180, 350 230, 350 300"/>

            </svg>


            <!-- CORE -->

            <div class="core">

                <strong>CloudnAI</strong>

                <small>
                    ENGINE
                </small>

            </div>


            <!-- NODES -->

            <div class="node node-code">

                <div class="node-icon">⌘</div>

                <div class="node-name">
                    SOURCE
                </div>

                <div class="node-status">
                    ● CONNECTED
                </div>

            </div>


            <div class="node node-build">

                <div class="node-icon">⚙</div>

                <div class="node-name">
                    CI / CD
                </div>

                <div class="node-status">
                    ● RUNNING
                </div>

            </div>


            <div class="node node-security">

                <div class="node-icon">◈</div>

                <div class="node-name">
                    SECURITY
                </div>

                <div class="node-status">
                    ● PASSED
                </div>

            </div>


            <div class="node node-cloud">

                <div class="node-icon">☁</div>

                <div class="node-name">
                    AWS CLOUD
                </div>

                <div class="node-status">
                    ● HEALTHY
                </div>

            </div>


            <div class="node node-k8s">

                <div class="node-icon">◉</div>

                <div class="node-name">
                    KUBERNETES
                </div>

                <div class="node-status">
                    ● READY
                </div>

            </div>


            <div class="floating-chip chip-one">
                Terraform · IaC
            </div>

            <div class="floating-chip chip-two">
                Docker · Containers
            </div>

        </div>

    </div>

</section>


<!-- =========================
     ARCHITECTURE
========================= -->

<section
    class="section reveal"
    id="architecture">

    <div class="section-heading">

        <span>Engineering Flow</span>

        <h2>
            One flow.<br>
            Multiple layers.
        </h2>

        <p>
            Every stage of modern application delivery connects
            to the next — from source control to production
            infrastructure.
        </p>

    </div>


    <div class="pipeline" id="pipeline">

        <div class="pipeline-flow">

            <div class="stage">

                <div class="stage-number">
                    01
                </div>

                <div class="stage-icon">
                    ⌘
                </div>

                <h3>CODE</h3>

                <p>
                    Git & GitHub source management.
                </p>

            </div>


            <div class="stage">

                <div class="stage-number">
                    02
                </div>

                <div class="stage-icon">
                    ⚙
                </div>

                <h3>BUILD</h3>

                <p>
                    Maven, CI pipelines and artifacts.
                </p>

            </div>


            <div class="stage">

                <div class="stage-number">
                    03
                </div>

                <div class="stage-icon">
                    ◈
                </div>

                <h3>SECURE</h3>

                <p>
                    Quality and security validation.
                </p>

            </div>


            <div class="stage">

                <div class="stage-number">
                    04
                </div>

                <div class="stage-icon">
                    △
                </div>

                <h3>PROVISION</h3>

                <p>
                    Terraform-powered infrastructure.
                </p>

            </div>


            <div class="stage">

                <div class="stage-number">
                    05
                </div>

                <div class="stage-icon">
                    ☁
                </div>

                <h3>DEPLOY</h3>

                <p>
                    Containers and Kubernetes workloads.
                </p>

            </div>

        </div>

    </div>

</section>


<!-- =========================
     TERMINAL
========================= -->

<section class="section reveal">

    <div class="terminal-section">

        <div class="terminal">

            <div class="terminal-header">

                <span class="terminal-dot"></span>
                <span class="terminal-dot"></span>
                <span class="terminal-dot"></span>

            </div>

            <div class="terminal-line blue">
                $ git push origin main
            </div>

            <div class="terminal-line">
                → Detecting changes...
            </div>

            <div class="terminal-line green">
                ✓ Build completed
            </div>

            <div class="terminal-line green">
                ✓ Security checks passed
            </div>

            <div class="terminal-line green">
                ✓ Infrastructure validated
            </div>

            <div class="terminal-line purple">
                ✓ Deployment completed
            </div>

        </div>


        <div class="terminal-info">

            <h2>
                Automation should feel invisible.
            </h2>

            <p>

                The goal of DevOps isn't more tools.
                It's creating a reliable path where developers
                can move from an idea to running infrastructure
                without unnecessary friction.

            </p>

        </div>

    </div>

</section>


<!-- =========================
     RUNTIME
========================= -->

<section
    class="section reveal"
    id="runtime">

    <div class="section-heading">

        <span>Request Runtime</span>

        <h2>
            Know where<br>
            your application lives.
        </h2>

        <p>
            Dynamic information collected directly from the
            current application request and server environment.
        </p>

    </div>


    <div class="environment">


        <div class="env-card">

            <div class="env-top">

                <div class="env-title">
                    Server
                </div>

                <div class="live">
                    ● ONLINE
                </div>

            </div>

            <div class="env-value">
                <%= serverHostName %>
            </div>

            <div class="env-label">
                Hostname
            </div>

        </div>


        <div class="env-card">

            <div class="env-top">

                <div class="env-title">
                    Server IP
                </div>

                <div class="live">
                    ● ACTIVE
                </div>

            </div>

            <div class="env-value">
                <%= serverIP %>
            </div>

            <div class="env-label">
                Application Server Address
            </div>

        </div>


        <div class="env-card">

            <div class="env-top">

                <div class="env-title">
                    Client
                </div>

                <div class="live">
                    ● CONNECTED
                </div>

            </div>

            <div class="env-value">
                <%= clientIP %>
            </div>

            <div class="env-label">
                Request Source
            </div>

        </div>

    </div>

</section>


<!-- =========================
     PROFILE
========================= -->

<section
    class="section reveal"
    id="about">

    <div class="profile">

        <div class="profile-image">

            <img
                src="images/devops.jpg"
                alt="DevSecOps.CloudnAI">

        </div>


        <div>

            <h2>
                M CHARAN
            </h2>

            <p>

                Cloud · DevOps · DevSecOps · SRE · Platform Engineering

                <br>

                Building practical cloud infrastructure,
                automation pipelines and DevOps learning environments.

            </p>

        </div>


        <a
            href="services/employee/getEmployeeDetails"
            class="profile-btn">

            Explore Services →

        </a>

    </div>

</section>


<!-- =========================
     FOOTER
========================= -->

<footer>

    <div>
        © 2026 DevSecOps.CloudnAI
    </div>

    <div>
        Cloud · Automation · Security · Kubernetes
    </div>

</footer>


<script>

    /* =========================
       SCROLL REVEAL
    ========================== */

    const revealElements =
        document.querySelectorAll(".reveal");

    const revealObserver =
        new IntersectionObserver(
            function(entries) {

                entries.forEach(function(entry) {

                    if (entry.isIntersecting) {

                        entry.target.classList.add("show");

                    }

                });

            },
            {
                threshold: 0.12
            }
        );


    revealElements.forEach(function(element) {

        revealObserver.observe(element);

    });


    /* =========================
       MOUSE MOVEMENT
    ========================== */

    const network =
        document.querySelector(".network-card");

    if (network) {

        network.addEventListener(
            "mousemove",
            function(e) {

                const rect =
                    network.getBoundingClientRect();

                const x =
                    e.clientX - rect.left;

                const y =
                    e.clientY - rect.top;

                const rotateX =
                    ((y / rect.height) - .5) * -3;

                const rotateY =
                    ((x / rect.width) - .5) * 3;

                network.style.transform =
                    "perspective(1000px) rotateX("
                    + rotateX +
                    "deg) rotateY("
                    + rotateY +
                    "deg)";

            }
        );


        network.addEventListener(
            "mouseleave",
            function() {

                network.style.transform =
                    "perspective(1000px) rotateX(0deg) rotateY(0deg)";

            }
        );

    }

</script>

</body>
</html>
