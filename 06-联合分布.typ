#import "lib/lib.typ": *
#show: chapter-style.with(
  title: "联合分布",
  info: info,
)

= 联合、边际、条件分布
<联合-边际-条件分布>

== 离散分布

#definition[
  随机变量$X$和$Y$的联合 CDF 为
  $ F_(X,Y)(x, y) = P(X≤x, Y≤y) $
]

不幸的是，离散随机变量的联合 CDF 并非一个良好的函数；与单变量情况一样，其由跳跃和平坦区域组成。故对于离散随机变量，通常使用联合 PMF。PMF 也决定了联合分布，且更易可视化。

#definition[
  随机变量$X$和$Y$的联合 PMF 为
  $ p_(X, Y)(x, y) = P(X=x, Y=y) $
  满足
  - PMF 非负
  - $sum_x sum_y P(X=x, Y=y) = 1$
]

#definition[
  对随机变量$X$和$Y$，$X$的边际 PMF 为
  $ P(X=x) = sum_y P(X=x, Y=y) $
]

$X$的边际 PMF 是单独观察$X$时，$X$的 PMF。为了将联合 PMF 转换为$X$的边际 PMF，对$Y$的可能值求和的操作称为$Y$的边际化（marginalizing out）。

#definition[
  对随机变量$X$和$Y$，给定$X$时，$Y$的条件 PMF 为
  $ P(Y=y|X=x) = frac(P(X=x, Y=y), P(X=x)) $
]

#definition[
  对随机变量$X$和$Y$
  $ F_(X,Y)(x, y) = F_X (x) F_Y (y), med ∀x, y $
  则$X$和$Y$独立。

  对离散变量，等价于
  $ P(X=x, Y=y) = P(X=x) P(Y=y), med ∀x, y $
]

#theorem[
  若$X ∼ "Pois"(λ p)$，$Y ∼ "Pois"(λ q)$，且$X$和$Y$独立，则
  - $N = X + Y ∼ "Pois"(λ)$
  - $X|N = n ∼ "Bin"(n, p)$
]

#theorem[
  若$N ∼ "Pois"(λ)$，$X|N = n ∼ "Bin"(n, p)$，则
  - $X ∼ "Pois"(λ p)$
  若$Y = N - X ∼ "Pois"(λ q)$，则
  - $X$和$Y$独立
]

== 连续分布

#definition[
  若$X$和$Y$是连续的，且具有联合 CDF $F_(X,Y)$ ，则其联合 PDF 是联合 CDF 关于$X$和$Y$的导数

  $
    f_(X, Y)(x, y) = pdv(, x y) F_(X, Y)(x, y)
  $

  满足
  - $f_(X, Y) ≥ 0$
  - $∫_(-∞)^∞ ∫_(-∞)^∞ f_(X, Y)(x, y) dd(x, y) = 1$
]

#definition[
  对连续随机变量$X$和$Y$，设其联合 PDF 为$f_(X, Y)(x, y)$，则$X$的边际 PDF 为
  $ f_X(x) = ∫_(-∞)^∞ f_(X, Y)(x, y) dd(y) $
]

#definition[
  对连续随机变量$X$和$Y$，设其联合 PDF 为$f_(X, Y)(x, y)$，给定$X$时，$Y$的条件 PDF 为
  $ f_(Y|X)(y|x) = frac(f_(X, Y)(x, y), f_X (x)) $
  满足$∀x, f_X (x) > 0$。
]

#theorem[
  对连续随机变量$X$和$Y$，Bayes' 法则表示为
  $ f_(Y|X)(y|x) = frac(f_(X|Y)(x|y) f_Y (y), f_X (x)), "for" f_X (x) > 0 $
  全概率定律表示为
  $ f_X (x) = ∫_(-∞)^(∞) f_(X|Y)(x|y) f_Y (y) dd(y) $
]

#definition[
  对随机变量$X$和$Y$，若
  $ F_(X,Y)(x, y) = F_X (x) F_Y (y), med ∀x, y $
  则$X$和$Y$独立。
  对连续变量，等价于
  $ f_(X, Y)(x, y) = f_X (x) f_Y (y) $
]

#figure(
  table(
    columns: 3,
    align: center + horizon,
    inset: 6.5pt,
    stroke: table-three-line(rgb("000")),
    table.header([], [$Y$离散], [$Y$连续], [$X$离散]),
    [$P(Y=y|X=x) = frac(P(X=x|Y=y) P(Y=y), P(X=x))$], [$f_Y (y|X=x) = frac(P(X=x|Y=y) f_Y (y), P(X=x))$], [$X$连续],
    [$P(Y=y|X=x) = frac(f_X (x|Y=y) P(Y=y), f_X (x))$], [$f_(Y|X)(y|x) = frac(f_(X|Y)(x|y) f_Y (y), f_X (x))$],
  ),
  caption: "条件 Bayes' 法则",
  kind: table,
)

#figure(
  table(
    columns: 3,
    align: center,
    inset: 6.5pt,
    stroke: table-three-line(rgb("000")),
    table.header([], [$Y$离散], [$Y$连续], [$X$离散]),
    [$sum_y P(X=x|Y=y) P(Y=y)$], [$∫_(-∞)^(∞) P(X=x|Y=y) f_Y (y) dd(y)$], [$X$连续],
    [$sum_y f_X (x|Y=y) P(Y=y)$], [$∫_(-∞)^(∞) f_(X|Y)(x|y) f_Y (y) dd(y)$],
  ),
  caption: "条件全概率定律",
  kind: table,
)

= 二维 LOTUS
<二维-LOTUS>

#definition[
  设$g$是一个从$ℝ^2 → ℝ$的函数。若$X$和$Y$是离散的，则
  $ 𝔼[g(X, Y)] = sum sum g(x, y) P(X=x, Y=y) $
  若$X$和$Y$是连续的，且有联合 PDF $f_(X,Y)$，则
  $ 𝔼[g(X, Y)] = ∫_(-∞)^(∞) ∫_(-∞)^(∞) g(x, y) f_(X, Y)(x, y) d x d y $
]

与一维 LOTUS 类似，二维 LOTUS 也让我们不必为了计算$g(X, Y)$的期望值而寻找其分布。相反，有了$X$和$Y$的联合 PMF/PDF 就足够了。二维 LOTUS 的一个用途是求出两个随机变量间的期望距离。如对$X, Y limits(∼)^(i.i.d.) 𝒩(0, 1)$，通过 二维 LOTUS 可以得到$𝔼[|X - Y|]$，过程如下

首先由 LOTUS，得

$
  𝔼[|X - Y|] = ∫_(-∞)^(∞)∫_(-∞)^(∞)(|x - y|) 1 / sqrt(2π) e^(-x^2 / 2) 1 / sqrt(2π) e^(= y^2 / 2) dd(x, y)
$

又由矩母函数的结论，正态分布的和或差仍服从正态分布，可知$X - Y ∼ 𝒩(0, 2)$，于是有$X - Y = sqrt(2)Z$，得

$ 𝔼[Z] = sqrt(frac(2, π)) ⇒ 𝔼[|X - Y|] = 2 / sqrt(π) $

= 协方差和相关系数
<协方差和相关系数>

#definition[
  随机变量$X$和$Y$的协方差为
  $
    "Cov"(X, Y) &= 𝔼[(X - E X)(Y - E Y)] \
    &= 𝔼[X Y] − 𝔼[X]𝔼[Y]
  $
]

#theorem[
  若$X$和$Y$独立，则其协方差为$0$。
]

#theorem[
  设$"Cov"(X, Y)$为$X$和$Y$的协方差，则
  - $"Cov"(X, X) = "Var"(X)$
  - $"Cov"(X, Y) = "Cov"(Y, X)$
  - $"Cov"(a X, Y) = a "Cov"(X, Y)$
  - $"Cov"(X + Y, Z) = "Cov"(X, Z) + "Cov"(Y, Z)$
  - $"Cov"(X + Y, Z + W) = "Cov"(X, Z) + "Cov"(X, W) + "Cov"(Y, Z) + "Cov"(Y, W)$
  - $"Var"(X + Y) = "Var"(X) + "Var"(Y) + "Cov"(X, Y)$
]

#warning[
  - 独立：没有关系
  - 不相关：没有线性关系
]

#definition[
  随机变量$X$和$Y$的相关系数为
  $ "Corr"(X, Y) = frac("Cov"(X, Y), sqrt("Var"(X)) "Var"(Y)) $
]

相关系数的取值范围是$[-1, 1]$，$1$代表完全正相关，$-1$表示完全负相关，$0$表示完全不相关，其不受$X$和$Y$标度的影响。

= 多项式分布
<多项式分布>

$n$个对象中，每个对象都被独立归入$k$个类别之一。一个物体被归入$j$个类别的概率为$p_j$，其中$p_j$为非负数，且$sum_(j=1)^k p_j = 1$。假设$X_1$是第 1 类中的物体数，$X_2$是第 2 类中的物体数，等等，这样$X_1 + … + X_p = n$，则$𝑿 = (X_1, …, X_p)$称为多项式分布，参数为 $n$和$𝐩 = (p_1, …, p_p)$。记作$𝑿 ∼ "Mult"_p (n, 𝐩)$。

这里，称$𝑿$为随机向量，因为它是一个随机变量向量。

#theorem[
  若$𝑿 ∼ "Mult"_p (n, 𝐩)$，$𝑿$的 PMF 为
  $
    P(X_1 = n_1, …, X_p = n_p) = frac(n!, n_1! n_2! … n_p!)⋅p_1^(n_1) p_2^(n_2) … p_p^(n_p)
  $
  满足$sum n_i = n$。
]

#theorem(title: "多项式定理")[
  $
    (sum_(i=1)^(m) a_(i))^(n) =
    sum binom(n, k_1\, k_2\, ⋯\, k_m) ∏_(t=1)^(m) a_t^(k_t)( a_(i) ∈ ℝ,
      ∀k_(i) ∈ ℕ, sum_(i=1)^(m) k_(i) = n )
  $
]

#theorem[
  多项式分布的边际分布为二项式分布。即，若$X ∼ "Mult"_p (n, p)$，则$X_j ∼ "Bin"(n, p_j)$。
]

#theorem[
  若$𝑿 ∼ "Mult"_p (n, 𝐩)$，则对不同的$i$和$j$，$X_i + X_j ∼ "Bin"(n, p_i + p_j)$。合并类别$i$和$j$所得到的计数随机向量仍然服从多项式分布。
]

#theorem[
  若$𝑿 ∼ "Mult"_p (n, 𝐩)$，则
  $
    (X_2, …, X_p)|X_1 = n_1 ∼ "Mult"_(k -1)(n - n_1, (p_2^′, …, p_p^′))
  $
  其中，$p_j^′ = p_j / (p_2 + … + p_p)$。
]

#theorem[
  令$(X_1 + … + X_p) ∼ "Mult"_p (n, 𝐩)$，其中，$𝐩 = (p_1, …, p_p)$，则$∀i ≠ j$，有
  $
    "Cov"(X_i, X_j) = −n p_i p_j
  $
]

= 多元正态分布
<多元正态分布>

#definition[
  若$X_j$的每个线性组合都具有正态分布，则称$p$维随机向量$𝑿 = vecrow(X_1, …, X_p)$具有多元正态分布（MVN）。即要求$t_1 X_1 + … + t_p X_p$对任意常数$t_1, …, t_p$服从正态分布。其联合 PDF 为

  $
    f(𝒙) = frac(1, (2π)^(p / 2) |𝜮|^(1 / 2)) exp(-1 / 2 (𝒙 - 𝝁)^⊤ 𝜮^(-1)(𝒙 - 𝝁))
  $

  其中，$𝒙 ∈ ℝ^p$为随机向量，$𝝁 ∈ ℝ^p$为均值向量，$𝜮 ∈ ℝ^(p×p)$为协方差矩阵，即

  $
    𝒙 = mat(delim: "[", x_1; x_2; ⋮; x_p) 𝝁
    = mat(delim: "[", μ_1; μ_2; ⋮; μ_p) 𝜮
    = mat(
      delim: "[",
      σ_11, σ_12, …, σ_(1 p);
      σ_21, σ_22, …, σ_(2 p);
      ⋮, ⋮, med, ⋮;
      σ_(p 1), σ_(p 2), …, σ_(p p)
    )_(p×p)
  $
]

== Mahalanobis 距离
<Mahalanobis-距离>

多元正态分布 PDF 中，指数的次幂是$-1\/2$倍的 Mahalanobis 距离，该距离是对 Euclidean 距离中各维度标度不一致带来的相关性问题的一种修正。

$ D_M (x) = sqrt((𝒙 - 𝝁)^⊤ 𝜮^(-1)(𝒙 - 𝝁)) $

若$𝜮 = 𝑰$，即各维度独立同分布，Mahalanobis 距离就变成了 Euclidean 距离。简言之，Mahalanobis 距离是旋转变换缩放之后的 Euclidean 距离。通常，$𝜮$半正定（对称的）。因为涉及求逆，$𝜮$必须满秩，这里假设$𝜮$正定（特征值$λ > 0$）。对$𝜮$进行特征值分解，得

$
  𝜮 = 𝑼 𝚲 𝑼^⊤ = (u_1, u_2, …, u_p) "diag"(λ_i)(u_1, u_2, …, u_p)^⊤ = sum_(i=1)^p u_i λ_i u_i^⊤
$

于是

$ 𝜮^(-1) = sum_(i=1)^p u_i 1 / λ_i u_i^⊤ $

从而有

$ D_M (x) = sum_(i=1)^p (𝒙 - 𝝁)^⊤ u_i 1 / λ_i u_i^⊤(𝒙 - 𝝁) $
令$y_i = (𝒙 - 𝝁)^⊤ u_i$，得

$ D_M (x) = sum_(i=1)^p y_i^2 / λ_i $

注意到，$y_i$为新的坐标轴，$y_i$是$𝒙 - 𝝁$在特征向量$u_i$上的投影长度，因此上式就是$D_M (x)$取不同值时的同心椭圆。即 Mahalanobis 距离通过将随机向量投影到新的坐标系，消除了相关性影响。

== 相关性质

#theorem[
  若$(X_1, X_2, X_3)$服从多元正态分布，则子向量$(X_1, X_2)$也服从多元正态分布。
]

#theorem[
  若$𝑿 = (X_1, …, X_n)$和$𝒀 = (Y_1, …, Y_m)$是多元正态随机向量，且$𝑿$与$𝒀$无关，那么其铰接随机向量$W = (X_1, …, X_n, Y_1, …, Y_m)$是多元正态的。
]

#definition[
  随机向量$𝑿 = (X_1, … , X_p)$的联合 MGF 是由以下公式定义的函数 M
  $ M(𝒕) = 𝔼[e^(𝒕^′𝑿)] = 𝔼[e^(t_1 X_1 + … + t_p X_p)] $
  其中，$𝒕 = (t_1, …, t_p) ∈ ℝ^p$。
]

#theorem[
  若$X ∼ "MVN"$可写成$𝑿 = (𝑿_1，𝑿_2)$，其中，$𝑿_1$和$𝑿_2$是子向量，且$𝑿_1$的每个分量都与$𝑿_2$的每个分量不相关，则$𝑿_1$和$𝑿_2$就是独立的。
]

#theorem(title: "样本均值与方差的独立性")[
  设$X_1, … , X_n i.i.d. ∼ 𝒩(μ, σ^2)$，则$"Cov"(macron(X_n), S_n^2) = 0$
]

#theorem(title: "积分布")[
  设$X ∼ "MVN"(μ_1, Σ_1)$，$Y ∼ "MVN"(μ_2, Σ_2)$，则积分布的参数为
  $
    μ = Σ_2 (Σ_1 + Σ_2)^(-1) μ_1 + Σ_1 (Σ_1 + Σ_2)^(-1) μ_2\
    Σ = Σ_1 (Σ_1 + Σ_2)^(-1) Σ_2
  $

  近似为

  $
    μ ≈ frac(Σ_2 μ_1 + Σ_1 μ_2, Σ_1 + Σ_2), quad Σ ≈ frac(Σ_1 Σ_2, (Σ_1 + Σ_2))
  $
]

== 二元正态分布

由上可以推断出，以$𝒩(0, 1)$为边际分布的二元正态分布的联合 PDF 为

$
  f_(X, Y)(x, y) = frac(1, 2π τ) exp(-frac(1, 2 τ^2)(x^2 + y^2 - 2ρ x y))
$

其中，$ρ ∈ (-1, 1)$为相关系数，$τ = sqrt(1 − ρ^2)$。

#theorem(title: "和与差的独立性")[
  设$X, Y i.i.d. ∼ 𝒩(0, 1)$，则$"Cov"(X + Y, X − Y) = 0$
]
