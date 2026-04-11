#import "lib/lib.typ": *
#show: chapter-style.with(title: "概率与计数", info: info)

= 集合
<集合>

== 相关概念

- 空集：不含任何元素的集合，记作$∅$。
- 子集：对$2$个集合$A$与集合$B$，若$A$中任一元素都是$B$的元素，则称$A$为$B$的子集，记作$A ⊆ B$。
- 交集：对$2$个集合$A$与集合$B$，属于$A$且属于$B$的元素构成的集合称$A$与$B$的交集，记作$A ∩ B$。
- 并集：对$2$个集合$A$与集合$B$，属于$A$或属于$B$的元素构成的集合称$A$与$B$的并集，记作$A ∪ B$。
- 补集：对集合$S$和，$S$中不属于其子集$A$的元素构成的集合，称为$A$在$S$中的补集，记作$overline(A)$。

== 集合运算律

#block(height: 10em, columns()[
  - 交换律
    #list([$A ∪ B = B ∪ A$], [$A ∩ B = B ∩ A$], indent: 0.1em)
  - 结合律
    #list(
      [$A ∪ (B ∪ C) = (A ∪ B) ∪ C$],
      [$A ∩ (B ∩ C) = (A ∩ B) ∩ C$],
      indent: 0.1em,
    )
  - 分配律
    #list(
      [$A ∪ (B ∩ C) = (A ∪ B) ∩ (A ∪ C)$],
      [$A ∩ (B ∪ C) = (A ∩ B) ∪ (A ∩ C)$],
      indent: 0.1em,
    )
  - De Morgen 律
    #list(
      [$overline(A ∪ B) = overline(A) ∩ overline(B)$],
      [$overline(A ∩ B) = overline(A) ∪ overline(B)$],
      indent: 0.1em,
    )
])

== 转化与组合

#block(height: 7em, columns()[
  - 转换
    #list(
      [$A + B = A ∪ B$],
      [$A - B = A B^∁$],
      [$A (B-C) = A B - A C$],
      indent: 0.1em,
    )
  - Cartian 积
    #list([$A × B = \{(x, y) |x ∈ A ∧ y ∈ B\}$], [$A × ∅ = ∅$], indent: 0.1em)
])

Cartian 幂：$n$元集合有$2^(n)-1$个子集，其$k$阶 Cartian 幂有$n^(k)$个元素。

= 朴素概率
<朴素概率>

== 样本空间与事件

#definition[
  实验的样本空间 S 是实验所有可能结果的集合。事件 A 是样本空间 S 的一个子集，若实际结果在 A 中，我们就说 A 发生了。
]

#definition[
  假设 A 是有限样本空间 S 中的一个事件，A 的朴素概率（naive probability）为

  $
    P_("naive")(A) = frac(|A|, |S|) = ctext("事件A发生的次数") / ctext("S中所有事件发生的总次数")
  $
]

== 抽样

抽样是概率模拟的最常用手段。一般分为有放回抽样和无放回抽样。前者相当于多次抽样，而后者相当于一次性抽样。

#theorem[
  考虑$n$个对象，并从它们中选出$k$个对象，每次选择后放回。则有$n^k$种可能的结果。
]

#theorem(title: ctext("二项式定理"))[
  对$k ≤ n$，有

  $
    binom(n, k) = frac(n(n-1)⋯(n-k+1), k!) = frac(n!, (n-k)!k!)
  $

  对$k > n$，有$binom(n, k) = 0$。
]

#theorem[
  考虑$n$个对象，并从它们中选出$k$个对象，每次选择不放回。则有$binom(n, k)$种可能的结果。
]

== 讲述证明

对于抽样概率，讲述证明很多时候比代数证明更简洁、直观，也更能加深对实验的理解。以下给出几个经典案例。

- 案例1

$ binom(n, k) = binom(n, n-k) $

*证*：从$n$个队员中选出$k$个人参赛，有两种方法

- 选出$k$个队员参赛
- 选出$n-k$个队员不参赛

- 案例2

$
  k binom(n, k) = n binom(n-1, k-1)
$

*证*：从$n$个队员中选出$k$个人去参赛，包括$1$队长，有两种方法

- 选出$k$个队员参赛，再在这$k$个队员中选出$1$个队长
- 选出$1$个队长，然后再在剩下的$n-1$个队员中选出$k-1$个队员参赛

- 案例3

$
  binom(n, k) + binom(n, k-1) = binom(n+1, k)
$

*证*：从$n$个队员和$1$个队长选出$k$个人参赛，选出$k$个人参赛，需要考虑 2 种情况

- 队长未被选中时：从$n$个队员中，选出$k$个队员参赛
- 队长被选中时：从$n$个队员中，选出$k-1$个队员参赛

#tip[
  更多讲述证明，详见本章最后一节。
]

= 一般概率
<一般概率>

#definition[
  概率空间由样本空间 S 和概率函数$P$组成，函数 P 将事件$A ⊆ S$作为输入，并返回$P(A)$（一个介于 0 和 1 之间的实数）作为输出。函数$P$必须满足以下公理：

  + P(∅) = 0
  + P(S) = 1
  + 若$A_1, A_2, …$为独立（互斥）事件，则
  $ P(U_(j=1)^(∞) A_j) = sum_(j=1)^(∞) P(A_j) $
]

== 概率的性质

- $P(overline(A)) = 1 - P(A)$
- $A ⊆ B ⇒ P(A) < P(B)$
- $P(A ∪ B) = P(A) + P(B) - P(A ∩ B)$

#theorem(title: ctext("容斥原理"))[
  $
    P(U_(i=1)^n A_i) = sum_i P(A_i)
    - sum_(i < j) P(A_i ∩ A_j) & + sum_(i < j < k) P(A_i ∩ A_j ∩ A_k)-⋯ \
                               & +(-1)^(n+1) P(A_1 ∩ ⋯ ∩ A_n)
  $
]

#corollary(title: ctext("二元容斥原理"))[
  $
    P(A Δ B) = P(A) + P(B) - 2P(A ∩ B)
  $
]

= 条件概率
<条件概率>

#definition[
  若 A 和 B 是$P(B) > 0$的事件，则给定 B 的 A 的条件概率（用$P(A|B)$表示）定义为
  $
    P(A|B) = frac(P(A ∩ B), P(B))
  $
]

#tip[
  Conditioning is the soul of statistics.
  #align("-- <Introduction to Probability>", right)
]

== 贝叶斯定理

#theorem(title: ctext("贝叶斯定理"))[
  $
    P(A|B) = frac(P(B|A)P(A), P(B))
  $

  其中
  - $P(A)$：先验（prior），反映事先对 A 的认识
  - $P(A|B)$：后验（posterior），反映基于 B 对 A 的认识
  - $P(B)$：边际似然（marginal likelihood），又称证据（evidence）
  - $P(B|A)$：似然（likelihood），原因 A 下产生 B 的概率
]

实际应用中，A 对应某种原因，B 对应被观测到的现象，由此，上述公式可翻译为

$
  P( ctext("原因i|现象") )
  = frac(P(ctext("原因i")) × P(ctext("现象|原因i")), P(ctext("现象")))
  = ctext("先验") × ctext("标准化的似然")
$ <bayes>

@bayes 告诉我们，信息推断同时考虑如下 2 个方面：

+ 原因的解释力，即该原因可能导致被观测到的现象的概率
+ 原因的可能性，即该原因在所以潜在原因中的占比，也就是先验

关于 贝叶斯定理的更详细解释和应用，请参考第 11 章及其后续章节。

#theorem[
  对于概率为正的任何事件 A 和 B，有
  $
    P(A ∩ B) = P(B) P(A|B) = P(A) P(B|A)
  $
]

#theorem[
  若概率$P(A_1, A_2, …, A_(n−1)) > 0$，则对任何事件$A_1, A_2, …, A_n$，有

  $
    P(A_1, A_2, …, A_n) = P(A_1) P(A_2|A_1) P(A_3|A_1, A_2) ⋯ P(A_n|A_1, …, A_(n-1))
  $

  其中，$(A_3|A_1, A_2) = (A_3|A_1 ∩ A_2)$。
]

#definition[
  事件 A 的几率指

  $ "odds"(A) = P(A) / P(overline(A)) $
]

#theorem(title: ctext("贝叶斯定理的几率形式"))[
  $
    frac(P(A|B), P(overline(A)|B)) = frac(P(B|A), P(B | overline(A))) frac(P(A), P(overline(A)))
  $
]

#theorem(title: ctext("全概率定律"))[
  设$A_1, A_2, …, A_n$是样本空间 S 的分区，若$P(A_i) > 0$，$∀i$，有

  $
    P(B) = sum_(i=1)^n P(B|A_i) P(A_i)
  $
]

== 额外条件

#theorem[
  假设$P(A ∩ E) > 0$且$P(B ∩ E)$，则

  $ P(A|B, E) = frac(P(B|A, E)P(A|E), P(B|E)) $
]

#theorem[
  设$A_1, A_2, …, A_n$是样本空间 S 的分区，假设$P(A_i ∩ E)$，$∀i$，有

  $ P(B|E) = sum_(i=1)^n P(B|A_i, E) P(A_i|E) $
]

== 独立性

#theorem[
  独立 ⇔ $P(A B) = P(A) P(B) ⇒ A ∩ B = ∅$
]

#corollary[
  $
    cases(P(A B) = P(A) P(B), P(A) > 0) ⇔
    P(B|A) = P(B)
  $
]

#theorem[
  若$P(A ∩ B|E) = P (A|E)P (B|E)$，则称事件 A 和 B 在给定条件 E 下是独立的。
]

== 一些应用

令 AP 表示事实阳性，PP 表示预测阳性，则

- 真阳性率/敏感度：$P("PP"|"AP")$
- 真阴性率/特异率：$P(overline("PP")|overline("AP"))$

=== 流行病学

- 几率比（odds ratio）：

  $
    "OR" = frac("odds"(D|C), "odds"(D | overline(C)))
  $

- 相对风险（relative risk）：

  $
    "RR" = frac(P(D|C), P(D | overline(C)))
  $

= 讲述证明扩展

== 抽样级数

- 案例1

$ sum_(i=0)^n binom(n, k)^2 = binom(2n, n) $

- 案例2

$ sum_(i=1)^n k binom(n, k)^2 = n binom(2n-1, n-1) $

- 案例3（曲棍球棒恒等式）

$ sum_(i=k)^(n-k) binom(i, k) = binom(n+1, k+1) $

- 案例4（Vandermonde's 恒等式）

$ sum_(j=0)^k binom(m, j)binom(n, k-j) = binom(m+n, k) $

== 自然数级数

- 案例1

$ sum_(i=1)^n i = binom(n+1, 2) $

- 案例2

$ sum_(i=1)^n i^3 = 6 binom(n+1, 4) + 6 binom(n+1, 3) + binom(n+1, 2) $

- 案例3

$ product_(i=1)^n(2i - 1) = frac((2n)!, 2^n⋅n!) $
