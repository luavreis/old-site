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
      if file[end-1:end] == "md"
        fpath = joinpath(root, file)[1:end-3]
        # some filtering here to check the most recent or whatever
        push!(data, (fpath, get_date(fpath)))
      end
    end
  end
  return data
end
tqmf_pages = blog_page_data("blog/cadernos/tqmf")
ism_pages = blog_page_data("blog/cadernos/ism")
ic_pages = blog_page_data("blog/ic")
# feed_pages = blog_page_data("blog/feed")


# Teoremas, etc

mutable struct Theorem
  chapter::Int
  section::Int
  subsection::Int
  Theorem()=new(0,0,0)
end

mutable struct State 
  level::Symbol
  thm::Theorem
  label2thm::Dict{Any,Any}
end

# global state
state = State(:chapter, Theorem(), Dict())

function lx_initcounter(com, _)
  global state
  state = State(:chapter, Theorem(), Dict())
  return ""
end

function setlevel(new::Symbol)
  global state
  state.level = new
end

setlevel(new::AbstractString) = setlevel(Symbol(new))

function lx_setlevel(com, _)
  brace_content = Franklin.content(com.braces[1])
  setlevel(brace_content)
  return ""
end

function record_theorem_number(label)
  global state
  state.label2thm[label] = deepcopy(state.thm)
end

function lx_generateLabel(com, _)
  label = Franklin.content(com.braces[1])
  if label != ""
      return "\\label{$(label)}"
  else
      return ""
  end
end

function lx_generateTheoremName(com, _)
  name = Franklin.content(com.braces[1])
  if name != ""
      return "($name)"
  else
      return ""
  end
end

function increment()
  global state
  t = state.thm
  if state.level == :chapter && (t.chapter += 1) end
  if state.level == :section && (t.section += 1) end
  if state.level == :subsection && (t.subsection += 1) end
  # update
  state.thm = t
end

function lx_increment(com, _)
  increment()
  return ""
end

function resetcount()
  global state
  t = state.thm
  if state.level == :chapter && (t.chapter = 0) end
  if state.level == :section && (t.section = 0) end
  if state.level == :subsection && (t.subsection = 0) end
  # update
  state.thm = t
end

function lx_resetcount(com, _)
  resetcount()
  return ""
end


get_theorem_number(t::Theorem)="$(t.chapter).$(t.section).$(t.subsection)"

function get_theorem_number()
  global state 
  get_theorem_number(state.thm)
end

function lx_getTheoremNumber(com, _)
  global state 
  get_theorem_number(state.thm)
end

function ref(label::AbstractString)
  global state
  try
      n = get_theorem_number(state.label2thm[label])    
      return "[$n](#$label)"
  catch
      @warn "fail to ref $label"
      return "???"
  end

end

function lx_ref(com, _)
  brace_content = Franklin.content(com.braces[1])
  ref(brace_content)
end

function lx_recordTheoremNumber(com, _)
  brace_content = Franklin.content(com.braces[1])
  record_theorem_number(brace_content)
  return ""
end
