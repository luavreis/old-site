<!-----------------------------------------------------
Add here global page variables to use throughout your
website.
The website_* must be defined for the RSS to work
------------------------------------------------------->
@def website_title = "Gat-ergódico"
@def website_descr = "Um site interessante"
@def website_url   = "https://lucasvreis.github.io/"

@def author = "Lucas Viana"

<!-- @def date_format = raw"dd \d\e U \d\e yyyy" -->
<!-- @def date_months = ["janeiro", "fevereiro", "março", "abril", "maio", "junho", "julho", "agosto", "setembro", "outubro", "novembro", "dezembro"] -->

\newcommand{\emoji}[1]{~~~<i class="twa twa-!#1"></i>~~~}

<!-- Put a box around something and pass some css styling to the box
(useful for images for instance) e.g. :
\style{width:80%;}{![](path/to/img.png)} -->
\newcommand{\style}[2]{~~~<div style="!#1;margin-left:auto;margin-right:auto;">~~~!#2~~~</div>~~~}