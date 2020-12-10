+++
date_format = raw"dd \d\e U \d\e yyyy"
date_months = ["janeiro", "fevereiro", "março", "abril", "maio", "junho", "julho", "agosto", "setembro", "outubro", "novembro", "dezembro"]
title = "Escritos"
+++

\newcommand{\list}[1]{
~~~
<ul>
{{for (p, d) in !#1}}
  <li><a href="{{fill fd_url p}}">{{fill title p}}</a> - {{fill d}}</li>
{{end}}
</ul>
~~~
}

# \temoji{memo} Escritos

## \temoji{notebook-with-decorative-cover} Cadernos

Alguns posts com temas:

### iniciação científica

\list{ic_pages}

### teoria quântica

\list{tqmf_pages}

### variedades suaves

\list{ism_pages}
