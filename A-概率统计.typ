#import "lib/lib.typ": *
#show: appendix-style.with(
  title: "概率统计",
  info: info,
)

= 统计测度
<统计测度>

== 期望与方差
<期望与方差>

#figure(
  table(
    columns: 3,
    align: center + horizon,
    inset: 0.6em,
    stroke: table-three-line(rgb("000")),
    table.header([分布], [$𝔼[X]$], [$D(X)$]),
    [$"Bern"(p)$], [$p$], [$p(1 - p)$],
    [$"Bin"(n, p)$], [$n p$], [$n p(1 - p)$],
    [$"Pois"(λ)$], [$λ$], [$λ$],
    [$"Expo"(λ)$], [$1 / λ$], [$1 / λ^2$],
    [$𝒩(μ, σ)$], [$μ$], [$σ^2$],
    [$𝒩(0, 1)$], [$0$], [$1$],
    [$"Beta"(α, β)$], [$frac(α, α + β)$], [$frac(α β, (α + β)^2 (α + β + 1))$],
    [$"Gamma"(α, β)$], [$α / β$], [$α / β^2$],
    [$chi^2$], [$n$], [$2 n$],
    [$"Unif"(a, b)$], [$frac(a + b, 2)$], [$(a + b)^2 / 12$],
    [$ln(a, b)$], [$frac(b - a, ln b - ln a)$], [],
  ),
  caption: "期望与方差",
  kind: table,
)

== 特征函数
<特征函数>

$
  ϕ_X (t) &= 𝔼[e^(i t x)] = sum_(k=1)^n 𝔼[frac((i t)^k x^k, j!)]\
  &= 1 + frac(i t 𝔼[x], 1) - frac(t^2 𝔼[x^2], 2!) + ⋯ + frac((i t)^n 𝔼[x^n], n!)
$

由上式，通过比较特征函数中的矩，即可确定概率分布是否相同。
