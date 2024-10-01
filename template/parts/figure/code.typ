#import "../../params.typ": *

#let code-num(_) = {
  locate(loc => {
    let chapter-num = counter(heading).at(loc).at(0)
    let type-num = counter(figure-kind-code + str(chapter-num))
    str(chapter-num) + "-" + str(type-num.at(loc).at(0) + 1)
  })
}


#let codeIn(title, content) = block(
  above: 2em,
  stroke: 0.5pt + line-color,
  radius: 6pt,
  width: 100%,
  inset: 15pt,
  fill: white,
  breakable: true,
)[
  #place(
    top + right,
    dy: -21pt,
    dx: 0pt,
    block(
      fill: white,
      inset: 2pt,
      outset: 2pt,
      text(font: "Lora", style: "italic", fill: line-color)[*#title*],
    ),
  )
  #align(left + top)[
    #content
  ]
]

#let code(title, caption, content) = {
  figure(
    codeIn(title, content),
    placement: auto,
    caption: caption,
    supplement: [代码],
    numbering: code-num,
    kind: figure-kind-code,
  )
}