# Blog 
Em construção... ~~~<i class="twa twa-building-construction"></i>~~~
## ~~~<i class="twa twa-notebook-with-decorative-cover"></i>~~~

### Introduction to Smooth Manifolds
<!-- [Variedades Topológicas](cadernos/ism/variedades-topologicas)\
[Mapas Suaves](cadernos/ism/mapas-suaves)\
[Espaços Tangente](cadernos/ism/espaco-tangente-e-derivadas) -->

```julia:exlist
#hideall

using Franklin
path = Franklin.PATHS[:folder]

function find_title(pg)
    content = read(pg, String)
    m = match(r"@def\s+title\s+=\s+\"(.*)?\"", content)
    if m === nothing
        m = match(r"(?:^|\n)#\s+(.*?)(?:\n|$)", content)
        m === nothing && return "Unknown title"
    end
    return m.captures[1]
end

println("~~~")
println("<ol>")
for (root, _, files) in walkdir("blog/cadernos/ism")
    for file in files
        md   = joinpath(root, file)
        html = replace(md, joinpath("src", "pages") => "pub")
        html = replace(html, r".md$" => "")

        t = find_title(md)
        l = Franklin.unixify(html)
        println("<li><a href=\"/$l\">$t</a></li>")
    end
end
println("</ol>")
println("~~~")
```

\textoutput{exlist}

### Structure and Interpretation of Classical Mechanics
```julia:exlist
#hideall

using Franklin
path = Franklin.PATHS[:folder]

function find_title(pg)
    content = read(pg, String)
    m = match(r"@def\s+title\s+=\s+\"(.*)?\"", content)
    if m === nothing
        m = match(r"(?:^|\n)#\s+(.*?)(?:\n|$)", content)
        m === nothing && return "Unknown title"
    end
    return m.captures[1]
end

println("~~~")
println("<ol>")
for (root, _, files) in walkdir("blog/cadernos/sicm")
    for file in files
        md   = joinpath(root, file)
        html = replace(md, joinpath("src", "pages") => "pub")
        html = replace(html, r".md$" => "")
        
        t = find_title(md)
        l = Franklin.unixify(html)
        println("<li><a href=\"/$l\">$t</a></li>")
    end
end
println("</ol>")
println("~~~")
```
\textoutput{exlist}

<!-- ### Fundamentos da Teoria Ergódica -->