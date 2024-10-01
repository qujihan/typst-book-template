#import ("params.typ")

#let reference-block(title, content) = {
  set align(center)
  set par(first-line-indent: 0em)
  block(
    above: 2em,
    below: 2em,
    width: 95%,
    breakable: true,
  )[
    #v(0.5em)
    #text(fill: black, size: 1.2em)[
      #align(center)[
        *#title*
      ]
    ]
    #content
    #v(0.5em)

    #rect(width: 100%, fill: luma(240), stroke: (left: 0.25em))[
    ]
  ]
}

#let tips-block(title, content) = block(
  above: 2em,
  below: 2em,
  stroke: 0.5pt + black,
  radius: 6pt,
  width: 100%,
  inset: 14pt,
  breakable: true,
)[
  #set par(first-line-indent: 0em)
  #set text(fill: black)
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

