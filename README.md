# Typst-book-template
[中文](./README_zh.md)
> [!IMPORTANT]
> Prerequisites:
> 1. [typst](https://github.com/typst/typst)
> 2. [typstyle](https://github.com/Enter-tainer/typstyle)
> 3. Fonts
>   - Chinese font: [Source Han Serif SC](https://github.com/adobe-fonts/source-han-serif)
>   - Western font: [Lora](https://github.com/cyrealtype/Lora-Cyrillic)
>   - Code font: [FiraCode Nerd Font Mono](https://github.com/tonsky/FiraCode)
>   - If you want to install them all at once, you can run the download.py script under the fonts directory (`python typst-book-template/fonts/download.py`)
>       - In mainland China, you can use `python typst-book-template/fonts/download.py --proxy` to improve download speed.

# Some Commands
> [!Tip]
> By default, the compilation starts from the main.typ file in the parent directory of typst-book-template, and the output file is output_file.pdf.
> If you want to make changes, you can refer to typst-book/template/metadata.json and create metadata.json in the root directory of your project.

```shell
python typst-book-template/op.py w
python typst-book-template/op.py c
python typst-book-template/op.py f
```