#import "lib/lib.typ": *
#show: chapter-style.with(
  title: "条件期望与方差",
  info: info,
)

= 条件期望
<条件期望>

#definition[
  设$A$是正概率事件。若$Y$是离散随机变量，那么给定$A$的$Y$的条件期望为
  $ 𝔼[Y|A] = sum_y y P(Y=y|A) $

  若$Y$是连续随机变量，且有 PDF $f$，则
  $ 𝔼[Y|A] = ∫_(-∞)^(∞) y f(y|A) d y $

  该 PDF 是其条件 CDF $F(y|A) = P(Y ≤ y|A)$的导数。
]

#theorem(title: "全期望定律")[
  设$A_1, …, A_n$是样本空间的一个分区，$∀i, P(A_i) > 0$，并让$Y$成为该样本空间上的一个随机变量。则
  $ 𝔼[Y] = sum_(i=1)^n 𝔼[Y|A_i] P(A_i) $
]

实际上，全概率定律是全期望定律的一个特例，而后者又是 Adam's 定律（见后面的小节）的一个特例。

#definition[
  设$g(x) = 𝔼[Y|X = x]$。那么，给定 $X$的$Y$的条件期望$𝔼[Y|X]$被定义为随机变量$g(X)$。
]

== 性质

#theorem[
  对随机变量$X$和$Y$
  - 线性：$𝔼[Y_1 + Y_2|X] = 𝔼[Y_1|X] + 𝔼[Y_2|X]$
  - 独立性：$X$和$Y$独立 ⇒ $𝔼[Y|X] = 𝔼[Y]$
]

#theorem(title: "Adam's 定律")[
  对任意随机变量$X$和$Y$，有
  $ 𝔼[𝔼[Y|X]] = 𝔼[Y] $
]

#corollary[
  对随机变量$X$, $Y$和$Z$，有
  $ 𝔼[𝔼[Y|X,Z]|Z] = 𝔼[Y|Z] $
]

#theorem[
  对任意函数$h$，有
  - $𝔼[h(X)Y|X] = h(X)𝔼[Y|X]$
  - $𝔼[(Y − 𝔼[Y|X])h(X)] = 0$
  其中，$𝔼[Y|X]$可看作投影，$Y − 𝔼[Y|X]$可看作法线。
]

== 线性回归

在最基本的形式中，线性回归模型使用单一解释变量$X$来预测响应变量$Y$，并假定$Y$的条件期望值与$X$成线性关系，即

$ 𝔼[Y|X] = a + b X $

令$Y = a + b X + ϵ$，$𝔼[ϵ|X] = 0$，由条件期望的线性，得到

$ 𝔼[Y|X] = 𝔼[a|X] + 𝔼[b X|X] + 𝔼[ϵ|X] = a + b X $

定义$ϵ = Y − (a + b X)$，于是

$ 𝔼[ϵ|X] = 𝔼[Y|X] − 𝔼[a + b X|X] = 𝔼[Y|X] − (a + b X) = 0 $

根据 Adam's 定律，有

$
  𝔼[ϵ] = 𝔼[𝔼[ϵ|X]] = 𝔼[0] = 0\
  𝔼[ϵ X] = 𝔼[𝔼[ϵ X|X]] = 𝔼[X 𝔼[ϵ|X]] = 𝔼[0] = 0
$

从而有

$ "Cov"(X, Y) = "Cov"(X, a) + b "Cov"(X, X) + "Cov"(X, ϵ) = b "Var"(X) $

于是

$
  b &= frac("Cov"(X, Y), "Var"(X))\
  a &= 𝔼[Y] - b 𝔼[X] = 𝔼[Y] - frac("Cov"(X, Y), "Var"(X))⋅𝔼[X]
$

= 条件方差

#definition[
  给定$X$的$Y$的条件方差为
  $ "Var"(Y|X) = 𝔼[(Y − 𝔼[Y|X])^2|X] $

  等价于
  $ "Var"(Y|X) = 𝔼[Y^2|X] − (𝔼[Y|X])^2 $
]

#theorem(title: "Eve's 定律")[
  对任意随机变量$X$和$Y$，有
  $ "Var"(Y) = 𝔼["Var"(Y|X)] + "Var"(𝔼[Y|X]) $

  上式又称为全方差定律或方差分解公式。
]

#tip[
  Eve's 定律右侧的 "E" 和 "Var" 的排序拼写为 "EVVE"，因此得名 Eve's 定律，从而有了 Adam's 定律。
]
