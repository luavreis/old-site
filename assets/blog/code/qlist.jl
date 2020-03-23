# This file was generated, do not modify it. # hide
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
println("<ul>")
for (root, _, files) in walkdir("blog/cadernos/tqmf")
    for file in files
        md   = joinpath(root, file)
        html = replace(md, joinpath("src", "pages") => "pub")
        html = replace(html, r".md$" => "")

        t = find_title(md)
        l = Franklin.unixify(html)
        println("<li><a href=\"/$l\">$t</a></li>")
    end
end
println("</ul>")
println("~~~")