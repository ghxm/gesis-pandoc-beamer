---
title: "Beamer Presentation"
subtitle: "A Pandoc template"
author: "Jane Smith"
institute: "GESIS -- Leibniz Institute for the Social Sciences\\newline Cologne"
date: "24.10.2023"
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


```{=latex}
% Change the background mid-slides
% end the last slide
\end{frame}

% change the background image
\mode<all>\setbgimage{template/background12.pdf}

% start a new slide so that it will end when the next slide starts
\begin{frame}<0| handout:0>

```


# {.plain .c}

\color{white}

\LARGE
\centering

**Thank you!**




```{=latex}
% Change the background mid-slides
% end the last slide
\end{frame}

% change the background image
\mode<all>\setbgimage{template/background8.pdf}

% start a new slide so that it will end when the next slide starts
\begin{frame}<0| handout:0>
```

# References {.allowframebreaks}

\begingroup

\footnotesize

::: {#refs}
:::

\endgroup
