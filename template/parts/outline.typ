#import "../params.typ": *

#let show-outline() = [
  #set page(
    header: none,
    footer: none,
    background: none,
  )

  #let title-block = block()[
    #text(size: 2em, strong("目录"))
    #v(2em)
  ]

  #show outline.entry.where(level: 1): it => {
    text(size: 1em, weight: "semibold", it)
  }

  #show outline.entry.where(level: 2): it => {
    text(size: 1em, weight: "medium", it)
  }

  #show outline.entry.where(level: 3): it => {
    text(size: 1em, weight: "regular", it)
  }

  #set align(center)
  #outline(indent: auto, depth: 3, title: title-block)
]