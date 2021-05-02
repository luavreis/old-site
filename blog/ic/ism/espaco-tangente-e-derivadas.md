# Espaços Tangente

Um *espaço tangente geométrico de $\R^n$ em $a$* é o conjunto $\R^n_a=\{a\}\times\R^n$. Seus elementos são os *vetores tangente geométricos* em $a$, onde abreviamos $v_a=(a,v) \in \R^n_a$.

Também podemos pensar em derivadas direcionais, partindo dos espaços euclidianos. Neles, uma *derivação em $a$* é um operador linear $w:C^{\infty}(\R^n) \to \R$ que satisfaz a regra do produto:
$$w(fg) = f(a)wg + g(a)wf$$
e também:
$$w(f+g) = wf + wg\\
w(λf) = λ(wf)$$

O conjunto de todas as derivações em $a$ é denotado $T_a\R^n$, e é um espaço vetorial com as operações:
$$(w_1 + w_2)f = w_1f + w_2f\\
(λw)f = λ(wf)$$

Curiosamente, esse espaço possui dimensão finita, $n$. Para ver isso, podemos mostrar que há um isomorfismo $T_a\R^n \cong \R^n_a$, ou seja, cada vetor tangente define uma derivação em $a$.

No caso de uma variedade $M$, denotamos o conjunto de todas as derivações em um ponto $a\in M$, ou seja, operadores lineares $C^\infty(M)\to \R$ que satisfazem a regra do produto, por $T_aM$.

