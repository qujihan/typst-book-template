#import "../../params.typ": *

#let figure-kind-tbl = "figure-kind-tbl"

#let tbl-num(_) = {
  let chapter-num = counter(heading.where(level: 1)).display()
  let type-num = counter(figure-kind-tbl + chapter-num).display()
  str(chapter-num) + "-" + str(int(type-num) + 1)
}

#let tblIn(content) = align(center + horizon)[ #content ]

#let tbl(caption, tbl) = {
  figure(
    tblIn(tbl),
    caption: caption,
    supplement: [表格],
    numbering: tbl-num,
    kind: figure-kind-tbl,
  )
}