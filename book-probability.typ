#let chapter(filename) = {
  include filename
  context counter(heading).update(0)
}

#chapter("01-概率与计数.typ")
#chapter("02-离散随机分布.typ")
#chapter("03-期望与方差.typ")
#chapter("04-连续随机分布.typ")
#chapter("05-矩.typ")
#chapter("06-联合分布.typ")
#chapter("07-条件期望与方差.typ")
#chapter("08-分布变换.typ")
#chapter("09-极限定理.typ")
#chapter("10-指数分布族.typ")
#chapter("A-概率统计.typ")
