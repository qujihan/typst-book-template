#import "../params.typ": *
#import "first-line-indent.typ": virtual-line
#let set-raw-style(info, body) = {
  show raw: set block(breakable: true)

  show raw: it => {
    set text(font: (code-font, chinese-font))
    it
  }

  show raw.where(block: true): it => {
    set text(size: 1em)
    set par(justify: false)
    it
    virtual-line(-0.7)
  }

  show raw.where(block: false): it => {
    set text(size: 1em, fill: code-line-color)
    h(0.2em)
    box(
      fill: luma(240),
      inset: (left: 0.2em, right: 0.2em, top: 0.3em, bottom: 0.3em),
      baseline: 0.2em,
      radius: 0.2em,
    )[
      #h(0.2em) #it #h(0.2em)
    ]
    h(0.2em)
  }

  body
}