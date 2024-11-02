#import "../params.typ": *

#let tips-block(title, content) = {
  set par(first-line-indent: 0em)
  set text(fill: content-color)
  block(
    above: 2em,
    below: 2em,
    stroke: 0.5pt + line-color,
    radius: 6pt,
    width: 100%,
    inset: 14pt,
    breakable: true,
  )[
    #place(
      top + left,
      dy: -25pt,
      dx: 0pt,
      block(fill: white, inset: 2pt, outset: 2pt)[
        #v(0.5em)
        #text(fill: blue)[
          *#title*
        ]
        #v(0.5em)
      ],
    )
    #content
  ]
}