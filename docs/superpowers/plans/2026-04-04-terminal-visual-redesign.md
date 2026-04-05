# Terminal Visual Redesign Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Evolve the portfolio's visual style toward a minimal, terminal/hacker aesthetic inspired by canirun.ai — dark flat backgrounds, monospace typography, neon-cyan accents, bracketed navigation, and clean card layouts — while keeping all existing content and structure intact.

**Architecture:** All changes are confined to `style.css` (visual) and `index.html` (nav bracket text only). No JS changes. No new sections. The approach replaces gradients with flat dark surfaces, introduces a monospace font layer for UI elements, and unifies section backgrounds into one global dark base (`#0a0a0a`).

**Tech Stack:** Vanilla CSS3, Google Fonts (JetBrains Mono), HTML5 — no build tools.

---

## File Map

| File | Changes |
|------|---------|
| `style.css` | Font import, `:root` tokens, global base, header, hero, skills, projects, about, contact, footer |
| `index.html` | Nav link text only — add bracket characters around each label |

---

## Task 1: Foundation — Font, Palette, Global Base

**Files:**
- Modify: `style.css` lines 1–45

The entire visual system depends on these foundations. Do this first.

**What to change:**

- Add `JetBrains Mono` to the `@import` line (alongside Montserrat)
- Update `:root` tokens — replace `--color-red: crimson` with `--color-red: #e94560`, add new tokens
- Set `body` and `html` dark base colors
- Fix global `p` color (currently `black` — breaks dark sections)
- Add `--font-mono` custom property for consistent monospace usage

- [ ] **Step 1: Update the @import and :root block**

Replace lines 1–9 in `style.css` with:

```css
@import url("https://fonts.googleapis.com/css2?family=Montserrat:wght@300;400;700&family=JetBrains+Mono:wght@400;500;700&display=swap");

:root {
  --color-cyan:   #64ffda;
  --color-orange: #f0a500;
  --color-red:    #e94560;
  --color-muted:  #888;
  --color-dark:   #0a0a0a;
  --color-surface: #111;
  --color-border:  #2a2a2a;
  --font-mono: "JetBrains Mono", "Fira Code", "Consolas", monospace;
}
```

- [ ] **Step 2: Update the global base styles**

Replace the current `html` and `p` rules (lines 16–45):

```css
html {
  font-size: 10px;
  font-family: "Montserrat", sans-serif;
  scroll-behavior: smooth;
  background-color: var(--color-dark);
  color: #ccc;
}
p {
  color: #aaa;
  font-size: 1.4rem;
  margin-top: 5px;
  line-height: 2.5rem;
  font-weight: 300;
  letter-spacing: 0.05rem;
}
```

- [ ] **Step 3: Update `.section-title` global color**

Replace:
```css
.section-title {
  font-size: 4rem;
  font-weight: 450;
  color: black;
  margin-bottom: 10px;
  text-transform: uppercase;
  letter-spacing: 0.2rem;
  text-align: center;
}
.section-title span {
  color: crimson;
}
```
With:
```css
.section-title {
  font-size: 4rem;
  font-weight: 700;
  color: white;
  margin-bottom: 10px;
  text-transform: uppercase;
  letter-spacing: 0.2rem;
  text-align: center;
  font-family: var(--font-mono);
}
.section-title span {
  color: var(--color-cyan);
}
```

- [ ] **Step 4: Update `.cta` buttons — swap crimson for cyan**

Replace the two `.cta` rules:
```css
.cta {
  display: inline-block;
  padding: 10px 30px;
  color: var(--color-cyan);
  background-color: transparent;
  border: 1px solid var(--color-cyan);
  font-size: 1.4rem;
  font-family: var(--font-mono);
  text-transform: uppercase;
  letter-spacing: 0.1rem;
  margin-top: 30px;
  transition: 0.3s ease;
  transition-property: background-color, color;
}
.cta:hover {
  color: var(--color-dark);
  background-color: var(--color-cyan);
}
```

- [ ] **Step 5: Update `.brand h1` to monospace**

Replace:
```css
.brand h1 {
  font-size: 3rem;
  text-transform: uppercase;
  color: white;
  font-family: var(--font-mono);
}
.brand h1 span {
  font-size: 3rem;
  text-transform: uppercase;
  color: var(--color-cyan);
}
```

- [ ] **Step 6: Open `index.html` in browser (file:// or live server), hard-refresh (Ctrl+Shift+R)**

Expected: page has a dark background, CTAs have cyan borders, section titles are white in monospace font. Body text is light gray instead of black.

- [ ] **Step 7: Commit**

```bash
cd /home/admin/Documents/Personal/Portfolio/MCMSys-Dev-Portfolio
git add style.css
git commit -m "feat: terminal redesign — foundation: dark palette, mono font, cyan CTAs"
```

---

## Task 2: Navigation — Bracketed Links + Dark Header

**Files:**
- Modify: `index.html` — nav `<a>` text only
- Modify: `style.css` — header/nav rules (lines 103–228)

**What to change:**
- Wrap nav link text in `[` `]` brackets
- Header background: dark semi-transparent with blur
- Nav hover: cyan instead of crimson
- Hamburger: cyan border instead of white
- Desktop nav: monospace font

- [ ] **Step 1: Update nav link text in `index.html`**

Find the `<ul>` inside `.nav-list` and change each `<a>` text:

```html
<ul>
    <li><a href="#hero"     data-after="Home">    [Home]    </a></li>
    <li><a href="#skills"   data-after="Skills">  [Skills]  </a></li>
    <li><a href="#projects" data-after="Projects">[Projects]</a></li>
    <li><a href="#about"    data-after="About">   [About]   </a></li>
    <li><a href="#contact"  data-after="Contact"> [Contact] </a></li>
</ul>
```

- [ ] **Step 2: Update header CSS**

Replace the `/* Header section */` block (lines 103–228) with:

```css
/* Header section */
#header {
  position: fixed;
  z-index: 1000;
  left: 0;
  top: 0;
  width: 100vw;
  height: auto;
}
#header .header {
  min-height: 8vh;
  background-color: rgba(10, 10, 10, 0.85);
  backdrop-filter: blur(8px);
  -webkit-backdrop-filter: blur(8px);
  border-bottom: 1px solid var(--color-border);
  transition: 0.3s ease background-color;
}
#header .nav-bar {
  display: flex;
  align-items: center;
  justify-content: space-between;
  width: 100%;
  height: 100%;
  max-width: 1300px;
  padding: 0 20px;
}
#header .nav-list ul {
  list-style: none;
  position: absolute;
  background-color: #0a0a0a;
  width: 100vw;
  height: 100vh;
  left: 100%;
  top: 0;
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  z-index: 1;
  overflow-x: hidden;
  transition: 0.5s ease left;
}
#header .nav-list ul.active {
  left: 0%;
}
#header .nav-list ul a {
  font-size: 2.5rem;
  font-weight: 500;
  font-family: var(--font-mono);
  letter-spacing: 0.1rem;
  text-decoration: none;
  color: #aaa;
  padding: 20px;
  display: block;
  transition: color 0.2s ease;
}
#header .nav-list ul a::after {
  content: attr(data-after);
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%) scale(0);
  color: rgba(100, 255, 218, 0.03);
  font-size: 13rem;
  letter-spacing: 50px;
  z-index: -1;
  transition: 0.3s ease letter-spacing;
}
#header .nav-list ul li:hover a::after {
  transform: translate(-50%, -50%) scale(1);
  letter-spacing: initial;
}
#header .nav-list ul li:hover a {
  color: var(--color-cyan);
}
#header .hamburger {
  height: 60px;
  width: 60px;
  display: inline-flex;
  border: 2px solid var(--color-cyan);
  border-radius: 50%;
  position: relative;
  align-items: center;
  justify-content: center;
  z-index: 100;
  cursor: pointer;
  transform: scale(0.8);
  margin-right: 20px;
}
#header .hamburger:after {
  position: absolute;
  content: "";
  height: 100%;
  width: 100%;
  border-radius: 50%;
  border: 2px solid var(--color-cyan);
  animation: hamburger_puls 1s ease infinite;
}
#header .hamburger .bar {
  height: 2px;
  width: 30px;
  position: relative;
  background-color: var(--color-cyan);
  z-index: -1;
}
#header .hamburger .bar::after,
#header .hamburger .bar::before {
  content: "";
  position: absolute;
  height: 100%;
  width: 100%;
  left: 0;
  background-color: var(--color-cyan);
  transition: 0.3s ease;
  transition-property: top, bottom;
}
#header .hamburger .bar::after  { top: 8px; }
#header .hamburger .bar::before { bottom: 8px; }
#header .hamburger.active .bar::before { bottom: 0; }
#header .hamburger.active .bar::after  { top: 0; }
/* End Header section */
```

- [ ] **Step 3: Update desktop nav font size in media query**

In the `@media only screen and (min-width: 1200px)` block, update the nav rule:
```css
#header .nav-list ul li a {
  font-size: 1.4rem;
  font-family: var(--font-mono);
  color: #aaa;
}
```

- [ ] **Step 4: Hard-refresh browser**

Expected: header is dark with blur, nav links show `[Home]` `[Skills]` etc. in monospace, hover turns cyan.

- [ ] **Step 5: Commit**

```bash
git add style.css index.html
git commit -m "feat: terminal redesign — bracketed nav, dark blurred header, cyan accents"
```

---

## Task 3: Hero Section — Pure Dark, Refined Typography

**Files:**
- Modify: `style.css` — `/* Hero Section*/` block (lines 230–294)

**What to change:**
- Keep the photo background + dark overlay (it's atmospheric)
- Darken the overlay to 0.85 opacity
- Hero h3 (role line) uses monospace font
- Hero h1 animation color: change `text_reveal_name` from crimson to cyan
- `.hero-meta` and `.hero-location` style refinements

- [ ] **Step 1: Update `#hero` and animation rules**

Replace the `/* Hero Section*/` block:

```css
/* Hero Section*/
#hero {
  background-image: url(./img/Front.jpg);
  background-size: cover;
  background-position: top center;
  position: relative;
  z-index: 1;
}
#hero::after {
  content: "";
  position: absolute;
  left: 0;
  top: 0;
  height: 100%;
  width: 100%;
  background-color: #000;
  opacity: 0.85;
  z-index: -1;
}
#hero .hero {
  max-width: 1200px;
  margin: 0 auto;
  padding: 0 50px;
  justify-content: flex-start;
}
#hero h1 {
  display: block;
  width: fit-content;
  font-size: 4rem;
  position: relative;
  color: transparent;
  animation: text_reveal 0.5s ease forwards;
  animation-delay: 1s;
}
#hero h1:nth-child(1) { animation-delay: 1s; }
#hero h1:nth-child(2) { animation-delay: 2s; }
#hero h1:nth-child(3) {
  animation: text_reveal_name 0.5s ease forwards;
  animation-delay: 3s;
  font-family: var(--font-mono);
  font-size: 2.8rem;
}
#hero h1 span {
  position: absolute;
  top: 0;
  left: 0;
  height: 100%;
  width: 0;
  background-color: var(--color-cyan);
  animation: text_reveal_box 1s ease;
  animation-delay: 0.5s;
}
#hero h1:nth-child(1) span { animation-delay: 0.5s; }
#hero h1:nth-child(2) span { animation-delay: 1.5s; }
#hero h1:nth-child(3) span { animation-delay: 2.5s; }
/*End Hero Section*/
```

- [ ] **Step 2: Update the `text_reveal_name` keyframe (from crimson to cyan)**

Find and replace:
```css
@keyframes text_reveal_name {
  100% {
    color: var(--color-cyan);
  }
}
```

- [ ] **Step 3: Update `.hero-meta` and `.hero-location` styles**

Replace:
```css
.hero-meta,
.hero-location {
  color: var(--color-muted);
  font-size: 1.4rem;
  margin-top: 15px;
  font-weight: 300;
  font-family: var(--font-mono);
  letter-spacing: 0.03rem;
  opacity: 0;
  animation: text_reveal_muted 0.5s ease forwards;
  animation-delay: 4s;
}
.hero-location {
  animation-delay: 4.5s;
  font-size: 1.2rem;
}
```

- [ ] **Step 4: Hard-refresh browser**

Expected: role line (`DevSecOps · SRE · Cloud Engineer`) renders in monospace and animates to cyan. Meta lines are monospace muted gray. CTA buttons have cyan borders.

- [ ] **Step 5: Commit**

```bash
git add style.css
git commit -m "feat: terminal redesign — hero mono role line, cyan animation, darker overlay"
```

---

## Task 4: Skills & Certifications — Flat Dark Surface

**Files:**
- Modify: `style.css` — `/* Skills Section */` block (lines 295–402)

**What to change:**
- Replace gradient background with flat `var(--color-dark)` — consistent with global bg
- Add a top accent line (1px cyan) to visually separate sections
- Skill tags: sharper (border-radius: 2px), monospace font
- Cert cards: flat `var(--color-surface)` + `var(--color-border)` border
- Section titles and category titles: monospace

- [ ] **Step 1: Replace the entire `/* Skills Section */` block**

```css
/* Skills Section */
#skills {
  background-color: var(--color-dark);
  border-top: 1px solid var(--color-border);
}
#skills .skills-wrapper {
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: flex-start;
  min-height: 100vh;
  width: 100%;
  text-align: center;
  padding: 120px 20px 80px;
}
#skills .skills-header {
  margin-bottom: 60px;
}
#skills .section-title {
  color: white;
}
#skills .section-title span {
  color: var(--color-cyan);
}
#skills .skills-grid {
  display: flex;
  flex-wrap: wrap;
  justify-content: center;
  gap: 40px;
  max-width: 900px;
  margin: 0 auto 80px auto;
}
#skills .skill-category {
  min-width: 200px;
  text-align: left;
}
#skills .skill-category-title {
  font-size: 1.1rem;
  font-family: var(--font-mono);
  text-transform: uppercase;
  letter-spacing: 0.12rem;
  margin-bottom: 14px;
}
#skills .skill-tags {
  display: flex;
  flex-wrap: wrap;
  gap: 8px;
}
#skills .skill-tag {
  padding: 4px 12px;
  border-radius: 2px;
  font-size: 1.1rem;
  font-family: var(--font-mono);
  font-weight: 400;
  border: 1px solid;
}
#skills .skill-tag.infra    { border-color: var(--color-cyan);   color: var(--color-cyan); }
#skills .skill-tag.cloud    { border-color: var(--color-orange); color: var(--color-orange); }
#skills .skill-tag.security { border-color: var(--color-red);    color: var(--color-red); }
#skills .skill-tag.scripting{ border-color: var(--color-muted);  color: var(--color-muted); }

/* Certifications */
#skills .cert-header {
  margin-bottom: 24px;
}
#skills .cert-title {
  font-size: 1.8rem;
  font-family: var(--font-mono);
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
  background: var(--color-surface);
  border: 1px solid var(--color-border);
  border-radius: 4px;
  padding: 18px 24px;
  min-width: 260px;
  text-align: left;
  transition: border-color 0.2s ease;
}
#skills .cert-card:hover {
  border-color: var(--color-cyan);
}
#skills .cert-card.gcp           { border-left: 3px solid var(--color-orange); }
#skills .cert-card.security-cert { border-left: 3px solid var(--color-red); }
#skills .cert-icon {
  font-size: 2.8rem;
  line-height: 1;
}
#skills .cert-info h3 {
  font-size: 1.4rem;
  font-family: var(--font-mono);
  font-weight: 600;
  color: white;
  margin-bottom: 4px;
}
#skills .cert-info p {
  color: var(--color-muted);
  font-size: 1.2rem;
  margin: 0;
  line-height: 1.6rem;
}
#skills .cert-issuer {
  font-size: 1rem;
  font-family: var(--font-mono);
  color: #555;
  margin-top: 4px;
  display: block;
}
/* End Skills Section */
```

- [ ] **Step 2: Hard-refresh browser**

Expected: Skills section has same dark background as rest of page. Skill tags are sharp-cornered monospace labels. Cert cards are flat dark with a colored left accent. Hovering a cert card highlights it.

- [ ] **Step 3: Commit**

```bash
git add style.css
git commit -m "feat: terminal redesign — skills flat dark surface, mono tags, accent cert cards"
```

---

## Task 5: Projects Section — Flat Dark Cards

**Files:**
- Modify: `style.css` — `/* Projects section */` block (lines 403–511)

**What to change:**
- Remove the background image from `.projects`
- Replace `.project-info` gradient with flat dark surface + left accent border
- Remove `.project-img::after` gradient overlay
- Monospace font for category label and tech tags
- Add `border-top: 1px solid var(--color-border)` section separator

- [ ] **Step 1: Replace the entire `/* Projects section */` block**

```css
/* Projects section */
#projects {
  background-color: var(--color-dark);
  border-top: 1px solid var(--color-border);
}
#projects .projects {
  flex-direction: column;
  margin: 0 auto;
  padding: 120px 0 80px;
  width: 100%;
}
#projects .projects-header h1 {
  margin-bottom: 50px;
}
#projects .all-projects {
  display: flex;
  align-items: center;
  justify-content: center;
  flex-direction: column;
}
#projects .project-item {
  display: flex;
  align-items: stretch;
  justify-content: center;
  flex-direction: column;
  width: 80%;
  margin: 12px auto;
  overflow: hidden;
  border-radius: 4px;
  border: 1px solid var(--color-border);
  transition: border-color 0.2s ease;
}
#projects .project-item:hover {
  border-color: #444;
}
#projects .project-info {
  padding: 36px;
  flex-basis: 50%;
  display: flex;
  align-items: flex-start;
  justify-content: center;
  flex-direction: column;
  background-color: var(--color-surface);
  color: white;
  border-left: 3px solid var(--color-cyan);
}
#projects .project-info h1 {
  font-size: 2.6rem;
  font-weight: 600;
}
#projects .project-info h2 {
  font-size: 1.4rem;
  font-weight: 400;
  color: var(--color-muted);
  margin-top: 6px;
  font-family: var(--font-mono);
}
#projects .project-info p {
  color: #aaa;
  margin-top: 14px;
}
#projects .project-img {
  flex-basis: 50%;
  height: 260px;
  overflow: hidden;
  position: relative;
}
#projects .project-img img {
  transition: 0.3s ease transform;
  filter: brightness(0.4) saturate(0.3);
}
#projects .project-item:hover .project-img img {
  transform: scale(1.05);
  filter: brightness(0.5) saturate(0.4);
}
/* Project accent card */
#projects .project-accent-header {
  margin-bottom: 12px;
}
#projects .project-category {
  font-size: 1rem;
  font-family: var(--font-mono);
  text-transform: uppercase;
  letter-spacing: 0.12rem;
  color: var(--color-cyan);
  font-weight: 500;
}
#projects .project-tech-tags {
  display: flex;
  flex-wrap: wrap;
  gap: 8px;
  margin-top: 16px;
}
#projects .project-tech-tag {
  font-size: 1rem;
  font-family: var(--font-mono);
  color: var(--color-muted);
  border: 1px solid #333;
  padding: 3px 10px;
  border-radius: 2px;
}
/* End Projects section */
```

- [ ] **Step 2: Hard-refresh browser**

Expected: Projects section has same dark background. Each project card is a flat dark card with cyan left border. Images are desaturated/dimmed. Category labels and tech tags use monospace. No gradients anywhere.

- [ ] **Step 3: Commit**

```bash
git add style.css
git commit -m "feat: terminal redesign — projects flat dark cards, cyan left border, mono tags"
```

---

## Task 6: About Section — Clean Dark, Simplified Stat Cards

**Files:**
- Modify: `style.css` — `/*About Section*/` block (lines 513–591)

**What to change:**
- Add `background-color: var(--color-dark)` and section separator
- Stat cards: flat surface style consistent with the rest
- About text colors: white/muted on dark
- CTA color override: already handled globally in Task 1

- [ ] **Step 1: Replace the `/*About Section*/` block**

```css
/*About Section*/
#about {
  background-color: var(--color-dark);
  border-top: 1px solid var(--color-border);
}
#about .about {
  flex-direction: column-reverse;
  text-align: center;
  max-width: 1200px;
  margin: 0 auto;
  padding: 120px 20px 80px;
}
#about .col-left {
  width: 250px;
  height: 360px;
}
#about .col-right {
  width: 100%;
}
#about .col-right h2 {
  font-size: 1.8rem;
  font-weight: 500;
  font-family: var(--font-mono);
  letter-spacing: 0.1rem;
  margin-bottom: 10px;
  color: white;
}
#about .col-right p {
  color: #aaa;
  margin-bottom: 20px;
}
#about .cta {
  margin-bottom: 50px;
  padding: 10px 20px;
  font-size: 1.4rem;
}
#about .col-left .about-img {
  height: 100%;
  width: 100%;
  position: relative;
  border: 2px solid var(--color-border);
}
#about .col-left .about-img::after {
  content: "";
  position: absolute;
  left: -20px;
  top: 20px;
  height: 100%;
  width: 100%;
  border: 2px solid var(--color-cyan);
  z-index: -1;
}

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
  padding: 14px 22px;
  border-left: 3px solid;
  background: var(--color-surface);
  border-bottom: 1px solid var(--color-border);
  border-right: 1px solid var(--color-border);
  border-top: 1px solid var(--color-border);
  min-width: 110px;
}
#about .stat-card.stat-cyan   { border-left-color: var(--color-cyan); }
#about .stat-card.stat-orange { border-left-color: var(--color-orange); }
#about .stat-card.stat-red    { border-left-color: var(--color-red); }
#about .stat-number {
  font-size: 2.4rem;
  font-weight: 700;
  font-family: var(--font-mono);
  color: white;
  line-height: 1;
}
#about .stat-label {
  font-size: 1rem;
  font-family: var(--font-mono);
  color: var(--color-muted);
  margin-top: 4px;
}
/*End About Section*/
```

- [ ] **Step 2: Hard-refresh browser**

Expected: About section has same dark background. Photo has a thin cyan offset border (not crimson). Stat cards are flat dark with colored left accents. Numbers and labels use monospace.

- [ ] **Step 3: Commit**

```bash
git add style.css
git commit -m "feat: terminal redesign — about flat dark, cyan photo border, mono stat cards"
```

---

## Task 7: Contact & Footer — Unified Dark System

**Files:**
- Modify: `style.css` — `/* contact Section */` and `/*Footer Section*/` blocks (lines 592–691)

**What to change:**
- Contact: flat dark background (already attempted — ensure it sticks), flat dark cards
- Contact card items: use `var(--color-surface)` + border
- Footer: pure black with thin top border, simpler
- Section title colors already handled globally

- [ ] **Step 1: Replace the `/* contact Section */` block**

```css
/* contact Section */
#contact {
  background-color: var(--color-dark);
  border-top: 1px solid var(--color-border);
}
#contact .contact {
  flex-direction: column;
  max-width: 1000px;
  margin: 0 auto;
  width: 90%;
  padding: 120px 0 80px;
}
#contact .section-title {
  color: white;
  margin-bottom: 60px;
}
#contact .contact-items {
  width: 100%;
}
#contact .contact-item {
  width: 80%;
  padding: 24px 30px;
  margin: 12px auto;
  display: flex;
  justify-content: flex-start;
  align-items: center;
  flex-direction: row;
  gap: 20px;
  background: var(--color-surface);
  border: 1px solid var(--color-border);
  border-left: 3px solid var(--color-cyan);
  border-radius: 4px;
  transition: border-color 0.2s ease;
}
#contact .contact-item:hover {
  border-color: var(--color-cyan);
}
#contact .icon {
  width: 50px;
  height: 50px;
  flex-shrink: 0;
}
#contact .icon img {
  width: 100%;
  height: 100%;
  object-fit: contain;
}
#contact .contact-info h1 {
  font-size: 1.4rem;
  font-family: var(--font-mono);
  font-weight: 500;
  color: var(--color-muted);
  text-transform: uppercase;
  letter-spacing: 0.1rem;
  margin-bottom: 4px;
}
#contact .contact-info h2 {
  font-size: 1.8rem;
  font-weight: 400;
  color: white;
  line-height: 1.4;
}
#contact .contact-info h2 a {
  color: inherit;
  transition: color 0.2s ease;
}
#contact .contact-info h2 a:hover {
  color: var(--color-cyan);
}
/*End contact Section */
```

- [ ] **Step 2: Replace the `/*Footer Section*/` block**

```css
/*Footer Section*/
#footer {
  background-color: #000;
  border-top: 1px solid var(--color-border);
}
#footer .footer {
  min-height: 200px;
  flex-direction: column;
  padding: 40px 20px;
}
#footer .brand h1 {
  font-family: var(--font-mono);
  font-size: 2rem;
  color: white;
}
#footer .brand h1 span {
  color: var(--color-cyan);
  font-size: 2rem;
}
#footer h2 {
  color: #666;
  font-weight: 400;
  font-size: 1.4rem;
  font-family: var(--font-mono);
  letter-spacing: 0.05rem;
  padding-top: 8px;
}
#footer h2 span {
  color: var(--color-cyan);
}
#footer .social-icon {
  display: flex;
  margin-top: 20px;
  margin-bottom: 10px;
  gap: 10px;
}
#footer .social-item {
  height: 40px;
  width: 40px;
}
#footer .social-item img {
  filter: grayscale(1) brightness(0.6);
  transition: 0.3s ease filter;
}
#footer .social-item:hover img {
  filter: grayscale(0) brightness(1);
}
#footer p {
  margin-top: 10px;
  color: #444;
  text-align: center;
  font-size: 1rem;
  font-family: var(--font-mono);
}
/*End Footer Section*/
```

- [ ] **Step 3: Update tablet media query for contact**

In `@media only screen and (min-width: 768px)`, replace the `/* contact */` section:
```css
/* contact  */
#contact .contact {
  padding: 120px 0 80px;
}
#contact .contact-items {
  width: 100%;
}
#contact .contact-item {
  width: 70%;
}
/* End contact  */
```

- [ ] **Step 4: Hard-refresh browser**

Expected: Contact cards are flat dark with cyan left border, left-aligned with icon + label/value. Footer is pure black with monospace text. Everything unified — no section looks white.

- [ ] **Step 5: Commit**

```bash
git add style.css
git commit -m "feat: terminal redesign — contact flat cards, unified footer, full dark system"
```

---

## Task 8: Tablet/Desktop Media Query Cleanup

**Files:**
- Modify: `style.css` — both `@media` blocks (lines 742–865)

The media queries contain overrides for the old crimson color and old layout values. These need to match the new system.

- [ ] **Step 1: In `@media (min-width: 768px)`, update `.section-title` font size**

```css
h1.section-title {
  font-size: 5rem;
}
```

- [ ] **Step 2: In `@media (min-width: 768px)`, update project layout**

```css
/* Project */
#projects .project-item {
  flex-direction: row;
  height: 380px;
  margin: 12px auto;
  width: 85%;
  border-radius: 4px;
}
#projects .project-item:nth-child(even) {
  flex-direction: row-reverse;
}
#projects .all-projects .project-info {
  height: 100%;
}
#projects .all-projects .project-img {
  height: 100%;
}
/* End Project */
```

- [ ] **Step 3: In `@media (min-width: 768px)`, update about column layout**

```css
/* About */
#about .about {
  flex-direction: row;
  padding: 120px 40px 80px;
}
#about .col-left {
  width: 500px;
  height: 360px;
  padding-left: 40px;
  flex-shrink: 0;
}
#about .about .col-left .about-img::after {
  left: -30px;
  top: 30px;
  height: 100%;
  width: 100%;
  border: 2px solid var(--color-cyan);
}
#about .col-right {
  text-align: left;
  padding: 30px 40px;
}
#about .col-right h1 {
  text-align: left;
}
/* End About */
```

- [ ] **Step 4: In `@media (min-width: 1200px)`, update desktop nav**

```css
/* header */
#header .hamburger {
  display: none;
}
#header .nav-list ul {
  position: initial;
  display: block;
  height: auto;
  width: fit-content;
  background-color: transparent;
}
#header .nav-list ul li {
  display: inline-block;
}
#header .nav-list ul li a {
  font-size: 1.3rem;
  font-family: var(--font-mono);
  color: #aaa;
  padding: 10px 16px;
}
#header .nav-list ul a::after {
  display: none;
}
/* End header */
```

- [ ] **Step 5: Hard-refresh at desktop viewport**

Expected: On desktop, nav links show `[Home]` `[Skills]` etc. in small monospace. Projects alternate left/right side. About shows two-column layout with photo on left and cyan offset border.

- [ ] **Step 6: Commit**

```bash
git add style.css
git commit -m "feat: terminal redesign — media query cleanup, responsive layout aligned to new system"
```

---

## Self-Review

**Spec coverage check:**
- ✅ Dark background unified across all sections (Tasks 1, 4, 5, 6, 7)
- ✅ Monospace font throughout UI elements (Tasks 1, 2, 3, 4, 5, 6, 7)
- ✅ Cyan as primary accent replacing crimson (Tasks 1, 2, 3, 4, 5, 6, 7)
- ✅ Bracketed navigation (Task 2)
- ✅ Flat cards with border accents — no gradients (Tasks 4, 5, 6, 7)
- ✅ Section separators via top border (Tasks 4, 5, 6, 7)
- ✅ Responsive layout preserved (Task 8)
- ✅ All existing content/sections untouched

**Placeholder scan:** No TBDs, TODOs, or vague steps found.

**Token consistency:** `var(--color-cyan)`, `var(--color-surface)`, `var(--color-border)`, `var(--color-muted)`, `var(--color-dark)`, `var(--font-mono)` used consistently across all tasks. All defined in Task 1.
