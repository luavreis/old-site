```julia
import Test: @test, @testset

include("../lagrangian-mechanics/numerical.jl")
using .Numerical
```

1.4 - Computing Actions

LFreeParticle - see lagrangiantypes.jl
struct LFreeParticle <: Lagrangian
    m::Number
end
function (p::LFreeParticle)((t, x, ẋ))
    1//2 * p.m * (ẋ⋅ẋ)
end

```julia
testpath(t) = [4t + 7, 3t + 5, 2t + 1]
```

Dado um caminho, produz uma função tempo -> tupla local (t, q, q̇).
gamma(w, t) = (t, w(t), w'(t))
Γ = PathFunction(gamma) - see numerical.jl

```julia
Γ[testpath](1)
```

actionf(w, L, t₁, t₂) = ∫(L∘(Γ[w]), t₁, t₂)
action = PathFunction(actionf)
S = action - see numerical.jl

```julia
@show S[testpath](LFreeParticle(3), 0, 10) # Action from t=0 to t=10

η(ν, t₁, t₂) =  t -> (t-t₂) .* (t-t₁) .* ν(t)
ν(t) = (sin(t), cos(t), t^2)
pertubated_action(L, w, t₁, t₂, ν, ϵ) = S[w + ϵ * η(ν,t₁,t₂)](L, t₁, t₂)

@show pertubated_action(LFreeParticle(3), testpath, 0, 10, ν, 0.001)
```

Minimizar a ação, variando o ε

```julia
@show minimize(ε -> pertubated_action(LFreeParticle(3), testpath, 0, 10, ν, ε), -2, 1)
```

Encontrando caminhos que minimizam a ação (interpolação)
using Plots

```julia
sol, itp = findpath(LHarmonicOscillator(1,1), 0., 1., 1.57, 0., 5)
```

plot(t -> itp(t)[1], 0, π/2, label="Approximation")
plot!(t -> cos(t), 0, π/2, label="Theory", show=true)

1.5 - The Euler-Lagrange Equations

```julia
q(t) = [4t + 7, 3t + 5, 2t + 1]
L = LFreeParticle(1)
S₀ = PathFunction(q -> S[q](L,0,10)^2)
S₁ = PathFunction(q -> 3*S[q](L,0,10))
ν(t) = (sin(t), cos(t), cos(2t))
ξ = η(ν, 0, 10)

@testset "Exercise 1.7 (prop. 1.23-1.27)" begin
```

Regra do produto (1.23)

```julia
@test δ(ξ, S₀ * S₁)[q]() ≈ (δ(ξ, S₀)[q]()*S₁[q] + S₀[q]()*δ(ξ, S₁)[q])()
```

Regra da soma (1.24)

```julia
@test δ(ξ, S₀ + S₁)[q]() ≈ (δ(ξ, S₀)[q] + δ(ξ, S₁)[q])()
```

Mult. por escalar (1.25)

```julia
@test δ(ξ, 3 * S₀)[q]() ≈ 3*δ(ξ, S₀)[q]()
```

(1.26)

```julia
h = L∘Γ
@test δ(ξ, h)[q](1) ≈ (D(L)∘Γ[q] * δ(ξ, Γ)[q])(1)
```

(1.27)

```julia
@test D(δ(ξ, Γ))[q](1) ≈ δ(ξ, D(Γ))[q](1)
end
```

Exercício 1.8
δ(η, f::PathFunction) = PathFunction((q, x...) -> D(ε -> f[q + ε*η](x...))(0))

Extra fun

```julia
@show δ(ξ, S)[testpath](LFreeParticle(3), 0, 10)

ξ = η(ν, 0, 1.57)
@show δ(ξ, S)[itp](LHarmonicOscillator(1,1), 0, 1.57)
@show δ(ξ, S)[t -> [cos(t)]](LHarmonicOscillator(1,1), 0, 1.57)
```

---

*This page was generated using [Literate.jl](https://github.com/fredrikekre/Literate.jl).*

