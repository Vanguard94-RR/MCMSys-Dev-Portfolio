# Portfolio & LinkedIn Redesign — Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Transform a placeholder-filled 2021 portfolio into a professional personal brand page for a 12-year IT veteran with GCP Architect and Security+ certifications.

**Architecture:** Vanilla HTML/CSS/JS static site hosted on GitHub Pages. No build system. Modify `index.html` and `style.css` in place; `app.js` is unchanged. Add two new sections (Tech Stack + Certifications) by replacing the old Services section. All other sections are rewritten in place.

**Tech Stack:** HTML5, CSS3 (no preprocessor), vanilla JS (hamburger menu — untouched), Google Fonts (Montserrat already imported)

---

## File Map

| File | What changes |
|------|-------------|
| `index.html` | All section rewrites: Hero, Skills (replaces Services), Projects, About, Contact, Footer, Nav |
| `style.css` | Remove old services CSS, add Skills/Certifications/stat-cards/accent-project CSS, hero meta styles |
| `app.js` | No changes |
| `docs/Manuel-Cortes-Resume.pdf` | User verifies it's current — no code change |

---

## Task 1: CSS Foundation — Add New Color Variables and Hero Meta Styles

**Files:**
- Modify: `style.css` (top of file, after `@import`)

---

- [ ] **Step 1: Add CSS custom properties and new utility styles**

Insert after the `@import` line at the top of `style.css`:

```css
:root {
  --color-cyan: #64ffda;
  --color-orange: #f0a500;
  --color-red: crimson;
  --color-muted: #aaa;
  --color-dark: #29323c;
}
```

Then add at the bottom of `style.css`, before the Media Queries block:

```css
/* Hero meta styles */
.hero-meta,
.hero-location {
  color: #aaa;
  font-size: 1.4rem;
  margin-top: 15px;
  font-weight: 300;
  letter-spacing: 0.05rem;
  opacity: 0;
  animation: text_reveal 0.5s ease forwards;
  animation-delay: 4s;
}
.hero-location {
  animation-delay: 4.5s;
  font-size: 1.2rem;
}
```

- [ ] **Step 2: Open `index.html` in a browser locally to confirm existing styles still load**

Open: `file:///home/admin/Documents/Personal/Portfolio/MCMSys-Dev-Portfolio/index.html`
Expected: Page looks identical to before — no visual changes yet.

- [ ] **Step 3: Commit**

```bash
cd /home/admin/Documents/Personal/Portfolio/MCMSys-Dev-Portfolio
git add style.css
git commit -m "feat: add CSS custom properties and hero meta animation styles"
```

---

## Task 2: Rewrite Hero Section

**Files:**
- Modify: `index.html` (lines 39–50)

---

- [ ] **Step 1: Replace the hero section HTML**

Replace the entire `<!--Hero Section-->` block (lines 39–51) with:

```html
<!--Hero Section-->
<section id="hero">
    <div class="hero container">
        <div>
            <h1>Hi there, I'm<span></span></h1>
            <h1>Juan Manuel Cortes<span></span></h1>
            <h1>DevSecOps · SRE · Cloud Engineer<span></span></h1>
            <p class="hero-meta">12+ years securing and scaling infrastructure &nbsp;·&nbsp; GCP Architect &nbsp;·&nbsp; CompTIA Security+</p>
            <p class="hero-location">Based in Guadalajara, México &nbsp;·&nbsp; Open to opportunities</p>
            <a href="#projects" type="button" class="cta">View Projects</a>
            <a href="./docs/Manuel-Cortes-Resume.pdf" type="button" class="cta" download="Manuel-Cortes-Resume.pdf">Download Resume</a>
            <a href="https://www.linkedin.com/in/juan-manuel-cortes-martinez/" target="_blank" rel="noopener" type="button" class="cta">LinkedIn &rarr;</a>
        </div>
    </div>
</section>
<!--End Hero Section-->
```

- [ ] **Step 2: Verify in browser**

Open: `file:///home/admin/Documents/Personal/Portfolio/MCMSys-Dev-Portfolio/index.html`
Expected:
- Hero shows "Hi there, I'm" / "Juan Manuel Cortes" / "DevSecOps · SRE · Cloud Engineer" animating in sequence
- After animations: meta line "12+ years..." visible in muted gray
- Three CTAs visible: View Projects, Download Resume, LinkedIn →

- [ ] **Step 3: Commit**

```bash
git add index.html
git commit -m "feat: rewrite hero with personal identity and three CTAs"
```

---

## Task 3: Replace Services Section with Skills (Tech Stack + Certifications)

**Files:**
- Modify: `index.html` (lines 52–95 — the services section)
- Modify: `style.css` (remove old `#services` CSS, add `#skills` CSS)

---

- [ ] **Step 1: Replace the services section HTML**

Replace the entire `<!--Service Section-->` block (lines 52–96) with:

```html
<!--Skills Section-->
<section id="skills">
    <div class="skills container">

        <div class="skills-header">
            <h1 class="section-title">TECH <span>STACK</span></h1>
        </div>

        <div class="skills-grid">
            <div class="skill-category">
                <h3 class="skill-category-title" style="color: var(--color-cyan)">Infrastructure &amp; Orchestration</h3>
                <div class="skill-tags">
                    <span class="skill-tag infra">Kubernetes</span>
                    <span class="skill-tag infra">Terraform</span>
                    <span class="skill-tag infra">Ansible</span>
                    <span class="skill-tag infra">Helm</span>
                </div>
            </div>
            <div class="skill-category">
                <h3 class="skill-category-title" style="color: var(--color-orange)">Cloud Platforms</h3>
                <div class="skill-tags">
                    <span class="skill-tag cloud">GCP</span>
                    <span class="skill-tag cloud">AWS</span>
                    <span class="skill-tag cloud">Azure</span>
                </div>
            </div>
            <div class="skill-category">
                <h3 class="skill-category-title" style="color: var(--color-red)">Security &amp; Identity</h3>
                <div class="skill-tags">
                    <span class="skill-tag security">CyberArk</span>
                    <span class="skill-tag security">IAM</span>
                    <span class="skill-tag security">Netbackup</span>
                    <span class="skill-tag security">Linux</span>
                </div>
            </div>
            <div class="skill-category">
                <h3 class="skill-category-title" style="color: var(--color-muted)">Languages &amp; Scripting</h3>
                <div class="skill-tags">
                    <span class="skill-tag scripting">Go</span>
                    <span class="skill-tag scripting">Python</span>
                    <span class="skill-tag scripting">Bash</span>
                </div>
            </div>
        </div>

        <div class="cert-header">
            <h2 class="cert-title">CERTIFICATIONS</h2>
        </div>
        <div class="cert-cards">
            <div class="cert-card gcp">
                <div class="cert-icon">&#9729;</div>
                <div class="cert-info">
                    <h3>Google Cloud Professional</h3>
                    <p>Cloud Architect</p>
                    <span class="cert-issuer">Google &nbsp;·&nbsp; Verified</span>
                </div>
            </div>
            <div class="cert-card security-cert">
                <div class="cert-icon">&#128274;</div>
                <div class="cert-info">
                    <h3>CompTIA Security+</h3>
                    <p>Cybersecurity Fundamentals</p>
                    <span class="cert-issuer">CompTIA &nbsp;·&nbsp; Verified</span>
                </div>
            </div>
        </div>

    </div>
</section>
<!--End Skills Section-->
```

- [ ] **Step 2: Remove old `#services` CSS and add `#skills` CSS**

In `style.css`, remove everything between `/*Service Section*/` and `/*End Service Section*/` (lines 294–357) and replace with:

```css
/* Skills Section */
#skills .skills {
  background-image: linear-gradient(60deg, #29323c 0%, #485563 100%);
  flex-direction: column;
  text-align: center;
  padding: 100px 20px;
}
#skills .skills-header {
  margin-bottom: 40px;
}
#skills .section-title {
  color: white;
}
#skills .skills-grid {
  display: flex;
  flex-wrap: wrap;
  justify-content: center;
  gap: 30px;
  max-width: 900px;
  margin: 0 auto 60px auto;
}
#skills .skill-category {
  min-width: 200px;
  text-align: left;
}
#skills .skill-category-title {
  font-size: 1.2rem;
  text-transform: uppercase;
  letter-spacing: 0.1rem;
  margin-bottom: 12px;
}
#skills .skill-tags {
  display: flex;
  flex-wrap: wrap;
  gap: 8px;
}
#skills .skill-tag {
  padding: 5px 14px;
  border-radius: 4px;
  font-size: 1.2rem;
  font-weight: 400;
  border: 1px solid;
}
#skills .skill-tag.infra  { border-color: var(--color-cyan);   color: var(--color-cyan); }
#skills .skill-tag.cloud  { border-color: var(--color-orange); color: var(--color-orange); }
#skills .skill-tag.security { border-color: var(--color-red);  color: var(--color-red); }
#skills .skill-tag.scripting { border-color: var(--color-muted); color: var(--color-muted); }

/* Certifications */
#skills .cert-header {
  margin-bottom: 20px;
}
#skills .cert-title {
  font-size: 2rem;
  font-weight: 500;
  color: white;
  text-transform: uppercase;
  letter-spacing: 0.15rem;
}
#skills .cert-cards {
  display: flex;
  flex-wrap: wrap;
  justify-content: center;
  gap: 20px;
}
#skills .cert-card {
  display: flex;
  align-items: center;
  gap: 16px;
  background: rgba(255,255,255,0.05);
  border: 1px solid;
  border-radius: 8px;
  padding: 18px 24px;
  min-width: 260px;
  text-align: left;
}
#skills .cert-card.gcp           { border-color: var(--color-orange); }
#skills .cert-card.security-cert { border-color: var(--color-red); }
#skills .cert-icon {
  font-size: 2.8rem;
  line-height: 1;
}
#skills .cert-info h3 {
  font-size: 1.4rem;
  font-weight: 600;
  color: white;
  margin-bottom: 4px;
}
#skills .cert-info p {
  color: #aaa;
  font-size: 1.2rem;
  margin: 0;
  line-height: 1.6rem;
}
#skills .cert-issuer {
  font-size: 1rem;
  color: #666;
  margin-top: 4px;
  display: block;
}
/* End Skills Section */
```

- [ ] **Step 3: Verify in browser**

Open: `file:///home/admin/Documents/Personal/Portfolio/MCMSys-Dev-Portfolio/index.html`
Expected:
- "TECH STACK" section visible with 4 category groups
- Cyan tags for Infrastructure, orange for Cloud, red for Security, gray for Scripting
- "CERTIFICATIONS" subsection below with GCP (orange border) and Security+ (red border) cards

- [ ] **Step 4: Commit**

```bash
git add index.html style.css
git commit -m "feat: replace services section with tech stack and certifications"
```

---

## Task 4: Rewrite Projects Section

**Files:**
- Modify: `index.html` (lines 99–190 — the projects section)
- Modify: `style.css` (projects CSS block — add accent card styles)

---

- [ ] **Step 1: Replace the projects section HTML**

Replace the entire `<!--Projects Section-->` block (lines 99–191) with:

```html
<!--Projects Section-->
<section id="projects">
    <div class="projects container">
        <div class="projects-header">
            <h1 class="section-title">
                <span2>Recent</span2> <span>Projects</span>
            </h1>
        </div>
        <div class="all-projects">

            <div class="project-item">
                <div class="project-info">
                    <div class="project-accent-header">
                        <span class="project-category">IaC &nbsp;·&nbsp; Automation</span>
                    </div>
                    <h1><a href="https://github.com/Vanguard94-RR/IaC-Programming-Samples" target="_blank" rel="noopener" class="button1">IaC Programming Samples</a></h1>
                    <h2>Infrastructure as Code</h2>
                    <p>A collection of Infrastructure as Code samples using Terraform, Ansible, and shell scripting. Covers provisioning, configuration management, and automation patterns for cloud and on-premise environments.</p>
                    <div class="project-tech-tags">
                        <span class="project-tech-tag">Terraform</span>
                        <span class="project-tech-tag">Ansible</span>
                        <span class="project-tech-tag">Shell</span>
                    </div>
                </div>
                <div class="project-img">
                    <img src="./img/img-1.png" alt="IaC Programming Samples">
                </div>
            </div>

            <div class="project-item">
                <div class="project-info">
                    <div class="project-accent-header">
                        <span class="project-category">SRE &nbsp;·&nbsp; Observability</span>
                    </div>
                    <h1><a href="https://github.com/Vanguard94-RR/lambda-promtail" target="_blank" rel="noopener" class="button1">lambda-promtail</a></h1>
                    <h2>AWS Log Forwarding to Loki</h2>
                    <p>Go-based AWS Lambda function that forwards CloudWatch logs to Grafana Loki for centralized log aggregation. Enables cost-effective observability across multi-account AWS environments.</p>
                    <div class="project-tech-tags">
                        <span class="project-tech-tag">Go</span>
                        <span class="project-tech-tag">AWS Lambda</span>
                        <span class="project-tech-tag">Grafana Loki</span>
                    </div>
                </div>
                <div class="project-img">
                    <img src="./img/img-1.png" alt="lambda-promtail">
                </div>
            </div>

            <div class="project-item">
                <div class="project-info">
                    <div class="project-accent-header">
                        <span class="project-category">Kubernetes &nbsp;·&nbsp; Orchestration</span>
                    </div>
                    <h1><a href="https://github.com/Vanguard94-RR/K8s-and-Helm-Training" target="_blank" rel="noopener" class="button1">K8s and Helm Training</a></h1>
                    <h2>Kubernetes Orchestration</h2>
                    <p>Kubernetes deployment manifests and Helm charts for orchestrating containerized workloads. Covers deployments, services, ingress controllers, and Helm chart templating for production-grade clusters.</p>
                    <div class="project-tech-tags">
                        <span class="project-tech-tag">Kubernetes</span>
                        <span class="project-tech-tag">Helm</span>
                        <span class="project-tech-tag">Containers</span>
                    </div>
                </div>
                <div class="project-img">
                    <img src="./img/img-1.png" alt="K8s and Helm">
                </div>
            </div>

            <div class="project-item">
                <div class="project-info">
                    <div class="project-accent-header">
                        <span class="project-category">Automation &nbsp;·&nbsp; Config Management</span>
                    </div>
                    <h1><a href="https://github.com/Vanguard94-RR/Ansible" target="_blank" rel="noopener" class="button1">Ansible Automation</a></h1>
                    <h2>Server Configuration Management</h2>
                    <p>Ansible playbooks and roles for automated server configuration, package management, and infrastructure hardening. Includes Docker environment setup and Linux server automation workflows.</p>
                    <div class="project-tech-tags">
                        <span class="project-tech-tag">Ansible</span>
                        <span class="project-tech-tag">Docker</span>
                        <span class="project-tech-tag">Linux</span>
                    </div>
                </div>
                <div class="project-img">
                    <img src="./img/img-1.png" alt="Ansible Automation">
                </div>
            </div>

            <div class="project-item">
                <div class="project-info">
                    <div class="project-accent-header">
                        <span class="project-category">Commercial &nbsp;·&nbsp; Automation</span>
                    </div>
                    <h1><a href="./Projects/index-projects.html" class="button1">Python Web Scraper</a></h1>
                    <h2>Guadalajara Commercial Client</h2>
                    <p>Commercial project extracting public procurement data from a government portal into structured Excel reports. Built with Python and Selenium for a client in Guadalajara, automating a manual data collection process.</p>
                    <div class="project-tech-tags">
                        <span class="project-tech-tag">Python</span>
                        <span class="project-tech-tag">Selenium</span>
                        <span class="project-tech-tag">Excel</span>
                    </div>
                </div>
                <div class="project-img">
                    <img src="./img/Img-1.jpg" alt="Python Web Scraper">
                </div>
            </div>

        </div>
    </div>
</section>
<!--End Projects Section-->
```

- [ ] **Step 2: Add accent card CSS to projects block**

In `style.css`, find `/* End Projects section */` and insert before it:

```css
/* Project accent card additions */
#projects .project-accent-header {
  margin-bottom: 10px;
}
#projects .project-category {
  font-size: 1.1rem;
  text-transform: uppercase;
  letter-spacing: 0.1rem;
  color: var(--color-cyan);
  font-weight: 500;
  border-top: 2px solid var(--color-cyan);
  padding-top: 8px;
  display: inline-block;
}
#projects .project-tech-tags {
  display: flex;
  flex-wrap: wrap;
  gap: 8px;
  margin-top: 12px;
}
#projects .project-tech-tag {
  font-size: 1.1rem;
  color: var(--color-muted);
  border: 1px solid #555;
  padding: 3px 10px;
  border-radius: 3px;
}
```

- [ ] **Step 3: Verify in browser**

Open: `file:///home/admin/Documents/Personal/Portfolio/MCMSys-Dev-Portfolio/index.html`
Expected:
- 5 project cards, no Lorem ipsum, no empty cards
- Each card has a cyan category label with top border accent
- Tech tags visible below each description
- Project 2 (lambda-promtail) and 3 (K8s) link to GitHub; Project 5 links to internal project page

- [ ] **Step 4: Commit**

```bash
git add index.html style.css
git commit -m "feat: rewrite projects with 5 real projects and accent card style"
```

---

## Task 5: Rewrite About Section

**Files:**
- Modify: `index.html` (lines 195–219 — the about section)
- Modify: `style.css` (about CSS block — add stat cards)

---

- [ ] **Step 1: Replace the about section HTML**

Replace the entire `<!--About Section-->` block (lines 195–220) with:

```html
<!--About Section-->
<section id="about">
    <div class="about container">
        <div class="col-left">
            <div class="about-img">
                <img src="./img/MCM.png" alt="Juan Manuel Cortes">
            </div>
        </div>
        <div class="col-rigth">
            <h1 class="section-title">About <span>Me</span></h1>
            <h2 class="section-title2"><span>S</span>ystems <span>E</span>ngineer &amp; <span>IaC</span> Specialist</h2>
            <p>12+ years designing, automating, and securing IT infrastructure at scale. I specialize in DevSecOps, Site Reliability Engineering, and Cloud Architecture across GCP, AWS, and Azure — from bare-metal Linux to multi-cloud Kubernetes clusters.</p>
            <p>Based in Guadalajara, México. Available for remote opportunities and consulting engagements.</p>
            <div class="stat-cards">
                <div class="stat-card stat-cyan">
                    <span class="stat-number">12+</span>
                    <span class="stat-label">Years in IT</span>
                </div>
                <div class="stat-card stat-orange">
                    <span class="stat-number">3</span>
                    <span class="stat-label">Cloud Platforms</span>
                </div>
                <div class="stat-card stat-red">
                    <span class="stat-number">2</span>
                    <span class="stat-label">Certifications</span>
                </div>
            </div>
            <a href="./docs/Manuel-Cortes-Resume.pdf" class="cta" download="Manuel-Cortes-Resume.pdf">Download Resume</a>
            <a href="https://github.com/Vanguard94-RR" target="_blank" rel="noopener" class="cta">GitHub</a>
            <a href="https://www.linkedin.com/in/juan-manuel-cortes-martinez/" target="_blank" rel="noopener" class="cta">LinkedIn</a>
        </div>
    </div>
</section>
<!--End About Section-->
```

- [ ] **Step 2: Add stat cards CSS**

In `style.css`, find `/*End About Section*/` and insert before it:

```css
/* Stat cards */
#about .stat-cards {
  display: flex;
  flex-wrap: wrap;
  gap: 12px;
  margin: 20px 0;
}
#about .stat-card {
  display: flex;
  flex-direction: column;
  padding: 12px 20px;
  border-radius: 6px;
  border-left: 3px solid;
  background: rgba(255,255,255,0.04);
  min-width: 100px;
}
#about .stat-card.stat-cyan   { border-left-color: var(--color-cyan); }
#about .stat-card.stat-orange { border-left-color: var(--color-orange); }
#about .stat-card.stat-red    { border-left-color: var(--color-red); }
#about .stat-number {
  font-size: 2.2rem;
  font-weight: 700;
  color: white;
  line-height: 1;
}
#about .stat-label {
  font-size: 1.1rem;
  color: #888;
  margin-top: 4px;
}
```

- [ ] **Step 3: Verify in browser**

Open: `file:///home/admin/Documents/Personal/Portfolio/MCMSys-Dev-Portfolio/index.html`
Expected:
- About section shows real bio (no Lorem ipsum)
- Three stat cards: "12+ Years in IT" (cyan), "3 Cloud Platforms" (orange), "2 Certifications" (red)
- Three CTAs: Download Resume, GitHub, LinkedIn

- [ ] **Step 4: Commit**

```bash
git add index.html style.css
git commit -m "feat: rewrite about section with real bio, stat cards, and LinkedIn CTA"
```

---

## Task 6: Simplify Contact Section

**Files:**
- Modify: `index.html` (lines 222–255 — the contact section)

---

- [ ] **Step 1: Replace the contact section HTML**

Replace the entire `<!--Contact Section-->` block (lines 222–256) with:

```html
<!--Contact Section-->
<section id="contact">
    <div class="contact container">
        <div>
            <h1 class="section-title">Contact<span> Info</span></h1>
        </div>
        <div class="contact-items">
            <div class="contact-item">
                <div class="icon"><img src="https://img.icons8.com/bubbles/50/000000/gmail.png" alt="Email" /></div>
                <div class="contact-info">
                    <h1>E-Mail</h1>
                    <h2>vanguard9417@gmail.com</h2>
                </div>
            </div>
            <div class="contact-item">
                <div class="icon"><img src="https://img.icons8.com/bubbles/50/000000/map-marker.png" alt="Location" /></div>
                <div class="contact-info">
                    <h1>Location</h1>
                    <h2>Guadalajara, México</h2>
                </div>
            </div>
            <div class="contact-item">
                <div class="icon"><img src="https://img.icons8.com/color/48/000000/linkedin.png" alt="LinkedIn" /></div>
                <div class="contact-info">
                    <h1>LinkedIn</h1>
                    <h2><a href="https://www.linkedin.com/in/juan-manuel-cortes-martinez/" target="_blank" rel="noopener" style="color: inherit;">/in/juan-manuel-cortes-martinez</a></h2>
                </div>
            </div>
        </div>
    </div>
</section>
<!--End Contact Section-->
```

- [ ] **Step 2: Verify in browser**

Open: `file:///home/admin/Documents/Personal/Portfolio/MCMSys-Dev-Portfolio/index.html`
Expected:
- Contact section has exactly 3 items: Email, Location, LinkedIn
- Phone number is gone
- LinkedIn item links to your profile

- [ ] **Step 3: Commit**

```bash
git add index.html
git commit -m "feat: simplify contact section — remove phone, add LinkedIn"
```

---

## Task 7: Fix Navigation + Footer

**Files:**
- Modify: `index.html` (nav lines 22–35, footer lines 260–283)

---

- [ ] **Step 1: Update navigation**

Replace the `<ul>` block inside `.nav-list` (lines 26–33) with:

```html
<ul>
    <li><a href="#hero" data-after="Home">Home</a></li>
    <li><a href="#skills" data-after="Skills">Skills</a></li>
    <li><a href="#projects" data-after="Projects">Projects</a></li>
    <li><a href="#about" data-after="About">About</a></li>
    <li><a href="#contact" data-after="Contact">Contact</a></li>
</ul>
```

- [ ] **Step 2: Update the footer**

Replace the entire `<!--Footer Section-->` block (lines 259–284) with:

```html
<!--Footer Section-->
<section id="footer">
    <div class="footer container">
        <div class="brand">
            <h1><span>J</span>uan <span>M</span>anuel <span>C</span>ortes</h1>
        </div>
        <h2>Securing and scaling infrastructure — <span>one automation at a time.</span></h2>
        <div class="social-icon">
            <div class="social-item">
                <a href="https://github.com/Vanguard94-RR" target="_blank" rel="noopener" aria-label="GitHub">
                    <img src="https://img.icons8.com/color/48/000000/github--v1.png" alt="GitHub"/>
                </a>
            </div>
            <div class="social-item">
                <a href="https://www.linkedin.com/in/juan-manuel-cortes-martinez/" target="_blank" rel="noopener" aria-label="LinkedIn">
                    <img src="https://img.icons8.com/color/48/000000/linkedin.png" alt="LinkedIn"/>
                </a>
            </div>
        </div>
    </div>
    <p>Copyright &copy; 2026 Juan Manuel Cortes. All rights reserved.</p>
</section>
<!--End Footer Section-->
```

- [ ] **Step 3: Verify in browser**

Open: `file:///home/admin/Documents/Personal/Portfolio/MCMSys-Dev-Portfolio/index.html`
Expected:
- Nav shows: Home | Skills | Projects | About | Contact (desktop) — "Skills" replaces "Services"
- Clicking "Skills" scrolls to the Tech Stack section
- Footer shows: "Juan Manuel Cortes" brand, new tagline, only GitHub + LinkedIn icons (both linked)
- Copyright reads "2026"

- [ ] **Step 4: Commit**

```bash
git add index.html
git commit -m "feat: update nav to Skills, fix footer links and copyright 2026"
```

---

## Task 8: Final Verification Pass

**Files:**
- Read: `index.html` (full scan)

---

- [ ] **Step 1: Scan for any remaining Lorem ipsum**

```bash
grep -n "Lorem\|ipsum\|dolor\|consectetur\|adipiscing" /home/admin/Documents/Personal/Portfolio/MCMSys-Dev-Portfolio/index.html
```

Expected: no output (zero matches)

- [ ] **Step 2: Scan for broken placeholder links**

```bash
grep -n 'href=""' /home/admin/Documents/Personal/Portfolio/MCMSys-Dev-Portfolio/index.html
```

Expected: no output (zero matches)

- [ ] **Step 3: Verify page title**

In `index.html` line 9, update the `<title>` tag:

```html
<title>Juan Manuel Cortes — DevSecOps · SRE · Cloud Engineer</title>
```

- [ ] **Step 4: Final browser review**

Open: `file:///home/admin/Documents/Personal/Portfolio/MCMSys-Dev-Portfolio/index.html`

Check each section:
- [ ] Hero: "Hi there, I'm Juan Manuel Cortes" animates in, 3 CTAs visible
- [ ] Skills: Tech Stack grouped by category with colored tags
- [ ] Skills: Certifications badges (GCP + Security+) below tech stack
- [ ] Projects: 5 real project cards with accent headers and tech tags
- [ ] About: Real bio, stat cards (12+, 3, 2), 3 CTAs
- [ ] Contact: Email, Location, LinkedIn — no phone
- [ ] Footer: GitHub + LinkedIn linked, "2026" copyright
- [ ] Nav: "Skills" link scrolls to Tech Stack section

- [ ] **Step 5: Commit**

```bash
git add index.html
git commit -m "fix: update page title for SEO"
```

---

## Task 9: LinkedIn Profile Updates (Manual — User Task)

These changes must be made manually by you in the LinkedIn interface. No code changes required.

- [ ] **Update Headline** — go to Edit Profile → Headline, replace with:
  ```
  DevSecOps & SRE Engineer | 12+ yrs in IT Infrastructure | GCP Architect · CompTIA Security+ | Kubernetes · Terraform · Ansible · Go | Guadalajara, MX
  ```

- [ ] **Update About / Summary** — go to Edit Profile → About, replace with:
  ```
  Systems Engineer with 12+ years designing, automating, and securing IT infrastructure at scale.

  I work across the full infrastructure stack — from Linux server administration and Kubernetes orchestration to multi-cloud architectures on GCP, AWS, and Azure. My focus is where reliability meets security: building IaC pipelines with Terraform and Ansible, enforcing identity and access policies with CyberArk and IAM, and implementing observability for mission-critical systems.

  📌 Currently open to senior DevSecOps, SRE, or Cloud Engineer roles — remote or hybrid.
  ```

- [ ] **Featured section** — Add portfolio URL and Resume PDF as featured items

- [ ] **Certifications** — Add GCP Cloud Architect and CompTIA Security+ with verification URLs

- [ ] **Skills** — Pin top 5: Kubernetes, Terraform, GCP, Ansible, Linux

- [ ] **#OpenToWork** — Enable in "Recruiters only" mode (does not show green banner publicly)

- [ ] **Update repo descriptions on GitHub** — Add short descriptions to: `IaC-Programming-Samples`, `lambda-promtail`, `K8s-and-Helm-Training`, `Ansible` (used in project cards)

---

## Deploy

- [ ] **Push to GitHub Pages**

```bash
cd /home/admin/Documents/Personal/Portfolio/MCMSys-Dev-Portfolio
git push origin main
```

Wait ~60 seconds, then verify at: https://vanguard94-rr.github.io/MCMSys-Dev-Portfolio/
