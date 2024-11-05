#import "../../params.typ": *

#let figure-kind-code = "figure-kind-code"

#let code-num(_) = {
  let chapter-num = counter(heading.where(level: 1)).display()
  let type-num = counter(figure-kind-code + chapter-num).display()
  str(chapter-num) + "-" + str(int(type-num) + 1)
}


#let codeIn(
  title,
  content,
) = (
  context {
    block(
      stroke: 0.5pt + line-color-state.get(),
      radius: 6pt,
      width: 100%,
      inset: (top: 0.8em, bottom: 0.8em, left: 0.6em, right: 0.6em),
      fill: none,
      breakable: true,
    )[
      #place(
        top + right,
        dy: -1.25em,
        dx: -1em,
        block(
          fill: white,
          inset: (bottom: 0.1em),
          outset: (left: 0.5em, right: 0.5em),
          text(
            font: latin-font-state.get() + cjk-font-state.get(),
            style: "italic",
            fill: line-color-state.get(),
          )[*#title*],
        ),
      )
      #align(left + top)[
        #content
      ]

    ]

  }
)


// #let codeIn(
//   title,
//   content,
// ) = block(
//   stroke: 0.5pt + line-color-state.get(),
//   radius: 6pt,
//   width: 100%,
//   inset: (top: 0.8em, bottom: 0.8em, left: 0.6em, right: 0.6em),
//   fill: none,
//   breakable: true,
// )[
//   #place(
//     top + right,
//     dy: -1.25em,
//     dx: -1em,
//     block(
//       fill: white,
//       inset: (bottom: 0.1em),
//       outset: (left: 0.5em, right: 0.5em),
//       text(
//         font: latin-font-state.get() + cjk-font-state.get(),
//         style: "italic",
//         fill: line-color-state.get(),
//       )[*#title*],
//     ),
//   )
//   #align(left + top)[
//     #content
//   ]
// ]

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