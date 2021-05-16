+++
date = "2020-05-01"
+++

# Notas sobre SDDS

## Cones e métricas projetivas

p. 19: notamos que

$$\frac{d}{dx} \log(e^x + C) = \frac{e^x}{e^x + C}$$

e que

$$\frac{e^x(S_n - T_n)}{(e^x + T_n)(e^x + S_n)} = \frac{S_n - T_n}{(1 + T_n
  e^{-x})(e^x + S_n)} \leq \frac{S_n - T_n}{S_n}$$

p. 20:
 - _"nesse sentido, as métricas projetivas generalizam a
   métrica hiperbólica no intervalo"_ como assim?
 - O que é o lema de Schwartz? o sobre funções holomorfas?
 
@@teorema
Let $\mathbf{D}=\{z:|z|<1\}$ be the open unit disk in the
complex plane $\mathbb{C}$ centered at the origin, and let
$f: \mathbf{D} \rightarrow \mathbb{C}$ be a holomorphic map
such that $f(0)=0$ and $|f(z)| \leq 1$ on $\mathbf{D}$.
 
Then $|f(z)| \leq|z|$ for all $z \in \mathbf{D}$, and
$\left|f^{\prime}(0)\right| \leq 1$.
@@
 
Exemplo 2.3
 - notamos que
 
 $$\frac{t_1 \varphi_1(x)+t_2 \varphi_2(x)}{t_1 \varphi_1(y)+t_2 \varphi_2(y)} =
  \frac{\frac{\varphi_1(x)}{\varphi_1(y)} t_1\varphi_1(y) + \frac{\varphi_2(x)}{\varphi_2(y)} t_2\varphi_2(y)}{t_1 \varphi_1(y)+t_2 \varphi_2(y)}$$

daí é uma média ponderada, e vale

$$\leq \max \left\{\frac{\varphi_1(x)}{\varphi_1(y)}, \frac{\varphi_2(x)}{\varphi_2(y)}\right\}$$
etc.

- E se $a=0$? Ele queria dizer $\varphi_1(x) \neq \varphi_1(y)$, etc? [sim]

Exemplo 2.4
- Topologia $C^1$ é o mesmo que a topologia uniforme? (não)
- sempre existe a sequência? (ver prova!)

---

Sobre o operador de transferência, o por que da soma ser finita:

@@teorema 
**Teo**. Seja $M$ uma variedade compacta, $N$ uma variedade conexa, e $f: M \to
N$ um difeomorfismo local. Então existe um inteiro $k \geq 1$ tal que
$\#f^{-1}(y) = k$ para todo $x \in N$ (tal inteiro é chamado de _grau_ do mapa
$f$). 
@@

---

@@teorema
**Lema**. A imagem de um compacto por uma função contínua é um compacto.
@@


_Prova:_ toda cobertura da imagem por abertos tem pré imagem cobrindo um
compacto, portanto tem subcobertura finita. Claro que a imagem dessa
subcobertura finita continua cobrindo a imagem, e é finita.

---

@@teorema
**Lema.** Seja $X$ compacto, $Y$ Hausdorff e $g : X \to Y$ contínua. Então $g$ é um mapa
fechado.
@@


_Prova:_ se $F \subset X$ é fechado, então $F$ é compacto, portanto pelo lema acima
$g(F)$ é compacto. Mas $Y$ é Hausdorff, logo $g(F)$ é fechado.

---

@@teorema
**Lema.** Para todo $y \in N$, $\#f^{-1}(y)$ é finito.
@@


_Prova:_ de fato, caso não fosse finito, $f^{-1}(y)$ teria um ponto limite no
espaço compacto $M$. Toda vizinhança desse ponto contém infinitas pré-imagens de
$y$, portanto a restrição a nenhuma delas poderia ser injetiva. Isso contradiz
$f$ ser difeomorfismo local.

---

_Prova do teorema_: por um lema acima, $f$ é um mapa fechado. Seja $y \in N$, e
$\{x_i\}_{i=1}^K = f^{-1}(y)$. Então existem vizinhanças abertas $U_i \ni x_i$ tal que
$f|_{U_i}$ é difeomorfismo para cada $i$, e podemos diminuir essas vizinhanças de
forma que sejam disjuntas. Seja $F = M \setminus \bigcup_{i=1}^K U_i$. Então $f(F)$ é fechado por
um lema acima, e portanto $V = \bigcap_{i=1}^K f(U_i) \setminus f(F)$ é aberto contendo $y$, uma vez
que nenhuma das $K$ pré-imagens de $y$ está em $F$.

Agora, por definição $f^{-1}(V) \subset F^{\complement} = \bigcup_{i=1}^K U_i$,
e já sabemos que $f(U_i \cap f^{-1}(V)) = V$ para cada $i$. Mas $U_i \cap f^{-1}(V)$ são
vizinhanças disjuntas, portanto todo ponto do aberto $V$ tem exatamente $K$
pré-imagens, uma para cada $i$.

O que acabamos de mostrar foi que as classes da relação de equivalência $a \sim b \iff
\#f^{-1}(a) = \#f^{-1}(b)$ são abertas em $N$. Mas $N$ é conexa, então só há uma
classe de equivalência. Claro que se $M$ não é vazia, existe um ponto com pelo
menos uma pré-imagem, então concluímos que existe $k$ como no enunciado.

Nota: de fato, $f$ é um _mapa de recobrimento_.
