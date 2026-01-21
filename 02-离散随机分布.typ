#import "lib/lib.typ": *
#show: chapter-style.with(title: "离散随机分布", info: info)

= 随机变量

#definition[
  给定一个具有样本空间$S$的实验，随机变量（_r.v._）是一个从样本空间$S$到实数$ℝ$的函数。
]

#tip[
  随机变量是对概率的一种简化表达。其保证了概率可以被轻松地函数化。
]

#definition[
  若存在1个有限值向量组$a_1, a_2, …, a_n$或1个无限值向量组$a_1, a_2, …,$，使得
  $ P(X = a_j "for some" j) = 1 $
  则称随机变量$X$是离散的。
]

= 概率函数

== 概率质量函数

#definition[
  离散随机变量$X$的概率质量函数（PMF）是由$p_X (x) = P(X=x)$给出的函数$p_X$。
  注意，若$x$是$X$的支撑集，则为正值，否则为$0$。
]

#theorem(title: "有效 PMFs")[
  设离散随机变量$X$的支撑集为$x_1, x_2$，$X$的 PMF $p_X$必须满足以下两个条件：

  + 非负的：$p_X (x) > O "if" x = 2; "for some" j, "else" p_X (x) = 0$
  + 和为$1$：$sum_(j=1)^(∞) p_X (x_j) = 1$
]

== 累积分布函数

#definition[
  随机变量$X$的累积分布函数（CDF）是由$F_X = P (X≤x)$给定的函数。显然，CDF 是 PMF 的加和。
]

离散随机变量的 CDF 并非一个良好的函数，它由跳跃和平坦区域组成，不容易可视化，所以通常情况下，我们只使用其 PMF 对其进行描述。

= 0-1分布族

== Bernoulli 分布

#definition[
  一项独立实验，其结果可能是"成功"或"失败"，但不可能两者兼有，这种实验被称为 Bernoulli 试验。 Bernoulli 随机变量可以看作是 Bernoulli 试验中成功的指标：若试验成功，它等于 1；若失败，它等于 0。
]

#definition[
  Bernoulli 试验产生的分布称 Bernoulli 分布，其是一种离散随机分布，其参数$p$满足

  - $P(X=1) = p$
  - $P(X=0) = 1−p$

  记作$X ∼ "Bern"(p)$
]

#theorem[
  Bernoulli 分布的 PMF 为

  $ p^k (1-p)^(1-k) quad "for" k ∈ {0,1} $

  或令$q = 1-p$

  $ p^k q^(1-k) quad "for" k ∈ {0,1} $
]

#definition[
  事件 A 的指示性随机变量是指若 A 发生，随机变量等于 1，否则等于 0，用$I_A$或$I(A)$来表示。注意，当$p = P(A)$，$I_A ∼ "Bern"(p)$。
]

== 二项分布

将 Bernoulli 试验重复$n$次得到的分布称二项分布（binomial distribution），其得名于二项式系数，记作$X ∼ "Bin"(p)$。

#theorem[
  二项式分布的 PMF 为

  $ P(X = k) = binom(n, k) p^k (1 - p)^(n - k), k ∈ ℕ $

  或令$q = 1-p$

  $ P(X = k) = binom(n, k) p^k q^(n - k), k ∈ ℕ $
]

#theorem[
  设$X ∼ "Bin"(n, p)$且$q = 1 - p$，则$n - X ∼ "Bin"(n, q)$。
]

== 超几何分布

一个容器里$w$个白球，$b$个黑球。随机抽取$n$个，含$k$个白球的概率服从超几何分布，记作$X ∼ "HGeom"(w, b, n)$，相当于不放回抽样的二项分布。

#theorem[
  超几何分布的 PMF 为

  $ P(X=k) = frac(binom(w, k)binom(b, n-k), binom(w+b, n)) $
]

超几何分布还可以表述为，一批产品共$N$个，其中含次品$M$个（合格品$N - M$个）。随机抽取$n$个，含$m$个次品的概率分布，此时其 PMF 为

$ P(X = m) = binom(N - M, n - m) binom(M, m) / binom(N, n) $

#sgrid(
  figure(
    image("images/distrs/distr_bin_pmf.png", width: 90%),
    caption: "二项分布",
  ),
  figure(
    image("images/distrs/distr_hgeom_pmf.png", width: 90%),
    caption: "超几何分布",
  ),
  columns: (200pt,) * 2,
  gutter: 2pt,
  caption: "二项分布与超几何分布",
)

不难知道，二项分布实验是独立重复的，而超几何分布实验是非独立重复的。

== 几何分布

#definition[
  在$n$次 Bernoulli 试验中，连续失败$k$次的概率分布服从几何分布，记作$X ∼ "Geom"(p)$q，其得名于几何级数

  $
    G = sum_(i=0)^n r^(i) = frac(1 - r^(n+1), 1 - r), quad r ≠ 1
  $
]

#theorem[
  几何分布的 PMF 为

  $ P(X = k) = p(1-p)^k, k ∈ ℕ $

  或令$q = 1-p$

  $ P(X = k) = p q^k, k ∈ ℕ $
]

#sgrid(
  figure(
    image("images/distrs/distr_bern_pmf.png", width: 90%),
    caption: "Bernoulli 分布",
  ),
  figure(
    image("images/distrs/distr_geom_pmf.png", width: 90%),
    caption: "几何分布",
  ),
  columns: (200pt,) * 2,
  gutter: 2pt,
  caption: "Bernoulli分布与几何分布",
)

== 负二项分布

#definition[
  将几何分布试验重复$n$次得到的概率分布服从负二项分布。可以理解成，已知合格率为$p$时，进行$n$次实验，抽到合格品$r$个的概率分布。记作$X ∼ "NBin"(p)$，其得名于负二项式系数

  $ (1 - x)^(-n) = sum_0^(∞) binom(i + n + 1, n + 1) x^n $
]

#theorem[
  负二项分布的 PMF 为

  $
    P(X = k) = binom(k + r - 1, r - 1) p^(r)(1 - p)^(k)
  $
]

== 负超几何分布

一批产品共$N$个，其中含次品$M$个。随机抽取$n$个，含$r$个合格品的概率分布，此时其 PMF 为

负二项分布是几何分布的有放回重复版本，而负超几何分布是几何分布的不放回重复版本，记作$X ∼ "NHGeom"(p)$。

#theorem[
  负超几何分布的 PMF 为

  $
    P(X = k) = binom(k + r - 1, k) frac(binom(N - r - k, M - k), binom(M, n))
  $
]

#sgrid(
  figure(
    image("images/distrs/distr_nbin_pmf.png", width: 90%),
    caption: "负二项分布",
  ),
  figure(
    image("images/distrs/distr_nhgeom_pmf.png", width: 90%),
    caption: "负超几何分布",
  ),
  columns: (200pt,) * 2,
  gutter: 2pt,
  caption: "负二项分布与负超几何分布",
)

= 随机变量的函数

#definition[
  对样本空间 S、随机变量$X$和函数$g: ℝ → ℝ$，$g(X)$是将所有$s ∈ S$的$s$映射到$g(X(s))$的随机变量。
]

#definition[
  给定一个具有样本空间$S$的实验，若$X$和$Y$分别是将$s ∈ S$映射到$X(s)$和$Y(s)$的随机变量，则$g(X, Y)$就是将$s$映射到$g(X(s), Y (s))$的随机变量。
]

== 独立性

#definition[
  随机变量$X$和$Y$被认为是独立的，当且仅当，$∀x, y ∈ ℝ$

  $ P(X≤x, Y≤y) = P(X≤x) P(Y≤y) $

  对离散型随机变量，该充要条件为

  $ P(X=x, Y=y) = P(X=x) P(Y=y) $

  该定义可推广至多个随机变量。
]

#theorem[
  若随机变量$X$和$Y$是独立的，则其函数也是相互独立的。
]

#definition[
  随机变量$X$和$Y$被认为是条件独立的，当且仅当，$∀x, y ∈ ℝ$

  $ P(X≤x, Y≤y|Z=z) = P(X≤x|Z=z) P(Y≤y|Z=z) $

  对离散型随机变量，该充要条件为

  $ P(X=x, Y=y|Z=z) = P(X=x|Z=z) P(Y=y|Z=z) $
]

#definition[
  对于任何随机变量$X$和$Z$，当把函数$P(X=x|Z=z)$看作固定$z$的$x$的函数时，就称其为给定$Z=z$的$X$的条件 PMF。
]

#warning[
  随机变量独立 ⇏ 独立
]

== 同分布

#definition[
  独立的随机变量若具有同一种分布，则称其独立同分布，记作$i.i.d$。
]

#theorem[
  若随机向量$X ∼ "Bin"(n,p)$，则$X$的分量$X_i limits(∼)^(i.i.d) "Bern(p)"$。
]

#theorem[
  设随机变量$X$和$Y$独立同分布于二项分布，即$X ∼ "Bin"(n, p)$且$Y ∼ "Bin"(m, p)$，则
  $
    (X + Y) ∼ "Bin"(n+m, p)\
    (X|X + Y = r) ∼ "HGeom"(n, m, r)
  $
]

= 小结

#let data = csv("data/dstr-discrete.csv")
#figure(
  tableq(data, 5, inset: 0.33em),
  caption: "主要离散分布关系",
  kind: table,
)

+ $n p ≥ 5$ ⇒ $B(n, p) → 𝒩(n p, n p(1 - p))$
+ $N → ∞$ ⇒ $H(N, m, n) → B(n, p)$（当$n$固定，则$p=M / N$固定）
