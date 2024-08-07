#import "../params.typ": *

#let show-outline() = [
  #set page(
    header: none,
    footer: none,
    background: none,
  )

  #show outline.entry.where(level: 1): it => {
    v(2em, weak: true)
    text(size: 1.4em, weight: "semibold", it)
  }

  #show outline.entry.where(level: 2): it => {
    text(size: 1.2em, weight: "medium", it)
  }

  #show outline.entry.where(level: 3): it => {
    text(size: 1em, weight: "regular", it)
  }


  #let title-block = block()[
    #text(size: 2.2em, strong("目录"))
    #v(3em)
  ]

  #set align(center)
  #outline(indent: auto, depth: 3, title: title-block)
]