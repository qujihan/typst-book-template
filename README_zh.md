<div align="center">
<strong>
<samp>

[English](./README.md)

</samp>
</strong>
</div>

# Typst-book-template
> [!IMPORTANT]
> 先决条件:
> [typst](https://github.com/typst/typst): *0.12.0* 或更高版本
> 
> 推荐:
> 字体 (参考 [fonts](https://github.com/qujihan/fonts) 来下载字体)
>   - 中日韩字体: [Source Han Serif SC](https://github.com/adobe-fonts/source-han-serif)
>   - 拉丁字体: [Lora](https://github.com/cyrealtype/Lora-Cyrillic)
>   - 代码字体: [CaskaydiaCove Nerd Font](https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/CascadiaCode.zip)


# 快速开始
> [!Tip]
> 你可以使用子模块或者直接下载代码，这样可以及时跟进修改。
> 
> 你也可以使用官方的包管理工具，这会比较方便。（即将推出）

## Git 子模块
```shell
git init
git submodule add https://github.com/qujihan/typst-book-template.git typst-book-template
```

## 官方包管理工具
`main.typ`
```typ
#import "typst-book-template/book.typ": *

#show: book.with(info: (
  name: "author",
  title: "typst-book-template demo",
))

#include "src/chapter1.typ"
```

`src/chapter1.typ`
```typ
#import "../typst-book-template/book.typ": *
// 请参考 `example` 目录中的示例，了解如何使用 `path-prefix`。
#let path-prefix = figure-root-path + "src/pics/"
= 第1章
== 第1节
```