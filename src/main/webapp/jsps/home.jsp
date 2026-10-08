<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.net.*" %>
<%
    // ---- Server side info (safe against lookup failures) ----
    String serverHost = "unknown";
    String serverIp = "unknown";
    try {
        InetAddress inet = InetAddress.getLocalHost();
        serverHost = inet.getHostName();
        serverIp = inet.getHostAddress();
    } catch (UnknownHostException e) {
        // keep defaults
    }

    // ---- Client side info ----
    String clientIp = request.getRemoteAddr();
    String clientHost = request.getRemoteHost();
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>M CHARAN | DevSecOps.CloudnAI</title>
<meta name="description" content="DevSecOps training, development and consulting by M Charan. CI/CD, Kubernetes, cloud and security, taught on real projects.">
<link href="images/devops.jpg" rel="icon">

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=JetBrains+Mono:wght@400;500&family=Sora:wght@400;600;700;800&family=Plus+Jakarta+Sans:wght@400;500;600&display=swap" rel="stylesheet">

<style>
    :root {
        --ink: #0d1626;
        --ink-2: #16233a;
        --ink-3: #22324e;
        --paper: #f4f7fb;
        --white: #ffffff;
        --cobalt: #2f5bff;
        --cobalt-dark: #2146d6;
        --amber: #ffb020;
        --pass: #34d399;
        --text: #1b2536;
        --muted: #5b6b82;
        --line: #dbe3ee;
        --radius: 14px;
    }
    * { box-sizing: border-box; margin: 0; padding: 0; }
    html { scroll-behavior: smooth; }
    body {
        font-family: "Plus Jakarta Sans", system-ui, -apple-system, "Segoe UI", sans-serif;
        background: var(--paper);
        color: var(--text);
        line-height: 1.65;
        -webkit-font-smoothing: antialiased;
    }
    h1, h2, h3, h4 { font-family: "Sora", system-ui, sans-serif; line-height: 1.15; letter-spacing: -0.02em; }
    a { color: inherit; }
    :focus-visible { outline: 3px solid var(--amber); outline-offset: 3px; }
    .wrap { width: min(1120px, 92%); margin: 0 auto; }

    /* ---------- Top bar ---------- */
    .topbar { background: var(--ink); color: #cfd9ea; }
    .topbar .wrap { display: flex; align-items: center; justify-content: space-between; gap: 16px; padding: 14px 0; }
    .brand { display: flex; align-items: center; gap: 12px; text-decoration: none; color: var(--white); font-family: "Sora", sans-serif; font-weight: 700; }
    .brand img { width: 38px; height: 38px; border-radius: 10px; object-fit: cover; }
    .brand span small { display: block; font-family: "Plus Jakarta Sans", sans-serif; font-weight: 400; font-size: 12px; color: #8ea2c2; }
    .nav { display: flex; gap: 26px; font-size: 15px; }
    .nav a { text-decoration: none; color: #cfd9ea; }
    .nav a:hover { color: var(--white); }

    /* ---------- Hero ---------- */
    .hero { background: var(--ink); color: var(--white); padding: 56px 0 96px; position: relative; overflow: hidden; }
    .hero::before {
        content: ""; position: absolute; inset: 0;
        background-image:
            linear-gradient(rgba(255,255,255,.04) 1px, transparent 1px),
            linear-gradient(90deg, rgba(255,255,255,.04) 1px, transparent 1px);
        background-size: 44px 44px;
        mask-image: linear-gradient(to bottom, #000 30%, transparent 95%);
        -webkit-mask-image: linear-gradient(to bottom, #000 30%, transparent 95%);
        pointer-events: none;
    }
    .hero .wrap { position: relative; display: grid; grid-template-columns: 1.15fr .85fr; gap: 56px; align-items: center; }
    .hero h1 { font-size: clamp(2.3rem, 5vw, 3.8rem); font-weight: 800; }
    .hero p.lead { margin-top: 22px; font-size: 1.1rem; color: #b8c6de; max-width: 52ch; }
    .cta-row { margin-top: 32px; display: flex; flex-wrap: wrap; gap: 14px; }
    .btn {
        display: inline-block; padding: 13px 24px; border-radius: 10px; font-weight: 600; text-decoration: none;
        font-size: 15px; border: 2px solid transparent; transition: background .2s, border-color .2s;
    }
    .btn-primary { background: var(--cobalt); color: var(--white); }
    .btn-primary:hover { background: var(--cobalt-dark); }
    .btn-ghost { border-color: #3a4d70; color: var(--white); }
    .btn-ghost:hover { border-color: var(--white); }
    .btn-amber { background: var(--amber); color: var(--ink); }
    .btn-amber:hover { background: #ffc24d; }

    /* Live terminal panel (shows real JSP values) */
    .terminal { background: var(--ink-2); border: 1px solid var(--ink-3); border-radius: var(--radius); overflow: hidden; box-shadow: 0 30px 60px -30px rgba(0,0,0,.6); }
    .terminal-head { display: flex; align-items: center; gap: 8px; padding: 12px 16px; background: var(--ink-3); font-family: "JetBrains Mono", monospace; font-size: 12.5px; color: #9fb2d1; }
    .dot { width: 10px; height: 10px; border-radius: 50%; background: #4a5d80; }
    .terminal-head .live { margin-left: auto; display: flex; align-items: center; gap: 7px; color: var(--pass); }
    .terminal-head .live i { width: 8px; height: 8px; border-radius: 50%; background: var(--pass); animation: pulse 1.8s infinite; }
    .terminal-body { padding: 22px 20px 24px; font-family: "JetBrains Mono", monospace; font-size: 13.5px; line-height: 2; }
    .terminal-body .k { color: #7f93b5; display: inline-block; min-width: 118px; }
    .terminal-body .v { color: #e8efff; word-break: break-all; }
    .terminal-body .sep { border-top: 1px dashed #2f4266; margin: 12px 0; }
    .terminal-body .ok { color: var(--pass); }
    @keyframes pulse { 0%,100% { opacity: 1; } 50% { opacity: .3; } }

    /* ---------- Pipeline (the memorable element) ---------- */
    .pipeline-band { margin-top: -52px; position: relative; z-index: 2; }
    .pipeline { background: var(--white); border: 1px solid var(--line); border-radius: 18px; padding: 28px 28px 24px; box-shadow: 0 24px 50px -28px rgba(13,22,38,.35); }
    .pipeline h2 { font-size: 1.15rem; margin-bottom: 4px; }
    .pipeline .sub { color: var(--muted); font-size: 14px; margin-bottom: 22px; }
    .stages { list-style: none; display: grid; grid-template-columns: repeat(6, 1fr); gap: 0; counter-reset: stage; }
    .stage { position: relative; text-align: center; padding: 0 6px; }
    .stage::before { /* connector line */
        content: ""; position: absolute; top: 19px; left: -50%; width: 100%; height: 3px; background: var(--line); z-index: 0;
    }
    .stage:first-child::before { display: none; }
    .stage .node {
        position: relative; z-index: 1; width: 40px; height: 40px; margin: 0 auto 10px; border-radius: 50%;
        display: grid; place-items: center; background: var(--paper); border: 3px solid var(--line);
        font-family: "JetBrains Mono", monospace; font-size: 13px; font-weight: 500; color: var(--muted);
        transition: background .3s, border-color .3s, color .3s;
    }
    .stage b { display: block; font-family: "Sora", sans-serif; font-size: 14px; }
    .stage small { color: var(--muted); font-size: 12.5px; display: block; line-height: 1.4; margin-top: 2px; }
    .stage.done .node { background: var(--pass); border-color: var(--pass); color: var(--ink); }
    .stage.done::before { background: var(--pass); }
    .stage.scan .node { border-color: var(--amber); }
    .stage.scan.done .node { background: var(--amber); border-color: var(--amber); }
    .stage.scan.done::before { background: var(--amber); }

    /* ---------- Sections ---------- */
    section { padding: 84px 0 0; }
    .section-head { max-width: 62ch; margin-bottom: 36px; }
    .section-head h2 { font-size: clamp(1.7rem, 3vw, 2.3rem); }
    .section-head p { color: var(--muted); margin-top: 12px; font-size: 1.05rem; }

    /* Offerings: three columns separated by rules, not identical cards */
    .offer { display: grid; grid-template-columns: repeat(3, 1fr); border-top: 3px solid var(--ink); }
    .offer > div { padding: 28px 28px 8px 0; }
    .offer > div + div { padding-left: 28px; border-left: 1px solid var(--line); }
    .offer h3 { font-size: 1.3rem; margin-bottom: 10px; }
    .offer p { color: var(--muted); }
    .offer ul { margin: 16px 0 0; padding-left: 18px; color: var(--text); font-size: 15px; }
    .offer li { margin-bottom: 6px; }

    /* Toolchain */
    .toolchain { background: var(--ink); color: var(--white); border-radius: 22px; padding: 44px; }
    .toolchain h2 { font-size: clamp(1.5rem, 2.6vw, 2rem); }
    .toolchain > p { color: #a9b9d6; margin-top: 10px; max-width: 60ch; }
    .tool-groups { margin-top: 30px; display: grid; grid-template-columns: repeat(3, 1fr); gap: 28px; }
    .tool-groups h4 { font-size: 15px; color: var(--amber); margin-bottom: 12px; }
    .chips { display: flex; flex-wrap: wrap; gap: 8px; }
    .chips span { font-family: "JetBrains Mono", monospace; font-size: 13px; padding: 6px 12px; border: 1px solid #34486b; border-radius: 8px; color: #dbe6fb; }

    /* Service + contact */
    .two-col { display: grid; grid-template-columns: 1.1fr .9fr; gap: 28px; }
    .panel { background: var(--white); border: 1px solid var(--line); border-radius: 18px; padding: 34px; }
    .panel h3 { font-size: 1.35rem; margin-bottom: 10px; }
    .panel p { color: var(--muted); }
    .endpoint { margin: 20px 0; background: var(--ink); color: #dbe6fb; border-radius: 10px; padding: 14px 16px; font-family: "JetBrains Mono", monospace; font-size: 13.5px; overflow-x: auto; white-space: nowrap; }
    .endpoint em { font-style: normal; color: var(--pass); margin-right: 10px; }
    .contact-line { display: flex; gap: 14px; margin-top: 16px; align-items: flex-start; }
    .contact-line b { min-width: 72px; font-family: "Sora", sans-serif; font-size: 14px; }
    .contact-line span, .contact-line a { color: var(--muted); word-break: break-word; }
    .contact-line a:hover { color: var(--cobalt); }
    .person { display: flex; align-items: center; gap: 16px; margin-bottom: 8px; }
    .person img { width: 72px; height: 72px; border-radius: 16px; object-fit: cover; }
    .person h3 { margin: 0; }
    .person small { color: var(--muted); }

    /* Channel banner */
    .channel { margin-top: 28px; background: var(--cobalt); color: var(--white); border-radius: 22px; padding: 40px 44px; display: flex; align-items: center; justify-content: space-between; gap: 28px; flex-wrap: wrap; }
    .channel h2 { font-size: clamp(1.4rem, 2.6vw, 1.9rem); }
    .channel p { margin-top: 8px; color: #dbe5ff; max-width: 56ch; }

    /* ---------- Footer ---------- */
    footer { margin-top: 84px; background: var(--ink); color: #9fb0cc; padding: 30px 0; font-size: 14px; }
    footer .wrap { display: flex; justify-content: space-between; flex-wrap: wrap; gap: 10px; }
    footer a { color: var(--white); }

    /* ---------- Responsive ---------- */
    @media (max-width: 920px) {
        .hero .wrap, .two-col { grid-template-columns: 1fr; }
        .stages { grid-template-columns: repeat(3, 1fr); row-gap: 26px; }
        .stage:nth-child(4)::before { display: none; }
        .offer, .tool-groups { grid-template-columns: 1fr; }
        .offer > div, .offer > div + div { padding: 24px 0 8px; border-left: 0; border-top: 1px solid var(--line); }
        .offer > div:first-child { border-top: 0; }
        .toolchain { padding: 30px 24px; }
        .nav { display: none; }
    }
    @media (prefers-reduced-motion: reduce) {
        html { scroll-behavior: auto; }
        .terminal-head .live i { animation: none; }
        .stage .node { transition: none; }
    }
</style>
</head>
<body>

<!-- ======= Top bar ======= -->
<div class="topbar">
    <div class="wrap">
        <a class="brand" href="#top">
            <img src="images/devops.jpg" alt="M CHARAN logo">
            <span>M CHARAN <small>DevSecOps.CloudnAI</small></span>
        </a>
        <nav class="nav" aria-label="Main">
            <a href="#pipeline">Pipeline</a>
            <a href="#programs">Programs</a>
            <a href="#toolchain">Toolchain</a>
            <a href="#services">Services</a>
            <a href="#contact">Contact</a>
        </nav>
    </div>
</div>

<!-- ======= Hero ======= -->
<header class="hero" id="top">
    <div class="wrap">
        <div>
            <h1>Build it, secure it, ship it. Learn DevSecOps on real projects.</h1>
            <p class="lead">
                Hands-on training, development and consulting for teams and engineers who want
                reliable CI/CD pipelines, hardened containers and cloud-native delivery that works on a Monday morning.
            </p>
            <div class="cta-row">
                <a class="btn btn-primary" href="#programs">See the programs</a>
                <a class="btn btn-ghost" href="#contact">Talk to Charan</a>
            </div>
        </div>

        <!-- Live values from this server and this visitor -->
        <aside class="terminal" aria-label="Live connection details">
            <div class="terminal-head">
                <span class="dot"></span><span class="dot"></span><span class="dot"></span>
                <span>session.log</span>
                <span class="live"><i></i>serving</span>
            </div>
            <div class="terminal-body">
                <div><span class="k">server.host</span> <span class="v"><%= serverHost %></span></div>
                <div><span class="k">server.ip</span> <span class="v"><%= serverIp %></span></div>
                <div class="sep"></div>
                <div><span class="k">client.ip</span> <span class="v"><%= clientIp %></span></div>
                <div><span class="k">client.host</span> <span class="v"><%= clientHost %></span></div>
                <div class="sep"></div>
                <div><span class="ok">&#10003;</span> <span class="v">request served by the instance above</span></div>
            </div>
        </aside>
    </div>
</header>

<!-- ======= Pipeline ======= -->
<div class="wrap pipeline-band" id="pipeline">
    <div class="pipeline">
        <h2>The delivery pipeline we teach and build</h2>
        <p class="sub">Every commit travels these six stages. Security checks run inside the pipeline, not after it.</p>
        <ol class="stages" id="stages">
            <li class="stage"><span class="node">1</span><b>Code</b><small>Git, branching, reviews</small></li>
            <li class="stage"><span class="node">2</span><b>Build</b><small>Maven, Jenkins, Docker</small></li>
            <li class="stage"><span class="node">3</span><b>Test</b><small>Unit and integration</small></li>
            <li class="stage scan"><span class="node">4</span><b>Scan</b><small>SonarQube, Trivy</small></li>
            <li class="stage"><span class="node">5</span><b>Deploy</b><small>Kubernetes, Helm, Argo CD</small></li>
            <li class="stage"><span class="node">6</span><b>Monitor</b><small>Prometheus, Grafana</small></li>
        </ol>
    </div>
</div>

<!-- ======= Programs ======= -->
<section id="programs">
    <div class="wrap">
        <div class="section-head">
            <h2>Three ways to work together</h2>
            <p>Pick the one that matches where you are: learning the craft, building a product, or fixing a delivery process.</p>
        </div>
        <div class="offer">
            <div>
                <h3>Training</h3>
                <p>Instructor-led DevSecOps courses built around one project you deploy end to end.</p>
                <ul>
                    <li>Linux, Git and shell for DevOps</li>
                    <li>Jenkins and GitHub Actions pipelines</li>
                    <li>Docker, Kubernetes and Helm</li>
                    <li>Interview preparation and projects for your resume</li>
                </ul>
            </div>
            <div>
                <h3>Development</h3>
                <p>Java web apps and REST services delivered with the pipeline already in place.</p>
                <ul>
                    <li>JSP and Spring based applications</li>
                    <li>REST APIs with clean documentation</li>
                    <li>Containerized builds, ready to deploy</li>
                    <li>Automated tests and code quality gates</li>
                </ul>
            </div>
            <div>
                <h3>Consulting</h3>
                <p>Review of your current release process, with a clear plan to make it faster and safer.</p>
                <ul>
                    <li>CI/CD design and migration</li>
                    <li>Infrastructure as code with Terraform</li>
                    <li>Container and cluster hardening</li>
                    <li>Monitoring, alerting and cost review</li>
                </ul>
            </div>
        </div>
    </div>
</section>

<!-- ======= Toolchain ======= -->
<section id="toolchain">
    <div class="wrap">
        <div class="toolchain">
            <h2>The toolchain you will actually use at work</h2>
            <p>Industry-standard tools, taught in the order a real project needs them.</p>
            <div class="tool-groups">
                <div>
                    <h4>Build and deliver</h4>
                    <div class="chips">
                        <span>Git</span><span>GitHub</span><span>Jenkins</span><span>Maven</span><span>Docker</span><span>Nexus</span>
                    </div>
                </div>
                <div>
                    <h4>Secure and verify</h4>
                    <div class="chips">
                        <span>SonarQube</span><span>Trivy</span><span>OWASP ZAP</span><span>Vault</span><span>Checkov</span>
                    </div>
                </div>
                <div>
                    <h4>Run and observe</h4>
                    <div class="chips">
                        <span>Kubernetes</span><span>Helm</span><span>Argo CD</span><span>Terraform</span><span>Ansible</span><span>Prometheus</span><span>Grafana</span><span>AWS</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- ======= Services + Contact ======= -->
<section id="services">
    <div class="wrap two-col">
        <div class="panel">
            <h3>Try the Employee service</h3>
            <p>This portal ships with a sample REST service, so you can test the deployed application right away.</p>
            <div class="endpoint"><em>GET</em>services/employee/getEmployeeDetails</div>
            <a class="btn btn-amber" href="services/employee/getEmployeeDetails">Get employee details</a>
        </div>

        <div class="panel" id="contact">
            <div class="person">
                <img src="images/devops.jpg" alt="M CHARAN">
                <div>
                    <h3>M CHARAN</h3>
                    <small>DevSecOps trainer and consultant</small>
                </div>
            </div>
            <div class="contact-line"><b>Address</b><span>Whitefield, Bangalore</span></div>
            <div class="contact-line"><b>Phone</b><a href="tel:+919876543210">+91-9876543210</a></div>
            <div class="contact-line"><b>Email</b><a href="mailto:devsecopscloudnai@gmail.com">devsecopscloudnai@gmail.com</a></div>
            <div style="margin-top:24px">
                <a class="btn btn-primary" href="mailto:devsecopscloudnai@gmail.com">Email M CHARAN</a>
            </div>
        </div>
    </div>

    <div class="wrap">
        <div class="channel">
            <div>
                <h2>Watch DevSecOps.CloudnAI on YouTube</h2>
                <p>Step-by-step tutorials on pipelines, Kubernetes, cloud and security, published for free.</p>
            </div>
            <!-- Replace the href with your exact channel URL -->
            <a class="btn btn-amber" href="https://www.youtube.com/@DevSecOpsCloudnAI" target="_blank" rel="noopener">Visit the channel</a>
        </div>
    </div>
</section>

<footer>
    <div class="wrap">
        <span>&copy; 2026 M CHARAN. Training, development and consulting.</span>
        <span>A <a href="https://www.youtube.com/@DevSecOpsCloudnAI" target="_blank" rel="noopener">DevSecOps.CloudnAI</a> project</span>
    </div>
</footer>

<script>
    // Pipeline lights up once on load: the page's single animated moment.
    (function () {
        var stages = document.querySelectorAll('#stages .stage');
        var reduce = window.matchMedia('(prefers-reduced-motion: reduce)').matches;
        stages.forEach(function (s, i) {
            if (reduce) { s.classList.add('done'); return; }
            setTimeout(function () { s.classList.add('done'); }, 500 + i * 450);
        });
    })();
</script>

</body>
</html>
