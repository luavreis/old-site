<!-- ---------------------------------------------------
Add here global page variables to use throughout your
website.
The website_* must be defined for the RSS to work
----------------------------------------------------- -->
+++
website_title = "Gat-ergódico"
website_descr = "Um site sobre matemática e coisas aleatórias"
website_url   = "https://lucasvreis.github.io/"

author = "Lucas Viana Reis"

date_format = raw"dd \d\e U \d\e yyyy"
date_months = ["janeiro", "fevereiro", "março", "abril", "maio", "junho", "julho", "agosto", "setembro", "outubro", "novembro", "dezembro"]

mintoclevel=2
+++
<!-- ---------------------------------------------------
Add here global latex commands to use throughout your
pages. It can be math commands but does not need to be.
For instance:
* \newcommand{\phrase}{This is a long phrase to copy.}
----------------------------------------------------- -->
\newcommand{\temoji}[1]{~~~<i class="twa twa-!#1"  aria-role="presentation" aria-label="!#1"></i>~~~}

<!-- Put a box around something and pass some css styling to the box
(useful for images for instance) e.g. :
\style{width:80%;}{![](path/to/img.png)} -->
\newcommand{\style}[2]{~~~<div style="!#1;margin-left:auto;margin-right:auto;">~~~!#2~~~</div>~~~}

\newcommand{\figenv}[3]{
~~~
<figure style="text-align:center;">
<img src="!#2" style="padding:0;#3" alt="#1"/>
<figcaption>#1</figcaption>
</figure>
~~~
}

<!-- Teoremas, etc -->
<!-- define document counter enumerated by utils.jl -->

\newcommand{\chapter}[1]{
# #1
}
\newcommand{\section}[1]{
## #1
}
\newcommand{\subsection}[1]{### #1}

<!-- theorem_name, label, title, statement-->
\newcommand{\theoremcounter}[4]{
@@!#1\\ <!-- newline -->
!#4
@@
}

<!-- \command{label}{name}{statement} -->
\newcommand{\definition}[3]{\theoremcounter{definition}{#1}{#2}{#3}}
\newcommand{\lemma}[3]{\theoremcounter{lemma}{#1}{#2}{#3}}
\newcommand{\prop}[3]{\theoremcounter{prop}{#1}{#2}{#3}}
\newcommand{\theorem}[3]{\theoremcounter{theorem}{#1}{#2}{#3}}
\newcommand{\example}[3]{\theoremcounter{example}{#1}{#2}{#3}}
\newcommand{\remark}[3]{\theoremcounter{remark}{#1}{#2}{#3}}
\newcommand{\proof}[1]{
@@proof \\ <!-- new line -->
!#1
@@
\\ <!-- new line-->
}
