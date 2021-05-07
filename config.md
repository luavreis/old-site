<!-- ---------------------------------------------------
Add here global page variables to use throughout your
website.
The website_* must be defined for the RSS to work
----------------------------------------------------- -->
+++
website_title = "gat-ergódico"
website_descr = "matemática e entrelinhas"

author = "Lucas Viana Reis"

hasjquery = false

date_format = raw"dd \d\e U \d\e yyyy"
date_months = ["janeiro", "fevereiro", "março", "abril", "maio", "junho", "julho", "agosto", "setembro", "outubro", "novembro", "dezembro"]

# robots_disallow = ["/"]

mintoclevel=2
+++

<!-- Latex-like syntax -->

\newcommand{\emph}[1]{_!#1_}
\newcommand{\textbf}[1]{**!#1**}

\newcommand{\proof}[1]{#3}
\newcommand{\lemma}[3]{#3}
\newcommand{\theorem}[3]{#3}
\newcommand{\section}[1]{## #1}
\newcommand{\subsection}[1]{### #1}

\newcommand{\tikz}[1]{}

\newenvironment{proposition}{### Proposição}{}
\newenvironment{center}{}{}

<!-- end Latex-like syntax -->


\newcommand{\temoji}[1]
{~~~
<i class="twa twa-!#1"  aria-role="presentation" aria-label="!#1"></i>
~~~}


\newcommand{\style}[2]
{~~~
<div style="!#1;margin-left:auto;margin-right:auto;">
~~~ !#2 ~~~
</div>
~~~}

\newcommand{\svg}[2]
{~~~
<figure style="text-align:center;">
<object id="!#1" data="!#2" type="image/svg+xml"></object>
</figure>
~~~}

\newcommand{\figenv}[3]
{~~~
<figure style="text-align:center;">
<img src="!#2" style="padding:0;#3" alt="#1"/>
<figcaption>#1</figcaption>
</figure>
~~~}

\newenvironment{details}[1]
{~~~
<details><summary>#1</summary>
<div class="details">
~~~}
{~~~
</div>
</details>
~~~}

\newcommand{\contents}{
@@contents 
\begin{details}{Conteúdo}
\toc 
\end{details}
@@}
