#import "../../params.typ": *

#let figure-kind-pic = "figure-kind-pic"

#let pic-num(_) = {
  let chapter-num = counter(heading.where(level: 1)).display()
  let type-num = counter(figure-kind-pic + chapter-num).display()
  str(chapter-num) + "-" + str(int(type-num) + 1)
}

#let picIn(path) = block(
  above: 2em,
  width: 100%,
  fill: white,
)[
  #align(center + horizon)[
    #image(path)
  ]
]

#let pic(path, caption) = {
  figure(
    picIn(path),
    caption: caption,
    supplement: [图],
    numbering: pic-num,
    kind: figure-kind-pic,
  )
}
