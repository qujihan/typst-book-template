#import ("params.typ")

#let reference-block(content) = block(
  above: 2em,
  below: 2em,
  width: 100%,
)[
  #set par(first-line-indent: 0em, leading: 1.2em)
  #rect(width: 100%, fill: luma(240), stroke: (left: 0.25em))[
    #v(0.5em)
    #content
    #v(0.5em)
  ]
]

#let tips-block(title, content) = block(
  above: 2em,
  below: 2em,
  stroke: 0.5pt + black,
  width: 100%,
  inset: 14pt,
)[
  #set par(first-line-indent: 0em)
  #set text(fill: black)
  #place(
    top + left,
    dy: -20pt,
    dx: 0pt,
    block(fill: white, inset: 2pt, outset: 2pt)[
      #v(0.5em)
      *#title*
      #v(0.5em)
    ],
  )
  #content
]

