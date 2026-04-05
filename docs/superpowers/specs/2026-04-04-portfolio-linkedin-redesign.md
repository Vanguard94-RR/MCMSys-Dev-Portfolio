# Portfolio & LinkedIn Redesign — Design Spec
**Date:** 2026-04-04
**Approach:** C — Modular Enhancement (keep dark theme, add new sections, replace all placeholder content)

---

## Context

Current portfolio at https://vanguard94-rr.github.io/MCMSys-Dev-Portfolio/ has critical branding issues:
- Uses "we are MCM Sys-Dev" (company language) instead of personal identity
- Lorem ipsum in About, 3 of 4 Services, and 4 of 6 Projects
- Two completely empty project placeholders (Project 4, Project 5)
- All social media links point to `#` (broken)
- No Skills section, no Certifications section
- Phone number publicly exposed
- Copyright 2021 (5 years outdated)
- No value proposition — 12 years of experience and two certifications are invisible

## User Profile

- **Name:** Juan Manuel Cortes Martinez
- **Role:** DevSecOps / SRE / SysAdmin / Cloud Engineer
- **Experience:** 12+ years in IT
- **Certifications:** Google Cloud Professional Architect, CompTIA Security+
- **Location:** Guadalajara, México
- **Target audience:** Recruiters/employers (passive) + freelance clients
- **Language:** English only
- **Status:** Open to opportunities + building freelance client base

---

## Page Architecture

### Navigation (updated)
`Home | Skills | Projects | About | Contact`
- "Services" renamed to "Skills" to reflect the tech-stack section replacing it

### Sections (in order)

| # | Section | Status |
|---|---------|--------|
| 1 | Hero | Rewrite |
| 2 | Tech Stack | **NEW** |
| 3 | Certifications | **NEW** |
| 4 | Projects | Rewrite |
| 5 | About | Rewrite |
| 6 | Contact | Simplify |
| 7 | Footer | Fix links + copyright |

---

## Section Designs

### 1. Hero

**Style:** A — Direct & Professional

```
Hi there, I'm
Juan Manuel Cortes
DevSecOps · SRE · Cloud Engineer

12+ years securing and scaling infrastructure.
GCP Architect · CompTIA Security+
Based in Guadalajara, México · Open to opportunities

[View Projects]   [Download Resume]   [LinkedIn →]
```

- Replaces: `"Hello, we are MCM Sys-Dev, IT Support and IaaC Specialists"`
- Three CTAs: View Projects (internal anchor), Download Resume (PDF), LinkedIn (external link)
- No "Hire Me" CTA

### 2. Tech Stack (NEW)

**Style:** B — Grouped by Category with bordered tags

Three groups:

**Infrastructure & Orchestration** (cyan `#64ffda` border)
`Kubernetes` · `Terraform` · `Ansible` · `Helm`

**Cloud Platforms** (orange `#f0a500` border)
`GCP` · `AWS` · `Azure`

**Security & Identity** (red `#e94560` border)
`CyberArk` · `IAM` · `Linux` · `Netbackup`

**Languages & Scripting** (gray border)
`Go` · `Python` · `Bash`

### 3. Certifications (NEW)

Two badge cards side by side:

| Badge | Details |
|-------|---------|
| ☁️ Google Cloud Professional | Cloud Architect · Google · Verified |
| 🔒 CompTIA Security+ | Cybersecurity Fundamentals · CompTIA · Verified |

- Each badge links to the credential verification URL (to be provided during implementation)
- GCP badge: orange `#f0a500` accent border
- Security+ badge: red `#e94560` accent border

### 4. Projects

**Style:** B — Accent card (category header + color accent)

Five real projects (replacing Lorem ipsum + empty placeholders):

| # | Project | Language | Category | GitHub Link |
|---|---------|----------|----------|-------------|
| 1 | IaC-Programming-Samples | Shell | IaC · Automation | github.com/Vanguard94-RR/IaC-Programming-Samples |
| 2 | lambda-promtail | Go | SRE · Observability | github.com/Vanguard94-RR/lambda-promtail |
| 3 | K8s-and-Helm-Training | Helm | Kubernetes · Orchestration | github.com/Vanguard94-RR/K8s-and-Helm-Training |
| 4 | Ansible Automation | Dockerfile | Automation · Config Mgmt | github.com/Vanguard94-RR/Ansible |
| 5 | Python Web Scraper | Python | Commercial · Automation | existing project page |

**Card structure per project:**
- Header: Category label + color accent top border
- Title: project name
- Description: 1-2 sentences (real content — not Lorem ipsum)
- Tech tags: language + relevant tools
- Footer: "→ View on GitHub" link + year

**Prerequisites:** GitHub repos need README files and descriptions before implementation. This is a parallel task for the user.

### 5. About

**Layout:** Two-column — bio text (left) + stat cards (right)

**Bio text:**
```
Systems Engineer with 12+ years designing, automating, and securing IT infrastructure at scale.

I specialize in DevSecOps, Site Reliability Engineering, and Cloud Architecture
across GCP, AWS, and Azure. My work focuses on automating infrastructure, enforcing
security at scale, and keeping systems running reliably — from bare-metal Linux to
multi-cloud Kubernetes clusters.

Based in Guadalajara, México. Available for remote opportunities and consulting engagements.
```

**Stat cards (right column):**
- `12+` / Years in IT (cyan accent)
- `3` / Cloud Platforms (orange accent)
- `2` / Certifications (red accent)

**CTAs:** `Download Resume` · `GitHub →` · `LinkedIn →`

### 6. Contact

Simplified to three items only:

| Icon | Label | Value |
|------|-------|-------|
| ✉️ | Email | vanguard9417@gmail.com |
| 📍 | Location | Guadalajara, México |
| 💼 | LinkedIn | /in/juan-manuel-cortes-martinez |

**Removed:** Phone number (privacy/security — not safe to expose publicly on a static site)

### 7. Footer

- Fix all social icon links: GitHub, LinkedIn (remove Instagram and Twitter if no active accounts)
- Update copyright: `© 2026 Juan Manuel Cortes. All rights reserved`
- Tagline: `"Securing and scaling infrastructure — one automation at a time."`

---

## LinkedIn Profile Optimization

### Headline (proposed)
```
DevSecOps & SRE Engineer | 12+ yrs in IT Infrastructure | GCP Architect · CompTIA Security+ | Kubernetes · Terraform · Ansible · Go | Guadalajara, MX
```

Replaces: `Linux || K8s || GCP || Azure || AWS || Ansible || Bash || Go || IaC || Terraform || Infra Cloud || NetApp || DevSecOps || Netbackup || IAM || CyberArk`

**Why:** The current headline is a keyword dump with no role or seniority signal. The new one communicates: role → seniority → credentials → top tools → location.

### About / Summary (proposed)
```
Systems Engineer with 12+ years designing, automating, and securing IT infrastructure at scale.

I work across the full infrastructure stack — from Linux server administration and Kubernetes
orchestration to multi-cloud architectures on GCP, AWS, and Azure. My focus is where reliability
meets security: building IaC pipelines with Terraform and Ansible, enforcing identity and access
policies with CyberArk and IAM, and implementing observability for mission-critical systems.

📌 Currently open to senior DevSecOps, SRE, or Cloud Engineer roles — remote or hybrid.
```

### Additional LinkedIn Quick Wins

| Action | Why |
|--------|-----|
| Add portfolio URL to Featured section | Direct recruiter traffic to the portfolio |
| Upload Resume PDF to Featured section | One-click access for recruiters |
| Add GCP Architect + Security+ to Certifications | Verification builds trust |
| Pin top 5 skills: Kubernetes, Terraform, GCP, Ansible, Linux | Boost search ranking |
| Customize profile URL to shorter form if available | Cleaner for resume/business card |
| Activate `#OpenToWork` (visible to recruiters only) | Signal availability without alerting employer |
| Add custom banner image with tech stack visual | Immediate visual differentiation |

---

## Files to Modify

| File | Changes |
|------|---------|
| `index.html` | All section rewrites, new sections, nav update |
| `style.css` | Styles for new Tech Stack, Certifications, stat cards, project accent cards |
| `app.js` | No major changes expected |
| `docs/Manuel-Cortes-Resume.pdf` | Verify it's up to date (user task) |
| GitHub repos | Add README + descriptions (user task, parallel) |

## Out of Scope

- New framework or build system (stays as vanilla HTML/CSS/JS)
- Blog/articles section
- Contact form (email link is sufficient)
- Experience timeline section
- Dark/light mode toggle
- Internationalization (English only)
