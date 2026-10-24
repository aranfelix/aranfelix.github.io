# Helper functions for the portfolio.  Load them with:  source("helpers.R")

# Create a new project page (hidden from the live site until you remove "draft: true")
new_project <- function(slug, title) {
  dir.create("projects", showWarnings = FALSE)
  path <- file.path("projects", paste0(slug, ".qmd"))
  if (file.exists(path)) stop("That project already exists: ", path)
  tpl <- r"--(---
title: "__TITLE__"
description: "One sentence: what question did this project answer?"
date: __DATE__
categories: [Data Analysis]
# image: ../images/__SLUG__.png
draft: true
---

::: {.keyfinding}
**Key finding:** State the main result in one sentence.
:::

## 1. The problem
What question did you investigate and why does it matter?

## 2. The data
Source, number of records and variables, period and population covered.

## 3. Methods and tools
Cleaning steps, statistical methods and software you actually used.

## 4. Findings
Charts, tables and precise explanations. Every number must come from your analysis.

## 5. Interpretation and implications
What the findings mean for a researcher, programme manager or business.

## 6. Limitations
Missing data, sampling issues, assumptions and limits to generalisation.

## 7. Outputs and code
[View the code on GitHub](https://github.com/aranfelix)

<!-- DASHBOARD OPTION A: a button that opens your Tableau Public / Power BI / Shiny link
[Open the interactive dashboard](PASTE-THE-DASHBOARD-LINK-HERE){.btn .btn-primary target="_blank"}
-->

<!-- DASHBOARD OPTION B: show the dashboard inside this page
<iframe class="dashboard-frame" src="PASTE-THE-DASHBOARD-LINK-HERE" title="Interactive dashboard"></iframe>
-->

{{< include ../_cta.qmd >}}
)--"
  tpl <- sub("__TITLE__", title, tpl, fixed = TRUE)
  tpl <- gsub("__SLUG__", slug, tpl, fixed = TRUE)
  tpl <- sub("__DATE__", format(Sys.Date()), tpl, fixed = TRUE)
  writeLines(tpl, path)
  message("Created ", path, "  -  edit it, then delete the line 'draft: true' to publish.")
  invisible(path)
}

# Switch on the contact form (create a free form at formspree.io first)
add_contact_form <- function(formspree_id) {
  writeLines(trimws(formspree_id), "formspree-id.txt")
  message("Saved. Re-render the site to show the form on the Contact page.")
}
