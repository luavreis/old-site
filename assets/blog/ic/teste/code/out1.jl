# This file was generated, do not modify it. # hide
using Catlab.WiringDiagrams, Catlab.Graphics
import Convex, SCS
using Catlab.Theories
using Compose

A, B = Ob(FreeBicategoryRelations, :A, :B)
f = Hom(:f, A, B)

pic = to_composejl((dunit(A) ⊗ id(B)) ⋅ (id(A) ⊗ f ⊗ id(B)) ⋅ (id(A) ⊗ dcounit(B)))
draw(SVG(joinpath(@OUTPUT, "out.svg"), pic.width, pic.height), pic.context)