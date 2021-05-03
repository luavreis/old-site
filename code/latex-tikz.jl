function env_latex(e, _)
    replace(strip(Franklin.content(e)), r"%.*" => "")
end

function env_tikzpicture(e, _)
    content = strip(Franklin.content(e))
    opt = strip(Franklin.content(e.braces[1]))
    preamble = open(joinpath(splitext(
                      Franklin.locvar(:fd_rpath))[1],
                      "tikzpreamble.tex")) do file
        strip(read(file, String))
    end
    name = (content |> sha256 |> bytes2hex)[1:8]

    rpath = joinpath("assets", splitext(Franklin.locvar(:fd_rpath))[1], "$name.svg")
    outpath = joinpath(Franklin.path(:site), rpath)
    if !isfile(outpath)
        outdir = dirname(outpath)
        isdir(outdir) || mkpath(outdir)
        try
            println("Tikz is compiling $(Franklin.locvar(:fd_rpath))...")
            save(SVG(outpath), TikzPicture(content, adjustboxOptions="scale=1.5", options=opt, preamble=preamble))
        catch e
            @warn "Could not compile Tikz. Error:"
            display(e)
        end
    end
    return "\\svg{$name}{/$(Franklin.unixify(rpath))}"
end


function env_tikzcd(e, _)
    content = strip(Franklin.content(e))
    opts = lxargs(e)
    id, opt = opts[1]
    hash = (content |> sha256 |> bytes2hex)[1:6]
    rpath = joinpath("assets", splitext(Franklin.locvar(:fd_rpath))[1], "tikzcd", "$(id)_$hash.svg")
    outpath = joinpath(Franklin.path(:site), rpath)

    if !isfile(outpath) || !isnothing(locvar("recompiletikz"))
        outdir = dirname(outpath)
        isdir(outdir) || mkpath(outdir)

        for f in glob("$(id)_*.svg", outdir) rm(f) end

        try
            println("Tikz is compiling $(id) at $(Franklin.locvar(:fd_rpath))...")
            save(SVG(outpath), TikzCD(content, adjustboxOptions="scale=1.5", options=opt))
        catch e
            @warn "Could not compile TikzCD. Error:"
            display(e)
        end
    end
    return "\\svg{$id}{/$(Franklin.unixify(rpath))}"
end
