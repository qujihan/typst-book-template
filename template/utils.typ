#import ("params.typ")

#let referenceBlock(content) = block(
  above: 2em,
  below: 2em,
  width: 100%,
)[
  #set par(first-line-indent: 0em)
  #rect(width: 100%, fill: luma(240), stroke: (left: 0.25em))[
    #content
  ]
]

#let tipsBlock(title, content) = block(
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
    block(fill: white, inset: 2pt, outset: 2pt)[*#title*],
  )
  #content
]

