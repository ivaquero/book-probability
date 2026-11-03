# 极简概率导论

![code size](https://img.shields.io/github/languages/code-size/ivaquero/book-probability.svg)
![repo size](https://img.shields.io/github/repo-size/ivaquero/book-probability.svg)

本仓库基于我一直在迭代的概率导论教案，目标是希望其具有如下特点

- 循序渐进：从集合与计数、条件概率出发，经离散/连续分布、期望与矩、联合分布与分布变换，一路到极限定理与指数分布族
- 主线清晰：以「分布族 — 变换 — 极限」为骨架组织内容，尽量减少碎片化的公式罗列
- 面向应用：末章「指数分布族」与共轭先验、充分统计量一起，为统计建模与机器学习提供概率基础

> 说明：本仓库当前为纯 Typst 讲稿，尚未附带可运行的示例代码；正文中的分布/模拟图由外部绘图脚本生成后纳入 `images/`，数据表位于 `data/`。

## 内容结构

| 章节 | 主题               |
| ---- | ------------------ |
| 01   | 概率与计数         |
| 02   | 离散随机分布       |
| 03   | 期望与方差         |
| 04   | 连续随机分布       |
| 05   | 矩                 |
| 06   | 联合分布           |
| 07   | 条件期望与方差     |
| 08   | 分布变换           |
| 09   | 极限定理           |
| 10   | 指数分布族         |
| A    | 附录：概率统计速查 |

## 构建

### 依赖软件

- [Typst](https://github.com/typst/typst)（本项目在 0.15.x 下验证编译）
- 中文字体：模板默认字体名为 `Kaiti SC`（楷体）。若本机未安装该字体会在编译时出现 `unknown font family` 告警，不影响出 PDF；可安装任一 CJK 字体，或用 `typst compile --font-path <dir>` 指定字体目录。

### 克隆官方仓库

为保证正常编译，请参考 [typst-packages](https://github.com/typst/packages) 上的说明，在如下路径下克隆 `typst-packages` 仓库

- Linux：
  - `$XDG_DATA_HOME`
  - `~/.local/share`
- macOS：`~/Library/Application Support`
- Windows：`%APPDATA%`

```shell
cd [above-path]
git clone --depth 1 --branch main https://github.com/typst/packages typst
```

### 编译

```shell
typst compile book-probability.typ book-probability.pdf
```

入口文件 `book-probability.typ` 通过 `chapter()` 宏逐章 `include` 根目录下的 `NN-*.typ`，并在每章结束后重置章节计数；公共依赖与文档信息集中在 `lib/`。

### 使用模版

本项目排版基于 [qooklet](https://github.com/ivaquero/typst-qooklet) 模板。每章起首的写法如下：

```typst
#import "lib/lib.typ": *
#show: chapter-style.with(title: "概率与计数", info: info)
```

参数 `info` 来自一个 TOML 文件，用于传入文档元信息（使用默认值意味着下列信息为空）。本仓库的 `lib/info.toml` 形如

```toml
[global]
    title = "极简概率导论"
    author = "ivaquero"
    footer = "ivaquero"
    header = "极简概率导论"
    lang = "zh"
```

读取方式：

```typst
#let info = toml("lib/info.toml").global
```

详情见 [qooklet](https://github.com/ivaquero/typst-qooklet)

## 约定规范

### 记号

- 期望 `$𝔼[·]$`；方差 `$"Var"(·)$`；协方差/相关系数 `$"Cov"$`、`$"Corr"$`
- 正态分布 `$𝒩(μ, σ^2)$`（第二参数为方差）
- 分布名用正体并只引名称，如 `$"Bin"(n, p)$`、`$"Gamma"(a, λ)$`；随机变量用斜体
- 随机向量 `$𝑿$`、均值向量 `$𝝁$`、协方差矩阵 `$𝜮$`（粗体）
- 微分用 `$dd(x)$`，偏导用 physica 的 `$pdv$`
- 样本均值 `$macron(X_n)$`，无偏样本方差 `$S_n^2$`（除以 $n-1$）

### 矩阵与向量

- 矩阵
  - `[]` 括号
  - 加粗斜体，大写
- 向量
  - `[]` 括号
  - 加粗斜体，小写
