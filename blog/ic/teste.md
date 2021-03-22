+++
title = "Página de testes"
hascode = true
hasjquery = true
#recompiletikz = true
+++

# Página de testes

```julia:out1
using Catlab.WiringDiagrams, Catlab.Graphics
import Convex, SCS
using Catlab.Theories
using Compose

A, B = Ob(FreeBicategoryRelations, :A, :B)
f = Hom(:f, A, B)

pic = to_composejl((dunit(A) ⊗ id(B)) ⋅ (id(A) ⊗ f ⊗ id(B)) ⋅ (id(A) ⊗ dcounit(B)))
draw(SVG(joinpath(@OUTPUT, "out.svg"), pic.width, pic.height), pic.context)
```
\output{out1}
\fig{out}

\begin{tikzcd}{cd1, "row sep=scriptsize,column sep=scriptsize"}
    & f^* E_V\arrow[dl,Mapsto]\arrow[rr]\arrow[dd] & & E_V\arrow[dl]\arrow[dd] \\
    f^* E\arrow[rr,crossing over]\arrow[dd] & & E \\
    & U\arrow[dl]\arrow[rr] &  & V\arrow[dl] \\
    M\arrow[rr,Leftrightarrow]{}{\textrm{Clique!}} & & N\arrow[from=uu,crossing over]\\
\end{tikzcd}

@@hide
Texto escondido. 
$$∫ φ\, dμ $$
@@

~~~
<style>
.hide {
    display: none;
}
</style>
<script>
$(window).on('load', function () {

    cd1 = document.getElementById("cd1");

    svgDoc = cd1.contentDocument;
    a0 = svgDoc.getElementById("g187");

    a0.style["fill"] = "red";
    a0.onmousedown = function(){ $('.hide').css('display','unset') };
    a0.onmouseup = function(){ $('.hide').css('display','none') };
    a0.onmouseover = function(){ a0.style["fill-opacity"] = 0.1 };
    a0.onmouseout = function(){ a0.style["fill-opacity"] = 0 };
});
</script>
~~~