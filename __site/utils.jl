using Dates
using Franklin: pagevar, fd_date, locvar
using TikzPictures, FranklinUtils
using TikzCDs
using SHA
using Glob

function get_date(fpath)
  date = pagevar(fpath, "date")
  (isnothing(date) || date == Date(1)) && return "Sem data"
  return fd_date(DateTime(date))
end

function blog_page_data(dir)
  data = NTuple{2,String}[]
  for (root, _, files) in walkdir(dir)
    for file in files
      if file[end-1:end] == "md"
        fpath = joinpath(root, file)[1:end-3]
        # some filtering here to check the most recent or whatever
        push!(data, (fpath, get_date(fpath)))
      end
    end
  end
  return data
end

function env_latex(e, _)
  content = replace(strip(Franklin.content(e)), r"%.*" => "")
  return content
end

function env_tikzpicture(e, _)
  content = strip(Franklin.content(e))
  opt = strip(Franklin.content(e.braces[1]))
  preamble = open(joinpath(splitext(
                      Franklin.locvar(:fd_rpath))[1],
                      "tikzpreamble.tex")) do file
    strip(read(file,String)) 
  end
  name = (content |> sha256 |> bytes2hex)[1:8]

  rpath = joinpath("assets", splitext(Franklin.locvar(:fd_rpath))[1], "$name.svg")
  outpath = joinpath(Franklin.path(:site), rpath)
  if !isfile(outpath)
    outdir = dirname(outpath)
    isdir(outdir) || mkpath(outdir)
    try
      save(SVG(outpath), TikzPicture(content,adjustboxOptions="scale=1.5",options=opt,preamble=preamble))
    catch
      println(content)
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
      println("Tikz is compiling $(id)...")
      save(SVG(outpath), TikzCD(content,adjustboxOptions="scale=1.5",options=opt))
    catch e
      @warn "Could not compile TikzCD. Error:"
      println(e)
    end
  end
  return "\\svg{$id}{/$(Franklin.unixify(rpath))}"
end

tqmf_pages = blog_page_data("blog/cadernos/tqmf")
ism_pages = blog_page_data("blog/cadernos/ism")
ic_pages = blog_page_data("blog/ic")
# feed_pages = blog_page_data("blog/feed")
