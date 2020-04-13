@def hascode=true
@def mintoclevel=2

# Um pouco de teoria quântica, parte 1

\toc

## Tempos difíceis.

Muitas coisas acontecendo pelo mundo. Algumas delas particularmente assustadoras. Sobre isso, por ora apenas peço que fique em casa o máximo possível, ajude seus conhecidos mais velhos, lembre dos idosos e das pessoas em risco, e não saia de casa se não for necessário. Eu repeti alguma coisa?

Pois bem, nesse semestre me matriculei em uma disciplina um pouco estranha. O nome dela é [Teoria Quântica para Matemátic@s em Formação](https://www.ime.unicamp.br/~tcunha/Teach/TopQuant-1S20.html), ministrada pelo Marcelo Terra Cunha. Tivemos apenas três aulas, uma das quais não pude ir e outra que o professor não pôde ir. Agora, as aulas estão suspensas. Mas com essa uma aula, e o que tivemos até agora de EAD, ainda tenho um pouco sobre o que escrever.

A disciplina é até então exclusiva desse semestre e serviria como motivação para o Marcelo escrever um livro sobre o assunto, com o mesmo nome. Nesse sentido, ele já foi um dos autores de um outro livro com nome tão parecido que até agora não entendi muito bem qual vai ser a diferença entre os dois. Segundo o Marcelo, eles são "parecidos em espírito". Segundo o índice e a ementa da disciplina, o novo é uma reestruturação do anterior com coisas novas, mas sem o "prelúdio" que tinha alguns pré-requisitos e que achei muito bom. Enfim, o livro pai se chama \cite{mqmf}, e talvez você queira voltar ao parágrafo anterior para encontrar a diferença dos nomes (além do @ bem colocado).

Vou precisar que você saiba um pouco de álgebra linear e números complexos no que se segue. No "Mecânica [...] em Formação" tem um "prelúdio" bom sobre isso, e você acha muitas coisas na internet.

## O que é mesmo um qubit?

É um pouco didático começar com o que se tem de mais simples na teoria quântica. Talvez você já tenha se deparado com alguém por aí apontando para uma esfera e chamando ela de um qubit:

![](/assets/svg/qubit.svg)

Mas como assim, o qubit é uma esfera? E ele é _a_ esfera ou algo _na_ esfera? E como assim uma "média" daqueles dois vetores deu um vetor perpendicular e... porque esse $\sqrt{2}$? Além desses $|0\rang$, $|1\rang$ estranhos.

Bom, primeiramente um qubit _não é_ uma esfera, pelo menos no sentido físico. A priori, ele é um objeto matemático da teoria quântica, e existem alguns objetos físicos (que não são esféricos) que se comportam como qubits. Também gostaria de avisá-lo que a grande maioria dos textos que tentam explicar o que é, como funciona, o que se pode fazer com um qubit sem tocar na matemática criam analogias bonitinhas mas muito erradas. Às vezes extremamente erradas. Mas vamos prosseguir pela matemática.

## Um pouco de teoria

Um _espaço de estados_ de um sistema quântico é um espaço vetorial complexo com produto interno. Um _teste com alternativas clássicas_ desse sistema é associado a uma base ortonormal desse espaço. Um _estado_ desse sistema é um vetor normalizado do espaço de estados, ou seja, com norma 1.
\newcommand{\ket}[1]{| #1 ⟩}
\newcommand{\bra}[1]{⟨ #1 |}
\newcommand{\z}{| 0 ⟩}
\newcommand{\u}{| 1 ⟩}
\newcommand{\braket}[2]{\langle #1 | #2 ⟩}
\newcommand{\proj}[2]{\text{proj}_{\ket{#1}} \ket{#2}}

Assim, seguindo essa definição, temos espaço de estados $\Bbb{E}≅\Complex^n$ para algum $n≥1$, e escrevemos $\ket{\,\cdot\,}$ para denotar os elementos do espaço vetorial (os estados), e seguindo a convenção do Marcelo, também chamados de _crianças_, onde o "$\,\cdot\,$" é o _nome da nossa criança_. Dados estados $\ket{a}$ e $\ket{b}$, escrevemos o produto interno entre eles como $\braket{a}{b}$. 

Já que temos um produto interno, podemos identificar cada estado de $\Bbb{E}$ com um funcional linear de $\Bbb{E}$, ou seja, uma função linear com tipo $\Bbb{E}\to\Complex$. Fazemos isso definindo um funcional $L_{v_0} : \Bbb{E}\to\Complex$ dado por $\ket{v}\mapsto \braket{v_0}{v}$. Na notação de Dirac (essa que estamos usando) escrevemos esse funcional como $\bra{v_0}$, de forma que fica sugestiva sua aplicação a uma criança $\ket{v}$ dada pelo produto interno $\braket{v_0}{v}$.

Vamos ver como isso fica no caso de um qubit, usando o produto interno usual.

Como o teste clássico mais simples distingue entre duas possibilidades (senão seria um teste trivial), nossa base ortonormal precisa de dois elementos, e podemos usar um espaço de estados $\Bbb{E}≅\Complex^2$. Vamos definir $\{\z,\u\}$ como uma base do nosso espaço, e essas duas crianças compõem o que chamaremos de base computacional. Não estranhe muito o fato de não estarmos utilizando uma notação vetorial, $\{\z,\u\}$ é como $\{e_1,e_2\}$, a notação de base que estamos acostumados, e lembre que os números dentro dos símbolos são apenas nomes.

Agora colocamos como postulado que a probabilidade de um teste ter uma de suas alternativas clássicas como resultado pode ser obtido decompondo o estado do sistema nessa base e calculando o quadrado da norma da componente que corresponde a essa alternativa. Por exemplo, tome nossa base computacional $\{\z,\u\}$, e um vetor de estado $\ket{v}\in\Bbb{E}$. Sabemos que $\proj{0}{v} = \braket{0}{v}$ e $\proj{1}{v} = \braket{1}{v}$, e como a base é ortonormal, $\ket{v} = \braket{0}{v}\ket{0} + \braket{1}{v}\ket{1}$. Se queremos saber a probabilidade de um teste com a base computacional resultar em $\z$ para o estado $\ket{v}$, calculamos $|\braket{0}{v}|^2$.

## Rumo à esfera

Agora que temos a teoria, vamos olhar para a geometria do nosso espaço de eventos e tentar descobrir em que ela tem a ver com a consagrada esfera. Primeiro, perceba que $\Complex^2$ é um espaço de dimensão real 4. Mas estamos interessados somente nos elementos com norma 1, que formam uma "esfera complexa", homeomorfa a $\Bbb{S}^3$, a esfera (tridimensional) de $\R^4$. Vamos construir essa paramatrização dessa esfera. Primeiro, note que o nosso espaço de estados é basicamente um produto de dois planos complexos:

~~~ <img src="/assets/svg/c2space.svg" alt style="width:90%; padding-left:5%"> ~~~

Qualquer número complexo pode ser escrito como $z=re^{i\theta}$ para $r$ e $\theta$ reais. Então vamos escolher um número complexo em cada plano, cada um multiplicando um elemento da base, e assim definindo um único ponto no espaço de estados. Sejam eles $r_0e^{i\phi}\z$ e $r_1e^{i\theta}\u$. O ponto que obtemos é então $\ket{v}=r_0e^{i\phi}\z+r_1e^{i\theta}\u$. Mas para ser um estado de verdade, ele precisa ter norma 1! Vamos fazer isso, calculando $\braket{v}{v}$ e obrigando que o resultado seja 1:

$$
\braket{v}{v} = \left[r_0e^{-iφ}\bra{0} + r_1e^{-iθ}\bra{1}\right]\cdot\left[r_0e^{iφ}\z + r_1e^{iθ}\u\right] = 1\\\,\\
\braket{v}{v} = r_0e^{-iφ}r_0e^{iφ} + r_1e^{-iθ}r_1e^{iθ} = r_0^2+r_1^2 = 1
$$

Na última passagem usamos $\braket{0}{1}=\braket{1}{0}=0\;$ e $\;\braket{0}{0}=\braket{1}{1}=1$. A última relação é conhecida, e como $r_0$ e $r_1$ são reais, podemos parametrizá-los escolhendo um ângulo $\phi$ e colocando $r_0=\cos\phi$ e $r_1=\sin\phi$. Temos então uma parametrização para nossas crianças:

$$ ψ(φ,ϕ,θ) = (e^{iφ}\sinϕ)\z + (e^{iθ}\cosϕ)\u $$

Todas as crianças dessa forma são válidas como estados, mas será que são todas
mesmo diferentes? Afinal, os estados dados por essa parametrização ainda estão
numa esfera de $\R^4$, e o que todos os textos na internet prometeram é uma
esfera como a da primeira figura, mais conhecida.

A verdade é que, de certo modo, a esfera de $\R^4$ pode ser identificada com uma
esfera em $\R^3$ em que colamos um círculo em cada ponto. "de certo modo" pois
ainda assim, $\Bbb{S}^3\neq\Bbb{S}^1\times\Bbb{S}^2$. Mas como? Vamos escrever
a parametrização anterior assim:

$$ ψ(φ,ϕ,δ) = e^{iφ}\left[\sinϕ\z + e^{iδ}\cosϕ\u \right] $$

Perceba que foi feita a troca $\delta=\theta-\varphi$. Predigo: o $φ$ não serve
pra nada. Por que? Vamos calcular a decomposição de $\ket{v}=ψ(ϕ,φ,δ)$ em uma base
ortonormal qualquer $\{\ket{a},\ket{b}\}$. Afinal, a decomposição é a palavra
final da teoria: a medição, a única coisa que observamos no fim das contas.
Mas veja que com isso, o que foi insinuado no último parágrafo faz algum sentido,
pois "retiramos um círculo", que é o termo $e^{iφ}$, da expressão para nossos
estados. Bastaria verificar se o que sobra pode ser entendido de alguma forma
como a esfera que estamos habituados.

Bom, sabemos que $\ket{a} = ψ(ϕ_a,φ_a,δ_a)$ para alguma combinação de parâmetros.
Só precisamos calcular a probabilidade do resultado $a$, dada por $P_a=|\braket{a}{v}|^2$,
já que do fato da base ser ortonormal temos $P_b=1-P_a$. Podemos chamar a parte
da parametrização dentro dos colchetes de $ψ^⋆_a$ para $\ket{a}$, e
de $ψ^⋆_v$ para $\ket{v}$. Lembre que essas partes não dependem de $φ$. Assim:

\begin{align}
|\braket{a}{v}| &= |⟨e^{iφ_a}ψ^⋆_a|e^{iφ}ψ^⋆_v⟩| = |e^{i(φ-φ_a)}⟨ψ^⋆_a|ψ^⋆_v⟩| \\\\
 &= |e^{i(φ-φ_a)}|⋅|⟨ψ^⋆_a|ψ^⋆_v⟩| = 1⋅|⟨ψ^⋆_a|ψ^⋆_v⟩|
\end{align}

Ou seja, os resultados dos testes só dependem dos parâmetros $ϕ$ e $δ$, e podemos
escrever qualquer estado como:

$$ ψ^⋆(ϕ,δ) = \sinϕ\z + e^{iδ}\cosϕ\u $$

Com duas dimensões, estamos bem mais pertos da esfera! Perceba que não faz diferença
se restringirmos $ϕ∈[0,π/2]$ e $δ∈[0,2π)$. Mas com isso já podemos representar
nossos estados em $\Bbb{S}^2$, em que $∠2ϕ$ é o ângulo a partir do polo norte
e $∠δ$ é a longitude. Essa representação é chamada de Esfera de Bloch:

\figenv{Esfera de Bloch}{/assets/svg/qubit2.svg}{width:40%;padding-right:5%;}

E presumivelmente é ela que aparece internet afora dando caras ao qubit. E
para o leitor, talvez agora com um pouco mais sentido.

A "redução" que fizemos da esfera $\Bbb{S}^3$ para a $\Bbb{S}^2$, "retirando"
uma circunferência de cada ponto, tem um nome matemático: se chama \cite{hopf}.
Com ela, conseguimos demonstrar que a esfera em $\R^4$ localmente se parece
com um espaço produto de uma circunferência e uma esfera em $\R^3$, gerando o
que é chamado de _\cite{fiber}_. Sim, e você também pode [brincar com ela](https://philogb.github.io/page/hopf/#) na internet. Afinal somos todos crianças em algum espaço de estados.


## Referências
* \biblabel{mqmf}{Mecânica Quântica para Matemáticos em Formação} **Bárbara Amaral, Alexandre Tavares Baraviera e Marcelo O. Terra Cunha**, [Mecânica Quântica para Matemáticos em Formação](https://impa.br/wp-content/uploads/2017/04/28CBM_12.pdf), Impa 2011.
* \biblabel{fiber}{maço de fibras} **Wikipedia**, [Fiber Bundle](https://en.wikipedia.org/wiki/Fiber_bundle).
* \biblabel{hopf}{Fibração de Hopf} **Wikipedia**, [Fibração de Hopf](https://pt.wikipedia.org/wiki/Fibra%C3%A7%C3%A3o_de_Hopf).
* \biblabel{hopf}{Fibração de Hopf} **@philogb**, [HOPF FIBRATIONS](https://philogb.github.io/page/hopf/#).

~~~
<p style="margin-top:8em"></p>
<hr>
<script src="https://utteranc.es/client.js"
        repo="lucasvreis/lucasvreis.github.io"
        issue-term="title"
        label="comments"
        theme="github-light"
        crossorigin="anonymous"
        async>
</script>
~~~

