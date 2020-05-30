using Dates
using Franklin: pagevar, fd_date, locvar

function get_date(fpath)
  date = pagevar(fpath, "date")
  (isnothing(date) || date == Date(1)) && return "Sem data"
  return fd_date(DateTime(date))
end

function blog_page_data(dir)
  data = NTuple{2,String}[]
  for (root, _, files) in walkdir(dir)
    for file in files
      fpath = joinpath(root, file)
      # some filtering here to check the most recent or whatever
      push!(data, (fpath, get_date(fpath)))
    end
  end
  return data
end
# tqmf_pages = blog_page_data("blog/cadernos/tqmf")
ism_pages = blog_page_data("blog/cadernos/ism")

