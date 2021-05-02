# Mapas Suaves

 > Essas notas são baseadas no livro Introduction to Smooth Manifolds, 2nd ed. de John M. Lee. Ainda assim, conteúdo desse site é unicamente de minha responsabilidade.

\contents

## Funções e mapas suaves $→$ difeomorfismos

Particularidade de notação: funções $\neq$ mapas.
 - Funções: codomínio euclidiano $\Reals^n$ para $n>0$
 - Mapas: funções entre variedades diferenciáveis 
  
### Funções suaves definidas em variedades
Uma função do tipo $f:M\to\Reals^k$, onde $M$ é n-variedade, é dita diferenciável se para cada $p\in M$, existe uma carta $(U, \varphi)$ tal que $f \circ \varphi^{-1}$ é suave em $\varphi(U) \in \Reals^n$ no sentido usual. Caso $M$ tenha fronteira, a ideia é a mesma mas com $\mathbb{H}$ (o semiplano fechado) no lugar de $\Reals$. 

$C^{\infty}(M)$ - funções diferenciáveis com valor real. Seus elementos (as funções) formam um espaço vetorial.

### Mapas suaves entre variedades
Intuitivamente: função $M\to N$ cuja composição da inversa de uma carta do domínio com uma carta do contradomínio é diferenciável.

**Preposição 2.4:**  Todo mapa diferenciável é contínuo

**Preposição 2.5:** Condições equivalentes para $f:M\to N$ ser diferenciável.
 - Para cada ponto em M existe uma carta $(U, \varphi)$ contendo $p$ e uma carta (V, psi) contendo $f(p)$ tal que $U \cap F^{-1}(V)$ é aberto e a composição $\psi \circ F \circ \varphi^{-1}$ é diferenciável em $\varphi(U \cap F^{-1}(V))$.
 - F é contínua e existem atlas $\lbrace (U_a,\varphi_a)\rbrace$ e $\lbrace (V_b,\psi_b)\rbrace$ para M e N, tal que para cada a e b, $\psi \circ F \circ \varphi^{-1}$ é diferenciável em $\varphi_a(U_a \cap F^{-1}(V_b))$.

### Difeomorfismos
Uma bijeção diferenciável $F: M\to N$ e cuja inversa é diferenciável.

**Difeomórficos**: existe difeomorfismo entre eles.

"Lema da cola": nos são dados mapas para várias cartas que concordam nas interseções das cartas. Então existe uma única extensão F cuja restrição a cada carta são as funções originais.

**Estruturas suaves**: até $n=3$, todas as estruturas em uma $n-$variedade são difeomorfas. Também temos que para $n\neq4$, todas as estruturas das variedades em $\Reals^{n}$ são difeomorfas. Para $n=4$, porém, existem as estruturas chamadas de 'estruturas exóticas'. É um problema em aberto saber se existem estruturas exóticas para $\mathbb{S}^4$. Também é interessante tentar entender [as implicações dessas estruturas na física][nlab-física].

## Partições de unidade

O lema da cola só fala de abertos. Como colar mapas definidos em fechados?

Defininimos uma função que é suave mesmo sendo definida por partes. Também defininimos uma função **cutoff** e uma função **bump**:

- $\text{supp}f = \overline{\{ p \in M \mid f(p) \neq 0 \}}$
- $f$ tem suporte compacto $\iff \text{supp}f$ é compacto.

Enfim, chegamos às **partições de unidade**: seja $M$ uma variedade suave, na qual definimos, para uma cobertura aberta qualquer $\mathcal{X} = \lparen X_a \rparen_{a \in A}$, uma família de funções contínuas $(\psi_a)_{a\in A}$ $\psi_a : X_a \to \R$. Chamamos essa família de funções de **partições de unidade subordinadas a $\mathcal{X}$** sse ela satisfaz:
+ $0 \le \psi_a (x) \le 1$ para todo $a \in A$ e $x \in M$.
+ $\text{supp }\psi_a \subseteq X_a$ para todo $a \in A$.
+ A família $(\text{supp }\psi_a)_{a \in A}$ é localmente finita, ou seja, para todo ponto $x$ da variedade, existe uma vizinhança de $x$ que intersecta um número finito de elementos da família.
+ $\sum_{a \in A} \psi_a(x) = 1$ para todo $x \in M$.
<!-- 
**Teorema 2.23 (Existência de Partições de Unidade)**
: Suponha que $M$ seja uma variedade suave com ou sem fronteira, e $\mathcal{X} = \lparen X_a\rparen_{a\in A}$ *qualquer* cobertura aberta indexada de $M$. Então *existe uma partição de unidade suave subordinada a $\mathcal{X}$*.

**Prova**  
Cada conjunto $X_a$ é uma variedade suave por si só, e portanto possui uma base $\mathcal{B} _a$ de bolas de coordenadas regulares. Também temos que a união $\mathcal{B} = \bigcup _{a} \mathcal{B} _a$ dessas bases é uma base para a topologia de $M$, e com seus elementos podemos construir um refinamento contável e localmente finito $\{B_i\}$ da cobertura $\mathcal{X}$. Outra propriedade é que a cobertura $\{\bar{B_i} \}$ também é localmente finita. 
Para cada $i$, o fato de $B_i$ ser uma bola de coordenadas regular em algum $X_a$ garante que existe uma bola de coordenadas $B_i' \subseteq X_a$ tal que $B_i' \supseteq \bar{B} _i$, e uma carta suave $\varphi_i : B_i' \to \Reals^n$ com a propriedade que $\varphi_i(\bar{B} _i) = \bar{B} _{r_i}(0)$ e $\varphi_i(B_i') = B _{r'_i}(0)$ para um par $r_i < r_i'$.
Agora, para cada $i$, definimos uma função $f_i:M\to \Reals$ como:

$$
f_i = \begin{cases}
   H_i \circ \varphi_i  &\text{em } B_i'\\
   0                    &\text{em } M\setminus \bar{B}_i \\
\end{cases}
$$

Onde $H_i:\Reals^n \to \Reals$ é uma função suave que é positiva se em $B_{r_i}(0)$ e zero se fora dessa bola aberta, como a função bump. No conjunto $B_i'\smallsetminus \bar{B} _i$, onde as duas definições se aplicam, as duas definições correspondem à função constante zero, de forma que $f_i$ é bem definida e suave, e $\text{supp }f_i = \bar{B} _i$. -->

 

 --- 
**Referências:**  
> Lee, John Marshall. Introduction to Smooth Manifolds. 2nd ed., Springer, 2013.



[nlab-física]: https://ncatlab.org/nlab/show/exotic+smooth+structure#ReferencesForApplicationsToPhysics

