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
>   - If you want to install all fonts at once, you can run download.py under the fonts directory (`python typst-book-template/fonts/download.py`)
>       - For users in mainland China, you can use `python typst-book-template/fonts/download.py --proxy` to improve download speed


# Quick Start
> [!Tip]
> By default, the main.typ file in the parent directory of typst-book-template is used as the project entry point for compilation, and the output is saved as output_file.pdf.
> 
> If you want to make modifications, you can refer to typst-book-template/metadata.json and create a metadata.json file in the project root directory (at the same level as typst-book-template).


```shell
# Add this project as a git submodule
git submodule add https://github.com/qujihan/typst-book-template.git

# Real-time preview
python typst-book-template/op.py w

# Compile
python typst-book-template/op.py c

# Format typst code
python typst-book-template/op.py f
```