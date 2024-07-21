#let code_num(_) = {
  locate(loc => {
    let chapt = counter(heading).at(loc).at(0)
    let c = counter("code-num" + str(chapt))
    let n = c.at(loc).at(0)
    str(chapt) + "-" + str(n + 1)
    // c.step()
  })
}

#let codeIn(title, content) = block(
  above: 2em,
  stroke: 0.5pt + black,
  width: 100%,
  inset: 15pt,
  fill: white,
)[
  #place(
    top + right,
    dy: -21pt,
    dx: 0pt,
    block(
      fill: white,
      inset: 2pt,
      outset: 2pt,
      text(font: "Lora", style: "italic", fill: luma(100))[*#title*],
    ),
  )
  #align(left + top)[
    #content
  ]
]

#let code(title, code, caption) = {
  figure(
    codeIn(title, code),
    caption: caption,
    supplement: [代码],
    numbering: code_num,
    kind: "code",
  )
}