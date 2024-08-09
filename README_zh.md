<div align="center">
<strong>
<samp>

[English](./README.md)

</samp>
</strong>
</div>

# 一个Typst书籍模板
> [!IMPORTANT]
> 需要提前安装:
> 1. [typst](https://github.com/typst/typst)
> 2. [typstyle](https://github.com/Enter-tainer/typstyle)
> 3. [字体](./fonts.json)
>   - 中文字体: [Source Han Serif SC](https://github.com/adobe-fonts/source-han-serif)
>   - 西文字体: [Lora](https://github.com/cyrealtype/Lora-Cyrillic)
>   - 代码字体: [CaskaydiaCove Nerd Font](https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/CascadiaCode.zip)
>   - 如果想一键安装, 可以运行 fonts 下的 download.py (`python typst-book-template/fonts/download.py`)
>       - 中国大陆地区可是使用 `python typst-book-template/fonts/download.py --proxy` 提高下载速度


# Quick Start
> [!Tip]
> 默认从 typst-book-template 的父目录的 main.typ 作为项目入口开始编译, 输出结果为 output_file.pdf
> 
> 如果想要修改可以参照 typst-book-template/metadata.json, 在项目根目录下(与typst-book-template同级)创建 metadata.json


```shell
# 将本项目作为 git submodule
git submodule add https://github.com/qujihan/typst-book-template.git typst-book-template
git submodule update --init --recursive

# 实时预览
python typst-book-template/op.py w

# 编译
python typst-book-template/op.py c

# 格式化typst代码
python typst-book-template/op.py f
```