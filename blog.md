+++
date_format = raw"dd \d\e U \d\e yyyy"
date_months = ["janeiro", "fevereiro", "março", "abril", "maio", "junho", "julho", "agosto", "setembro", "outubro", "novembro", "dezembro"]
+++


# Blog 
Em construção... ~~~<i class="twa twa-building-construction"></i>~~~

<!-- ## Feed
~~~
<ul>
{{for (p, d) in feed_pages}}
  <li>{{fill d}} - <a href="{{fill fd_url p}}">{{fill title p}}</a></li>
{{end}}
</ul>
~~~ -->

## \temoji{notebook-with-decorative-cover} Cadernos

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
