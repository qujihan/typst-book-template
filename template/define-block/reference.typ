#import "../params.typ": *

#let reference-block(title, content) = {
  set par(first-line-indent: 0em)
  block(
    width: 100%,
    fill: util-reference-block-color,
    stroke: (left: 7pt + util-reference-line-color),
    radius: 6pt,
    inset: (left: 8pt, right: 1em, bottom: 1em, top: 1em),
    breakable: true,
  )[
    #v(0.5em)
    #text(fill: content-color, size: 1.2em)[
      #align(center)[
        *#title*
      ]
    ]
    #content
    #v(0.5em)
  ]
}