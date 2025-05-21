#import "lib/lib.typ": *
#show: chapter-style.with(
  title: "分布变换",
  info: info,
)

= 变量的变化
<变量的变化>

#definition[
  设$X$是连续随机变量，其 PDF 为$f_X$；设$Y = g(X)$，其中，$g$是可微且严格递增（或严格递减）的。则$Y$的 PDF 为
  $ f_Y (y) = f_X (x) |dv(x, y)| $
  其中，$x = g^(−1)(y)$。
]

#definition[
  设$𝑿 = X_1, …, X_n$是一个连续随机向量，其联合 PDF 为 $f_𝑿$。令$g: A_0 → B_0$是一个可逆函数，其中，$A_0$和$B_0$是$ℝ^n$的开子集，$A_0$包含$𝑿$的支撑集$B_0$是$g$的范围。令$𝒀 = g(𝑿)$，继而令$𝒚 = g(𝒙)$，因此也有$𝑿 = g^(-1)(𝒀)$和$𝒙 = g^(-1)(𝒚)$。

  假设所有偏导数$pdv(x_i, y_j)$都存在且连续，则可以组成 Jacobian 矩阵，同时假设该矩阵的行列式永不为$0$，则$Y$的联合 PDF 为
  $ f_𝒀 (𝒚) = f_𝑿 (g^(-1)(𝒚))⋅∣ |pdv(𝒙, 𝒚)| ∣ "for" 𝒚 ∈ B_0 and "else" 0 $

]

= 卷积
<卷积>

卷积是独立随机变量之和。

#theorem[
  设$X$和$Y$是独立的随机变量，$T = X + Y$是它们的和。若$X$和$Y$是离散的，则$T$的 PMF 为
  $
    P(T = t) &= sum_x P(Y = t - x) P(X=x)\
    &= sum_y P(X = t - y) P(Y=y)
  $

  若$X$和$Y$是离散的，则$T$的 PDF 为

  $
    f_T (t) &= ∫_(-∞)^(∞) f_Y (t - x) f_X (x) dd(x)\
    &= ∫_(-∞)^(∞) f_X (t - y) f_Y (y) dd(y)
  $
]

== 连续分布

- 指数分布

令$X, Y limits(∼)^("i.i.d.") "Expo"(λ)$，则对$T = X + Y$有

$
  f_T (t)
  = ∫_(-∞)^(∞) f_Y (t - x) f_X (x) dd(x)
  = λ^2 ∫_0^t e^(-λ t) dd(x) = λ^2 t e^(-λ t), "for" t > 0
$

这实际上是 Gamma 分布$"Gamma"(2, λ)$。

- 均匀分布

令$X, Y limits(∼)^("i.i.d.") "Unif"(0, 1)$，则对$T = X + Y$有

$
  f_T (t)
  &= ∫_(-∞)^(∞) f_Y (t - x) f_X (x) dd(x)
  = cases(
    delim: "{",
    ∫_0^t dd(x) = t & "for" 0 < t ≤ 1,
    ∫_(t - 1)^1 dd(x) = 2 - t & "for" 1 < t < 2
  )
$

这实际上是三角分布$"Triangle(0, 1, 2)"$。从启发式的角度来看，$T$更有可能取中间值而非极端值：

- 若$X$和$Y$都适中，或者$X$大而$Y$小，或者$Y$大而$X$小，都可以得到接近$1$的值
- 相反，只有当$X$和$Y$都很大时，才可能得到接近$2$的值

两次掷骰子之和的 PMF 也是三角分布。单个掷骰子的分布是离散均匀分布。在这里得到的 PDF 在形状上类似也是有道理的。

#figure(
  image("images/trials/sum-conv-unif.png", width: 40%),
  caption: "均匀分布的卷积",
)

#figure(
  table(
    columns: 2,
    align: center + horizon,
    inset: 5.5pt,
    stroke: table-three-line(rgb("000")),
    [$X_i$], [$sum X_i$],
    [$"Bin"(n_i, p)$], [$"Bin"(sum n_i, p)$],
    [$𝒩(μ_i, σ_i^2)$], [$𝒩(sum μ_i, sum σ_i^2)$],
    [$chi^2(i)$], [$chi^2 (sum i)$],
  ),
  caption: "常见分布卷积和",
  kind: table,
)

= Beta 分布
<Beta-分布>

Beta 分布是一个取值$[0, 1]$的概率分布，是标准均匀分布$"Unif(0, 1)"$的泛化，允许分布在$[0, 1]$非恒定。

#definition[
  若随机变量$X$服从参数为$(a, b)$的 Beta 分布，记作$X ∼ "Beta"(a, b)$，则其 PDF 为
  $ f(x) = frac(1, β(a, b)) x^(a - 1)(1 - x)^(b - 1) $

  其中，$a > 0, b > 0$，$β(a, b)$为 Beta 积分，是归一化因子，在下面的小节有介绍。
]

Beta 分布 PDF 关于参数$(a, b)$有如下性质：

- $a < 1, b < 1$时，呈 U 型开口向上
- $a > 1, b > 1$时，呈 U 型开口向下
- $a = b = 1$时，同标准均匀分布 PDF
- $a = b$时，关于$1 / 2$对称，$a < b$，偏左，$a > b$，偏右

#sgrid(
  figure(
    image("images/distrs/distr_beta_pdf.png", width: 90%),
    caption: "Beta 分布 PDF",
  ),
  figure(
    image("images/distrs/distr_beta_cdf.png", width: 90%),
    caption: "Beta 分布 CDF",
  ),
  columns: (200pt,) * 2,
  gutter: 2pt,
  caption: "Beta 分布",
)

== 与二项分布

#theorem(title: "Beta-二项共轭")[
  若先验分布服从 Beta 分布，即$p ∼ "Beta"(a, b)$，且数据条件服从二项分布，即$X|p ∼ "Bin"(n, p)$，则后验仍服从 Beta 分布
  $ p|X = k ∼ "Beta"(a + k, b + n - k) $
  此时，称 Beta 分布是二项分布的共轭先验。$X$的边际分布称 Beta-二项分布。
]

Beta-二项分布是一个离散分布，一般用于描述当每次试验的成功概率$p$是未知时，$n$次 Bernoulli 试验的成功次数$y$，并设服从参数$a$和$b$的 Beta 分布。即为了找到结果$y$的概率，对$p$的所有可能的（和连续的）值进行平均。

$
  "Beta-Bin"(y|n, a, b) = ∫_0^1 "Bin"(y|p, n) "Beta"(p|a, b) dd(p), med med ∀x ∈ ℕ
$

即

$
  P(X = k) &= frac(1, β(a, b)) ∫_0^1 binom(n, k) p^k(1 - p)^(n - k) ⋅ p^(a - 1)(1 - p)^(b - 1) dd(p)\
  &= frac(binom(n, k), β(a, b)) ∫_0^1 p^(a + k - 1)(1 - p)^(b + n - k - 1) d p\
  &= vec(n, k) frac(β(a + k, b + n - k), β(a, b))
$

由上，Beta-二项分布可被认为是一个连续的混合模型，可被直接使用，也可被拆分使用。

= Gamma 分布
<Gamma-分布>

Gamma 分布是正实数域的连续分布，是指数分布的泛化。指数分布表示无记忆条件下第一次成功的等待时间，而 Gamma 分布则表示多次成功的总等待时间。

== Gamma 函数

在给出 Gamma 分布的 PDF 前，我们首先介绍非常著名 Gamma 函数，它将阶乘扩展到非负整数领域之外。其表达式为

$ Γ(a) = ∫_0^∞ x^(a - 1) e^(-x) dd(x), quad ∀ a > 0 $

#theorem(title: "Gamma 函数的递归性")[
  $ Γ(a + 1) = a Γ(a) $
]

#corollary[
  $ Γ(a) = (a - 1)! $
]

#theorem(title: "余元公式")[
  $ Γ(1 - a) Γ(a) = frac(π, sin (π x)) $
]

#corollary[
  $ Γ(1 / 2) = sqrt(π) $
]

== Gamma 分布 PDF

#definition[
  若随机变量$X$服从参数为$(a, λ)$的 Gamma 分布，记作$X ∼ "Gamma"(a, λ)$，则对其 PDF 为
  $ f(x) = frac(1, Γ(a))(λ x)^a frac(1, x) e^(-λ x), med med x > 0 $
  其中，$a$为形状参数，$1 / λ$为标度参数（scale parameter）。
]

#sgrid(
  figure(
    image("images/distrs/distr_gamma_pdf.png", width: 90%),
    caption: "PDF",
  ),
  figure(
    image("images/distrs/distr_gamma_cdf.png", width: 90%),
    caption: " CDF",
  ),
  columns: (200pt,) * 2,
  gutter: 2pt,
  caption: "Gamma分布",
)

Gamma 分布可以衍生出多个其他连续分布

- $"Gamma"(1, λ) = "Exp"(λ)$
- $"Gamma"(n / 2, 2) = χ^2(n)$
- $"Gamma"(1 / 2, 2) ∼ 𝒩(0, 1)$

#theorem(title: "Gamma-Poisson 共轭")[
  若先验分布服从 Gamma 分布，即$λ ∼ "Gamma"(r_0, b_0)$，且数据条件服从 Poisson 分布，即$Y|λ ∼ "Poisson"(λ t)$，则后验仍服从 Gamma 分布
  $ λ|Y ∼ "Gamma"(r_0 + y, b_0 + t) $
  此时，称 Gamma 分布是 Poisson 分布的共轭先验。$Y$的边际分布称 Gamma-Poisson 分布。
]

== 负二项分布
<负二项分布>

负二项分布，可理解为 Gamma-Poisson 的混合。假设我们正在使用 Poisson 分布对计数数据进行建模，然后我们意识到我们的数据中的方差超过了模型的方差；使用 Poisson 分布的问题是均值和方差是相关的。故，解决这个问题的一种方法是将数据建模为一个 Poisson 分布的混合，其速率来自一个 Gamma 分布，这就给了使用负二项分布的理由。

Beta-二项分布和负二项分布都可作为线性模型的一部分。

= Beta 分布与 Gamma 分布

Beta 函数和 Gamma 函数分别又称第一、第二 Euler 积分。由前者的表达式可得

$ β(a, b) = ∫_0^1 x^(a - 1)(1 - x)^(b - 1) = frac(Γ(a)Γ(b), Γ(a + b)) $

#theorem[
  若随机变量$X$和$Y$服从等速率$λ$的 Gamma 分布，则
  $ X + Y ∼ "Gamma"(a_1 + a_2, λ) $
  且
  $ frac(X, X + Y) ∼ "Beta"(a_1 + 1, a_2) $
]

= 顺序统计量

#definition[
  将$n$个随机变量$X_1, …, X_n$排序，得到的新的序列$X_((1)), …, X_((n))$，称顺序统计量（order statistics）。
]

#definition[
  对$n$个统计量$X_((1)), …, X_((n))$，其样本中位数为$X_((n+1) / 2)$。
]

#theorem[
  假设随机变量$X_1, …, X_n$独立同分布，且有 CDF $F$，则第$j$个顺序统计量的 CDF 为
  $ P(X_(j) ≤ x) = sum_(k = j)^n binom(n, k) F(x)^k (1 - F(x))^(n - k) $
]

#theorem[
  假设连续随机变量$X_1, …, X_n$独立同分布，且有 CDF $F$和 PDF $f$，则第$j$个顺序统计量的边际 PDF 为
  $
    f_X_((j))(x) = n binom(n - 1, j - 1) f (x) F (x)^(j - 1)(1 - F (x))^(n - j)
  $
]

假设随机变量$U_1, …, U_n$独立同分布与$"Unif"(0, 1)$，则对$0 ≤ x ≤ 1$，有$f(x) = 1$且$F(x) = x$，于是$U_((j))$的 PDF 为

$ f_U_((j))(x) = n binom(n - 1, j - 1) x^(j - 1)(1 - x)^(n - j) $

这是$"Beta"(j, n − j + 1)$，所以

$ U_((j)) ∼ "Beta"(j, n − j + 1) $

且$𝔼[U_((j))] = j / (n+1)$。

= 总结

== 常见共轭先验

共轭先验对 Bayesian 分析至关重要。共轭性确保了后验的数学可理解性，Bayesian 统计中的一个常见问题就是最后得到一个无法求解的后验。在发展出合适的计算方法之前，这是个难题。

#figure(
  table(
    columns: 3,
    align: center + horizon,
    inset: 0.4em,
    stroke: table-three-line(rgb("000")),
    table.header([*分布*], [*共轭先验*], [*标准化*]),
    [Binomial-$p$], [Beta], [Bernoulli],
    [NBinomial-$p$], [Beta], [Geometric],
    [Poisson-$λ$], [Gamma], [],
    [Exponential-$λ$], [Gamma], [],
    [Gaussian-$μ$], [Gaussian], [Std.Normal],
    [Gaussian-$σ$], [Inv.Gamma], [Std.Normal],
    [Gamma-$β$], [Gamma], [],
    [Inv.Gamma-$β$], [Gamma], [],
    [Uniform-$θ$], [Pareto], [Std.Uniform],
    [Pareto-$k$], [Gamma], [],
  ),
  caption: "常见共轭先验",
  kind: table,
)
