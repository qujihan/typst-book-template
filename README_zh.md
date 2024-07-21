# 一个Typst书籍模板
[English](./README.md)
> [!IMPORTANT]
> 需要提前安装:
> 1. [typst](https://github.com/typst/typst)
> 2. [typstyle](https://github.com/Enter-tainer/typstyle)
> 3. 字体
>   - 中文字体: [Source Han Serif SC](https://github.com/adobe-fonts/source-han-serif)
>   - 西文字体: [Lora](https://github.com/cyrealtype/Lora-Cyrillic)
>   - 代码字体: [FiraCode Nerd Font Mono](https://github.com/tonsky/FiraCode)
>   - 如果想一键安装, 可以运行 fonts 下的 download.py (`python typst-book-template/fonts/download.py`)
>       - 中国大陆地区可是使用 `python typst-book-template/fonts/download.py --proxy` 提高下载速度


# 一些命令
> [!Tip]
> 默认从 typst-book-template 的父目录的 main.typ 作为项目入口开始编译, 输出结果为 output_file.pdf
> 如果想要修改可以参照 typst-book/template/metadata.json, 在 项目根目录下创建 metadata.json


```shell
python typst-book-template/op.py w
python typst-book-template/op.py c
python typst-book-template/op.py f
```