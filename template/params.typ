#let global-book-info = (:)

/*****************
*  basic info    *
*****************/
#let title = "title"
#global-book-info.insert(title, "Unnamed book")

#let name = "name"
#global-book-info.insert(name, "Unnamed author")

#let outline-depth = "outline-depth"
#global-book-info.insert(outline-depth, 3)

/*****************
*  font family   *
*****************/
#let latin-font = "latin-font"
#let latin-font-state = state(latin-font, ())
#global-book-info.insert(latin-font, ())

#let cjk-font = "cjk-font"
#let cjk-font-state = state(cjk-font, ())
#global-book-info.insert(cjk-font, ())

#let code-font = "code-font"
#let code-font-state = state(code-font, ())
#global-book-info.insert(code-font, ())

/*****************
*      size      *
*****************/
#let content-size = "content-size"
#global-book-info.insert(content-size, 10pt)

/*****************
*    color       *
*****************/
#let content-color = "content-color"
#let content-color-state = state(content-color, black)
#global-book-info.insert(content-color, black)

// this is used for page-header and page-footer
#let line-color = "line-color"
#let line-color-state = state(line-color, luma(80))
#global-book-info.insert(line-color, luma(80))

#let inline-code-color = "inline-code-color"
#let inline-code-color-state = state(inline-code-color, rgb("#004cd9"))
#global-book-info.insert(inline-code-color, rgb("#004cd9b3"))

#let emph-color = "emph-color"
#let emph-color-state = state(emph-color, rgb("#a7ec54"))
#global-book-info.insert(emph-color, rgb("#a7ec542d"))

#let util-reference-color = "util-reference-color"
#let util-reference-color-state = state(util-reference-color, rgb("#163bf5"))
#global-book-info.insert(util-reference-color, rgb("#163bf5"))