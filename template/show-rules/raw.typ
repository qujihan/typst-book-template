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
    set text(size: 0.9em, fill: code-line-color)
    h(0.3em)
    box(
      fill: luma(240),
      inset: (top: 0.15em, bottom: 0.15em),
      outset: (top: 0.15em, bottom: 0.15em),
      radius: 0.2em,

    )[
      #h(0.2em) #it #h(0.2em)
    ]
    h(0.3em)
  }

  body
}