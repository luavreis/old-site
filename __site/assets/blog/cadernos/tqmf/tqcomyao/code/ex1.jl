# This file was generated, do not modify it. # hide
using LinearAlgebra

# Vamos definir a base computacional como |0⟩ = [1,0] e |1⟩ = [0,1]
base0 = [1,0]
base1 = [0,1]
estado = normalize(base0 + base1)
@show estado

prob0 = norm(dot(base0', estado))^2
@show prob0