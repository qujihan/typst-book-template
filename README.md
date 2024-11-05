<div align="center">
<strong>
<samp>

[中文](./README_zh.md)

</samp>
</strong>
</div>

# Typst-book-template
> [!IMPORTANT]
> Prerequisites:
> 1. [typst](https://github.com/typst/typst): *0.12.0* or later
> 
> Recommend:
> 2. [Fonts](./fonts.json) (ref [fonts](https://github.com/qujihan/fonts) download fonts)
>   - cjk font: [Source Han Serif SC](https://github.com/adobe-fonts/source-han-serif)
>   - latin font: [Lora](https://github.com/cyrealtype/Lora-Cyrillic)
>   - code font: [CaskaydiaCove Nerd Font](https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/CascadiaCode.zip)


# Quick Start
> [!Tip]
>  You can use submodule or directly download the code, so you can keep up with the updates in a timely manner.
> 
>  And you can also use the official package manager, which will be more convenient. (coming soon)

## Git submodule
```shell
git init
git submodule add https://github.com/qujihan/typst-book-template.git typst-book-template
```


## Official Package Manager
main.typ
```typ
#import "typst-book-template/book.typ": *

#show: book.with(info: (
  name: "author",
  title: "typst-book-template demo",
))

#include "src/chapter1.typ"
```

src/chapter1.typ
```typ
#import "../typst-book-template/book.typ": *
// Please refer to the examples in the `example` directory for how to use `path-prefix`.
#let path-prefix = figure-root-path + "src/pics/"
= chapter 1
== section 1
```

