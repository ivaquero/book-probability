#import "lib/lib.typ": *
#show: chapter-style.with(title: "极限定理", info: info)

= 不等式
<不等式>

== 联合期望约束
<联合期望约束>

Cauchy-Schwarz 不等式是数学史上最著名的不等式之一。在概率论中，其形式如下

#theorem(title: ctext("Cauchy-Schwarz 不等式"))[
  对于具有有限方差的任意随机变量$X$和$Y$
  $ |𝔼[X Y]| ≤ sqrt(𝔼[X^2] 𝔼[Y^2]) $
]

Cauchy-Schwarz 不等式给出了联合期望的边际上限，在证明中应用广泛。如对$X = X⋅1$，有$|𝔼[X]| ≤ sqrt(𝔼[X^2] 𝔼[1^2])$，化简得$(𝔼[X])^2 ≤ 𝔼[X^2]$。

== 凸性判定

Jensen 不等式用于判定数据集的凸性（convexity），在概率论中，其形式如下

#theorem(title: ctext("Jensen 不等式"))[
  设$X$是一个随机变量。若$g$是
  - 凸函数，则$𝔼[g(X)] ≥ g(𝔼[X])$
  - 凹函数，则$𝔼[g(X)] ≤ g(𝔼[X])$
  在这两种情况下，只有当存在常数$a$和$b$，使得$g(X) = a + b X$的概率为$1$时，等号才可能成立。
]

#corollary[
  - $E|X| ≥ |E X|$
  - $𝔼[1 / X] ≥ 1 / (E X) med med ∀X > 0$
  - $𝔼[log(X)] ≤ log(E X) med med ∀X < 0$
]

== 尾概率约束

#theorem(title: ctext("Markov 不等式"))[
  对任意随机变量$X$和常数$a > 0$，有
  $ P(|X| ≥ a) ≤ frac(E|X|, a) $
]

为了直观起见，令$X$成为从人口中随机抽取的个体的收入。取$a = 2𝔼[X]$，Markov 不等式表示为$P(X ≥ 2𝔼[X]) ≤ 1 / 2$，即不可能有一半以上的人的收入至少是平均收入的 2 倍。将 2 替换成其他正整数，不等式也成立。

Markov 不等式是一个粗略的约束，它完全不需要对$X$作任何假设。下面 2 个不等式几乎不需要额外的工作就可以从 Markov 不等式中推导出来，它们通常可以给出比前者更好的约束。

#theorem(title: ctext("Chebyshev 不等式"))[
  设随机变量$X$具有均值$μ$和方差$σ^2$，则对常数$a > 0$，有
  $ P(|X - μ| ≥ a) ≤ σ^2 / a^2 $
]

令$a = c σ$，得

$ P(|X - μ| ≥ c σ) ≤ 1 / c^2 $

这就给出了一个概率上限，即随机变量偏离均值超过$c$个标准差的概率。

#let cheby(const) = {
  calc.round(1 - 1 / calc.pow(const, 2), digits: 2)
}

#corollary[
  - 所有数据，至少 #cheby(2) 落在均值的$2$个标准差范围内。
  - 所有数据，至少 #cheby(3) 落在均值的$3$个标准差范围内。
  - 所有数据，至少 #cheby(6) 落在均值的$6$个标准差范围内。
]

#theorem(title: ctext("Chernoff 不等式"))[
  设随机变量$X$，对常数$a > 0$和$t > 0$，有
  $ P(|X| ≥ a) ≤ frac(𝔼[e^(t X)], e^(t a)) $
]

Chernoff 不等式有两个非常好的特点：

- 右边可以对$t$进行优化，以给出最严格的上界
- 若$X$的 MGF 存在，则边际中的分子就是 MGF

设$Z ∼ 𝒩(0, 1)$。根据 68-95-99.7% 法则，可知$P(|Z| > 3) = 2⋅Φ(-3) ≈ 0.003$。

由 Markov 不等式

$ P(|Z| > 3) ≤ frac(E|Z|, 3) = 1 / 3⋅2⋅1 / sqrt(2pi) ≈ 0.27 $

由 Chebyshev 不等式

$ P(|Z| > 3) ≤ 1 / 9 ≈ 0.11 $

由 Chernoff 不等式

$
  P(|Z| > 3)
  = 2 P(Z > 3) ≤ 2e^(-3t) 𝔼[e^(t Z)]
  = 2e^(-3t)⋅e^(t^2 / 2) limits(≈)^(t=3) 0.022
$

= 大数定律
<大数定律>

大数定律（law of large numbers，LLN）指出，随着$n$的增长，样本均值̄$macron(X_n)$会趋近于真实均值$μ$。LLN 有两个版本，即"强"（SLLN）和 "弱"（WLLN），它们对随机变量序列收敛到一个数的含义所使用的定义略有不同。

#theorem(title: ctext("强大数定律"))[
  又称 Kolmogorov 大数定律，其表明，样本均值̄$macron(X_n)$逐步收敛至真实均值$μ$的概率为$1$。即设$X_i$独立同分布，且期望值$𝔼[X_i] = μ, med k ∈ ℕ$，则
  $ P{lim_(n → ∞)(1 / n sum X_i) = μ} = 1 $
]

#theorem(title: ctext("弱大数定律"))[
  又称 Wiener-Khinchin 大数定律，其表明，用算术均值来近似实际真值是合理的。即设$X_i$独立同分布，，且期望值$𝔼[X_i] = μ, med k ∈ ℕ$，则$∀ϵ ∈ ℕ$，存在

  $ P{|lim_(n → ∞)(1 / n sum X_i) - μ| ≤ ϵ} = 1 $
]

#figure(
  image("images/trials/theo-lln.png", width: 50%),
  caption: "大数定律",
)

== 经验 CDF

令$X_1, …, X_n$独立同分布于 CDF 为$F$的随机分布。对于每个数$x$，令$R_n (x)$统计$X_1, …, X_n$中有多少个小于或等于$x$，即

$ R_n (x) = sum_(j=1)^n I (X_j ≤ x) $

由于示性函数$I(X_j ≤ x)$独立同分布于成功概率$F(x)$，可知$R_n (x)$是参数为$n$和$F(x)$的二项分布。由此，给出 经验 CDF 定义。

#definition[
  $X_1, …, X_n$的经验 CDF 为
  $ hat(F)_n (x) = frac(R_n (x), n) $
]

经验 CDF 常用于非参数统计中，它试图在不对随机样本的分布族做出强假设的情况下理解该样本。例如，与其假设$X_1, …, X_n ∼ 𝒩(μ, σ_2)$，非参数方法允许$X_1, …, X_n ∼ F$的任意 CDF $F$，然后使用经验 CDF 作为$F$的近似值。LLN 确保我们在收集越来越多的样本时，这个近似值在极限范围内是有效的：在每个$x$值上，经验 CDF 都会向真实 CDF 收敛。

= 中心极限定理
<中心极限定理>

中心极限定理（central limit theorem，CLT）指出，对于大$n$，标准化后̄$macron(X_n)$的分布接近标准正态分布$𝒩(0, 1)$。

#theorem[
  当$n → ∞$，有
  $ sqrt(n)(frac(macron(X_n) - μ, σ)) → 𝒩(0, 1) $
  从而有
  $ macron(X_n) ∼ 𝒩(μ, σ_2 / n) $
]

CLT 是一个渐近的结果，它告诉我们当$n → ∞$时的$macron(X_n)$的极限分布，也提出了当$n$较大但有限时的$macron(X_n)$分布的近似值。

#corollary[
  当$n → ∞$，
  - $Y ∼ "Bin"(n, p) → (n p, n p(1 − p))$
  - $Y ∼ "Pois"(λ) → 𝒩(λ, λ)$
  - $Y ∼ "Gamma"(n, λ) → 𝒩(n / λ, n / λ^2)$
]

二项分布的正态近似是对 Poisson 近似的补充。Poisson 在$p$较小时效果最优，而正态近似在$n$较大、p 约为$1 / 2$时效果最优，因此$Y$的分布是对称的或接近对称。此结论可用以下定理证明。

#theorem(title: ctext("De Moivre-LaPlace 定理"))[
  设随机变量$X_1, X_2, …, X_n limits(∼)^(i.i.d.) B(n, p)$，则$∀ϵ ∈ ℤ$，存在

  $
    lim_(n → ∞) P{frac(X_n - n p, sqrt(n p (1 - p))) ≤ x} = ∫_(-∞)^x 1 / sqrt(2pi) e^(frac(-t^2, 2)) d t = Φ(x)
  $
]

== 三种收敛

三种收敛对应 LLN 和 CLT 的三种收敛方式，前者关心的是均值，后者不仅关心均值，还关心方差，即分布。矩在某种程度上统一了两者。当$n$越来越大时，正态分布就变得越来越尖，趋于$∞$时，收敛为没有宽度的但无限高的的样子，有意思的是，其曲线下的面积却等于$1$，被称为 Dirac-δ 函数，点电荷和点质量等点源和脉冲具有类似的性质。

#definition[
  当$n → ∞$，在函数$P$下，$X_n$不收敛到$x_0$的概率为$0$，即
  $ lim_(n → ∞) P(|X_n - x_0| ≥ ϵ) = 0 $
  则称$X_n$几乎确信收敛（convergence in affirmation）于$x_0$，记为$X_n → x_0$。

  SLLN 就是几乎确信收敛。
]

#definition[
  设$X_2, X_2, …$是随机变量序列，若$∀ϵ$，有
  $ lim_(n → ∞) P(|X_n - x_0| > ϵ)=0 $
  则称$X_n$依概率收敛（almost sure convergence）于$x_0$，记为$X_n limits(→)^p x_0$。

  WLLN 就是依概率收敛。
]

#definition[
  设${X_n}$和${x_0}$是 CDF 分别为${F_n (⋅)}$和${F_0 (⋅)}$的随机变量序列，若在$F_0(x)$连续处，$∀x ∈ ℝ$，有
  $ lim_(n → ∞) F_n(x) = F_0(x) $

  则称${X_n}$依分布收敛（convergence in distribution）于${x_0}$，记为$X_n limits(→)^d x_0$，意味着$X_n$的 CDF 越来越接近$x_0$的 CDF（随机变量的 PDF 并不总存在）。

  CLT 就是依分布收敛。
]

#tip[
  CLT 要求的均值和方差是有限的，WLLN 也是基于同样的条件。然而，凡事总有例外，Cauchy 分布没有均值和方差，因此其既不服从 LLN，也不服从 CLT。无论$n$多大，$n$个 Cauchy 分布的样本均值仍是 Cauchy 分布。
]

= 抽样分布
<抽样分布>

== $χ^2$ 分布

#definition[
  设$V = Z_1^2 + … + Z_n^2$，其中，$Z_1, …, Z_n$独立同分布于$𝒩(0, 1)$，则$V$服从$n$自由度的奇平方分布，记作$V ∼ χ_n^2$，对$x > 0$，其 PDF 为
  $ frac(1, Gamma(n\/2)⋅2^(n\/2)) e^(-x\/2)⋅x^((n\/2 - 1)) $
  不难发现，$χ_n^2$分布是 Gamma 分布的一种特例，即$"Gamma"(n\/2, 1\/2)$。
]

#sgrid(
  figure(
    image("images/distrib/distrib_chi2_pdf.png", width: 90%),
    caption: "χ² 分布 PDF",
  ),
  figure(
    image("images/distrib/distrib_gamma_pdf.png", width: 90%),
    caption: "Gamma 分布 PDF",
  ),
  columns: (200pt,) * 2,
  gutter: 2pt,
  caption: "χ²分布与Gamma分布",
)

设$X_1, …, X_n$独立同分布于$𝒩(μ, σ^2)$，则其样本方差为

$ S_n^2 = frac(1, n-1) sum_(j=1)^n (X_j - macron(X_n))^2 $

从而有

$ frac((n-1) S_n^2, σ^2) ∼ χ^2_(n-1) $

== 学生$t$分布

又称学生$t$分布，简称$t$分布，是来自正态总体的样本均值的分布。通常用于小样本数，当总体均值及标准差未知时。$t$分布的实质是，用样本方差$S$估计总体方差$σ$，即用标准误差代替标准差。

#definition[
  设$Z ∼ 𝒩(0, 1), V ∼ χ^2_n$，$Z$和$V$独立，则
  $
    T = frac(Z, sqrt(V\/n)) = frac(macron(X) - μ, S\/sqrt(n)) = frac(macron(X) - μ, "sem")
  $

  服从自由的为$n$的$t$分布，记作$T ∼ t_n$。其 PDF 为

  $
    h(t) = frac(Gamma((n + 1)\/2), sqrt(pi n) Gamma(n\/2))(1 + t^2\/n)^(-(n + 1)\/2)
  $
]

#theorem[
  $t$分布的 PDF 与标准正态分布相似，只是尾部更重一些。其性质如下

  - 关于$x = 0$对称，即$T ∼ t_n$ ⇒ $-T ∼ t_n$
  - 收敛于标准正态分布
  - 离散程度与$n$呈负相关
  - $t_1$为 Cauchy 分布
]

#sgrid(
  figure(
    image("images/distrib/distrib_t_pdf.png", width: 90%),
    caption: "t 分布 PDF",
  ),
  figure(
    image("images/distrib/distrib_caushy_pdf.png", width: 90%),
    caption: "Cauchy 分布 PDF",
  ),
  columns: (200pt,) * 2,
  gutter: 2pt,
  caption: "t分布与Cauchy分布",
)

== $F$ 分布

$F$分布用于比较两组正态分布数据的可变性，并确定方差分析的临界值，即，判断两个总体是否有相同的方差。

#definition[
  设$X_1 ∼ χ^2(n), X_2 ∼ χ^2(m)$，则
  $ frac(X_2\/m, X_1\/n) ∼ F(m, n) $
]

#figure(
  image("images/distrib/distrib_f_pdf.png", width: 40%),
  caption: "F 分布 PDF",
)

#theorem[
  - $F ∼ F(m, n)$ ⇒ $1 / F ∼ F(n, m)$
  - $t ∼ t(n)$ ⇒ $t^2 ∼ F(1, n)$
]

#theorem[
  当$X_i ∼ 𝒩(μ, σ^2)$，则

  $ frac(S^2, σ^2\/(n-1)) ∼ χ^2 (n-1) $

  $ frac(macron(X) - μ, S\/sqrt(n)) ∼ t(n-1) $
]

#theorem[
  当$X_i ∼ 𝒩(μ_1, σ_1^2)$，$Y_j ∼ 𝒩(μ_2, σ_2^2)$，且$X$和$Y$独立，则
  $
    sum frac((Y_j - macron(Y)), σ_2^2 (m - 1)) \/ frac((X_i - macron(X)), σ_1^2 (n-1)) ∼ F(m - 1, n-1)
  $
]

#theorem[
  当$σ_1^2 = σ_2^2$，则

  $
    sum [(macron(X)- macron(Y)) - (μ_1 - μ_2)]⋅sqrt((n + m - 2)\/(1 / n + 1 / m)) / sqrt(sum (X_i - macron(X)) + sum (Y_i - macron(Y))) ∼ t (n + m - 2)
  $
]

#figure(
  table(
    columns: 4,
    align: center + horizon,
    inset: 0.65em,
    stroke: table-three-line(rgb("000")),
    table.header([样本分布], [总体分布], [偏离量分布], [统计量]),
    [$χ^2$分布], [$X ∼ 𝒩(0, 1)$], [], [$sum X^2$],
    [$t$分布], [$X ∼ 𝒩(0, 1)$], [$Y ∼ χ^2(n)$], [$X / sqrt(Y\/n)$],
    [$F$分布], [$X ∼ χ^2(n)$], [$Y ∼ χ^2(m)$], [$frac(Y\/m, X\/n)$],
  ),
  caption: "抽样分布",
)
