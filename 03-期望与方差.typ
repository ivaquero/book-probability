#import "lib/lib.typ": *
#show: chapter-style.with(title: "期望与方差", info: info)

= 期望
<期望>

#definition[
  对离散变量$X$，设其值为$x_1, x_2, …$，则$X$的期望值定义为：
  $ 𝔼[X] = sum_(j=1)^(∞) x_j P(X=x_j) $

  若支撑集是有限的，则上式可以写作

  $ 𝔼[X] = sum_x underbrace(x, "value") underbrace(P(X=x), "PMF at x") $
]

#theorem[
  对离散变量$X$和$Y$，以及常数$a$，有

  - $𝔼[X + Y] = 𝔼[X] + 𝔼[Y]$
  - $𝔼[a X + Y] = a 𝔼[X + Y]$
]

#theorem[
  对离散变量$X$和$Y$，若$X$、$Y$相互独立，则
  $ 𝔼[X Y] = 𝔼[X]𝔼[Y] $
]

= 一些工具
<一些工具>

== 示性随机变量

#definition[
  一个随机事件 A 的示性函数$I_A$可以表示为：该事件发生时函数取值为1，不发生时取值为0。它可以将一个随机现象定量转化为随机变量$X ∼ I_A$。
]

#theorem[
  设 A 和 B 都是事件。则下列性质成立
  - $(I_A)^k = I_A$
  - $I_(macron(A)) = 1 − I_A$
  - $I_(A ∩ B) = I_A I_B$
  - $I_(A ∪ B) = I_A + I_B − I_A I_B$
]

#theorem[
  事件与指标随机变量之间存在一一对应关系，事件 A 的概率就是其随机变量的$I_A$的期望值，即

  $ P(A) = 𝔼[I_A] $
]

== LOTUS

在概率论与统计学中，若知道随机变量$X$的概率分布，但并不显式地知道函数$g(X)$的分布，则无意识统计学家法则（Law of the Unconscious Statistician，LOTUS）就是一个可用来计算关于随机变量$X$的函数$g(X)$之期望的定理。该法则的具体形式依赖于随机变量$X$之概率分布的描述形式。

#theorem(title: "LOTUS")[
  若$X$是离散随机变量，$g(X)$是一个$ℝ → ℝ$的函数，则
  $ 𝔼[g(X)] = sum_x g(X) P(X=x) $
]

令$X ∼ "Geom"(p)$，$q = 1 - p$。利用几何分布定义，${X > n}$是前$n + 1$次试验全部失败的事件，则由 LOTUS，有

$
  𝔼[X] = sum_(n = 0)^(∞) P(X > n) = sum_(n = 0)^(∞) q^(n+1) = frac(q, 1 - q) = frac(q, p)
$

= 方差
<方差>

#definition[
  随机变量$X$的方差为
  $ "Var"(X) = 𝔼[X - 𝔼[X]]^2 $
  方差的平方根称标准差，即
  $ σ(X) = sqrt("Var"(X)) $
]

#theorem[
  对任意随机变量$X$，有
  $ "Var"(X) = 𝔼[X^2]-(𝔼[X])^2 $
]

方差还有以下性质

- $"Var"(X) = "Var"(X + c)$
- $"Var"(c X) = c^2 "Var"(X)$

= Poisson 分布

Poisson 分布用于描述固定时间/空间内随机事件发生的次数。记作$X ∼ "Pois"(λ)$，其中，$λ$为事件发生的平均次数。

#definition[
  Poisson 分布的 PMF 为
  $ P(X = k) = frac(λ^k, k!) e^(-λ), k ∈ ℕ $
]

由二项分布，令$p = frac(λ, n)$，则有

$
  P(X = k) &= lim_(n → ∞) binom(n, k)(frac(λ, n))^k (1 - frac(λ, n))^(n - k)\
  &= lim_(n → ∞) frac(n!, (n-k)!) frac(1, k!)( frac(λ, n) )^k underbrace((1 - frac(λ, n))^(n), e^(-λ)) underbrace((1 - frac(λ, n))^(-k), 1)\
  &= lim_(n → ∞) frac(n!, (n-k)!) frac(1, n^k) frac(λ^k, k!) e^(-λ)
$

#tip[
  Poisson 分布的 PMF中，$lim_(k → ∞) frac(λ^k, k!) = e^(λ)$可以看作归一化因子。
]

#figure(
  image("images/distrs/distr_poisson_pmf.png", width: 40%),
  caption: "Poisson 分布",
)

#theorem[
  若随机变量$X$和$Y$相互独立，且$X ∼ "Pois"(λ_1)$，$Y ∼ "Pois"(λ_2)$，则

  - $X + Y ∼ "Pois"(λ_1 + λ_2)$
  - $X ∼ "Bin"(n, frac(λ_1, λ_1 + λ_2))$
]

#theorem[
  当$n → ∞, p → 0$，由于$λ = n p$为定值，此时 Poisson 分布的 PMF 收敛于二项分布，即
  $ "Bin"(n, p) → "Pois"(λ) $
]

实际上，Poisson 分布与二项分布之间的逼近关系有以下经验准则

- $n ≥ 20, p ⩽ 0.05$ ⇒ $"Bin"(n, p) → "Pois"(λ)$
- $λ ≥ 20$ ⇒ $"Pois"(λ) → 𝒩(λ, λ)$（均值和标准差均为$λ$的正态分布）
