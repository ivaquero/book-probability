#import "lib/lib.typ": *
#show: chapter-style.with(title: "连续随机分布", info: info)

= 连续随机变量
<连续随机变量>

#definition[
  若随机变量的累积分布函数（CDF）是可微分的，则其分布是连续的。
]

#definition[
  对于具有 CDF $F$的连续随机变量$X$，其的概率密度函数（PDF）是 CDF 的导数$f$，即$f(x) = F^′(x)$。
]

#theorem[
  设$X$是连续随机变量，其 PDF 为$f$，则其 CDF 为
  $ F(x) = ∫_(-∞)^x f(t) dd(t) $
]

#figure(
  image("images/distrs/distr_norm_pdf_cdf.png", width: 60%),
  caption: "PDF-CDF",
)

#theorem[
  连续随机变量的 PDF $f$必须满足以下两个标准：

  + 非负：$f(x) ≥ 0$
  + 积分为$1$：$∫_(-∞)^(∞) f(x) = 1$
]

#definition[
  连续可变变量$X$的期望，其 PDF 为
  $ 𝔼[X] = ∫_(-∞)^(∞) x f(x) dd(x) $
]

#definition[
  若$X$是 PDF 为$f$的连续随机变量，$g$是一个$ℝ → ℝ$的函数，则

  $ 𝔼[g(X)] = ∫_(-∞)^(∞) g(x) f(x) dd(x) $
]

= 均匀分布
<均匀分布>

#definition[
  若连续随机变量$U$的 PDF 满足

  $ f(x)= cases(frac(1, b-a) & "if" a < x < b, 0 & "otherwise") $

  则称其在区间$(a, b)$上具有均匀分布。记作$U ∼ "Unif"(a, b)$。
]

#sgrid(
  figure(image("images/distrs/distr_unif_pdf.png", width: 90%), caption: "PDF"),
  figure(image("images/distrs/distr_unif_cdf.png", width: 90%), caption: "CDF"),
  columns: (200pt,) * 2,
  gutter: 2pt,
  caption: "均匀分布",
)

#definition[
  均匀分布还有离散型，令$C$是一个有限的非空数集。从这些数中均匀随机地选择一个，称为$X$。用$X ∼ "dUnif"$ 表示。则 PMF 为

  $ P(X=x) = cases(frac(1, |C|) quad & ∀x ∈ C, 0 quad & ∀x ∉ C) $
]

#theorem[
  设$U ∼ "Unif"(a，b)$，设$(c, d)$是$(a, b)$的一个子区间。则给定$U ∈ (c, d)$的$U$的条件分布是$"Unif"(c, d)$。
]

#definition[
  设$X$是随机变量，$Y = σ X + μ$，其中$σ$和$μ$是常数，且 σ > 0。则我们可以说，$Y$是$X$通过位置-标度变换（location-scale transformation）得到的。这里，$μ$和$σ$分别控制位置和标度的变化方式。
]

== 普遍性

#theorem[
  设$F$是一个 CDF，它是一个连续函数，并且在分布的支撑集上严格递增。这确保了反函数$F^(-1)$作为$(0, 1) → ℝ$的函数存在。
]

#corollary[
  设$U ∼ "Unif"(0, 1)$，$X = F^(-1)(U)$，则$X$是一个具有 CDF $F$的随机变量。
]

若从$U ∼ "Unif"(0, 1)$和 CDF $F$开始，则可以通过将$U$插入$F^(-1)$来创建一个 CDF 为$F$的随机变量。由

- $F^(-1)$是一个函数（称为分位数函数）
- $U$是一个随机变量

而一个随机变量的函数是一个随机变量，所以$F^(-1)(U)$是一个随机变量；Uniform 的普遍性说明其 CDF 是$F$。

#corollary[
  设$X$是一个具有 CDF $F$的随机变量，则$F(X) ∼ "Unif"(0, 1)$
]

从一个 CDF 为$F$的随机变量$X$开始，创建一个 服从$"Unif"(0, 1)$随机变量，同样，$F$是一个函数，$X$是一个随机变量，因此$F(X)$是一个随机变量。由于任何 CDF 在任何地方都介于 0 和 1 之间，因此$F(X)$的值必介于 0 和 1 之间。

== 生存函数

#definition[
  具有 CDF $F$的随机变量$X$的生存函数是函数$G$，其值为
  $ G(x) = 1 - F (x) = P (X > x) $
  即 CDF 上面的部分。
]

#theorem[
  设$X$是一个非负的随机变量，通过对其生存函数进行积分，可以求出其期望值：

  $ 𝔼[X] = ∫_0^(∞) P(X > x) dd(x) $
]

= 正态分布
<正态分布>

== 标准正态分布

#definition[
  若连续随机变量$Z$的 PDF $φ$由以下公式给出，则称其为标准正态分布，又称 Z 分布，即
  $ φ(z) = frac(1, sqrt(2π)) e^(-z^2 / 2), quad -∞ < z < ∞ $
  记作$Z ∼ 𝒩(0, 1)$，因为我们已知$Z$均值为$0$，标准差为$1$。
]

标准正态分布的 CDF 为其 PDF 积分下的面积，即

$ Φ(z) = ∫_(-∞)^z φ(t) dd(t) = ∫_(-∞)^z frac(1, sqrt(2π)) e^(-t^2 / 2) dd(t) $

标准正态分布有很多重要性质

- PDF 对称：$φ(z) = φ(-z)$
- CDF 尾对称：$Φ(z) = 1 - Φ(-z)$
- $Z$和$Z$对称：$P(-Z ≤ z) = P(Z ≥ -z) = 1 - Φ(-z)$

由 CDF，取平方

$
  (∫_(-∞)^(∞) e^(-z^2 / 2) dd(z))(∫_(-∞)^(∞) e^(-z^2 / 2) dd(z))
  &= (∫_(-∞)^(∞) e^(-x^2 / 2) dd(x))(∫_(-∞)^(∞) e^(-y^2 / 2) dd(y)) \
  &= ∫_(-∞)^(∞) ∫_(-∞)^(∞) e^(-frac(x^2 + y^2, 2)) dd(x, y) \
  &= ∫_0^(2π) ∫_0^(∞) e^(-r^2 / 2) r dd(r, θ) \
  &= ∫_0^(2π)(∫_0^(∞) e^(-u) dd(u)) dd(θ) = 2π
$

由此，$∫_(-∞)^(∞) e^(-z^2 / 2) dd(z) = sqrt(2π)$，即$frac(1, sqrt(2π))$是归一化因子。

== 正态分布

#definition[
  若$Z ∼ 𝒩(0, 1)$，则$X = μ + σ Z$服从均值为$μ$，标准差为$σ$正态分布。记作$X ∼ 𝒩(μ, σ)$
]

#definition[
  令$X ∼ 𝒩(μ, σ)$，则$X$的 CDF 为
  $ F(x) = Φ(frac(x - μ, σ)) $
  PDF 为
  $ f(x) = φ(frac(x - μ, σ)) frac(1, σ) $
]

#sgrid(
  figure(
    image("images/distrs/distr_normal_pdf.png", width: 90%),
    caption: "PDF",
  ),
  figure(
    image("images/distrs/distr_normal_cdf.png", width: 90%),
    caption: "CDF",
  ),
  columns: (200pt,) * 2,
  gutter: 2pt,
  caption: "正态分布",
)

#theorem(title: "68-95-99.7% 法则")[
  若$X ∼ 𝒩(μ, σ)$，则

  $
    P(|X - μ| < 1σ) & = 2⋅Φ(-1) ≈ 0.68 \
    P(|X - μ| < 2σ) & = 2⋅Φ(-2) ≈ 0.95 \
    P(|X - μ| < 3σ) & = 2⋅Φ(-3) ≈ 0.997
  $
]

#figure(
  image("images/distrs/distr_norm_3sigma.png", width: 40%),
  caption: "68-95-99.7% 法则",
)

== 计算性质

#theorem[
  设$X_1 ∼ 𝒩(μ_1, σ_1^2), X_2 ∼ 𝒩(μ_2, σ_2^2)$，且$X_1$和$X_2$相互独立，则
  $ X_1 + X_2 ∼ 𝒩(μ_1 + μ_2, σ_1^2 + σ_2^2) $
]

#theorem[
  设$X_1 ∼ 𝒩(μ_1, σ_1^2), X_2 ∼ 𝒩(μ_2, σ_2^2)$，且$X_1$和$X_2$相互独立，则
  $
    X_1 X_2 ∼ 𝒩(frac(σ_1^2 μ_2 + σ_2^1 μ_1, σ_1^2 + σ_2^2), frac(σ_1^2 σ_2^2, σ_1^2 + σ_2^2))
  $
]

= 指数分布
<指数分布>

#definition[
  若连续随机变量$X$具有参数$λ$的指数分布（其中$λ > 0$），其 PDF 为
  $ f(x) = λ e^(-λ x), quad x > 0 $
  记作$X ∼ "Expo"(λ)$。对应的 CDF 为

  $ F(x) = 1 - e^(-λ x), quad x > 0 $
]

#sgrid(
  figure(image("images/distrs/distr_expo_pdf.png", width: 90%), caption: "PDF"),
  figure(image("images/distrs/distr_expo_cdf.png", width: 90%), caption: "CDF"),
  columns: (200pt,) * 2,
  gutter: 2pt,
  caption: "指数分布",
)

#theorem[
  若连续分布的随机变量$X$满足以下条件，则称该分布具有无记忆特性
  $ P(X ≥ s + t|X ≥ s) = P(X ≥ t), quad ∀s, t ≥ 0 $
]

#theorem[
  若$X$是一个具有无记忆特性的正连续随机变量，则$X$服从指数分布。
]
