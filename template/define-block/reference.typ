#import "../params.typ": *

#let reference-block(title, content) = {
  set par(first-line-indent: 0em)
  context {
    block(
      width: 100%,
      fill: util-reference-color-state.get().lighten(95%),
      stroke: (left: 7pt + util-reference-color-state.get().lighten(60%)),
      radius: 6pt,
      inset: (left: 8pt, right: 1em, bottom: 1em, top: 1em),
      breakable: true,
    )[
      #v(0.5em)
      #text(fill: content-color-state.get(), size: 1.2em)[
        #align(center)[
          *#title*
        ]
      ]
      #content
      #v(0.5em)
    ]

  }
}