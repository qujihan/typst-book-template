#import "../../params.typ": *

#let pic-num(_) = {
  locate(loc => {
    let chapter-num = counter(heading).at(loc).at(0)
    let c = counter(figure-kind-pic + str(chapter-num))
    str(chapter-num) + "-" + str(c.at(loc).at(0) + 1)
  })
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
