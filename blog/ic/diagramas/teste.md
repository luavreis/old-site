+++
title = "teste"
+++

\begin{tikzpicture}{disp}
    \centering
    \matrix (c) {
        \coordinate (s); \\
        \node[below= .6 of s,box] (f) {$f$};
        \coordinate[below= .6 of f] (e); \\
        };
    \draw[oes={->-}] (s)
    -- node[vs] {$V$} (f)
    -- node[vs] {$W$} (e);

    \matrix[right= 3 of f] (c) {
        \node[box] (f) {$g$};
        \heads[2]{f}{0}
        \tails[2]{f}{2}\\
    };
    \node[vs,left= of f-hs-1] {$V_1$};
    \node[vs,right=of f-hs-2] {$V_n$};
    \node[vs,between= f-hs-1 and f-hs-2,yshift=1mm,xshift=.7mm]
    {$...$};
    \node[vs,left= of f-ts-2] {$W_1$};
    \node[vs,right=of f-ts-1] {$W_m$};
    \node[vs,between= f-ts-1 and f-ts-2,yshift=1mm,xshift=.7mm]
    {$...$};
\end{tikzpicture}

Conhecemos duas "receitas de bolo" para produzir uma transformação linear a partir de outras duas, $f$ e $g$: o produto tensorial $f\otimes g$, e, se $f$ e $g$ concordarem domínio com contradomínio, a composta $f\circ g$. 
Nos diagramas, a composição de duas funções é ilustrada como na figura da direita.
Note que se tivermos mais caixas empilhadas, a associatividade da composição garante que não precisamos nos importar com parênteses.
Representamos produtos tensoriais de funções ao colocar as suas caixas lado a lado:

\begin{tikzpicture}{disp}
    \matrix (c2) {
        \node (s)   {};
        \node[below= .6 of s, box  ] (f)   {$f$};
        \node[below= .6 of f, box  ] (g)   {$g$};
        \node[below= .6 of g       ] (e)   {}; \\
    };
    \draw[oes={->-}] (s)
    -- node[vs] {$V$} (f) 
    -- node[vs] {$W$} (g) 
    -- node[vs] {$U$} (e);

    \defeq{c2};

    \matrix[rofeq   ] {
        \node (s)  {};
        \node[below= .6 of s, box  ] (gof) {$g\circ f$};
        \node[below= .6 of gof     ] (e)  {}; \\
    };
    \draw[oes={->-}] (s)
    -- node[vs] {$V$} (gof) 
    -- node[vs] {$U$} (e);
\end{tikzpicture}

$$e=mc^2
aa$$

~~~
<style>

.hover2:hover {
  display: block;
  color: green;
}

.hide ~ .hover2:hover {
  display: block;
  color: red;
}
</style> 
~~~

@@hover2
teste de novo
@@

$$\begin{CD}
\htmlId{hv2}{K(X)} @>{ch}>> \htmlId{hv1}{H(X;\mathbb Q)};\\
@VVV @VVV \\
K(Y) @>f>> H(Y;\mathbb Q);
\end{CD}$$

~~~
<p id="hide" class="hide">
Escondido2
</p>
~~~ 

~~~
<script type="text/javascript">
function bla() {
  hv1 = document.getElementById("hv1");
  hv2 = document.getElementById("hv2");
  hd = document.getElementById("hide");


  hv1.onmouseover = function() {hd.textContent = "Teste 1!"};
  hv2.onmouseover = function() {hd.textContent = "Teste 2!"};
}
</script>
<body onload="bla();">
~~~