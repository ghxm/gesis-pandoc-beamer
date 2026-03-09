---
title: "Beamer Presentation"
subtitle: "A Pandoc template"
author: "Jane Smith"
institute: "GESIS -- Leibniz Institute for the Social Sciences\\newline Cologne"
date: "2023-10-24"
aspectratio: 169
theme: metropolis
colortheme: dove
fontfamily: sourcesanspro
fontsize: 10pt
bibliography: "library.bib"
---


# First slide

This is the first slide.

# {.plain}

\section{First section}

# Second slide

::: {.columns}

:::: {.column width="50%"}

This is slide number 2

::::

:::: {.column width="50%"}

with columns....

and a citation [@sample2023].

::::

:::


# Third slide

A last slide to wrap things up.

\switchbg{template/background12.pdf}

# {.plain .c}

\color{white}

\LARGE
\centering

**Thank you!**

\switchtodefaultbg

# References {.allowframebreaks}

\begingroup

\footnotesize

::: {#refs}
:::

\endgroup
