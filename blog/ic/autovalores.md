@def date = Date(2020,11,1)
@def title = "Autovalores nas propriedades estatísticas de dinâmicas"

~~~
<meta property="og:url" content="https://lucasvreis.github.io/blog/ic/autovalores/index.html" />
<meta property="og:title" content="Autovalores nas propriedades estatísticas de dinâmicas" />
<meta property="og:description" content="Seja na física, ciência da computação, biologia ou matemática, muitas vezes nos deparamos com um processo determinístico..." />
<meta property="og:image" content="https://lucasvreis.github.io/blog/ic/autovalores/img5.svg" />
~~~

\newcommand{\floor}[1]{\lfloor #1 \rfloor}
$$\newcommand{\emoji}[1]{\htmlClass{twa twa-#1}{}}$$

# Autovalores nas propriedades estatísticas de dinâmicas
\toc

\section{O que são sistemas dinâmicos em tempo discreto?}
\subsection{Introdução}
Seja na física, ciência da computação, biologia ou matemática, muitas
vezes nos deparamos com um processo determinístico que descreve a
"evolução temporal" de algum objeto. Mas enquanto que nas primeiras
disciplinas esses processos aparecem em contextos específicos, na
subárea matemática conhecida como sistemas dinâmicos esses processos são
estudados em formas mais gerais: por exemplo, o que acontece quando
aplicamos de forma repetida uma mesma função $f:X\to X$? Será que
$f\circ \dots \circ f\circ f (x)$ converge para alguma coisa? Imagino
que não fui o único que quando pequeno apertei dezenas de vezes a mesma
tecla da calculadora para ver o que acontece.

De fato, estaremos preocupados neste documento com sistemas dinâmicos em
tempo discreto, que são na sua forma mais básica transformações
$f:X\to X$ para algum espaço $X$. Mas acontece que mesmo sendo puramente
determinísticos, esses sistemas podem apresentar o que chamamos de
comportamento *caótico*, uma qualidade um pouco subjetiva e com muitas
definições diferentes. Um dos exemplos mais clássicos é o do matemático
Edward Lorenz e as cientistas da computação Ellen Fetter e Margaret
Hamilton. Resumidamente, Lorenz, Fetter e Hamilton tinham um programa de
computador em que eram colocadas informações sobre o clima atual, e que
depois de computar com um modelo determinístico, imprimia em um papel a
previsão do tempo dos próximos dias. A surpresa veio durante uma
tentativa de repetir uma das simulações a partir do meio: no começo do
papel, o comportamento da previsão era muito parecido com o da primeira
vez. Mas aos poucos, a previsão dos próximos dias se mostrava cada vez
mais diferente, até passar a não ter nenhuma relação com a simulação
original. Por que? O computador trabalhava com uma precisão de 6
dígitos, mas imprimia um número arredondado com 3. Assim, quando as
condições iniciais foram reintroduzidas na simulação, o estado do
sistema era ligeiramente diferente. O "comportamento caótico" do sistema
se refere ao fato de que essas pequenas diferenças foram *amplificadas
de maneira imprevisível* com o passar do tempo.

Mais tarde, Lorenz deu a palestra *"O bater de asas de uma borboleta no
Brasil pode provocar um tornado no Texas?"* que foi responsável por
popularizar o conhecido "efeito borboleta" na cultura popular. Mas a
mensagem que Lorenz quis passar no seu trabalho não foi a de que alguns
sistemas físicos são inerentemente imprevisíveis, mas a de que certas
estruturas como atratores e o comportamento estatístico das trajetórias
-- valores como médias e frequências -- podem depender muito pouco das
condições iniciais, constituindo uma forma robusta de entender o
comportamento desses sistemas. Neste artigo, vamos mostrar um pouco do
papel dos autovetores como forma de estudar essas propriedades nas
dinâmicas simbólicas, e como elas servem de modelo para sistemas mais
complicados.

\subsection{Medindo probabilidades}

Pensando nas propriedades estatísticas, muniremos o espaço de uma
estrutura de *espaço de probabilidade*, que é basicamente composta de
uma função $\mu$ que mede o tamanho de subconjuntos de $X$. Mais
formalmente, $(X,\mathcal{F},\mu)$ é um espaço de probabilidade se:

-   $\mathcal{F}$ é uma $\sigma$-álgebra de subconjuntos de $X$, ou
    seja, $\mathcal{F}$ é uma coleção de subconjuntos que inclui $X$ e
    que é fechada quando se toma complementos e uniões de famílias
    enumeráveis.

-   $\mu:\mathcal{F}\to\mathbb{R^+}$ é tal que
    $\mu(\bigcup_{i=1}^\infty S_i)=\sum_{i=1}^\infty \mu(S_i)$ sempre
    que $S_i$ são mutualmente disjuntos.

-   $\mu(X)=1$.

Nesse caso chamamos $\mu$ de uma *medida de probabilidade*, e os
elementos de $\mathcal{F}$ de subconjuntos mensuráveis ou eventos. Em
sistemas dinâmicos, se costuma pedir que a medida seja *invariante*.
Motivaremos essa propriedade da seguinte forma: suponha que você vai
acordar tarde amanhã se, e somente se, hoje estudar até a madrugada ou
esquecer de ligar o despertador. É intuitivo que a chance do evento
"acordar tarde" de amanhã é a mesma do evento "estudar até a madrugada
ou esquecer do despertador" de hoje. Podemos pensar nesse último evento
como a *pré-imagem* do primeiro: o conjunto de todas as situações de
hoje que implicam em acordar tarde amanhã. De forma bastante análoga,
$\mu$ ser invariante significa que $\mu(f^{-1}(A))=\mu(A)$ para todo $A$
mensurável, onde $f^{-1}(A)=\{x\in X : f(x) \in A\}$ denota a pré-imagem
de $A$. Note que para $\mu(f^{-1}(A))$ fazer sentido, precisamos que
$f^{-1}(A)\in\mathcal{F}$ para todo $A\in\mathcal{F}$, e nesse caso
chamamos $f$ de uma função mensurável.

Em posse de uma probabilidade $\mu$, a teoria da medida também nos dá
uma noção de valor esperado para funções $\varphi :X\to\mathbb{R}$, que
denotaremos por $\mathbb{E}_\mu[\varphi]$. As funções que possuem valor
esperado podem ser chamadas de funções integráveis, variáveis aleatórias
ou observáveis, a depender da área da matemática em que aparecem. Por
exemplo, a função indicadora $\mathbb{1}_A$ para um subconjunto
mensurável $A$ é definida por $\mathbb{1}_A(x)=1$ se $x\in A$ e
$\mathbb{1}_A(x)=0$ caso contrário, sendo integrável com
$\mathbb{E}_\mu[\mathbb{1}_A]=\mu(A)$.

\subsection{Correlações e misturas}

Na teoria da probabilidade, se define a covariância entre duas variáveis
aleatórias $\psi,\varphi:X\to\mathbb{R}$ como
$\operatorname{cov}[\psi,\varphi]\coloneqq\mathbb{E}_\mu[\psi\cdot\varphi]-\mathbb{E}_\mu[\psi]\mathbb{E}_\mu[\varphi]$.
Lembrando que na teoria da probabilidade dois eventos $A$ e $B$ são
independentes se $\mu(A\cap B)=\mu(A)\mu(B)$, ela pode ser vista como
uma medida do "quão longe" duas variáveis estão de serem
estatisticamente independentes. Com efeito,
$\operatorname{cov}[\mathbb{1}_A,\mathbb{1}_B]=0$ equivale aos eventos $A$ e $B$ serem
independentes. A covariância indica se as variáveis apresentam em média
comportamentos similares, opostos ou pouco relacionados.

Embora em teoria da probabilidade a *correlação* seja um pouco diferente
da covariância, em sistemas dinâmicos, se a medida de probabilidade do
nosso espaço for invariante, usamos a covariância para definir a
correlação entre dois observáveis no tempo $n$ da seguinte forma:
$C_n(\psi,\varphi)=\operatorname{cov}[\psi,\varphi\circ f^n]$. A expressão $f^n$ é uma
forma mais compacta de escrever a composição de $f$ consigo mesma $n$
vezes. Além disso, denotamos por $f^{-n}(A)$ a pré-imagem de $A$ por
$f^n$, ou seja, o conjunto dos pontos de $X$ que vão parar em $A$ depois
de aplicada a função $f$ $n$ vezes.

Sistemas são chamados de *misturadores* para uma medida invariante $\mu$
quando para todo par de subconjuntos mensuráveis $A$ e $B$, temos que
$\lim_{n\to\infty}C_n(\mathbb{1}_A,\mathbb{1}_B)=0$. Escrevendo por
completo, isso fica:
 $$\begin{aligned}
    &\lim_{n\to\infty}\mathbb{E}_\mu[\mathbb{1}_A\cdot \mathbb{1}_B\circ f^n]-\mathbb{E}_\mu[\mathbb{1}_A]\mathbb{E}_\mu[ \mathbb{1}_B\circ f^n]=0\end{aligned}$$
O que significa a função $(\mathbb{1}_A\cdot \mathbb{1}_B\circ f^n)$?
Note que isso também é uma função indicadora, pois
$(\mathbb{1}_A\cdot \mathbb{1}_B\circ f^n)(x)$ vale um se $x\in A$ e
$f^n(x)\in B$, e vale zero caso contrário. Assim, o conjunto dos pontos
em que essa função vale 1 é $A\cap f^{-n}(B)$. Se chamamos
$C=A\cap f^{-n}(B)$, então
$(\mathbb{1}_A\cdot \mathbb{1}_B\circ f^n)=\mathbb{1}_C$, e como vimos
anteriormente, $\mathbb{E}_\mu[\mathbb{1}_C]=\mu(C)$. Com a mesma ideia,
$(\mathbb{1}_B\circ f^n)(x)$ vale um se $f^n(x)\in B$, de forma que
$\mathbb{E}_\mu[\mathbb{1}_B\circ f^n]=\mu(f^{-n}(B))=\mu(B)$, e na
última igualdade usamos que a medida é invariante. Então podemos
reescrever a propriedade da mistura dessa forma:
$$\begin{aligned}
    &\lim_{n\to\infty}\mu(A\cap f^{-n}(B))-\mu(A)\mu(B)=0\\
    \iff &\lim_{n\to\infty}\mu(A\cap f^{-n}(B))=\mu(A)\mu(B)\end{aligned}$$

Como $\mathbb{1}_A(x)$ é determina se $x$ está dentro do subconjunto
$A$, o observável $\mathbb{1}_A\circ f^n$ determina se um ponto está
dentro do subconjunto $A$ depois de um tempo $n$. O que sistemas
misturadores fazem, portanto, é "misturar" o espaço $X$ ao longo do
tempo de forma que para todo $A$ e $B$ mensuráveis, o observável
$\mathbb{1}_A$, que dá informação sobre a condições iniciais do sistema,
se torne muito pouco relacionado com $\mathbb{1}_B\circ f^n$, que dá
informação sobre a posição de pontos do sistema após um tempo $n$,
conforme $n$ aumenta.

Uma consequência importante da propriedade de mistura é que quase todas
as trajetórias de sistemas misturadores possuem o mesmo comportamento
estatístico, "quase todas" significando que o conjunto das condições
iniciais para as quais a propriedade vale tem tem medida total em $X$
(ou seja, probabilidade 1). Mais precisamente, se você fosse tomar
médias dos valores de um observável ao longo de duas trajetórias que
partem de condições iniciais diferentes nesse conjunto, você perceberia
que conforme o tempo passa as duas médias tenderiam ao mesmo número, por
mais diferentes que as trajetórias possam parecer. Por exemplo, supondo
que existisse uma função que nos desse o clima de amanhã em função do
clima de hoje, e que o sistema fosse misturador para alguma
probabilidade invariante, a teoria nos garantiria que a frequência média
da chuva seria a mesma para (quase) todas as condições iniciais, e o
mesmo para a média de qualquer outra medição, como temperatura. Em
outras palavras, mesmo se não sabemos com exatidão o valor de uma
condição inicial para poder determinar o futuro de um sistema caótico,
sob certas condições ainda podemos fazer afirmações sobre o seu
comportamento estatístico de forma robusta, que dependa pouco das
incertezas.

\section{Deslocamentos de Markov finitos}


Imagine que você tenha um "observável" com um número finito de possíveis
resultados, que representaremos por um conjunto finito $X$ chamado de
alfabeto. Por exemplo, suponha que você tenha uma medição que consiste
em anotar o clima de onde você está como um dos elementos de
$X=\{\text{\emoji{sun} (sol)},\text{ \emoji{umbrella} (chuva)}\}$, e
suponha que você repete essa medição por vários dias seguidos. Melhor
ainda, você repete por *infinitos* dias seguidos, e anota os resultados
no seu caderno de laboratório com infinitas páginas:
$$\text{\emoji{sun}\emoji{sun}\emoji{sun}\emoji{sun}\emoji{sun}\emoji{umbrella}\emoji{sun}\emoji{umbrella}\emoji{sun}\emoji{umbrella}\emoji{umbrella}\emoji{sun}\emoji{umbrella}\emoji{umbrella}\emoji{umbrella}\emoji{sun}\emoji{sun}\emoji{umbrella}}...$$
Pode ser que cada resultado da medição seja independente dos demais.
Outra possibilidade seria que cada medição depende de um número *finito*
de dias anteriores. Por exemplo, imagine que se ontem choveu, seja mais
provável que hoje chova também, mas saber ou não o clima de anteontem
(já se sabendo o de ontem) não afeta essa probabilidade. Nesse caso,
poderíamos representar o nosso modelo como um grafo direcionado, por
exemplo:

![alt](img1.svg)

e chamamos as probabilidades nas arestas de *probabilidades de
transição*. Cada grafo desse tipo corresponde a uma matriz
$(P_{i,j})_{i,j\in X}$, onde $P_{ij}$ é a probabilidade do próximo
resultado ser $j\in X$ se o atual é $i\in X$. Chamamos essa matriz de
*matriz estocástica*. No exemplo acima, essa matriz seria a seguinte:

$$P=\left[
\begin{matrix}
    P_{\text{\emoji{sun},\emoji{sun}}} & P_{\text{\emoji{sun},\emoji{umbrella}}} \\
    P_{\text{\emoji{umbrella},\emoji{sun}}} & P_{\text{\emoji{umbrella},\emoji{umbrella}}}
\end{matrix}\right] =\left[
\begin{matrix}
    0.7 & 0.3 \\
    0.4 & 0.6 \\
\end{matrix}\right]$$ 
Duas propriedades que definem as matrizes
estocásticas são: os seus elementos são números reais não-negativos, e a
soma dos elementos ao longo de qualquer linha é igual a 1. Digamos que
hoje choveu. Qual seriam as probabilidades de cada resultado para
amanhã? Usando a notação que construímos, a resposta seria
$P_{\text{\emoji{umbrella},\emoji{sun}}}$ para sol e
$P_{\text{\emoji{umbrella},\emoji{umbrella}}}$ para chuva. E para depois
de amanhã? As chances seriam:
$$\text{prob(\emoji{sun}\;depois de amanhã}\mid \text{\emoji{umbrella}\;hoje)}=
 P_{\text{\emoji{umbrella},\emoji{sun}}}P_{\text{\emoji{sun},\emoji{sun}}}+
 P_{\text{\emoji{umbrella},\emoji{umbrella}}}P_{\text{\emoji{umbrella},\emoji{sun}}}=
 P^2_{\text{\emoji{umbrella},\emoji{sun}}}$$
$$\text{prob(\emoji{umbrella}\;depois de amanhã}\mid \text{\emoji{umbrella}\;hoje)}=
 P_{\text{\emoji{umbrella},\emoji{sun}}}P_{\text{\emoji{sun},\emoji{umbrella}}}+
 P_{\text{\emoji{umbrella},\emoji{umbrella}}}P_{\text{\emoji{umbrella},\emoji{umbrella}}}=
 P^2_{\text{\emoji{umbrella},\emoji{umbrella}}}$$

Vamos chamar de prob($i\xrightarrow{\;k\;}j$) a probabilidade de o
resultado daqui a $k$ dias ser $j$, se sabemos que o atual é $i$. Já
sabemos que prob($i\xrightarrow{\;1\;}j$) é $P_{i,j}$. Se supormos por
hipótese de indução que prob($i\xrightarrow{\;k\;}j$) é $P^k_{i,j}$,
então: 
$$\begin{aligned}
\text{prob($i\xrightarrow{k+1}j)$}=
\sum_{l\in X}\text{prob($i\xrightarrow{\;k\;}l$)}\cdot
\text{prob($l\xrightarrow{\;1\;}i$)}=
\sum_{l\in X}P^k_{i,l}P_{l,j}=P^{k+1}_{i,j}\end{aligned}$$ 
de forma que
o resultado vale para todo $k$.

Assim, se $p=(p_{\text{\emoji{sun}}},p_{\text{\emoji{umbrella}}})$ é um
vetor com as probabilidades para um certo dia, então as probabilidades
de sol e chuva para depois de $k$ dias são:
$$(p_{\text{\emoji{sun}}}P^k_{\text{\emoji{sun},\emoji{sun}}}+p_{\text{\emoji{umbrella}}}P^k_{\text{\emoji{umbrella},\emoji{sun}}},\;p_{\text{\emoji{sun}}}P^k_{\text{\emoji{sun},\emoji{umbrella}}}+p_{\text{\emoji{umbrella}}}P^k_{\text{\emoji{umbrella},\emoji{umbrella}}})
 =(P^k)^\mathsf{T}p$$ 
 O que acontece se $P^\mathsf{T}p=p$? E o que
acontece quando calculamos a probabilidade de um dia muito distante, ou
seja, $\lim_{k\to\infty}(P^\mathsf{T})^kp$? Nesse ponto, vale a pena
parar e pensar sobre essas perguntas. Veremos que as respostas de ambas
são bastante relacionadas.

"Mas!", você pode estar se perguntando, "se estávamos falando de
sistemas dinâmicos determinísticos, como esse sistema é determinístico?
Até agora você só falou em probabilidades!".

O detalhe é que, se consideramos que a dinâmica por trás do nosso
sistema é determinística, *todas* as medições futuras já estão
pré-determinadas. Dessa forma, se a única informação com a qual nos
importamos são os resultados da medição, podemos bem considerar que os
elementos do nosso espaço são sequências, cada uma listando os
resultados de cada uma das medições futuras! Ou seja, o espaço da
dinâmica é o espaço de todas sequências de elementos do alfabeto $X$:
$$\Sigma = X^{\mathbb{N}} = \{(x_i)_{i\in\mathbb{N}} : \forall i,\; x_i \in X\}$$
e a transformação é a função $\sigma$ que chamamos de *shift*
(deslocamento):
$$\begin{aligned}
    \sigma : \Sigma &\to \Sigma\\
    (x_i)_{i\in\mathbb{N}} &\mapsto (x_{i+1})_{i\in\mathbb{N}}\end{aligned}$$
O sistema dinâmico $(\Sigma,\sigma)$ é conhecido como *deslocamento de
Markov*. Seguindo o que falamos antes, podemos procurar colocar uma
estrutura de probabilidade nos deslocamentos de Markov. Uma definição
útil para isso é a dos cilindros, que definimos da seguinte forma:
$$[m; a_m,...,a_n] \coloneqq \{(x_i)_{i\in\mathbb{N}}\in \Sigma \mid x_i = a_i,\; \forall m\leq i\leq n\}$$
ou seja, cada cilindro é um subconjunto de $\Sigma$ contendo todas as
sequências cujos elementos nos índices de $m$ até $n$ são $a_m,...,a_n$.

O interessante dos cilindros é que eles geram, de uma forma que pode ser
feita precisa, a coleção de subconjuntos mensuráveis$\mathcal{F}$ de
$\Sigma$. Por isso, a teoria da medida diz que uma probabilidade
invariante nos cilindros se estende automaticamente a uma única
probabilidade invariante em todo o $\mathcal{F}$. Se temos um vetor de
probabilidades $p$ que satisfaz $P^\mathsf{T}p=p$, chamado de
probabilidade estacionária, podemos definir uma probabilidade $\mu$
pelos valores que ela assume nos cilindros[^1]:
$$\mu([m; a_1,...,a_n]) \coloneqq p_{a_1}P_{a_{2},a_{3}}\dots P_{a_{n-1},a_n}$$
Note que $\sigma^{-1}([m; a_1,...,a_n]))=[m+1; a_1,...,a_n]$, e que o
lado direito da definição de $\mu$ não depende de $m$. Assim, a medida
$\mu$ é invariante por $\sigma$: 
$$\mu(\sigma^{-1}([m; a_1,...,a_n]))=
\mu([m+1; a_1,...,a_n])=
\mu([m; a_1,...,a_n])$$

\subsection{Autovalores e o Teorema de Perron-Frobenius}

Quando que um vetor $p$ com entradas positivas tal que $P^\mathsf{T}p=p$
existe? Em outras palavras, queremos um autovetor de $P^\mathsf{T}$ com
autovalor 1 e entradas positivas. O próximo teorema garante a existência
desse autovetor, e ainda lista várias propriedades interessantes do
mesmo que são centrais para endender os deslocamentos de Markov.

\theorem{}{Perron-Frobenius}{
Seja $A$ uma matriz $d\times d$ cujas entradas são números reais não
negativos. Então:

1.  A matriz tem um autovalor real $r\geq 0$ tal que qualquer outro
    autovalor $\lambda$ (possivelmente complexo) tem valor absoluto
    menor do que $r$, ou seja, $|\lambda|\leq r$.

2.  Existe um autovetor $p$ de autovalor $r$ cujas entradas são todas
    não-negativas e somam 1, ou seja, $p$ é um vetor de probabilidades.

Ainda, se existir $n$ tal que $A^n$ tem apenas entradas positivas,
então:

1.  O autovalor $r$ é positivo, e qualquer outro autovalor $\lambda$ tem
    valor absoluto estritamente menor do que $r$, ou seja, $|\lambda|< r$.

2.  Há um único autovetor $p$ de autovalor $r$ cujas entradas são todas
    positivas e somam 1.
}

Perfeito! Podemos aplicar a primeira parte do teorema para
$P^\mathsf{T}$, que tem entradas não negativas, e obter $r$ e $p$. No
caso de matrizes estocásticas, também é simples mostrar que o autovalor
$r=1$, o que é bastante conveniente.

Agora, examinemos melhor a hipótese na segunda parte do teorema. Quando
para uma matriz estocástica $P$ existe $n$ tal que $P^n$ tem apenas
entradas positivas, chamamos $P$ de aperiódica. Note que $P^\mathsf{T}$
é aperiódica se, e somente se, $P$ também é. Como já vimos que as
entradas de $P^n$ são as probabilidades prob(${i\xrightarrow{\;n\;}j}$),
onde $i$ e $j$ são vértices do grafo associado a $P$, a probabilidade de
um caminho de tamanho $n$ sair do vértice $i$ e chegar ao vértice $j$ é
$P^n_{i,j}$. Se todas as entradas de $P^n$ são positivas, isso significa
que com caminhos de tamanho $n$ é possível sair de qualquer vértice do
grafo e chegar a qualquer outro com probabilidade maior que zero. A
seguir estão alguns exemplos de grafos de matrizes aperiódicas ou não,
onde desenhamos apenas as arestas que têm probabilidade maior que zero:

![alt](img2.svg)

Os três primeiros grafos são de matrizes não aperiódicas: na primeira,
saindo da aresta A, se andamos por um número par de passos, sempre
estaremos na aresta A ou D, e por um número ímpar, na aresta B ou C; na
segunda, esse mesmo raciocício funciona com o resto na divisão por 3. Na
terceira, é impossível chegar ao vértice C saindo de A ou B. O quarto
grafo representa uma matriz aperiódica, pois com dois passos é possível
partir de qualquer vértice e chegar a qualquer outro.

\subsection{Quando os deslocamentos de Markov são misturadores?}

Estamos caminhando para demonstrar as condições sob as quais os
deslocamentos são misturadores, mas antes disso, precisaremos provar
dois pequenos lemas:

\lemma{}{}{
Seja $P$ uma matriz estocástica aperiódica e seja $p$ uma solução de
$P^\mathsf{T}p = p$ cujas entradas somam 1. Então para todo $i$ e $j$,
$\lim_{n\to\infty}P_{i,j}^n=p_j$.
}
\proof{
Dizemos que um subespaço $W$ é *invariante* por uma transformação linear
$T$ se $T(w)\in W$ para todo $w\in W$. Iniciaremos a prova demonstrando
que o hiperplano $H=\{h\in \mathbb{R}^d: h_1+\dots+h_d = 0\}$ é
invariante por $P^\mathsf{T}$.

A condição de que as linhas da matriz estocástica somam 1 pode ser
reescrita como $Pu=u$, onde $u=(1,\dots,1)$. Agora, note que $H$ é o
complemento ortogonal do vetor $u$. Mas então, para todo $h\in H$:
$$\langle P^\mathsf{T}h,u\rangle = \langle h,Pu\rangle = \langle h,u\rangle = 0$$
ou seja, $P^\mathsf{T}h$ continua ortogonal à $u$, e portanto está em
$H$.
\
Agora, consideramos a decomposição $\mathbb{R}^d = \mathbb{R}p\oplus H$,
que é invariante por $P^\mathsf{T}$. Como, pelo item 2 da segunda parte
do teorema de Perron-Frobenius, todos os autovalores da restrição de
$P^\mathsf{T}$ à $H$ são estritamente menores que 1 em valor absoluto,
essa restrição é uma contração. Isso significa que
$\lim_{n\to\infty}(P^\mathsf{T})^n$ converge para uma matriz $B$ que é a
projeção em $\mathbb{R}p$ com respeito a essa decomposição, ou seja,
caracterizada por $Bp=p$ e $Bh=0$ para todo $h\in H$. Seja $h_i=e_i-p$,
para todo $e_i$ elemento da base canônica. Como a soma das entradas
tanto de $e_i$ como de $p$ são 1, a soma das entradas de $h_i$ vale
zero, e portanto $h_i\in H$. Isso significa que para todo $i$,
$Be_i=B(p+h_i)=p$, ou seja, $B_{i,j}=p_i$. Então:
$$\lim_{n\to\infty} P_{i,j}^n = \lim_{n\to\infty} (P^\mathsf{T})^n_{j,i}= B_{j,i}=p_j.$$
}

\lemma{}{}{ 
Sejam $A=[m;a_m,...,a_q]$ e
$B=[r;b_r,...,b_s]$ cilindros com $r>q$. Então 
$\mu(A\cap B)=\mu(A)\mu(B)\frac{P^{r-q}_{a_q,b_r}}{p_{b_r}}$
}

Primeiramente, vamos entender melhor o que é $A\cap B$: isso é o
conjunto das sequências cujos elementos de $m$ a $q$ são
$a_m,\dots,a_q$, e cujos os elementos de $r$ a $s$ são $b_r,\dots,b_s$.
Podemos expressar esse conjunto como uma união disjunta de cilindros,
com cada cilindro associado uma possibilidade para os $r-q-1$ elementos
entre $q$ e $r$:
$$A\cap B = \bigcup_{x}\,[m;a_m,\dots,a_q,x_{q+1},\dots,x_{r-1},b_r,\dots,b_s]$$
sobre todos os $x\in X^{r-q-1}$. Como $X^{r-q-1}$ é um conjunto finito,
isso é uma união de um número contável de subconjuntos disjuntos, e
portanto podemos aplicar a propriedade na definição de medida que diz:

$$\begin{aligned}
        \mu(A\cap B)&=\sum_{x\in X^{r-q-1}} \mu([m;a_m,\dots,a_q,x_{q+1},\dots,x_{r-1},b_r,\dots,b_s])\\
        &= \sum_{x\in X^{r-q-1}}
        {\color{green} p_{a_m}P_{a_{m},a_{m+1}}\dots P_{a_{q-1},a_{q}}}
        {\color{blue} P_{a_q,x_{q+1}}\dots P_{x_{r-1},b_r}}
        {\color{salmon} P_{b_{r},b_{r+1}}\dots P_{b_{s-1},b_{s}}}\\
        &= ({\color{green} p_{a_m}P_{a_{m},a_{m+1}}\dots P_{a_{q-1},a_{q}}})
        \left(\frac{p_{b_r}}{p_{b_r}} {\color{salmon} P_{b_{r},b_{r+1}}\dots P_{b_{s-1},b_{s}}}\right)
        \sum_{x\in X^{r-q-1}}{\color{blue} P_{a_q,x_{q+1}}\dots P_{x_{r-1},b_r}}\\
        &= \mu(A)
        \frac{\mu(B)}{p_{b_r}}
        \sum_{x\in X^{r-q-1}}\underbrace{P_{a_q,x_{q+1}}\dots P_{x_{r-1},b_r}}_{r-q\text{ termos}}\\
        &= \mu(A)\mu(B)\frac{P^{r-q}_{a_q,b_r}}{p_{b_r}}
\end{aligned}$$


Provado isso, estamos prontos para o teorema:

Suponha que $P$ é aperiódica. Então o deslocamento de Markov é
misturador, ou seja, para todo $A$ e $B$ mensuráveis,
$$\lim_{j\to\infty}\mu(A\cap \sigma^{-j}(B))=\mu(A)\mu(B)$$

Tal qual a invariância da medida, pode-se mostrar que basta verificar o
resultado quando $A=[m;a_m,...,a_q]$ e $B=[r;b_r,...,b_s]$ são
cilindros, pois eles geram a coleção de subconjuntos mensuráveis. Assim,
lembrando que $\sigma^{-j}(B)=[r+j;b_r,...,b_s]$, sempre que $r+j>q$
vale pelo Lema 2.
$$\mu(A\cap \sigma^{-j}(B))=\mu(A)\mu(B)\frac{P^{r-q+j}_{a_q,b_r}}{p_{b_r}}$$

Por fim, usamos o Lema 1 para obter que
$\lim_{j\to\infty} P^{r-q+j}_{a_q,b_r}=p_{b_r}$. Dessa forma, juntando
os dois resultados, o limite converge:
$$\lim_{j\to\infty}\mu(A\cap \sigma^{-j}(B))=
\lim_{j\to\infty} \mu(A)\mu(B)\frac{P^{r-q+j}_{a_q,b_r}}{p_{b_r}}=
\mu(A)\mu(B)$$

\section{Sistemas equivalentes}


O interessante da ideia dos deslocamentos é que podemos fazer uso dessa
"simplificação probabilística" para tirar conclusões sobre outros
sistemas mais complexos. Vamos entender isso a partir de um exemplo,
dessa vez matematicamente mais concreto que os anteriores. Considere a
transformação $f(x)=3x\pmod{1}=3x-\floor{3x}$ no intervalo $[0,1]$. O
gráfico dessa função é o seguinte:

![alt](img3.svg)

Dividimos o intervalo $[0,1]$ nos três subintervalos coloridos
${\textsf{\color{orange}\textbf{0}}}$, ${\textsf{\color{lime}\textbf{1}}}$ e ${\textsf{\color{blue}\textbf{2}}}$ que,
como veremos, constituem uma boa escolha para o nosso alfabeto $X$, e
consideramos o observável
$\varphi : [0,1]\to\{\textsf{\color{orange}\textbf{0}}{},\textsf{\color{lime}\textbf{1}},\textsf{\color{blue}\textbf{2}}{}\}$
que leva cada ponto ao número do subintervalo em que esse ponto se
situa. Pense na transformação $f:[0,1]\to[0,1]$ como o sistema "por
trás" da série de observações que fazemos com o observável $\varphi$, da
mesma forma que uma dinâmica bastante complexa poderia estar por trás do
padrão de dias de sol e chuva do exemplo anterior. Mas ao contrário
desse último, neste caso da $f$ o deslocamento de Markov que escolhemos
é em um certo sentido *equivalente* ao sistema original $f$.

Para instigar um pouco a curiosidade, vamos antes de tudo ver como se
comportam os iterados pela função $f$ de dois pontos ligeiramente
distintos, anotando o valor do observável a cada passo:

![alt](img4.svg)

A trajetória de $x_0=0.1$ é periódica, mas começando no ponto
ligeiramente diferente $x_0=0.100005$, depois de alguns poucos passos a
sequência de observações parece não ter mais nenhuma relação com a
primeira! E isso não é uma característica específica desses pontos;
veremos que a dinâmica como um todo é misturadora.

A medida invariante mais naturalno intervalo $[0,1]$ para a
transformação $f$ é a própria medida usual nos números reais, onde o
tamanho de $[a,b]$ é $b-a$, e que chamaremos de $m$. Considerando essa
medida, se sabemos apenas o resultado atual do observável $\varphi$, a
próxima medição tem probabilidades iguais de resultar em qualquer
intervalo, cada um com probabilidade $p=1/3$. Portanto, o grafo da
matriz estocástica teria a seguinte forma:

![alt](img5.svg)

Claramente essa matriz estocástica é aperiódica, e portanto o
deslocamento de Markov associado é misturador para uma medida $\mu$.
Será que o mesmo vale para $f$ e $m$ em $[0,1]$? A partir de agora,
vamos construir uma correspondência entre $[0,1]$ e $\Sigma$ que
preserve a medida dos subconjuntos mensuráveis, e nos permita
transportar esse resultado para a dinâmica original.

Seja $x\in[0,1]$, e represente por $x=[0.\overline{x_1x_2x_3...}]_3$ a
expansão de $x$ na base 3, com
$x_i\in\{\textsf{\color{orange}\textbf{0}}{},\textsf{\color{lime}\textbf{1}},\textsf{\color{blue}\textbf{2}}{}\}$
para todo $i\in\mathbb{N}$. Isso nos motiva a definir o seguinte mapa:
$$\pi : \Sigma \to [0,1], \hspace{2em} (x_n)_n\mapsto [0.\overline{x_1x_2x_3...}]_3$$
Que tem a propriedade que $\pi\circ\sigma=f\circ\pi$, pois:
$$\begin{aligned}
    \pi(\sigma((x_n)_n))=\pi((x_{n+1})_n)&=[0.\overline{x_2x_3x_4...}]_3\\
    &=[\overline{x_1.x_2x_3x_4...}]_3 - x_1\\
    &=3\cdot\pi((x_n)_n) - \floor{3\cdot\pi((x_n)_n)}\\
    &= f(\pi((x_n)_n))\end{aligned}$$ 
Como $f^{n+1}\circ\pi=f^n\circ (f\circ\pi)$, segue de forma indutiva que
$f^n\circ\pi=\pi\circ\sigma^n$, e portanto 
$$(\pi^{-1}\circ f^{-n})(A)=
(f^n\circ\pi)^{-1}(A)=(\pi\circ\sigma^n)^{-1}(A)=
(\sigma^{-n}\circ\pi^{-1})(A)$$
Além disso, a medida de subconjuntos é
preservada, no sentido que $\mu\circ\pi^{-1}(A)=m(A)$ para todo
$A\subset[0,1]$ mensurável, onde $\mu$ é a medida em $\Sigma$. Em mãos
dessa "tradução" entre as dinâmicas, transportamos a propriedade da
mistura da seguinte forma: dados quaisquer subconjuntos mensuráveis
$A,B\subset [0,1]$, 
$$\begin{aligned}
    m(A\cap f^{-n}(B)) &= \mu(\pi^{-1}(f^{-n}(A)\cap B)) \\
    &=\mu(\pi^{-1}(f^{-n}(A))\cap \pi^{-1}(B))\\
    &=\mu(\sigma^{-n}(\pi^{-1}(A))\cap \pi^{-1}(B))\\
    &\xrightarrow[n\to\infty]{} \mu(\pi^{-1}(A))\mu(\pi^{-1}(B))=m(A)m(B)\end{aligned}$$
Ou seja, $(f,m)$ também é misturadora.

\section{Poslúdio}

Se sabemos que a dinâmica é misturadora, a Teoria Ergódica nos diz que a
sequência de pontos formada pela trajetória de quase toda condição
inicial é distribuída de acordo com a medida invariante. No exemplo
anterior, isso significa que começando de quase todo ponto $x$, a
sequência de pontos formada pelos iterados $f^n(x)$ tem uma distribuição
uniforme em $[0,1]$. Esse tipo de independência das condições iniciais
tem a importância de tornar conclusões desse tipo "à prova de
incertezas": mesmo se não sabemos com exatidão o estado de um sistema,
sabemos que certas propriedades estatísticas são sempre as mesmas.
Sabendo isso, fica fácil adivinhar que a teoria tem relevância em áreas
da física como mecânica estatística.

Em um paralelo mais pessoal, o que vimos nesse artigo é também mais um
exemplo de como, em face de incertezas e processos complicados, a
ciência muitas vezes consegue tirar conclusões sobre a realidade que são
robustas o suficiente para serem levadas a sério.

\section{Referências}

* _Orientação da IC e notas_, Prof. Dr. Christian S. Rodrigues.  (Imecc -- Unicamp).
* Krerley Oliveira e Marcelo Viana. _Fundamentos Da Teoria Ergódica_. 2ª ed. SBM, 2019.
* _Edward Norton Lorenz_. Em: [Wikipedia](https://en.wikipedia.org/w/index.php?title=Edward_Norton_Lorenz&oldid=976386700). 2 de set. de 2020. (consultado em 15/10/2020).
* Joshua Sokol. _The Hidden Heroines of Chaos_. Em: [Quanta Magazine](https://www.quantamagazine.org/hidden-heroines-of-chaos-ellen-fetter-and-margaret-hamilton-20190520). (consultado em 30/10/2020).