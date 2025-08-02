# 极简概率导论

![code size](https://img.shields.io/github/languages/code-size/ivaquero/book-probability.svg)
![repo size](https://img.shields.io/github/repo-size/ivaquero/book-probability.svg)

本仓库基于我一直在迭代的概率导论教案，目标是希望其具有如下特点

- 循序渐进
- 主线清晰
- 对接应用
  - 深度学习
  - 机器学习

## 构建

### 依赖软件

- [Typst](https://github.com/typst/typst)

### 克隆官方仓库

为保证正常编译，请参考 [typst-packages](https://github.com/typst/packages) 上的说明，在如下路径下克隆 `typst-packages` 仓库

- Linux：
  - `$XDG_DATA_HOME`
  - `~/.local/share`
- macOS：`~/Library/Application Support`
- Windows：`%APPDATA%`

```bash
cd [above-path]
git clone --depth 1 --branch main https://github.com/typst/packages typst
```

### 使用模版

```typst
#import "@preview/qooklet:0.6.1": *
#show: chapter-style.with(
  title: "Bellman Eqation",
  // the following are optional arguments
  // info: none
  // outline-on: false,
)
```

这里参数 `info` 让你可以使用一个 TOML 文件传入你的文档信息（使用默认值，意味着下列信息为空）。TOML 文件格式如下

```toml
[key-you-like]
    author = "ivaquero"
    footer = "ivaquero"
    header = "Reinforcement Learning"
    lang = "en"
```

使用如下语句读取你的 TOML 文件

```typst
#let info = toml("your path").key-you-like
```

详情见 [qooklet](https://github.com/ivaquero/typst-qooklet)

## 约定规范

### 公式

- 矩阵
  - `[]` 括号
  - 加粗斜体，大写
- 向量
  - `[]` 括号
  - 加粗斜体，小写
