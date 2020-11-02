+++
date_format = raw"dd \d\e U \d\e yyyy"
date_months = ["janeiro", "fevereiro", "março", "abril", "maio", "junho", "julho", "agosto", "setembro", "outubro", "novembro", "dezembro"]
+++

Olá, essa é a página principal de Gat-ergódico. Seja bem vindo \temoji{slightly-smiling-face} 

# Blog 
Em construção... ~~~<i class="twa twa-building-construction"></i>~~~

## ~~~<i class="twa twa-notebook-with-decorative-cover"></i>~~~ 

### iniciação científica

~~~
<ul>
{{for (p, d) in ic_pages}}
  <li>{{fill d}} - <a href="{{fill fd_url p}}">{{fill title p}}</a></li>
{{end}}
</ul>
~~~

### teoria quântica

~~~
<ul>
{{for (p, d) in tqmf_pages}}
  <li>{{fill d}} - <a href="{{fill fd_url p}}">{{fill title p}}</a></li>
{{end}}
</ul>
~~~

### variedades suaves

~~~
<ul>
{{for (p, d) in ism_pages}}
  <li>{{fill d}} - <a href="{{fill fd_url p}}">{{fill title p}}</a></li>
{{end}}
</ul>
~~~
