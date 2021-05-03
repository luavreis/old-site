using Dates, FranklinUtils, TikzPictures, TikzCDs, SHA, Glob, Franklin
using Franklin: pagevar, fd_date, locvar

include("code/latex-tikz.jl")

function get_date(fpath)
    date = pagevar(fpath, "date")
    (isnothing(date) || date == Date(1)) && return "Sem data"
    return fd_date(DateTime(date))
end

function blog_page_data(dir)
    data = NTuple{2,String}[]
    for (root, _, files) in walkdir(dir)
        for file in files
            if file[end - 1:end] == "md"
                fpath = joinpath(root, file)[1:end - 3]
        # some filtering here to check the most recent or whatever
                push!(data, (fpath, get_date(fpath)))
            end
        end
    end
    return data
end

function lx_list(com, _)
    arg = Franklin.content(com.braces[1])

    out = "~~~<ul>"
    for (p, d) in blog_page_data(arg)
        out *= """<li><a href="/$p">$(pagevar(p, "title"))</a> - $d</li>"""
    end
    out * "</ul>~~~"
end
