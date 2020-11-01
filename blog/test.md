---
author:
- 'Lucas Viana Reis - 240191'
title: Qdit
---

Exercício 20. *Projetores ortogonais e notação de Dirac*

1.  Seja $| ϕ \rangle$ um vetor normalizado. O que faz o operador
    $| ϕ \rangle\langle ϕ |$?

2.  Seja $\{| v_i \rangle\}_{i=1}^d$ uma base ortonormal. Defina
    $P_i = | v_i \rangle\langle v_i |$. Mostre que
    $P_i P_j = δ_{ij} P_j$.

3.  Para $J ⊂ \{1,\dots, d\}$ defina $P_J = ∑_{i∈J}P_i$. Mostre que
    $P_J P_K = P_{J∩K}$. Em particular, $P_J^2 = P_J$.

4.  Qual a forma diagonal de $P_J$? Interprete $\text{Tr}P_J$ , o traço
    de $P_J$.

*Solução.*

1\. Como $| ϕ \rangle$ tem norma 1, para um $| ψ \rangle$ qualquer,
$$\begin{aligned}
        (| ϕ \rangle\langle ϕ |)| ψ \rangle&= \langle ϕ \,|\, ψ \rangle| ϕ \rangle\\
        &= {\langle ϕ \,|\, ψ \rangle\over \langle ϕ \,|\, ϕ \rangle}| ϕ \rangle\\
        &= \text{proj}_{| ϕ \rangle}| ψ \rangle
    \end{aligned}$$

2\. Suponha $i≠j$. Então 
$$\begin{aligned}
        P_iP_j &=| v_i \rangle\langle v_i |(| v_j \rangle\langle v_j |)\\
        &= | v_i \rangle\langle v_i \,|\, v_j \rangle\langle v_j |\\
        &= 0
    \end{aligned}$$
pois $\langle v_i \,|\, v_j \rangle= 0$. Já se
$i=j$,
$$\begin{aligned}
        P_iP_j &=| v_i \rangle\langle v_i \,|\, v_j \rangle\langle v_j |\\
        &= | v_i \rangle\langle v_j |\text{ (pois $\langle v_i \,|\, v_j \rangle= 1$)}\\
        &= | v_j \rangle\langle v_j | = P_j
    \end{aligned}$$

3\. 
$$\begin{aligned}
        P_JP_K &= (∑_{j∈J}P_j)(∑_{k∈K}P_k)\\
        &= ∑_{j∈J}∑_{k∈K}P_jP_k\\
        &= ∑_{j∈J}∑_{k∈K}δ_{jk}P_k\\
        &= ∑_{i∈J∩K}P_i = P_{J∩K}
    \end{aligned}$$
e por isso: 
$$\begin{aligned}
        P_J^2 = P_{J∩J} = P_J
    \end{aligned}$$

4\. Para todo elemento da base $\{| v_i \rangle\}_{i=1}^d$,
$$\begin{aligned}
        P_J| v_i \rangle &= (∑_{j∈J}| v_j \rangle\langle v_j |)| v_i \rangle\\
        &= ∑_{j∈J}| v_j \rangle\langle v_j \,|\, v_i \rangle\\
        &= ∑_{j∈J}δ_{ij}| v_i \rangle\\
        &= \begin{cases} | v_i \rangle &\text{se $i∈J$} \\ 
            0 &\text{caso contrário} \end{cases}
    \end{aligned}$$ 
isso significa que todos os elementos da base são
autovetores com autovalor $\mathbb{1}_J(i)$. Assim, nessa base, a forma
diagonal de $P_J$ é dada por $(P_J)_{ii}=\mathbb{1}_J(i)$. Portanto,
$\text{tr}(P_J)=∑_{i=1}^d \mathbb{1}_J(i) = \#J$, que é a dimensão da
imagem da projeção $P_J$.
