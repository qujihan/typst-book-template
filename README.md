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
> 1. [typst](https://github.com/typst/typst)
> 2. [typstyle](https://github.com/Enter-tainer/typstyle)
> 3. [Fonts](./fonts.json)
>   - Chinese font: [Source Han Serif SC](https://github.com/adobe-fonts/source-han-serif)
>   - Western font: [Lora](https://github.com/cyrealtype/Lora-Cyrillic)
>   - Code font: [CaskaydiaCove Nerd Font](https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/CascadiaCode.zip)
>   - If you want to install all fonts at once, you can run download.py under the fonts directory (`python typst-book-template/fonts/download.py`)
>       - For users in mainland China, you can use `python typst-book-template/fonts/download.py --proxy` to improve download speed


# Quick Start
> [!Tip]
> By default, the main.typ file in the parent directory of typst-book-template is used as the project entry point for compilation, and the output is saved as output_file.pdf.
> 
> If you want to make modifications, you can refer to typst-book-template/metadata.json and create a metadata.json file in the project root directory (at the same level as typst-book-template).

metadata.json
// output_file_name must end with .pdf/.svg
```json
{
    "root_file_name": "main.typ",
    "output_file_name": "typst-book-template-demo.pdf"
}
```

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


```shell
# Add this project as a git submodule
git init
git submodule add https://github.com/qujihan/typst-book-template.git typst-book-template
git submodule update --init --recursive
# recommand install tqdm
# pip install tqdm
python typst-book-template/fonts/download.py

# Real-time preview
python typst-book-template/op.py w

# Compile
python typst-book-template/op.py c

# Format typst code
python typst-book-template/op.py f
```