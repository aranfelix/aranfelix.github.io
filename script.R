# ================= Aran Felix portfolio: UPDATE 3 (tool logos and data collection) =================
if (basename(getwd()) != "aranfelix-portfolio")
  stop("Open the aranfelix-portfolio project first (File > Open Project).")

# ---- the logos: download tool-logos.zip from the chat first (it goes to your Downloads folder)
zip_candidates <- c(
  file.path(getwd(), "tool-logos.zip"),
  file.path(Sys.getenv("USERPROFILE"), "Downloads", "tool-logos.zip"),
  file.path(path.expand("~"), "Downloads", "tool-logos.zip")
)
zip_found <- zip_candidates[file.exists(zip_candidates)]
if (length(zip_found) == 0)
  stop("tool-logos.zip not found. Download it from the chat, or copy it into the aranfelix-portfolio folder, then run this script again.")

unlink("docs", recursive = TRUE)
unlink(".quarto", recursive = TRUE)
unlink("_freeze", recursive = TRUE)
for (d in c("images", "files", "projects")) dir.create(d, showWarnings = FALSE)
unzip(zip_found[1], exdir = ".", overwrite = TRUE)
message("logos installed in images/tools: ", paste(list.files("images/tools"), collapse = ", "))

w <- function(path, text) {
  writeLines(trimws(text), path, useBytes = TRUE)
  message("written: ", path)
}

# ------------------------------------------------------------ _quarto.yml
w("_quarto.yml", r"---(
project:
  type: website
  output-dir: docs
  resources:
    - files/*

website:
  title: "Aran Felix"
  site-url: https://aranfelix.github.io
  description: "Aran Felix, The Data Cruncher: statistics, data analytics and research & M&E portfolio."
  favicon: images/favicon.svg
  open-graph: true
  twitter-card: true
  search: true
  back-to-top-navigation: true
  navbar:
    logo: images/logo.png
    logo-alt: "Aran Felix, The Data Cruncher"
    title: false
    background: "#10243A"
    foreground: "#FFFFFF"
    collapse-below: lg
    right:
      - text: "Home"
        href: index.qmd
      - text: "Projects"
        href: projects.qmd
      - text: "Research & M&E"
        href: research-m-e.qmd
      - text: "About"
        href: about.qmd
      - text: "Contact"
        menu:
          - text: "WhatsApp"
            icon: whatsapp
            href: "https://wa.me/254111991749"
          - text: "LinkedIn"
            icon: linkedin
            href: "https://www.linkedin.com/in/aranfelix/"
          - text: "Email"
            icon: envelope
            href: "mailto:aranfelix2013@gmail.com"
          - text: "GitHub"
            icon: github
            href: "https://github.com/aranfelix"
  page-footer:
    left: "&copy; 2026 Aran Felix &middot; The Data Cruncher"
    right: "Built with Quarto"

format:
  html:
    theme:
      light: cosmo
      dark: darkly
    respect-user-color-scheme: true
    css:
      - styles.css
      - tools.css
    lang: en-GB
    grid:
      sidebar-width: 0px
      body-width: 1060px
      margin-width: 0px
      gutter-width: 1.5rem
    toc: false
    anchor-sections: false
    smooth-scroll: true
    link-external-newwindow: true
    code-fold: true
    code-tools: false
    fig-align: center

execute:
  freeze: auto
  warning: false
  message: false
)---")

# ------------------------------------------------------------ tools.css (logo wall)
w("tools.css", r"---(
/* ===== Tools wall with logos ===== */
.toolwall {
  display: grid;
  grid-template-columns: repeat(5, minmax(0, 1fr));
  gap: 1px;
  background: var(--line);
  border: 1px solid var(--line);
  border-radius: 14px;
  overflow: hidden;
  margin: 1.2rem 0 2rem;
}
.tw-col { background: var(--card); padding: 1.2rem 1.05rem; }
.tw-col h4 { font-size: 1rem; margin: 0 0 1rem; line-height: 1.25; }
.tw-col h4 .acc { color: var(--blue); display: block; }
.tw-item { display: flex; align-items: center; gap: 0.7rem; margin-bottom: 0.85rem; }
.tw-logo {
  width: 52px;
  height: 52px;
  flex: 0 0 auto;
  border-radius: 50%;
  background: #ffffff;
  border: 1px solid var(--line);
  box-shadow: 0 2px 8px rgba(16, 36, 58, 0.12);
  display: flex;
  align-items: center;
  justify-content: center;
}
.tw-logo img { width: 30px; height: 30px; object-fit: contain; display: block; }
.tw-logo.wide img { width: 40px; height: auto; }
.tw-logo.badge {
  background: linear-gradient(135deg, #2563eb, #10243A);
  border: 0;
  color: #ffffff;
  font-weight: 800;
  font-size: 0.85rem;
}
.tw-logo.badge.tiny { font-size: 0.62rem; letter-spacing: 0; }
.tw-logo.badge i { font-size: 1.2rem; }
.tw-name { font-weight: 600; font-size: 0.93rem; line-height: 1.25; }
.tw-name small { display: block; font-weight: 400; color: var(--muted); font-size: 0.76rem; }
@media (max-width: 1099px) {
  .toolwall { grid-template-columns: repeat(2, minmax(0, 1fr)); }
  .tw-col:last-child { grid-column: 1 / -1; }
}
@media (max-width: 520px) {
  .toolwall { grid-template-columns: 1fr; }
}
)---")

# ------------------------------------------------------------ index.qmd
w("index.qmd", r"---(
---
pagetitle: "Aran Felix | The Data Cruncher | Statistics, Data Analytics and Research"
listing:
  id: featured
  contents: "projects/*.qmd"
  type: grid
  max-items: 3
  sort: "date desc"
  fields: [image, title, description, categories]
---

::::: {.hero}
<span class="pill">STATISTICS &middot; DATA ANALYTICS &middot; RESEARCH &amp; M&amp;E</span><span class="open-badge">Open to opportunities</span>

# Turning data into evidence and better decisions.

I am a statistician and data analyst who turns raw data into clear, defensible evidence for banks, NGOs, research organisations and businesses: questionnaire design, digital data collection, statistical analysis, qualitative research, dashboards and M&E reporting.

[Explore Projects](projects.qmd){.btn .btn-primary}
[View CV](cv.qmd){.btn .btn-outline-dark}
[Contact me](#contact){.btn .btn-outline-dark}

<p class="hero-note">Open to full-time roles, contracts and consulting &middot; Data Analyst &middot; Research Analyst &middot; M&amp;E Analyst &middot; BI &amp; Reporting Analyst</p>
:::::

<div class="feature-grid">
<a class="feature-card" href="projects.html"><i class="bi bi-database ic"></i><h3>Data Analytics</h3><p>Data cleaning, SQL, Python and R analysis, and dashboards that answer real questions.</p></a>
<a class="feature-card" href="research-m-e.html"><i class="bi bi-journal-text ic"></i><h3>Research &amp; Statistics</h3><p>Study and questionnaire design, SPSS and Stata analysis, and results explained in plain language.</p></a>
<a class="feature-card" href="projects.html"><i class="bi bi-bar-chart-line ic"></i><h3>Business Intelligence</h3><p>Tableau and Power BI reporting that decision-makers actually use.</p></a>
<a class="feature-card" href="research-m-e.html"><i class="bi bi-clipboard-check ic"></i><h3>Monitoring &amp; Evaluation</h3><p>Indicators, digital data collection and data quality checks for donors and boards.</p></a>
</div>

## Where I add value

<div class="feature-grid">
<div class="feature-card"><i class="bi bi-bank ic"></i><h3>Banking &amp; Finance</h3><p>Accurate numbers, clear reporting and analysis that can be audited.</p><ul class="mini"><li>SQL extraction, validation and reconciliation</li><li>Excel, Tableau and Power BI reporting</li><li>Segmentation, trend analysis and logistic regression</li></ul></div>
<div class="feature-card"><i class="bi bi-people ic"></i><h3>NGOs &amp; Development</h3><p>Donor-ready evidence you can trust.</p><ul class="mini"><li>Questionnaires and digital data collection (ODK, KoboToolbox)</li><li>Indicator frameworks and data quality checks</li><li>Survey analysis in SPSS, Stata and R</li><li>Qualitative coding in NVivo and ATLAS.ti</li><li>Donor-style reporting</li></ul></div>
<div class="feature-card"><i class="bi bi-mortarboard ic"></i><h3>Research Organisations</h3><p>Rigorous analysis that others can reproduce.</p><ul class="mini"><li>Study design, sampling and questionnaire design</li><li>REDCap and CAPI data collection</li><li>Hypothesis testing, regression and ANOVA</li><li>Mixed-methods analysis</li><li>Documented workflows in R, Python and Stata</li></ul></div>
<div class="feature-card"><i class="bi bi-graph-up-arrow ic"></i><h3>Business &amp; Corporate</h3><p>Insight that moves decisions.</p><ul class="mini"><li>KPI dashboards in Tableau and Power BI</li><li>Cohort, trend and A/B-test analysis</li><li>SQL-based reporting</li><li>Plain-language summaries for managers</li></ul></div>
</div>

## Featured work

::: {#featured}
:::

[See all projects &rarr;](projects.qmd)

## Why work with me

<div class="feature-grid three">
<div class="feature-card"><i class="bi bi-diagram-3 ic"></i><h3>Numbers and narratives</h3><p>I work in both quantitative tools (SPSS, Stata, R, Python) and qualitative tools (NVivo, ATLAS.ti), so your evidence has both the scale and the story.</p></div>
<div class="feature-card"><i class="bi bi-shield-check ic"></i><h3>From questionnaire to report</h3><p>I design the questionnaire, collect the data digitally, analyse it and report it, so quality is protected at every step.</p></div>
<div class="feature-card"><i class="bi bi-chat-left-text ic"></i><h3>Plain-language results</h3><p>You get findings that a programme manager, donor or board member can understand and use, not just tables of output. Limits are stated plainly.</p></div>
</div>

## Tools and methods

<div class="toolwall">
<div class="tw-col">
<h4><span class="acc">Programming</span>and databases</h4>
<div class="tw-item"><span class="tw-logo"><img src="images/tools/sql.png" alt="" width="30" height="30" loading="lazy"></span><span class="tw-name">SQL</span></div>
<div class="tw-item"><span class="tw-logo"><img src="images/tools/python.png" alt="" width="30" height="30" loading="lazy"></span><span class="tw-name">Python</span></div>
<div class="tw-item"><span class="tw-logo badge">R</span><span class="tw-name">R<small>RStudio</small></span></div>
</div>
<div class="tw-col">
<h4><span class="acc">Statistical and</span>qualitative software</h4>
<div class="tw-item"><span class="tw-logo"><img src="images/tools/spss.png" alt="" width="30" height="30" loading="lazy"></span><span class="tw-name">SPSS</span></div>
<div class="tw-item"><span class="tw-logo wide"><img src="images/tools/stata.png" alt="" width="40" height="14" loading="lazy"></span><span class="tw-name">Stata</span></div>
<div class="tw-item"><span class="tw-logo"><img src="images/tools/nvivo.png" alt="" width="30" height="30" loading="lazy"></span><span class="tw-name">NVivo</span></div>
<div class="tw-item"><span class="tw-logo"><img src="images/tools/atlasti.png" alt="" width="30" height="30" loading="lazy"></span><span class="tw-name">ATLAS.ti</span></div>
</div>
<div class="tw-col">
<h4><span class="acc">Data collection</span>and survey design</h4>
<div class="tw-item"><span class="tw-logo wide"><img src="images/tools/odk.png" alt="" width="40" height="22" loading="lazy"></span><span class="tw-name">ODK Collect</span></div>
<div class="tw-item"><span class="tw-logo"><img src="images/tools/kobo.png" alt="" width="30" height="30" loading="lazy"></span><span class="tw-name">KoboToolbox</span></div>
<div class="tw-item"><span class="tw-logo badge tiny">RC</span><span class="tw-name">REDCap</span></div>
<div class="tw-item"><span class="tw-logo badge tiny">CAPI</span><span class="tw-name">CAPI<small>Computer-assisted interviewing</small></span></div>
<div class="tw-item"><span class="tw-logo badge"><i class="bi bi-card-checklist"></i></span><span class="tw-name">Questionnaire design</span></div>
</div>
<div class="tw-col">
<h4><span class="acc">Visualisation</span>and reporting</h4>
<div class="tw-item"><span class="tw-logo"><img src="images/tools/tableau.png" alt="" width="30" height="30" loading="lazy"></span><span class="tw-name">Tableau</span></div>
<div class="tw-item"><span class="tw-logo badge"><i class="bi bi-bar-chart-fill"></i></span><span class="tw-name">Power BI</span></div>
<div class="tw-item"><span class="tw-logo"><img src="images/tools/excel.png" alt="" width="30" height="30" loading="lazy"></span><span class="tw-name">Excel</span></div>
</div>
<div class="tw-col">
<h4><span class="acc">Analytic</span>methods</h4>
<ul class="method-list">
<li>Exploratory data analysis</li>
<li>Data cleaning and validation</li>
<li>Descriptive and inferential statistics</li>
<li>Hypothesis tests (t-test, chi-square, post-hoc)</li>
<li>ANOVA</li>
<li>Linear and logistic regression</li>
<li>Segmentation and clustering</li>
<li>Cohort analysis</li>
<li>A/B testing</li>
<li>Questionnaire and survey design, sampling</li>
<li>Thematic analysis</li>
</ul>
</div>
</div>

## Methods in action

Pick a sector to see the methods I would apply and the questions they help answer.

::: {.panel-tabset}

### Banking & Finance

<div class="pills"><span>Data validation and reconciliation</span><span>Exploratory analysis</span><span>Customer segmentation</span><span>Logistic regression</span><span>Trend and seasonality analysis</span><span>Anomaly detection (IQR, z-scores)</span><span>KPI dashboards</span></div>

**Questions I can help answer**

- Which customer segments drive revenue, and which are likely to leave?
- Where do reports disagree with the source data, and why?
- Which transactions or accounts look unusual enough to review?
- How is portfolio performance trending, and what is behind the change?

### NGOs & M&E

<div class="pills"><span>Questionnaire design</span><span>Digital data collection (ODK, KoboToolbox, REDCap, CAPI)</span><span>Indicator frameworks</span><span>Data quality assessment</span><span>Survey data analysis</span><span>Thematic analysis</span><span>Mixed-methods triangulation</span><span>Donor-style reporting</span></div>

**Questions I can help answer**

- Did the programme reach its targets, and for whom?
- Is the data we are reporting reliable?
- What do participants say, and does it match the numbers?
- Which locations or groups are falling behind?

### Research

<div class="pills"><span>Study design and sampling</span><span>Questionnaire design</span><span>REDCap and CAPI data collection</span><span>Sample-size planning</span><span>Hypothesis testing</span><span>ANOVA and non-parametric tests</span><span>Linear and logistic regression</span><span>Reproducible workflows</span></div>

**Questions I can help answer**

- Is this difference real, or just noise?
- Which factors are associated with the outcome after adjusting for others?
- How large is the effect, and how sure are we?
- Could someone else reproduce this result?

### Business analytics

<div class="pills"><span>Cohort and retention analysis</span><span>A/B testing</span><span>Segmentation</span><span>Forecasting and trends</span><span>SQL KPI reporting</span><span>Dashboard design</span></div>

**Questions I can help answer**

- Which customers stay, and what do they have in common?
- Did the change we made actually work?
- What is next quarter likely to look like?
- What should the dashboard show so managers act on it?

:::

{{< include _contact.qmd >}}
)---")

# ------------------------------------------------------------ about.qmd
w("about.qmd", r"---(
---
title: "About me"
description: "Who I am, what I do, what I am looking for and how I can help."
---

::: {.lead}
I am Aran Felix, a statistician and data analyst. I take a question that matters to you, find or build the evidence to answer it, and explain the answer so you can act on it.
:::

I hold a **BSc in Statistics** and currently work as a data analyst with **ADAC Consultancy**. I combine questionnaire design, digital data collection, statistical analysis, qualitative research and dashboarding, so one person can carry a project from research design to a finished report.

## What I am looking for

- **Roles:** Data Analyst, Research Analyst or Officer, Monitoring and Evaluation Analyst, and Business Intelligence or Reporting Analyst.
- **Sectors:** banks and financial institutions, NGOs and development organisations, research institutions, and data-driven businesses.
- **Also:** freelance and consulting projects.

## How I can help

<div class="feature-grid three">
<div class="feature-card"><i class="bi bi-card-checklist ic"></i><h3>Research and questionnaire design</h3><p>Turn a vague question into a study you can answer: objectives, sampling, questionnaires and a data collection plan.</p></div>
<div class="feature-card"><i class="bi bi-phone ic"></i><h3>Digital data collection</h3><p>Collect data on phones and tablets with ODK Collect, KoboToolbox, REDCap and CAPI, with quality checks along the way.</p></div>
<div class="feature-card"><i class="bi bi-calculator ic"></i><h3>Quantitative analysis</h3><p>Clean, test and model survey and programme data in SPSS, Stata, R or Python, and interpret the results.</p></div>
<div class="feature-card"><i class="bi bi-chat-quote ic"></i><h3>Qualitative analysis</h3><p>Code interviews and focus groups in NVivo or ATLAS.ti and draw out themes that trace back to what people said.</p></div>
<div class="feature-card"><i class="bi bi-clipboard-check ic"></i><h3>Monitoring and evaluation</h3><p>Set up indicators, check data quality, track progress and report evidence to donors and boards.</p></div>
<div class="feature-card"><i class="bi bi-bar-chart-line ic"></i><h3>Dashboards and reporting</h3><p>Build Tableau and Power BI dashboards, SQL and Excel reports, and clear charts that show decision-makers what is happening.</p></div>
</div>

## Who I work with

- **Banks and financial institutions** that need accurate, well-documented reporting and analysis.
- **NGOs and development programmes** that need credible M&E evidence for donors and boards.
- **Research teams and institutions** that need rigorous, reproducible analysis.
- **Businesses and consultancies** that want analysis and dashboards to track performance.

## Why work with me

- **I work from questionnaire to report.** I design the instrument, collect the data digitally, analyse it and report it, so quality is protected at every step.
- **I work on both sides of research.** Numbers show the scale of a problem and interviews explain it. I can do both, which matters in research and M&E.
- **I show my working.** Methods are documented and analyses are reproducible, and my code is open on [GitHub](https://github.com/aranfelix).
- **I tell you what the data cannot say.** You get limitations and uncertainty stated plainly, not a result that sounds more certain than it is.

## How a project works

<div class="steps">
<div class="step"><b>1. Conversation</b><p>We agree the question, the data available, the deadline and what a useful result looks like.</p></div>
<div class="step"><b>2. Plan</b><p>You receive a short written scope with methods, outputs and timeline.</p></div>
<div class="step"><b>3. Analysis</b><p>I clean, analyse and check the results, sharing progress along the way.</p></div>
<div class="step"><b>4. Delivery</b><p>A clear report, dashboard or presentation, with the documentation behind it.</p></div>
<div class="step"><b>5. Handover</b><p>I walk you through the findings so you can explain and defend them.</p></div>
</div>

Where work was done for clients, I share only what I am permitted to disclose and anonymise the rest.

[See my projects](projects.qmd){.btn .btn-primary}
[View my CV](cv.qmd){.btn .btn-outline-dark}

{{< include _cta.qmd >}}
)---")

# ------------------------------------------------------------ research-m-e.qmd
w("research-m-e.qmd", r"---(
---
title: "Research & M&E"
description: "Research design, data collection, statistical and qualitative analysis, and monitoring and evaluation support."
---

Evidence is only useful if it can be trusted and understood. I support research and M&E work from the first design decision to the final report.

## What you need and what you get

| You need to... | I deliver | Tools |
|---|---|---|
| Design a study or evaluation | Research questions, indicators, a sampling approach and well-structured questionnaires | Excel, R |
| Collect data digitally | Questionnaires prepared for phone or tablet collection, with the collected data checked for quality | ODK Collect, KoboToolbox, REDCap, CAPI |
| Analyse survey or programme data | A cleaned dataset, statistical tests and models, tables and charts, and a clear interpretation | SPSS, Stata, R, Python |
| Make sense of interviews and focus groups | Coded transcripts, themes backed by evidence from participants, and a written summary | NVivo, ATLAS.ti |
| Track programme performance | Indicator tracking tables, data quality checks and live dashboards | Excel, SQL, Tableau, Power BI |
| Report to donors, boards or the public | A clear report with visuals and a plain-language summary of findings and limits | R, Tableau, Power BI, Excel |

## Methods I work with

<div class="pills">
<span>Questionnaire design</span><span>Digital data collection</span><span>Descriptive statistics</span><span>Hypothesis testing</span><span>Regression</span><span>Survey data analysis</span><span>Thematic analysis</span><span>Mixed methods</span><span>Indicator frameworks</span><span>Data quality assessment</span>
</div>

## How I handle evidence

- **Honest limits.** Every analysis states what the data can and cannot show, including missing data and sampling issues.
- **Association is not cause.** I say clearly when a result describes a pattern rather than an effect.
- **Confidentiality.** I follow the ethics and data-protection requirements of each project and anonymise anything shared publicly.

{{< include _cta.qmd >}}
)---")

# ------------------------------------------------------------ cv.qmd
w("cv.qmd", r"---(
---
title: "Curriculum Vitae"
description: "Profile, education, skills and tools."
execute:
  freeze: false
---

```{r}
#| echo: false
#| output: asis
if (file.exists("files/Aran-Felix-CV.pdf")) {
  cat('[Download the full CV (PDF)](files/Aran-Felix-CV.pdf){.btn .btn-primary}\n')
} else {
  cat('A full CV with dates and references is available on request. [Get in touch](/index.qmd#contact).\n')
}
```

## Profile

Statistician and data analyst working across research, monitoring and evaluation, and business intelligence. I combine questionnaire design, digital data collection, quantitative analysis, qualitative research and dashboarding to produce evidence that decision-makers can use.

## Target roles

Data Analyst, Research Analyst or Officer, Monitoring and Evaluation Analyst, and Business Intelligence or Reporting Analyst, in banking and finance, NGOs, research organisations and data-driven businesses.

## Education

**BSc in Statistics**

## Current role

**Data Analyst**, ADAC Consultancy

## Core competencies

- Research design, sampling and questionnaire design
- Digital data collection with ODK Collect, KoboToolbox, REDCap and CAPI
- Statistical analysis and interpretation of survey and programme data
- Qualitative coding and thematic analysis
- Monitoring and evaluation: indicators, data quality and reporting
- Data visualisation and dashboards
- SQL data extraction, validation and reporting

## Software and tools

| Area | Tools |
|---|---|
| Statistical analysis | SPSS, Stata, R (RStudio), Python |
| Qualitative research | NVivo, ATLAS.ti |
| Data collection | ODK Collect, KoboToolbox, REDCap, CAPI |
| Databases and spreadsheets | SQL, Excel |
| Visualisation and BI | Tableau, Power BI |

{{< include _cta.qmd >}}
)---")

message("\nUpdate 3 written. Next: quarto::quarto_preview()")