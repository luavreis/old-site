---
layout: post
title: Variedades Topológicas
date: 2019-11-05 22:41
category: Iniciação Científica (anotações)
author: 
tags: []
summary: 
---

 > Essas notas são baseadas no livro Introduction to Smooth Manifolds, 2nd ed. de John M. Lee, Springer Press, &copy; 2013. Ainda assim, conteúdo desse site é unicamente de minha responsabilidade.

## Propriedades Topológicas das Variedades

***Lema 1.10*** 
: Toda variedade possui uma base pré-compacta de bolas de coordenadas.

### ***Compactividade local e Paracompactividade***

***Preposição 1.12*** 
: Variedades são localmente compactas!

Relembrando, localmente compacto significa que para todo ponto na variedade, conseguimos encontrar uma vizinhança que está dentro de um subconjunto compacto da variedade. Como um aberto sempre está dentro de seu fecho[^h1], então se para todo ponto temos vizinhanças pré-compatas[^d1], o espaço também é localmente compacto. De fato, vimos[^l1] que uma variedade topológica sempre possui uma base contável de bolas de coordenadas pré-compactas.

***Definições***  

Localmente finita
 : Uma coleção $\mathcal{X}$ de subconjuntos de um espaço topológico $M$ é dita ***localmente finita*** se todo ponto de $M$ possui uma vizinhança que intersecta um número finito dos conjuntos de $\mathcal{X}$;

Refinamento
 : Dada uma cobertura $\mathcal{U}$ de $M$, outra cobertura $\mathcal{V}$ é chamada de ***refinamento*** de $\mathcal{U}$ se para todo $V\in \mathcal{V}$ existe $U\in \mathcal{U}$ tal que $V \subseteq U$, ou seja, todos os elementos de $\mathcal{V}$ estão dentro de elementos de $\mathcal{U}$;

Paracompacta
 : Chamamos $M$ de ***paracompata*** se toda cobertura aberta de $M$ admite um refinamento aberto que é localmente finito. Observe que um refinamento é uma coleção de subconjuntos, e também é uma cobertura.

Perceba que ser paracompato é diferente de ser segundamente contável, pois no primeiro queremos que exista um número finito de abertos em uma vizinhança de um dado ponto, enquanto no segundo falamos de uma base contável para o espaço, que pode ser infinita.
<!-- paracompacto => seg. contável? -->

Mais importante para distinguirmos, a definição de paracompacto lembra a definição de compacto, mas não são as mesmas. Afinal, basta trocar "refinamento aberto" por "subcobertura" ***ou*** "localmente finito" por "finito" que de repente temos uma definição equivalente à de espaço compacto!

Para ver isso: o segundo caso é bem simples, então você pode tentar fazer.[^r1] No primeiro caso, considere um aberto $G$, o qual fixamos de uma cobertura $\mathcal{U}$. A coleção $\mathcal{V} = \\{U\cup G\\}_{U\in\,\mathcal{U}}$ também é uma cobertura. Note que toda subcobertura de $\mathcal{V}$ que é localmente finita *precisa* ser finita: lembre dos pontos $x\in G$, que intersectam todos os elementos de $\mathcal{V}$. Agora, os elementos dessa subcobertura de $\mathcal{V}$ têm uma correspondência um-a-um com os de uma subcobertura de $\mathcal{U}$ (basta separar o $G$). Como trocamos "refinamento aberto" por "subcobertura", então existe essa subcobertura finita, e a definição seria equivalente à de espaço compacto.

De fato, todo espaço compacto é paracompacto, pois para toda cobertura há uma subcobertura que é finita, portanto também localmente finita. O contrário que não é sempre verdade. Como exemplo, tome uma cobertura construída de forma semelhante à do parágrafo anterior, em $\Reals^2$: bolas abertas centradas em pontos inteiros, com raio 2, mas em que cada uma dessas bolas é unida à bola de raio 1 centrada na origem. Não existe subcobertura finita para essa cobertura; não só isso, mas não existe sequer subcobertura *localmente finita*, pois um ponto na origem têm interseção com todos os elementos da cobertura. Apesar disso, sabemos que $\Reals^2$ com a topologia usual é paracompacto, e de fato, existe um *refinamento aberto localmente finito* dessa nossa cobertura, pois podemos "separar" a bola da origem das outras bolas no nosso refinamento, coisa que não é possível com uma subcobertura.

***Lema 1.13***
: Suponha que $\mathcal{X}$ é uma coleção localmente finita de um espaço topológico. Então:
   1. A coleção $\\{\bar{X} : X \in \mathcal{X}\\}$ é localmente finita;
   2. $\overline{\bigcup_{X\in\mathcal{X}}X}=\bigcup_{X\in\mathcal{X}}\bar{X}$.

*Prova*
   1. Considere um ponto $p$ qualquer na variedade. Se qualquer vizinhança $V$ de $p$ que intersecta um $\bar{X}$ também intersecta o $X$ correspondente, então o número de interseções com conjuntos $\bar{X}$ é limitado ('por cima') pelo número de interseções com conjuntos $X$. Portanto basta pegar para cada ponto a vizinhança que por hipótese intersecta um número finito desses conjuntos, de forma que o limite impõe que a coleção em questão é localmente finita. Para provar a primeira afirmação, seja $x\in \bar{X}\cap V$. Se $x\in X$, tudo bem, já temos o que queremos. Senão, então $x\in\partial\bar{X}$, e por definição toda vizinhança de $x$ intersecta $X$. Como $V$ também é uma vizinhança de $x$, então $V\cap X \neq \varnothing$. 

   2. Começamos por $E \to D$. Se um $x \in \overline{\bigcup_{X\in\mathcal{X}}X}$ está no interior do fecho, então ele está no interior de algum dos $\bar{X}$. Senão, ele está na borda, e toda vizinhança intersecta ao menos um dos $X$. Agora, como a coleção é localmente finita, existe uma vizinhança $V^\*$ de $x$ tal que a subcoleção $\mathcal{L} = \\{X : X \cap V^\* \neq \varnothing\\}$ é finita, e $x$ estar na borda garante que ela é não-vazia. Queremos mostrar que $x \in \bar{X}$ para algum $X\in \mathcal{L}$. Mas se isso não fosse verdade, então para todo elemento $X$ de $\mathcal{L}$, o fato de que $x$ não está em $\bar{X}$ implica que existe uma vizinhança $V_{X}$ de $x$ tal que $V_X \cap X = \varnothing$, e como $\mathcal{L}$ é uma coleção finita, $\bigcap_{X \in \mathcal{L}} V_X$ seria uma vizinhança de $x$ que não intersecta nenhum $X \in \mathcal{L}$. Mas toda vizinhança $U$ de $x$ ***precisa*** ter interseção com algum conjunto em $\mathcal{L}$, senão $V \cap U \in V$ seria uma vizinhança sem interseção com nenhum dos $X \in \mathcal{X}$. Ou seja, um absurdo!  
   Por outro lado, $D \to E$ é bem mais trivial: se todas as vizinhanças de $x$ intersectam um dos $X$, então as vizinhanças também intersectam a união de todos os $X$.
   
$\Box$

Agora, "o" teorema da seção:

*Teorema 1.15 - Variedades são Paracompactas*
: Toda variedade topológica é paracompacta. E por que não mais? Se $M$ é uma variedade, $\mathcal{X}$ é uma cobertura aberta de $M$, e $\mathcal{B}$ é qualquer base da topologia de $M$, temos que existe um refinamento aberto, localmente finito e contável de $\mathcal{X}$ que consiste de elementos de $\mathcal{B}$!

![Proof]({{ "/assets/svg/var-topologicas-paracompato.svg" | relative_url }})
{: style="float:right; width: 50%; padding-left:20px;"}

*Prova*
: Seja $(K)_{j=1}^{\infty}$ uma exaustão de $M$ por conjuntos compactos, que sabemos existir para a variedade.[^p1] Defina $V_j = K _{j+1} \setminus \text{Int } K _{j}$ e $W_j = K _{j+2} \setminus \text{Int } K _{j-1}$, como desenhei na imagem abaixo. Interprete o conjunto $K_i$ como vazio para índices menores que 1. A ideia da prova é construir uma cobertura de $V_j$ onde cada aberto é um elemento da base $\mathcal{B}$ que está contido em $W_j \cap X$ para algum $X \in \mathcal{X}$. Como $V_j$ é compacto, essa cobertura possui uma subcobertura finita, e construímos o refinamento com essas subcoberturas finitas para todo $j$. Como qualquer ponto $x$ da variedade está em algum $V_j$, contido em $W_j$, e uma vizinhança em $W_j$ só poderia ter interseção com os elementos do refinamento que estão em $W_l$ para $j-2 < l < j+2$, essa cobertura é localmente finita. 


<br style="line-height: 100px;">

 --- 
**Referências:**  
> Marketa, Weakening paracompactness condition, URL (version: 2010-12-09):  
[https://math.stackexchange.com/q/13624](https://math.stackexchange.com/q/13624)

> Lee, John Marshall. Introduction to Smooth Manifolds. 2nd ed., Springer, 2013.

 ---

<br style="line-height: 20px;">



[^d1]: $A$ ser pré-compacto significa que $\bar{A}$ é compacto.


[^l1]: Lema 1.10

[^h1]: O fecho de um aberto U é formado por todos os seus pontos de aderência, ou seja, os pontos para os quais toda vizinhança tem interseção não nula com U. Assim, todos os pontos de U estão, por definição, dentro do fecho.

[^r1]: Se trocamos "localmente finito" por "finito", então temos um refinamento aberto que cobre o espaço e que é finito. Mas então, para cada aberto do refinamento, escolha um aberto da cobertura no qual ele está contido (coisa que podemos por definição). Então esses abertos que escolhemos formam uma subcobertura finita, e o espaço é compacto!

*[exaustão]: Uma exaustão por conjuntos compactos é uma família infinita de conjuntos compactos indexada por números naturais, em que o interior do membro i+1 da família contém o membro anterior, e cuja união é o espaço topológico.

[^p1]: Ainda não tem no site. Preposição A.60 do livro.

<!-- Linkar a primeira menção de um termo em cada página. Fazer isso automaticamente? -->


